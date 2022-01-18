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

function TimedRefuel2EmptyLighter_FromPetrolCan(player, empty_lighter, item)
	ISTimedActionQueue.add(TimedRefuel2:new(player, item, 200))
end

TimedRefuel2 = ISBaseTimedAction:derive("TimedRefuel2")

function TimedRefuel2:isValid()
	-- Оставляем без изменений
	return true;
end

function TimedRefuel2:start()
	-- Что происходит в начале действия (может быть пустым)
end

function TimedRefuel2:stop()
	-- Что происходит, если действие было прервано
	ISBaseTimedAction.stop(self) -- строка обязательна
end

--- Заправить зажигалку контекстным меню ---
function TimedRefuel2:perform()
	-- выполняется после задержки
	local player = getPlayer()
	local lighter
	local PetrolCan
	
	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "SMEmptyLighter" then
			player:getInventory():Remove(item)
			break
		end
	end

	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "PetrolCan" then
			PetrolCan = item
			PetrolCan:setUsedDelta((PetrolCan:getUsedDelta() - 0.01));
			player:getInventory():AddItem("Base.Lighter");
		
			if PetrolCan:getUsedDelta() == 0 then
				player:getInventory():Remove("PetrolCan");
				player:getInventory():AddItem("Base.EmptyPetrolCan");			
			end
			break
		end
	end
	ISBaseTimedAction.perform(self)
end

function TimedRefuel2:new(player, item, time)
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
local function checkInvItemEmptyLighter_FromPetrolCan(player, context, worldobjects, item)
	local lighter = item:getType();
	local check_PetrolCan

	if not lighter then
	return end
	
	if not isItemValid(player, lighter, item) then return -- no dupe anymore
	end
	
	if lighter ~= "SMEmptyLighter" then
	return end

	for i = 0, player:getInventory():getItems():size() - 1 do 
		local PetrolCan = player:getInventory():getItems():get(i);
		if PetrolCan:getType() == "PetrolCan" then
			check_PetrolCan = true
			break
		end
	end

	if check_PetrolCan ~= true then
	return end

--- Показ контекстно меню на предмете...
	local option = context:addOption(getText("IGUI_Refuel_Lighter"), player, TimedRefuel2EmptyLighter_FromPetrolCan, lighter, item); --- надпись меню
	if not isItemValid(player, lighter, item) then
		DisableOption(option, getText("IGUI_ContextMenu_Cant_Action")) --- надпись о невозможности выполнить (не подходят условия)
	end
end

--Добавляет пункт меню для следующего трека
local invContextMenuMenuRefuelEmptyLighter_FromPetrolCan = function(_player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(_player);

	for i,k in pairs(worldobjects) do
	-- inventory item list
		if instanceof(k, "InventoryItem") then
			checkInvItemEmptyLighter_FromPetrolCan(playerObj, context, worldobjects, k);          
			elseif not instanceof(k, "InventoryItem") and k.items and #k.items > 1 then
			checkInvItemEmptyLighter_FromPetrolCan(playerObj, context, worldobjects, k.items[1]);
		end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(invContextMenuMenuRefuelEmptyLighter_FromPetrolCan); -- контекстное меню для заправки зажигалки