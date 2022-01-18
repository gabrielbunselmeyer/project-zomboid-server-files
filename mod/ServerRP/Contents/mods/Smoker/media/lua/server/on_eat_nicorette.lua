function OnEat_Nicorette(food, character)
	if food:getType() == "SMGum" then
		local stats = character:getStats()
		stats:setStressFromCigarettes(0);
	end
end