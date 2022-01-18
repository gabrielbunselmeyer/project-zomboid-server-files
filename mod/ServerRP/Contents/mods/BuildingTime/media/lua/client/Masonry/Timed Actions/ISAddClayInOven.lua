--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISAddClayInOven = ISBaseTimedAction:derive("ISAddClayInOven");

function ISAddClayInOven:isValid()
	return true;
end

function ISAddClayInOven:update()
end

function ISAddClayInOven:start()
end

function ISAddClayInOven:stop()
	ISBaseTimedAction.stop(self);
end

function ISAddClayInOven:perform()
	ISBaseTimedAction.perform(self);
    if self.add then
        for i=0,4 do
            self.character:getInventory():Remove("SFMoldedBricks");
        end
        SFBrickOven.addClay(self.brickOven, true);
    else
        for i=0,4 do
            self.character:getInventory():AddItem("filcher.SFMoldedBricks");
        end
        SFBrickOven.addClay(self.brickOven, false);
    end
end

function ISAddClayInOven:new(character, brickOven, add)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 30;
    o.brickOven = brickOven;
	o.character  = character;
    o.add = add;
	return o;
end
