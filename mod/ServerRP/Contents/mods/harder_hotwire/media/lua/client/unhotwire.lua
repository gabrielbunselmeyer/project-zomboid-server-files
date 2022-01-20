-- author: rez
-- version: 0.2 (2020-07-13)
-- based on: 40.43

require "TimedActions/ISBaseTimedAction"

unhotwire = ISBaseTimedAction:derive("unhotwire")

function unhotwire:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
		vehicle:isDriver(self.character) and
		not vehicle:isEngineRunning() and
		not vehicle:isEngineStarted()
end

function unhotwire:update()
end

function unhotwire:start()
end

function unhotwire:stop()
	ISBaseTimedAction.stop(self)
end

function unhotwire:perform()
	local vehicle = self.character:getVehicle()
	sendClientCommand(self.character, "vehicle", "cheatHotwire", {vehicle = vehicle:getId(), hotwired = false, broken = false})
	ISBaseTimedAction.perform(self)
end

function unhotwire:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 900 - (character:getPerkLevel(Perks.Electricity) * 10);
	return o
end
