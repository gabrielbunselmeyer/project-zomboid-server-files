local function SMItemsNewGame(_player)
	local player = getSpecificPlayer(0)
	if not player then return end
	if player:HasTrait("Smoker") then
		local DeltaPack = ZombRand(0,20)/20;
		local TypePackCigarettesRand = ZombRand(4)+1;
		local DeltaNicoretteBlister = ZombRand(10,100)/100
		local TypeSourceFire = ZombRand(4)+1;
		local SourceFireDelta = ZombRand(100)/100;
		local TypePackCigarettes;	
		local SMPackCigarettesAdd;
		local NicoretteBlisterAdd;
		local SourceFire;
		local SourceFireAdd;
		
		if TypePackCigarettesRand == 1 then TypePackCigarettes = "Pack"
			elseif TypePackCigarettesRand == 2 then TypePackCigarettes = "PackLight"
			elseif TypePackCigarettesRand == 3 then TypePackCigarettes = "PackMenthol"
			elseif TypePackCigarettesRand == 4 then TypePackCigarettes = "PackGold"
		end

		if DeltaPack == 0 then
			player:getInventory():AddItem("SM.SMEmpty" .. tostring(TypePackCigarettes));
			elseif DeltaPack ~= 0 then
			SMPackCigarettesAdd = player:getInventory():AddItem("SM.SM" .. tostring(TypePackCigarettes));
			SMPackCigarettesAdd:setUsedDelta(DeltaPack);
		end
		
		if DeltaPack <= 0.2 then
			local chance = ZombRand(3)+1;
			if chance == 1 then
				NicoretteBlisterAdd = player:getInventory():AddItem("SM.SMNicorette");
				NicoretteBlisterAdd:setUsedDelta(DeltaNicoretteBlister);
			end
		end
		
		if TypeSourceFire == 1 then SourceFire = "SM.EmptyMatchbox"
			elseif TypeSourceFire == 2 then SourceFire = "SM.Matches"
			elseif TypeSourceFire == 3 then SourceFire = "Base.Lighter"
			elseif TypeSourceFire == 4 then SourceFire = "SM.SMEmptyLighter"
		end
		
		if SourceFire ~= "SM.EmptyMatchbox" and SourceFire ~= "SM.SMEmptyLighter" then
			SourceFireAdd = player:getInventory():AddItem(SourceFire);
			SourceFireAdd:setUsedDelta(SourceFireDelta);
			else
			SourceFireAdd = player:getInventory():AddItem(SourceFire);
		end
	end
end

Events.OnNewGame.Add(SMItemsNewGame)