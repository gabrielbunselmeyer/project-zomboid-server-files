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

local function isItemValid(player, item)
	return item:getContainer() == player:getInventory();
end

function Fuelcanister2Lighter(player, fuelcanister, lighter, item)
	ISTimedActionQueue.add(Fuelcanister2:new(player, fuelcanister, lighter,item, 200))
end

Fuelcanister2 = ISBaseTimedAction:derive("Fuelcanister2")

function Fuelcanister2:isValid()
	-- Оставляем без изменений
	return true;
end

function Fuelcanister2:start()
	-- Что происходит в начале действия (может быть пустым)
end

function Fuelcanister2:stop()
	-- Что происходит, если действие было прервано
	ISBaseTimedAction.stop(self) -- строка обязательна
end

--- Заправить зажигалку контекстным меню ---
function Fuelcanister2:perform()
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
		if item:getType() == "HCFuelcanister" then
			fuelcanister = item
		
			if fuelcanister:getUsedDelta() > 0 then
				local fuelcanister_delta = fuelcanister:getUsedDelta();
				local need_fuel_lighter = (1 - lighter_delta);

				if fuelcanister_delta >= need_fuel_lighter then
					fuelcanister:setUsedDelta(fuelcanister_delta - need_fuel_lighter/2);
					lighter:setUsedDelta(lighter:getUsedDelta() + need_fuel_lighter*2);
					
					elseif fuelcanister_delta < need_fuel_lighter then
					lighter:setUsedDelta(lighter_delta + fuelcanister_delta*2);
					fuelcanister:setUsedDelta(fuelcanister_delta - need_fuel_lighter/2);
				end
			end
			break
		end
	end
	ISBaseTimedAction.perform(self)
end

function Fuelcanister2:new(player, fuelcanister, lighter, item, time)
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
local function checkInvItemLighter2(player, context, worldobjects, item)
	local fuelcanister = item:getType();
	local check_lighter

	if not fuelcanister then
	return end

	if not isItemValid(player, item) then
	return end -- no dupe anymore

	if fuelcanister ~= "HCFuelcanister" or item:getUsedDelta() == 0 then
	return end -- если это не брелок-канистра или брелок-канистра пустой - то прервать выполнение функции

	for i = 0, player:getInventory():getItems():size() - 1 do 
		local lighter = player:getInventory():getItems():get(i);

		if lighter:getType() == "Lighter" and lighter:getUsedDelta() < 1 then -- находим пустую зажигалку в инвентаре
			check_lighter = true
			break
		end
	end

	if  check_lighter ~= true then
	return end -- если нет пустой зажигалки,  то не показывать меню

--- Показ контекстно меню на предмете...
	local option = context:addOption(getText("IGUI_Refuel_Lighter"), player, Fuelcanister2Lighter, fuelcanister, lighter, item); --- надпись меню
	if not isItemValid(player, item) then
	DisableOption(option, getText("IGUI_ContextMenu_Cant_Action")) --- надпись о невозможности выполнить (не подходят условия)
	end
end

--Добавляет пункт меню для следующего трека
local invContextMenuMenuRefuelLighter2 = function(_player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(_player);

	for i,k in pairs(worldobjects) do
	-- inventory item list
		if instanceof(k, "InventoryItem") then
			checkInvItemLighter2(playerObj, context, worldobjects, k);          
			elseif not instanceof(k, "InventoryItem") and k.items and #k.items > 1 then
			checkInvItemLighter2(playerObj, context, worldobjects, k.items[1]);
		end
	end
end

if getActivatedMods():contains("Hydrocraft") then
	Events.OnFillInventoryObjectContextMenu.Add(invContextMenuMenuRefuelLighter2); -- контекстное меню для заправки зажигалки
end