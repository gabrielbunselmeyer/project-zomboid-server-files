--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISPlaceBricks = ISBaseTimedAction:derive("ISPlaceBricks");

function ISPlaceBricks:isValid()
	return true;
end

function ISPlaceBricks:update()
	self.character:faceThisObject(self.pallet2)
end

function ISPlaceBricks:start()
end

function ISPlaceBricks:stop()
    ISBaseTimedAction.stop(self);
end

function ISPlaceBricks:perform()

	local sprite = self.pallet2:getSprite()
	local properties = getSprite("construction_01_4"):getProperties()
	local moveable = properties:Is("IsMoveAble") or false;
	local weight = properties:Is("PickUpWeight") and tonumber(properties:Val("PickUpWeight"))

	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():Remove("filcher.Bricks");
	self.character:getInventory():setDrawDirty(true);
	self.pallet2:setSprite("construction_01_4");
	self.pallet2:getSprite():setProperties(properties);
	self.pallet2:getSprite():setName("construction_01_4");
	self.pallet2:transmitUpdatedSpriteToServer();

	--setProperties(self.pallet:getSprite(), properties :Is("CustomName") and properties :Val("Empty Pallet"));
	--setProperties(self.pallet:getSprite(), "PickUpWeight", 50);

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISPlaceBricks:new(character, pallet2)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.pallet2 = pallet2
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 50
	return o;
end