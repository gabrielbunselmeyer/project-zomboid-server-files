--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRepairLogWall = ISBaseTimedAction:derive("ISRepairLogWall");

function ISRepairLogWall:isValid()
	return true;
end

function ISRepairLogWall:update()
	self.character:faceThisObject(self.thump)
end

function ISRepairLogWall:start()
	self.character:PlayAnim("Idle")
	local hammer = self.character:getInventory():getItemFromType("HammerStone");
	if self.character:getInventory():contains("Hammer") then
		hammer = self.character:getInventory():getItemFromType("Hammer");
	end
    	forceDropHeavyItems(self.character)
	self.character:setPrimaryHandItem(hammer);
end

function ISRepairLogWall:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISRepairLogWall:perform()
        self.sound = self.character:getEmitter():playSound("PZ_Hammer", true)
        local radius = 20 * self.character:getHammerSoundMod()
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)

	self.character:getInventory():RemoveOneOf("Log");
	self.character:getInventory():RemoveOneOf("Plank");
--	local health = self.thump:getMaxHealth() * (self.character:getPerkLevel(Perks.Woodwork) * 0.1);
--	self.thump:setHealth(health);

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISRepairLogWall:new(character, thump)
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
    	o.caloriesModifier = 8;
	return o;
end
