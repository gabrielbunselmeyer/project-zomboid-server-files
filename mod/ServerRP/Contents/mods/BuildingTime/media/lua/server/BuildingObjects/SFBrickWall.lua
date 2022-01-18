--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

SFBrickWall = ISBuildingObject:derive("SFBrickWall");

--************************************************************************--
--** SFBrickWall:new
--**
--************************************************************************--
function SFBrickWall:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	if not self.health then
        self.javaObject:setMaxHealth(self:getHealth());
    else
        self.javaObject:setMaxHealth(self.health);
    end
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setName(self.name);
	-- the sound that will be played when our wall will be broken
	self.javaObject:setBreakSound("BreakObject");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject, self:getObjectIndex());
    self.sq:RecalcAllWithNeighbours(true);
--~ 	SFBrickWall:checkCorner(x,y,z,north);
--~ 	buildUtil.checkCorner(x,y,z,north,self, self.javaObject);
--	buildUtil.addWoodXp(self);
	self.javaObject:transmitCompleteItemToServer();
    if self.sq:getZone() then
        self.sq:getZone():setHaveConstruction(true);
    end
end

function SFBrickWall:checkCorner(x,y,z,north)
	local found = false;
	local sx = x;
	local sy = y;
	local sq2 = getCell():getGridSquare(x + 1, y - 1, z);
	for i = 0, sq2:getSpecialObjects():size() - 1 do
		local item = sq2:getSpecialObjects():get(i);
		if instanceof(item, "IsoThumpable") and item:getNorth() ~= north  then
			found = true;
			sx = x + 1;
			sy = y;
			break;
		end
	end
	if found then
		SFBrickWall:addCorner(sx,sy,z,north);
	end
end

function SFBrickWall:addCorner(x,y,z, north)
	local sq = getCell():getGridSquare(x, y, z);
	local corner = IsoThumpable.new(getCell(), sq, "walls_exterior_house_01_7", north, self);
	corner:setCorner(true);
	corner:setCanBarricade(false);
	sq:AddSpecialObject(corner);
	corner:transmitCompleteItemToServer();
end

function SFBrickWall:new(sprite, northSprite, corner)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.corner = corner;
	o.canBarricade = true;
	o.name = "Brick Wall";
	o.isWallLike = true
	return o;
end

-- return the health of the new wall, it's 600 + 100 per carpentry lvl
function SFBrickWall:getHealth()
        return 600 + buildUtil.getBrickHealth(self);
end

function SFBrickWall:isValid(square)
	if not self:haveMaterial(square) then return false end

--	if not buildUtil.canBePlace(self, square) then return false end
	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

	if square:isVehicleIntersecting() then return false end

	for i=1,square:getObjects():size() do
		local object = square:getObjects():get(i-1);
		local sprite = object:getSprite()
		if (sprite and ((sprite:getProperties():Is(IsoFlagType.collideN) and self.north) or
				(sprite:getProperties():Is(IsoFlagType.collideW) and not self.north))) or
				((instanceof(object, "IsoThumpable") and (object:getNorth() == self.north)) and not object:isCorner() and not object:isFloor() and not object:isBlockAllTheSquare()) or
				(instanceof(object, "IsoWindow") and object:getNorth() == self.north) or
				(instanceof(object, "IsoDoor") and object:getNorth() == self.north) then
			return false;
		end

		-- Forbid placing walls between parts of multi-tile objects like couches.
		-- TODO: Check for parts being destroyed.
		local spriteGrid = sprite and sprite:getSpriteGrid()
		if spriteGrid then
			local gridX = spriteGrid:getSpriteGridPosX(sprite)
			local gridY = spriteGrid:getSpriteGridPosY(sprite)
			if self.north and gridY > 0 then
				return false;
			end
			if not self.north and gridX > 0 then
				return false;
			end
		end
	end

    if buildUtil.stairIsBlockingPlacement( square, true, (self.nSprite==4 or self.nSprite==2) ) then return false; end

    -- if we don't have floor we gonna check if there's a stairs under it, in this case we allow the build
	if not square:hasFloor(self.north) then
		local belowSQ = getCell():getGridSquare(square:getX(), square:getY(), square:getZ()-1)
		if belowSQ then
			if self.north and not belowSQ:HasStairsWest() then return false; end
			if not self.north and not belowSQ:HasStairsNorth() then return false; end
		end
	end

	return true -- square:isFreeOrMidair(false);
end

function SFBrickWall:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

function SFBrickWall:getObjectIndex()
	for i = self.sq:getObjects():size(),1,-1 do
		local object = self.sq:getObjects():get(i-1)
		local props = object:getProperties()
		if props and props:Is(IsoFlagType.solidfloor) then
			return i
		end
	end
	return -1
end
