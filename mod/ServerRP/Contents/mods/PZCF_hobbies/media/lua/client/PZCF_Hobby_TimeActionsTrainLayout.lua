require "TimedActions/ISBaseTimedAction"

GetTrainLayoutAction = ISBaseTimedAction:derive("GetTrainLayoutAction");

function GetTrainLayoutAction:isValid()
	return true
end

function GetTrainLayoutAction:waitToStart()
    self.character:faceThisObject(self.object)
    return self.character:shouldBeTurning()
end

function GetTrainLayoutAction:update()
    self.character:faceThisObject(self.object)
end

function GetTrainLayoutAction:start()
	local randNum = ZombRand(12)
	if randNum > 0 then
		self.character:Say(getText("IGUI_PlayerText_Hobby_OperateTrainLayout"..randNum))
	end
	self:setActionAnim("ExamineVehicle");
	self:setOverrideHandModels(nil, nil)
	
    self.sound = self.character:getEmitter():playSound("PZCF_trainlayout")
    --addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 5, 1)	
end

function GetTrainLayoutAction:stop()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.stop(self)	
end

function GetTrainLayoutAction:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	if self.character:getBodyDamage():getBoredomLevel() > 0 then
		self.character:getBodyDamage():setBoredomLevel(self.character:getBodyDamage():getBoredomLevel() - 10)
	end
	if self.character:getBodyDamage():getUnhappynessLevel() > 0 then
		self.character:getBodyDamage():setUnhappynessLevel(self.character:getBodyDamage():getUnhappynessLevel() - 10)
	end
	ISBaseTimedAction.perform(self)		
end

function GetTrainLayoutAction:new(character, object)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o.stopOnWalk = true;
  o.stopOnRun = true;
  o.maxTime = 1450;
  o.character  = character;
  o.object = object;
  return o;
end