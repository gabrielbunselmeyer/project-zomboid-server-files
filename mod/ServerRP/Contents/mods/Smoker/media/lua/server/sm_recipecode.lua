function NoXP_OnGiveXP(recipe, ingredients, result, player)
end

-- ***** Support ExploringTime ***** --
function SMLanternLight_TestIsValid (sourceItem, result)
	if getActivatedMods():contains("ExploringTime") and sourceItem:getType() == "GasLantern" then
		return sourceItem:getUsedDelta() > 0; -- Если в фонаре есть топливо
	end
	return true -- топливо есть
end

function ExploringTime_TestIsValid(sourceItem, result)
	if not getActivatedMods():contains("ExploringTime") then --если игра без ExploringTime/filcher то рецепт показан не будет.
		return
	end
	return true
end

function Greenfire_TestIsValid(sourceItem, result)
	if not getActivatedMods():contains("jiggasGreenfireMod") then --если игра без GreenFire то рецепт показан не будет / if the game is without GreenFire then the recipe will not be shown.
		return
	end
	return true
end

-- (Рецепт только с Ванильными предметами) Смять пластиковую бутылку ---
function recipe_Vannila_TestIsValid(sourceItem, result)
	if getActivatedMods():contains("Hydrocraft") then --если активен мод Hydrocraft то рецепт показан не будет.
		return
	end
	return true
end

-- (Рецепт с Ванильными предметами и предметами из Гидрокрафта) Смять пластиковую бутылку ---
function recipe_Hydro_TestIsValid(sourceItem, result)
	if not getActivatedMods():contains("Hydrocraft") then --если игра без Hydrocraft то рецепт показан не будет.
		return
	end
	return true
end

-- (Recipe without Vanilla and without Littering items) Crumple a plastic bottle ---
function recipe_Littering_TestIsValid(sourceItem, result)
	if not getActivatedMods():contains("SVGLittering") then --- если в игре нет Littering, то рецепт не будет отображаться / if the game is without Littering, then the recipe will not be shown.
		return
	end
	return true
end

-- (Recipe with Littering items) Crumple a plastic bottle ---
function recipe_Active_Littering_TestIsValid(sourceItem, result)
	if getActivatedMods():contains("SVGLittering") then --- если в игре активен Littering, то рецепт не будет отображаться / if the game with active Littering, then the recipe will not be shown.
		return
	end
	return true
end

--[[
--- Проверки наличия фольги в пачке сигарет
function recipe_CheckFoilEmptyPack_TestIsValid(sourceItem)
	local pack = (tostring(sourceItem:getType()))
	if sourceItem:getType() == pack then
		local pack_data = sourceItem
		local DATASmokerCigarettePack = pack_data:getModData();
		return	DATASmokerCigarettePack.Foil == true -- Разрешить брать если фольга есть в пачке.
	end
	return true
end
--]]

--- Проверки табака в кисете - для разрешения крафта
function recipe_Put_Pinch_Tobacco_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMTobaccoPouches" then
		return sourceItem:getUsedDelta() < 0.99; -- Разрешить класть табак только в том случае, если в кисете есть место.
	end
	return true
end

function recipe_Put_Small_Handful_Tobacco_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMTobaccoPouches" then
		return sourceItem:getUsedDelta() < 0.91; -- Разрешить класть табак только в том случае, если в кисете есть место.
	end
	return true
end

function recipe_Take_Pinch_Tobacco_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMTobaccoPouches" then
		return sourceItem:getUsedDelta() > 0.019; -- Разрешить брать табак только в том случае, если в кисете он есть.
	end
	return true
end

function recipe_Take_Small_Handful_Tobacco_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMTobaccoPouches" then
		return sourceItem:getUsedDelta() >= 0.1; -- Разрешить брать табак только в том случае, если в кисете он есть.
	end
	return true
end

function recipe_Take_Cigarette_from_Pack_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMPack" then
		return sourceItem:getUsedDelta() ~= 0; -- Разрешить брать сигарету только в том случае, если в пачке они есть.
	end
	return true
