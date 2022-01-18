function OnSmoke_Bulbulyator(food, character, percent)
	local script = food:getScriptItem()
	if food:getType() == "SMSmokingDeviceWithPinchTobacco" or food:getType() == "SMSmokingDeviceWithSmokingBlend" then
		local player = getSpecificPlayer(0);
		local DATAPlayer = player:getModData();
		DATAPlayer.ItemSmoke = "Bulbulyator";
		DATAPlayer.Smoke = true;

		if food:getType() == "SMSmokingDeviceWithSmokingBlend" then
			OnSmoke_Cannabis(food, character) --launching the function of smoking drugs - GreenFire mod
			return
		end
	end
	
	
	local sm_percent = percent * (food:getStressChange() * 100) / script:getStressChange()
	local bodyDamage = character:getBodyDamage()
	local stats = character:getStats()

	if character:HasTrait("Smoker") then
		bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - 10 * sm_percent);
		
		if bodyDamage:getUnhappynessLevel() < 0 then
			bodyDamage:setUnhappynessLevel(0);
		end

		stats:setStress(stats:getStress() - 10 * sm_percent);
		if stats:getStress() < 0 then
			stats:setStress(0);
		end

		local reduceSFC = stats:getMaxStressFromCigarettes()
		stats:setStressFromCigarettes(stats:getStressFromCigarettes() - reduceSFC * sm_percent);
		character:setTimeSinceLastSmoke(stats:getStressFromCigarettes() / stats:getMaxStressFromCigarettes());
		
		else
		
		bodyDamage:setFoodSicknessLevel(bodyDamage:getFoodSicknessLevel() + 14 * sm_percent);
		if bodyDamage:getFoodSicknessLevel() > 100 then
			bodyDamage:setFoodSicknessLevel(100);
		end
	end

end