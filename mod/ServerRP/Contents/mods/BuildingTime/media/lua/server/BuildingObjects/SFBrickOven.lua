--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

-- this class extend ISBuildingObject, it's a class to help you drag around/place an item in the world
SFBrickOven = ISBuildingObject:derive("SFBrickOven");
-- list of our oven in the world
SFBrickOven.ovens = {};

SFBrickOven.wantNoise = true
local noise = function(msg)
    if (SFBrickOven.wantNoise) then print('brick oven: '..msg) end
end

function SFBrickOven:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);
    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    buildUtil.setInfo(self.javaObject, self);
    buildUtil.consumeMaterial(self);
    self.javaObject:setMaxHealth(200);
    self.javaObject:setBreakSound("breakdoor");
    self.sq:AddSpecialObject(self.javaObject);
    self.javaObject:getModData()["fuelMax"] = self.fuelMax;
    self.javaObject:getModData()["fuelAmount"] = 0;
    self.javaObject:setSpecialTooltip(true)
    local oven = {};
    oven.x = self.sq:getX();
    oven.y = self.sq:getY();
    oven.z = self.sq:getZ();
    oven.fuelMax = 100;
    oven.fuelAmount = 0;
    table.insert(SFBrickOven.ovens, oven);
    self.javaObject:transmitCompleteItemToServer();
end