end

function recipe_Take_Cigarette_from_PackLight_TestIsValid(sourceItem, result) -- Проверка для пачки Легких Сигарет
	if sourceItem:getType() == "SMPackLight" then
		return sourceItem:getUsedDelta() ~= 0; -- Разрешить брать сигарету только в том случае, если в пачке они есть.
	end
	return true
end

function recipe_Take_Cigarette_from_PackMenthol_TestIsValid(sourceItem, result) -- Проверка для пачки Метноловых Сигарет
	if sourceItem:getType() == "SMPackMenthol" then
		return sourceItem:getUsedDelta() ~= 0; -- Разрешите брать сигарету только в том случае, если в пачке они есть.
	end
	return true
end

function recipe_Take_Cigarette_from_PackGold_TestIsValid(sourceItem, result) -- Проверка для пачки Метноловых Сигарет
	if sourceItem:getType() == "SMPackGold" then
		return sourceItem:getUsedDelta() ~= 0; -- Разрешите брать сигарету только в том случае, если в пачке они есть.
	end
	return true
end

 --- Положить сигарету в пачку / Проверка наличия места в пачке для сигареты
function recipe_PutCigaretteInPack_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMPack" then --- Проверка наличия места в пачке для сигареты
		return sourceItem:getUsedDelta() < 1; -- Разрешите только в том случае, если в пачке есть место...
	end
	return true -- место есть
end

 --- Положить сигарету в пачку Легких сигарет / Проверка наличия места в пачке для сигареты
function recipe_PutCigaretteInPackLight_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMPackLight" then --- Проверка наличия места в пачке для сигареты
		return sourceItem:getUsedDelta() < 1; -- Разрешите только в том случае, если в пачке есть место...
	end
	return true -- место есть
end

 --- Положить сигарету в пачку Ментоловых сигарет / Проверка наличия места в пачке для сигареты
function recipe_PutCigaretteInPackMenthol_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMPackMenthol" then --- Проверка наличия места в пачке для сигареты
		return sourceItem:getUsedDelta() < 1; -- Разрешите только в том случае, если в пачке есть место...
	end
	return true -- место есть
end

 --- Положить сигарету в пачку Золотых сигарет / Проверка наличия места в пачке для сигареты
function recipe_PutCigaretteInPackGold_TestIsValid(sourceItem, result)
	if sourceItem:getType() == "SMPackGold" then --- Проверка наличия места в пачке для сигареты
		return sourceItem:getUsedDelta() < 1; -- Разрешите только в том случае, если в пачке есть место...
	end
	return true -- место есть
end

function recipe_CloseFullPackCigarettes_TestIsValid(sourceItem, result) -- закрыть полную пачку
	if sourceItem:getType() == "SMPack" then
		return sourceItem:getUsedDelta() == 1; -- Разрешите только в том случае, если пачка полная
	end
	return true -- пачка полная
end

function recipe_CloseFullPackCigarettesLight_TestIsValid(sourceItem, result) -- закрыть полную пачку Легких сигарет/close a full pack of Light Cigarettes
	if sourceItem:getType() == "SMPackLight" then
		return sourceItem:getUsedDelta() == 1; -- Разрешите только в том случае, если пачка полная/Allow only if the bundle is full
	end
	return true -- пачка полная/pack of cigarettes full
end

function recipe_CloseFullPackCigarettesMenthol_TestIsValid(sourceItem, result) -- закрыть полную пачку Ментоловых сигарет
	if sourceItem:getType() == "SMPackMenthol" then
		return sourceItem:getUsedDelta() == 1; -- Разрешите только в том случае, если пачка полная/Allow only if the bundle is full
	end
	return true -- пачка полная/pack of cigarettes full
end

function recipe_CloseFullPackCigarettesGold_TestIsValid(sourceItem, result) -- закрыть полную пачку Золотых сигарет
	if sourceItem:getType() == "SMPackGold" then
		return sourceItem:getUsedDelta() == 1; -- Разрешите только в том случае, если пачка полная/Allow only if the bundle is full
	end
	return true -- пачка полная/pack of cigarettes full
