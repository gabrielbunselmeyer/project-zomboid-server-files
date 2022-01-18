--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRemoveBricks = ISBaseTimedAction:derive("ISRemoveBricks");

function ISRemoveBricks:isValid()
	return true;
end

function ISRemoveBricks:update()
end

function ISRemoveBricks:start()
end

function ISRemoveBricks:stop()
	ISBaseTimedAction.stop(self);
end

function ISRemoveBricks:perform()
	ISBaseTimedAction.perform(self);
    SFBrickOven.addBricks(self.brickOven, false);
    self.character:getInventory():AddItems("filcher.Bricks", 5);
end

function ISRemoveBricks:new(character, brickOven)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 70;
    o.brickOven = brickOven;
	o.character  = character;
	return o;
end
