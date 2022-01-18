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

function Fuelcanister5Lighter(player, fuelcanister, lighter, item)
	ISTimedActionQueue.add(Fuelcanister5:new(player, fuelcanister, lighter,item, 200))
end

Fuelcanister5 = ISBaseTimedAction:derive("Fuelcanister5")

function Fuelcanister5:isValid()
	-- Оставляем без изменений
	return true;
end

function Fuelcanister5:start()
	-- Что происходит в начале действия (может быть пустым)
end

function Fuelcanister5:stop()
	-- Что происходит, если действие было прервано
	ISBaseTimedAction.stop(self) -- строка обязательна
end

--- Заправить зажигалку контекстным меню ---
function Fuelcanister5:perform()
	-- выполняется после задержки
	local player = getPlayer()
	local fuelcanister_delta
	local lighter
	
	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "SMEmptyLighter" then
			lighter = item
			break
		end
	end

	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "HCFuelcanister" then
			fuelcanister = item
			fuelcanister_delta = fuelcanister:getUsedDelta();
			
			if fuelcanister_delta >= 0.5 then
				fuelcanister:setUsedDelta(fuelcanister_delta-0.5);
				elseif fuelcanister_delta < 0.5 then
				fuelcanister:setUsedDelta(0);
			end
			
			player:getInventory():AddItem("Base.Lighter");
			player:getInventory():Remove(lighter)
			break
		end
	end
	
	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "Lighter" then
			item:setUsedDelta(fuelcanister_delta*2);
			break
		end
	end
		
	ISBaseTimedAction.perform(self)
end

function Fuelcanister5:new(player, fuelcanister, lighter, item, time)
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
local function checkInvItemLighter5(player, context, worldobjects, item)
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

		if lighter:getType() == "SMEmptyLighter" then -- находим пустую зажигалку в инвентаре
			check_lighter = true
			break
		end
	end

	if  check_lighter ~= true then
	return end -- если нет пустой зажигалки,  то не показывать меню

--- Показ контекстно меню на предмете...
	local option = context:addOption(getText("IGUI_Refuel_Lighter"), player, Fuelcanister5Lighter, fuelcanister, lighter, item); --- надпись меню
	if not isItemValid(player, item) then
	DisableOption(option, getText("IGUI_ContextMenu_Cant_Action")) --- надпись о невозможности выполнить (не подходят условия)
	end
end

--Добавляет пункт меню для следующего трека
local invContextMenuMenuRefueEmptylLighter5 = function(_player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(_player);

	for i,k in pairs(worldobjects) do
	-- inventory item list
		if instanceof(k, "InventoryItem") then
			checkInvItemLighter5(playerObj, context, worldobjects, k);          
			elseif not instanceof(k, "InventoryItem") and k.items and #k.items > 1 then
			checkInvItemLighter5(playerObj, context, worldobjects, k.items[1]);
		end
	end
end

if getActivatedMods():contains("Hydrocraft") then
	Events.OnFillInventoryObjectContextMenu.Add(invContextMenuMenuRefueEmptylLighter5); -- контекстное меню для заправки зажигалки
end