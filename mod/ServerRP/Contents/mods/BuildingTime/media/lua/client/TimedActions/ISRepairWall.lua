--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRepairWall = ISBaseTimedAction:derive("ISRepairWall");

function ISRepairWall:isValid()
	return true;
end

function ISRepairWall:update()
	self.character:faceThisObject(self.thump)
end

function ISRepairWall:start()
	self.character:PlayAnim("Idle")
	local hammer = self.character:getInventory():getItemFromType("HammerStone");
	if self.character:getInventory():contains("Hammer") then
		hammer = self.character:getInventory():getItemFromType("Hammer");
	end
    	forceDropHeavyItems(self.character)
	self.character:setPrimaryHandItem(hammer);
end

function ISRepairWall:stop()
    ISBaseTimedAction.stop(self);
end

function ISRepairWall:perform()
        self.sound = self.character:getEmitter():playSound("PZ_Hammer", true)
        local radius = 20 * self.character:getHammerSoundMod()
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)

	local plank = self.character:getInventory():getItemFromType("Plank");
	local nail = self.character:getInventory():getItemFromType("Nails");
	self.character:getInventory():Remove(plank);
	self.character:getInventory():Remove(nail);
--	local health = self.thump:getMaxHealth() * (self.character:getPerkLevel(Perks.Woodwork) * 0.1);
--	self.thump:setHealth(health);

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISRepairWall:new(character, thump)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.thump = thump
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 50
	if character:HasTrait("Handy") then
		o.maxTime = 30;
    	end
	return o;
end
