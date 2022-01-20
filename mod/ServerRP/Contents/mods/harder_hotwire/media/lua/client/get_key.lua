-- author: rez
-- version: 0.2 (2020-07-13)
-- based on: 40.43

require "TimedActions/ISBaseTimedAction"

get_key = ISBaseTimedAction:derive("get_key")

function get_key:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
		vehicle:isDriver(self.character) and
		not vehicle:isEngineRunning() and
		not vehicle:isEngineStarted()
end

function get_key:update()
end

function get_key:start()
end

function get_key:stop()
	ISBaseTimedAction.stop(self)
end

function get_key:perform()
	local vehicle = self.character:getVehicle()
	sendClientCommand(self.character, "vehicle", "getKey", {vehicle = vehicle:getId()})
	ISBaseTimedAction.perform(self)
end

function get_key:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 2100 - (character:getPerkLevel(Perks.Electricity) * 10);
	return o
end