end

function recipe_TakeCigaretteFromPack_OnCreate(items, sourceItem, result, player)
--[[
	local player = getSpecificPlayer(0);
	local pack = (tostring(sourceItem:getType()));
	if sourceItem:getType() == pack then
		local pack_data = sourceItem;
		local DATASmokerCigarettePack = pack_data:getModData();
		local foil = DATASmokerCigarettePack.Foil;
		local delta_pack = pack_data:getUsedDelta()

		if delta_pack < 0.05 then
			player:getInventory():Remove(sourceItem);
			player:getInventory():AddItem("SM.SMEmptyPack");
		end

		for i=0, items:size()-1 do
			if items:get(i):getType() == "SMEmptyPack" and items:get(i):hasModData() == false then
				local DATASmokerCigarettePack = items:get(i):getModData();
				DATASmokerCigarettePack.Smoker = true;
				DATASmokerCigarettePack.Foil = foil;
				break
			end
		end
	end
--]]
end

function recipe_CloseFullPackCigarettes(items, result, player)
end

function recipe_Open_full_pack(items, result, player)
	result:setUsedDelta(1);
	local DATASmokerCigarettePack = result:getModData();
	DATASmokerCigarettePack.Smoker = true;
end

--- случайное количество сигарет при открытии найденной пачки
--- a random number of cigarettes when opening a found pack
function recipe_OpenPackCigarettes(items, result, player)
	local player = getPlayer()
	local NumCigarettesInPack = ZombRand(0,20)/20;

	if NumCigarettesInPack == 0 then player:Say(getText("IGUI_Empty"))
		elseif NumCigarettesInPack == 0.05 then player:Say(getText("IGUI_One_cigarette"))
		elseif NumCigarettesInPack == 0.1 then player:Say(getText("IGUI_Two_cigarettes"))
		elseif NumCigarettesInPack >= 0.15 and NumCigarettesInPack <= 0.25 then player:Say(getText("IGUI_There_is_some"))
		elseif NumCigarettesInPack >= 0.25 and NumCigarettesInPack <= 0.35 then player:Say(getText("IGUI_Less_than_half"))
		elseif NumCigarettesInPack >= 0.4 and NumCigarettesInPack <= 0.6 then player:Say(getText("IGUI_Almost_half_a_pack"))
		elseif NumCigarettesInPack >= 0.65 and NumCigarettesInPack <= 0.8 then player:Say(getText("IGUI_More_than_a_half"))
		elseif NumCigarettesInPack >= 0.85 and NumCigarettesInPack <= 0.95 then player:Say(getText("IGUI_Almost_a_complete_pack"))
		elseif NumCigarettesInPack == 1 then player:Say(getText("IGUI_Full_pack"));
	end

	result:setUsedDelta(NumCigarettesInPack);
	local DATASmokerCigarettePack = result:getModData();
	DATASmokerCigarettePack.Smoker = true;
end

--- Положить сигарету в пачку
--- Put a cigarette in a pack
function recipe_PutCigaretteInPack(items, result, player)
	local player = getPlayer()
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMPack" then
			local pack = items:get(i);
			local DATASmokerCigarettePack = pack:getModData();
			result:setUsedDelta(items:get(i):getUsedDelta()+0.05);
			local DATASmokerCigarettePack = result:getModData();
			DATASmokerCigarettePack.Smoker = true;
			break
		end
	end
end

--- Положить сигарету в пачку Легких сигарет
function recipe_PutCigaretteInPackLight(items, result, player)
	local player = getPlayer()
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMPackLight" then
			local pack = items:get(i);
			local DATASmokerCigarettePack = pack:getModData();
			result:setUsedDelta(items:get(i):getUsedDelta()+0.05);
			local DATASmokerCigarettePack = result:getModData();
			DATASmokerCigarettePack.Smoker = true;
			break
		end
	end
