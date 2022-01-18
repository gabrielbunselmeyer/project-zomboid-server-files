--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISOvenLightFromPetrol = ISBaseTimedAction:derive("ISOvenLightFromPetrol");

function ISOvenLightFromPetrol:isValid()
--	camping.updateClientCampfire(self.campfire)
	local playerInv = self.character:getInventory()
	return playerInv:contains(self.petrol) and playerInv:contains(self.lighter) and
			self.lighter:getUsedDelta() > 0 and
			self.petrol:getUsedDelta() > 0 and
			self.brickOven ~= nil

end

function ISOvenLightFromPetrol:update()
	self.petrol:setJobDelta(self:getJobDelta());
end

function ISOvenLightFromPetrol:start()
	self.petrol:setJobType(getText("ContextMenu_LitOven"));
	self.petrol:setJobDelta(0.0);
end

function ISOvenLightFromPetrol:stop()
	ISBaseTimedAction.stop(self);
    self.petrol:setJobDelta(0.0);
end

function ISOvenLightFromPetrol:perform()
	self.petrol:getContainer():setDrawDirty(true);
    self.petrol:setJobDelta(0.0);
    SFBrickOven.lit(self.brickOven, true);
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISOvenLightFromPetrol:new(character, brickOven, lighter, petrol, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	-- custom fields
	o.brickOven = brickOven
	o.lighter = lighter
	o.petrol = petrol
	return o;
end
