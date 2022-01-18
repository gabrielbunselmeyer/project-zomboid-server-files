--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISPutOutFireOven = ISBaseTimedAction:derive("ISPutOutFireOven");

function ISPutOutFireOven:isValid()
	return true;
end

function ISPutOutFireOven:update()
end

function ISPutOutFireOven:start()
end

function ISPutOutFireOven:stop()
	ISBaseTimedAction.stop(self);
end

function ISPutOutFireOven:perform()
	ISBaseTimedAction.perform(self);
    SFBrickOven.lit(self.brickOven, false);
end

function ISPutOutFireOven:new(character, brickOven)
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
