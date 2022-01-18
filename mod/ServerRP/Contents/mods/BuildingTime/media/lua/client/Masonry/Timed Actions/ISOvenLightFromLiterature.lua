--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISOvenLightFromLiterature = ISBaseTimedAction:derive("ISOvenLightFromLiterature");

function ISOvenLightFromLiterature:isValid()
--	camping.updateClientCampfire(self.campfire)
	return self.brickOven ~= nil and
		self.character:getInventory():contains(self.lighter) and
		self.character:getInventory():contains(self.item)
end

function ISOvenLightFromLiterature:update()
	self.item:setJobDelta(self:getJobDelta());
end

function ISOvenLightFromLiterature:start()
	self.item:setJobType("Lit up");
	self.item:setJobDelta(0.0);
end

function ISOvenLightFromLiterature:stop()
	ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function ISOvenLightFromLiterature:perform()
	self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);
	self.character:getInventory():Remove(self.item);
	self.lighter:Use();
	local fuelAmt = self.fuelAmt
	if isClient() then
		local cf = self.brickOven
		local args = { x = cf.x, y = cf.y, z = cf.z, fuelAmt = fuelAmt }
--		sendClientCommand(self.character, 'camping', 'lightFire', args)
	else
        SFBrickOven.lit(self.brickOven, true);
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISOvenLightFromLiterature:new(character, item, lighter, brickOven, fuelAmt, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.brickOven = brickOven;
	o.item = item;
	o.lighter = lighter;
	o.fuelAmt = fuelAmt;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
