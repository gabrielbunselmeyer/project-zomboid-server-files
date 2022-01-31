PZCF_HobbyRecipe = {}
PZCF_HobbyRecipe.OnCreate = {}

local function ReduceMoodleLevel(player, moodletype, value)
	if moodletype == "Boredom" then
		if player:getBodyDamage():getBoredomLevel() > 0 then
			player:getBodyDamage():setBoredomLevel(player:getBodyDamage():getBoredomLevel() - value)
		end
	elseif moodletype == "Unhappiness" then
		if player:getBodyDamage():getUnhappynessLevel() > 0 then
			player:getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() - value)
		end
	end
end

function PZCF_HobbyRecipe.OnCreate.BuildModelKit(items, result, player)
	ReduceMoodleLevel(player, "Boredom", 20)
	ReduceMoodleLevel(player, "Unhappiness", 20)	
end

function PZCF_HobbyRecipe.OnCreate.BuildFoodTruckDisplay(items, result, player)
	ReduceMoodleLevel(player, "Boredom", 10)
	ReduceMoodleLevel(player, "Unhappiness", 5)	
end

function PZCF_HobbyRecipe.OnCreate.GenerateTradingGameCards(items, result, player)
	local greenCard = "PZCF_GreenTGC_"..ZombRand(1,20)
	local blueCard = "PZCF_BlueTGC_"..ZombRand(1,20)
	local redCard = "PZCF_RedTGC_"..ZombRand(1,20)
	local randRare = ZombRand(1000)
	
	if randRare >= 800 then
		local goldCard = "PZCF_GoldTGC_"..ZombRand(1,20)
		local x = ZombRand(1,3)
		if x == 1 then
			greenCard = goldCard
		elseif x == 2 then
			blueCard = goldCard
		elseif x == 3 then
			redCard = goldCard
		end
	end
	player:getInventory():AddItem(greenCard)
	player:getInventory():AddItem(blueCard)
	player:getInventory():AddItem(redCard)
	
end