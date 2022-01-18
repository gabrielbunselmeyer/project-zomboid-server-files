--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISTakeBricks = ISBaseTimedAction:derive("ISTakeBricks");

function ISTakeBricks:isValid()
	return true;
end

function ISTakeBricks:update()
	self.character:faceThisObject(self.pallet)
end

function ISTakeBricks:start()
end

function ISTakeBricks:stop()
    ISBaseTimedAction.stop(self);
end

function ISTakeBricks:perform()

	local properties = getSprite("construction_01_5"):getProperties()
	
	self.character:getInventory():AddItems("filcher.Bricks", 10);
	self.character:getInventory():setDrawDirty(true);
	self.pallet:setSprite("construction_01_5");
	self.pallet:getSprite():setProperties(properties);
	self.pallet:getSprite():setName("construction_01_5");
	self.pallet:transmitUpdatedSpriteToServer();

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISTakeBricks:new(character, pallet, square)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.pallet = pallet
	o.square = square
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 50
	return o;
end