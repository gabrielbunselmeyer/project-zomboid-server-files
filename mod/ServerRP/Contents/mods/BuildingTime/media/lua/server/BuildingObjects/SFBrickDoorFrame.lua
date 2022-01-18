--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

SFBrickDoorFrame = ISBuildingObject:derive("SFBrickDoorFrame");

--************************************************************************--
--** SFBrickDoorFrame:create
--** Called when you clicked on the ground to place the item
--**
--************************************************************************--
function SFBrickDoorFrame:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	-- the brick wall have 600 base health + 100 per carpentry lvl
	self.javaObject:setMaxHealth(self:getHealth());
	self.javaObject:setHealth(self.javaObject:getMaxHealth());
	-- the sound that will be played when our door frame will be broken
	self.javaObject:setBreakSound("BreakObject");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
	buildUtil.checkCorner(x,y,z,north, self.javaObject);
	self.javaObject:transmitCompleteItemToServer();
    if self.sq:getZone() then
        self.sq:getZone():setHaveConstruction(true);
    end
end

function SFBrickDoorFrame:new(sprite, northSprite, corner)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.corner = corner;
	o.canPassThrough = true;
	o.isDoorFrame = true;
	o.name = "Brick Door Frame";
	o.isThumpable = false
	o.isWallLike = true
	return o;
end

-- return the health of the new wall, it's 600 + 100 per carpentry lvl
function SFBrickDoorFrame:getHealth()
	return 600 + buildUtil.getBrickHealth(self);
end

function SFBrickDoorFrame:isValid(square)
	if not self:haveMaterial(square) then return false end
	if not buildUtil.canBePlace(self, square) then return false end
	if buildUtil.stairIsBlockingPlacement(square, true, self.north) then return false end
	if not square:hasFloor(self.north) then return false; end
	return square:isFreeOrMidair(false);
end

function SFBrickDoorFrame:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
