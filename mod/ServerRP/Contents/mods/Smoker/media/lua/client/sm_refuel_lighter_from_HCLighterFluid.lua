require "ISUI/ISToolTip"
require "TimedActions/ISBaseTimedAction"

local function newToolTip()
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	return toolTip;
end

local function DisableOption(option, text)
	option.notAvailable = true
	local tooltip = newToolTip();
	tooltip.description = text;
	option.toolTip = tooltip;
end

local function isItemValid(player, empty_lighter, item)
	return item:getContainer() == player:getInventory();
end

function TimedRefuelLighter_FromPetrolCan(player, empty_lighter, item)
	ISTimedActionQueue.add(TimedRefuel4:new(player, item, 200))
end

TimedRefuel4 = ISBaseTimedAction:derive("TimedRefuel4")

function TimedRefuel4:isValid()
	-- Оставляем без изменений
	return true;
end

function TimedRefuel4:start()
	-- Что происходит в начале действия (может быть пустым)
end

function TimedRefuel4:stop()
	-- Что происходит, если действие было прервано
	ISBaseTimedAction.stop(self) -- строка обязательна
end

--- Заправить зажигалку контекстным меню ---
function TimedRefuel4:perform()
	-- выполняется после задержки
	local player = getPlayer()
	
	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "Lighter" then
			lighter = item
			lighter_delta = lighter:getUsedDelta();
			break
		end
	end

	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "HCLighterfluid" then
			fuelcanister = item
		
			if fuelcanister:getUsedDelta() > 0 then
				local fuelcanister_delta = fuelcanister:getUsedDelta();
				local need_fuel_lighter = (1 - lighter_delta);

				if fuelcanister_delta >= need_fuel_lighter then
					fuelcanister:setUsedDelta(fuelcanister_delta - need_fuel_lighter/4);
					lighter:setUsedDelta(lighter:getUsedDelta() + need_fuel_lighter*2);
					
					elseif fuelcanister_delta < need_fuel_lighter then
					fuelcanister:setUsedDelta(fuelcanister_delta - need_fuel_lighter/4);
					lighter:setUsedDelta(lighter_delta + fuelcanister_delta*2);
				end
				
				if fuelcanister:getUsedDelta() == 0 then
					player:getInventory():Remove(fuelcanister)
				end
			end
			break
		end
	end
	ISBaseTimedAction.perform(self)
end

function TimedRefuel4:new(player, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player -- переменная обязательно должна называться character
	o.item = item
	o.stopOnWalk = true -- прерывать при ходьбе
	o.stopOnRun = true -- прерывать при беге
	o.maxTime = time
	return o;
end

--Проверяет предмет, по которому кликнули пустая-ли это зажигалка
local function checkInvItemLighter_FromLighterFluid(player, context, worldobjects, item)
	local lighter = item:getType();
	local check_PetrolCan

	if not lighter then
	return end
	
	if not isItemValid(player, lighter, item) then return -- no dupe anymore
	end
	
	if lighter ~= "Lighter" then
	return end
	
	if lighter == "Lighter" and item:getUsedDelta() < 1 then -- находим пустую зажигалку в инвентаре с дельтой меньше единицы
		check_lighter = true
	end

	if check_lighter ~= true then
	return end -- если нет подходящей зажигалки,  то не показывать меню

	for i = 0, player:getInventory():getItems():size() - 1 do 
		local PetrolCan = player:getInventory():getItems():get(i);
		if PetrolCan:getType() == "HCLighterfluid" and PetrolCan:getUsedDelta() > 0 then
			check_PetrolCan = true
			break
		end
	end

	if check_PetrolCan ~= true then
	return end

--- Показ контекстно меню на предмете...
	local option = context:addOption(getText("IGUI_Refuel_Lighter"), player, TimedRefuelLighter_FromPetrolCan, lighter, item); --- надпись меню
	if not isItemValid(player, lighter, item) then
		DisableOption(option, getText("IGUI_ContextMenu_Cant_Action")) --- надпись о невозможности выполнить (не подходят условия)
	end
end

--Добавляет пункт меню для следующего трека
local invContextMenuMenuRefuelLighter_FromLighterFluid = function(_player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(_player);

	for i,k in pairs(worldobjects) do
	-- inventory item list
		if instanceof(k, "InventoryItem") then
			checkInvItemLighter_FromLighterFluid(playerObj, context, worldobjects, k);          
			elseif not instanceof(k, "InventoryItem") and k.items and #k.items > 1 then
			checkInvItemLighter_FromLighterFluid(playerObj, context, worldobjects, k.items[1]);
		end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(invContextMenuMenuRefuelLighter_FromLighterFluid); -- контекстное меню для заправки зажигалки