end

--- Положить сигарету в пачку Ментоловых сигарет
function recipe_PutCigaretteInPackMenthol(items, result, player)
local player = getPlayer()
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMPackMenthol" then
			local pack = items:get(i);
			local DATASmokerCigarettePack = pack:getModData();
			result:setUsedDelta(items:get(i):getUsedDelta()+0.05);
			local DATASmokerCigarettePack = result:getModData();
			DATASmokerCigarettePack.Smoker = true;
			break
		end
	end
end

--- Положить сигарету в пачку Золотых сигарет
function recipe_PutCigaretteInPackGold(items, result, player)
local player = getPlayer()
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMPackGold" then
			local pack = items:get(i);
			local DATASmokerCigarettePack = pack:getModData();
			result:setUsedDelta(items:get(i):getUsedDelta()+0.05);
			local DATASmokerCigarettePack = result:getModData();
			DATASmokerCigarettePack.Smoker = true;
			break
		end
	end
end

--[[
--- Извлечь фольгу из пустой пачки
function recipe_RemoveFoilFromCigaretteEmptyPack(items, sourceItem, result, player)
	local player = getPlayer()
	if sourceItem:getType() == "SMEmptyPack" or sourceItem:getType() == "SMEmptyPackLight" or sourceItem:getType() == "SMEmptyPackMenthol" then
		local empty_pack = items;
		local DATASmokerCigarettePack = empty_pack:getModData();
		DATASmokerCigarettePack.Foil = false;
	end
end
--]]

--- Положить сигарету в пустую пачку
function recipe_PutCigaretteInEmptyPack_OnCreate(items, result, player)
	local player = getPlayer()
	result:setUsedDelta(0.05);
	local DATASmokerCigarettePack = result:getModData();
	DATASmokerCigarettePack.Smoker = true;
end

-- Изготовление кисета для табака > изменить дельту кисета для табака до нуля [result] (новый/пустой кисет)
function Make_Tobacco_Pouch_OnCreate(items, result, player)
	result:setUsedDelta(0);
end

-- кладем Щепотку табака в кисет
function recipe_Put_Pinch_Tobacco_OnCreate(items, result, player)
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMTobaccoPouches" then --- находим используемый (удаляемый) в крафте кисет и в [result] записывает дельту от него + устанавливаем прибавление дельты в зависимости от количества табака.
			result:setUsedDelta(items:get(i):getUsedDelta()+0.02);
		end
	end
end

-- кладем Маленькую горстку табака в кисет
function recipe_Put_Small_Handful_Tobacco_OnCreate(items, result, player)
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMTobaccoPouches" then --- находим используемый (удаляемый) в крафте кисет и в [result] записывает дельту от него + устанавливаем прибавление дельты в зависимости от количества табака.
			result:setUsedDelta(items:get(i):getUsedDelta()+0.1);
		end
	end
end

-- берем Шепотку табака из кисета
function recipe_Take_Pinch_Tobacco_OnCreate(items, result, player)
	local player = getPlayer();
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMTobaccoPouches" then --- находим используемый (удаляемый) в крафте кисет и в [result] записывает дельту от него + устанавливаем уменьшение дельты.
			result:setUsedDelta(items:get(i):getUsedDelta()-0.02);
			player:getInventory():AddItem("SM.SMPinchTobacco");
		end
	end
end

-- берем Маленькую горстку табака из кисета
function recipe_Take_Small_Handful_Tobacco_OnCreate(items, result, player)
	local player = getPlayer();
	for i=0, items:size()-1 do
		if items:get(i):getType() == "SMTobaccoPouches" then --- находим используемый (удаляемый) в крафте кисет и в [result] записывает дельту от него + устанавливаем уменьшение дельты.
			result:setUsedDelta(items:get(i):getUsedDelta()-0.1);
			player:getInventory():AddItem("SM.SMSmallHandfulTobacco");
		end
	end
end