function SFBrickOven:new(player, sprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(sprite);
    o.noNeedHammer = true;
    o.name = "Brick Kiln";
    o.player = player;
    o.dismantable = true;
    return o;
end

-- our oven can be placed on this square ?
-- this function is called everytime you move the mouse over a grid square, you can for example not allow building inside house..
function SFBrickOven:isValid(square)
    if not square then return false end
    if square:isSolid() or square:isSolidTrans() then return false end
    if square:HasStairs() then return false end
    if square:HasTree() then return false end
    if not square:getMovingObjects():isEmpty() then return false end
    if not square:TreatAsSolidFloor() then return false end
    if not self:haveMaterial(square) then return false end
    for i=1,square:getObjects():size() do
        local obj = square:getObjects():get(i-1)
        if self:getSprite() == obj:getTextureName() then return false end
    end
    if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    return true
end

-- called after render the ghost objects
-- the ISBuildingObject only render 1 sprite (north, south...), for example for stairs I can render the 2 others tile for stairs here
-- if I return false, the ghost render will be in red and I couldn't build the item
function SFBrickOven:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
end

function SFBrickOven.isSFBrickOvenObject(object)
    if object ~= nil and object:getName() == "Brick Kiln" then
        return true;
    end
    return false;
end

function SFBrickOven.findObject(square)
    if not square then return nil end
    for i=0,square:getSpecialObjects():size()-1 do
        local obj = square:getSpecialObjects():get(i)
        if SFBrickOven.isSFBrickOvenObject(obj) then
            return obj
        end
    end
    return nil
end

function SFBrickOven.LoadGridsquare(square)
    if isClient() then return; end
    -- does this square have a rain oven ?
    for i=0,square:getSpecialObjects():size() - 1 do
        local obj = square:getSpecialObjects():get(i)
        if SFBrickOven.isSFBrickOvenObject(obj) then
            SFBrickOven.loadBrickOven(obj)
            break
        end
    end
end

function SFBrickOven.loadGridsquareJavaHook(sq, object)
    if isClient() then return; end
    SFBrickOven.loadBrickOven(object)
end

-- load the oven
function SFBrickOven.loadBrickOven(ovenObject)
    if not ovenObject or not ovenObject:getSquare() then return end
    local square = ovenObject:getSquare()
    local oven = nil;
    -- check if we don't already have this oven in our map (the streaming of the map make the gridsquare to reload every time)
    for i,v in ipairs(SFBrickOven.ovens) do
        if v.x == square:getX() and v.y == square:getY() and v.z == square:getZ() then
            oven = v;
            break;
        end
    end
    if not oven then -- if we don't have the oven, it's basically when you load your saved game the first time
        oven = {};
        oven.x = square:getX();
        oven.y = square:getY();
        oven.z = square:getZ();
        oven.fuelAmount = ovenObject:getModData()["fuelAmount"]
        oven.fuelMax = ovenObject:getModData()["fuelMax"]
        oven.charcoalTick = ovenObject:getModData()["charcoalTick"];
        oven.haveClay = ovenObject:getModData()["haveClay"];
        oven.haveBricks = ovenObject:getModData()["haveBricks"];
        oven.isLit = ovenObject:getModData()["isLit"];

    	table.insert(SFBrickOven.ovens, oven);
    	noise("new oven created " .. oven.x .. "," .. oven.y .. " with " .. oven.fuelAmount .. " water");
    else
        noise("found existed oven " .. oven.x .. "," .. oven.y .. " with " .. oven.fuelAmount);
    end

    ovenObject:setSpecialTooltip(true)
    ovenObject:getModData()["fuelMax"] = oven.fuelMax
end

-- Called when the client adds an object to the map (which it shouldn't be able to)
SFBrickOven.OnObjectAdded = function(object)
    if isClient() then return end
    if SFBrickOven.isSFBrickOvenObject(object) then
        SFBrickOven.loadBrickOven(object)
    end
end

function SFBrickOven.OnDestroyIsoThumpable(thump, player)
    if isClient() then return end
    if not thump:getSquare() or not SFBrickOven.isSFBrickOvenObject(thump) then
        return
    end
    local sq = thump:getSquare()
    local luaOven = SFBrickOven.getLuaObject(thump);
    if not sq then return end
        for iB,vB in ipairs(SFBrickOven.ovens) do
        if vB.x == sq:getX() and vB.y == sq:getY() and vB.z == sq:getZ() then
            noise('destroyed at '..vB.x..','..vB.y..','..vB.z)
        getCell():removeLamppost(luaOven.LightSource);
        table.remove(SFBrickOven.ovens, iB)
        break
        end
    end
end

function SFBrickOven.DoSpecialTooltip(tooltipUI, square)
    local playerObj = getSpecificPlayer(0)
    if not playerObj or playerObj:getZ() ~= square:getZ() or
        playerObj:DistToSquared(square:getX() + 0.5, square:getY() + 0.5) > 2 * 2 then
        return
    end

    local oven = SFBrickOven.findObject(square)
    if not oven then return end

    local smallFontHgt = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
    tooltipUI:setHeight(6 + smallFontHgt + 6 + smallFontHgt + 12)

    local textX = 12
    local textY = 6 + smallFontHgt + 6

    local barX = textX + getTextManager():MeasureStringX(UIFont.Small, getText("IGUI_invpanel_Remaining")) + 12
    local barWid = 80
    local barHgt = 4
    local barY = textY + (smallFontHgt - barHgt) / 2 + 2

    tooltipUI:setWidth(barX + barWid + 12)
    tooltipUI:DrawTextureScaledColor(nil, 0, 0, tooltipUI:getWidth(), tooltipUI:getHeight(), 0, 0, 0, 0.75)
    tooltipUI:DrawTextCentre(getText("ContextMenu_Brick_Oven"), tooltipUI:getWidth() / 2, 6, 1, 1, 1, 1)
    tooltipUI:DrawText(getText("IGUI_invpanel_Remaining") .. ":", textX, textY, 1, 1, 1, 1)
end

function SFBrickOven.getLuaObject(oven)
    if not oven then return nil; end
    for iB,vB in ipairs(SFBrickOven.ovens) do
        if vB.x == oven:getX() and vB.y == oven:getY() and vB.z == oven:getZ() then
            return vB;
        end
    end
end

SFBrickOven.setModData = function(oven)
    local cell = getWorld():getCell();
    local sq = cell:getGridSquare(oven.x, oven.y, oven.z);
    if not sq then return; end
    local ovenObject = SFBrickOven.findObject(sq);
    local previousisLit = ovenObject:getModData()["isLit"];
    local previoushaveClay = ovenObject:getModData()["haveClay"];
    local previoushaveBricks = ovenObject:getModData()["haveBricks"];
    local previouscharcoalTick = ovenObject:getModData()["charcoalTick"];
    local previousfuelAmount = ovenObject:getModData()["fuelAmount"];
    ovenObject:getModData()["isLit"] = oven.isLit;
    ovenObject:getModData()["haveClay"] = oven.haveClay;
    ovenObject:getModData()["haveBricks"] = oven.haveBricks;
    ovenObject:getModData()["charcoalTick"] = oven.charcoalTick;
    ovenObject:getModData()["fuelAmount"] = oven.fuelAmount;
    if previousisLit ~= ovenObject:getModData()["isLit"] or previoushaveClay ~= ovenObject:getModData()["haveClay"] or previoushaveBricks ~= ovenObject:getModData()["haveBricks"] or previouscharcoalTick ~= ovenObject:getModData()["charcoalTick"] or previousfuelAmount ~= ovenObject:getModData()["fuelAmount"] then
        ovenObject:transmitModData();
    end
end

SFBrickOven.lit = function(oven, isLit)
    local luaOven = SFBrickOven.getLuaObject(oven);
    oven:getModData()["isLit"] = isLit;
    oven:transmitModData();
    if luaOven then
        luaOven.isLit = isLit;
        if isLit then
            luaOven.LightSource = IsoLightSource.new(oven:getX(), oven:getY(), oven:getZ(), 0.61, 0.165, 0, 3);
            getCell():addLamppost(luaOven.LightSource);
        elseif luaOven.LightSource then
            getCell():removeLamppost(luaOven.LightSource);
            luaOven.charcoalTick = 0;
        end
    end
    oven:transmitModData();
end

SFBrickOven.addBricks = function(oven, haveBricks)
    local luaOven = SFBrickOven.getLuaObject(oven);
    oven:getModData()["haveBricks"] = haveBricks;
    oven:transmitModData();
    if luaOven then
        luaOven.haveBricks = haveBricks;
    end
    oven:transmitModData();
end

SFBrickOven.getFuel = function(oven)
    local luaOven = SFBrickOven.getLuaObject(oven);

	return oven:getModData()["fuelAmount"]
end

SFBrickOven.setFuel = function(oven, fuelAmount)
    local luaOven = SFBrickOven.getLuaObject(oven);
    oven:getModData()["fuelAmount"] = oven:getModData()["fuelAmount"] + fuelAmount;
    if oven:getModData()["fuelAmount"] > 100 then
    	oven:getModData()["fuelAmount"] = 100
    elseif oven:getModData()["fuelAmount"] < 0 then
    	oven:getModData()["fuelAmount"] = 0
    end
    oven:transmitModData();
    if luaOven then
        luaOven.fuelAmount = oven:getModData()["fuelAmount"];
    end
    oven:transmitModData();
end

SFBrickOven.addClay = function(oven, haveClay)
    local luaOven = SFBrickOven.getLuaObject(oven);
    oven:getModData()["haveClay"] = haveClay;
    oven:transmitModData();
    if luaOven then
        luaOven.haveClay = haveClay;
        if not haveClay then
            luaOven.charcoalTick = 0;
        end
    end
    oven:transmitModData();
end

function SFBrickOven.doCheck()
    if isClient() then return; end
    for iB,vB in ipairs(SFBrickOven.ovens) do
        SFBrickOven.setModData(vB);
        local square = getCell():getGridSquare(vB.x, vB.y, vB.z);
        local obj = SFBrickOven.findObject(square)
    	local luaOven = SFBrickOven.getLuaObject(obj);
        if vB.fuelAmount and vB.haveClay and vB.isLit then
                if not vB.charcoalTick then vB.charcoalTick = 1; else vB.charcoalTick = vB.charcoalTick + 1; end
		vB.fuelAmount = vB.fuelAmount - 1;
                noise('charcoal update ' .. vB.charcoalTick);
                if vB.charcoalTick == 18 then
                    vB.haveClay = false;
                    vB.isLit = false;
            	    getCell():removeLamppost(luaOven.LightSource);
                    vB.haveBricks = true;
                    vB.charcoalTick = nil;
                end
		if vB.fuelAmount == 0 then
                    vB.isLit = false;
            	    getCell():removeLamppost(luaOven.LightSource);
		end
        end
        if obj then
                obj:getModData()["fuelAmount"] = vB.fuelAmount;
                obj:getModData()["haveClay"] = vB.haveClay;
                obj:getModData()["isLit"] = vB.isLit;
                obj:getModData()["haveBricks"] = vB.haveBricks;
                obj:getModData()["charcoalTick"] = vB.charcoalTick;
                obj:transmitModData()
        end
    end
end

Events.EveryTenMinutes.Add(SFBrickOven.doCheck);
Events.OnClientCommand.Add(SFBrickOven.OnClientCommand)
Events.OnObjectAdded.Add(SFBrickOven.OnObjectAdded)
Events.OnDestroyIsoThumpable.Add(SFBrickOven.OnDestroyIsoThumpable);

