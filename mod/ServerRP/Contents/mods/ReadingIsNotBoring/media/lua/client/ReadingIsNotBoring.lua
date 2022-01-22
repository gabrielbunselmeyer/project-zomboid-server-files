local adjustmentBaseValue1 = 1.05
local adjustmentBaseValue2 = 30


Events.OnGameStart.Add(
		function()
				adjustmentBaseValue1 = (adjustmentBaseValue1 + ((1.1 / 1380) * (getSandboxOptions():getDayLengthMinutes() - 60)))
				return
			end
	)


-- TimedActions\ISReadABook.lua
local originalISReadABookUpdate = ISReadABook.update


local calculateWeightedValue = function(adjustedValue, originalValue, originalMaximum, character)
		local traitAdjustmentValue = 1
		if character:HasTrait("FastReader") then
			traitAdjustmentValue = 0.7
		end
		if character:HasTrait("SlowReader") then
			traitAdjustmentValue = 1.3
		end
		return ((adjustedValue + math.ceil(math.max(((originalValue - (originalMaximum * 0.25)) * 0.04)))) * traitAdjustmentValue)
	end

ISReadABook.update = function(self, ...)
		local characterBodyDamage = nil
		local delta = nil
		if self.item:getNumberOfPages() >= 1 then
			characterBodyDamage = self.character:getBodyDamage()
			if characterBodyDamage ~= nil then
				delta = self.item:getAlreadyReadPages()
			end
		end


		local result = originalISReadABookUpdate(self, ...)


		if delta ~= nil then
			delta = (self.item:getAlreadyReadPages() - delta)
			if delta >= 1 then
				local adjustedValue1 = (adjustmentBaseValue1 * delta)

				local newBoredomLevel = characterBodyDamage:getBoredomLevel()
				newBoredomLevel = math.max(0, (newBoredomLevel - calculateWeightedValue(adjustedValue1, newBoredomLevel, 100, self.character)))
				characterBodyDamage:setBoredomLevel(newBoredomLevel)

				local newUnhappynessLevel = characterBodyDamage:getUnhappynessLevel()
				newUnhappynessLevel = math.max(0, (newUnhappynessLevel - calculateWeightedValue(adjustedValue1, newUnhappynessLevel, 100, self.character)))
				characterBodyDamage:setUnhappynessLevel(newUnhappynessLevel)

				local adjustedValue2 = (adjustmentBaseValue2 * delta)
				local characterStats = self.character:getStats()
				local newStress = ((characterStats:getStress() - characterStats:getStressFromCigarettes()) * 1000)
				newStress = (math.max(0, (newStress - calculateWeightedValue(adjustedValue2, newStress, 1000, self.character))) / 1000)
				characterStats:setStress(newStress)
			end
		end


		return result
	end
