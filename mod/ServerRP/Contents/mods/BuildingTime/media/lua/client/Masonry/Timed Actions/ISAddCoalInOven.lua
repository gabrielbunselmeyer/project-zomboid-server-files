--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISAddCoalInOven = ISBaseTimedAction:derive("ISAddCoalInOven");

function ISAddCoalInOven:isValid()
	local playerInv = self.character:getInventory()
	return playerInv:contains(self.coal)
end

function ISAddCoalInOven:update()
	self.coal:setJobDelta(self:getJobDelta());
end

function ISAddCoalInOven:start()
	self.coal:setJobType(getText("ContextMenu_Add_fuel_to_fire"));
	self.coal:setJobDelta(0.0);
end

function ISAddCoalInOven:stop()
	ISBaseTimedAction.stop(self);
    self.coal:setJobDelta(0.0);
end

function ISAddCoalInOven:perform()
	self.coal:getContainer():setDrawDirty(true);
    self.coal:setJobDelta(0.0);
    local use = math.floor(self.coal:getUsedDelta()/self.coal:getUseDelta());
    for i=0,use do
        if SFBrickOven.getFuel(self.oven) == 100 then
            break;
        end
    	SFBrickOven.setFuel(self.oven, 10);
        self.coal:Use();
    end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISAddCoalInOven:new(oven, coal, character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 100;
	-- custom fields
	o.oven = oven
	o.coal = coal;
	return o;
end