--- Извлечение табака из обычной сигареты + добавляем фильтр от сигареты
function recipe_Remove_Tobacco_From_Cigarette_OnCreate(items, player)
	local player = getPlayer();
	player:getInventory():AddItem("SM.SMFilter"); --- добавляем в инвентарь фильтр
end

--- Добавляем щепотку табака / Add a pinch of tobacco ---
function recipe_Remove_Tobacco_From_Butt_OnCreate(items, player)
	local player = getPlayer();
	player:getInventory():AddItem("SM.SMPinchTobacco"); --- добавляем в инвентарь щепотку табака / add a pinch of tobacco to inventory
end

--- Оторвать фильтр от окурка
function recipe_Remove_Filter_From_Butt_OnCreate(items, player)
	local player = getPlayer();
	player:getInventory():AddItem("SM.SMFilter"); --- добавляем в инвентарь фильтр
end

--- Извлечение табака из самопальной сигареты + добавляем фильтр
function recipe_Remove_Tobacco_From_Homemade_Cigarette_OnCreate(items, player)
	local player = getPlayer();
	player:getInventory():AddItem("SM.SMFilter"); --- добавляем в инвентарь фильтр
end

--- Добавляем маленькую горстку табака ---
function recipe_Remove_Tobacco_OnCreate(items, player)
	local player = getPlayer();
	player:getInventory():AddItem("SM.SMSmallHandfulTobacco"); --- добавляем в инвентарь маленькую горстку табака
end

--- Добавляем маленькую горстку табака ---
function recipe_AddSmokingBlend_OnCreate(items, player)
	local player = getPlayer();
	player:getInventory():AddItem("SM.SMSmokingBlend"); --- добавляем в инвентарь курительную смесь
end

-- Сделать отверстия в крышке из фольги ---
function recipe_MakeHolesFoil_OnCreate(item, result, player)
	local DATABulbulyator = result:getModData();
	DATABulbulyator.Foil = 0;
	DATABulbulyator.CounterSmoke = 0;
end

-- Положить щепотку табака в сухой бульбулятор --
function recipe_SMPutPinchTobbacoToBulbulaytor_OnCreate(sourceItem, result, player)
	local foil
	local counter_smoke
	local bulbulyator
	
	for i=0, sourceItem:size()-1 do
		if sourceItem:get(i):getType() == "SMCrumpledWithFoilCap2" then
			local DATABulbulyator = sourceItem:get(i):getModData()
			foil = DATABulbulyator.Foil;
			counter_smoke = DATABulbulyator.CounterSmoke;
			if DATABulbulyator.Foil == nil then foil = 0 end
			if DATABulbulyator.CounterSmoke == nil then counter_smoke = 0 end
			break
		end
	end
	
	bulbulyator = result;
	local DATABulbulyator = bulbulyator:getModData()
	DATABulbulyator.Foil = foil;
	DATABulbulyator.CounterSmoke = counter_smoke;
end

-- Извлечь табак из сухого бульбулятора --
function recipe_Remove_Tobacco_From_Bulbulaytor_OnCreate(sourceItem, result, player)
	local foil;
	local counter_smoke;
	local bulbulyator;
	local player = getPlayer();
	for i=0, sourceItem:size()-1 do
		if sourceItem:get(i):getType() == "SMSmokingDeviceWithPinchTobacco" then
			local DATABulbulyator = sourceItem:get(i):getModData()
			foil = DATABulbulyator.Foil;
			counter_smoke = DATABulbulyator.CounterSmoke;
			if DATABulbulyator.Foil == nil then foil = 0 end
			if DATABulbulyator.CounterSmoke == nil then counter_smoke = 0 end
			break
		end
	end

	bulbulyator = result;
	local DATABulbulyator = bulbulyator:getModData()
	DATABulbulyator.Foil = foil;
	DATABulbulyator.CounterSmoke = counter_smoke;
	player:getInventory():AddItem("SM.SMPinchTobacco"); --- добавляем в инвентарь щепотку табака / add a pinch of tobacco to inventory
end