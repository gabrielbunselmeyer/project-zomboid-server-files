--NoLighterNeeded Mod by Fingbel

local old_ISVehicleMenu_showRadialMenu = ISVehicleMenu.showRadialMenu


function ISVehicleMenu.showRadialMenu(player)
	
	--Let's run the vanilla function before our code
	old_ISVehicleMenu_showRadialMenu(player)	
	local vehicle = player:getVehicle()
	local smokables = CheckInventoryForCigarette(player)

	if vehicle ~= nil then
		local menu = getPlayerRadialMenu(player:getPlayerNum())
		
		--Gamepad stuff
		if menu:isReallyVisible() then
			if menu.joyfocus then
				setJoypadFocus(player:getplayerObjNum(), nil)
			end 
			menu:undisplay()
			return
		end
		local seat = vehicle:getSeat(player)
		
		if seat == 0 or seat == 1 then
			
			--Do we have everything ?
			if smokables ~= nil and vehicle:getBatteryCharge() > 0 and (vehicle:isHotwired() or vehicle:isKeysInIgnition()) then
				if 	IDNAL == "MODDEDIDNAL" then menu:addSlice(getText('ContextMenu_CarLighter'), getTexture("media/ui/vehicles/carSmokingBatteryCigarette.png"), IDNALOnSubMenu, player)				
					else menu:addSlice(getText('ContextMenu_CarLighter'),getTexture("media/ui/vehicles/carSmokingBatteryCigarette.png"), OnCarSmoking, player, smokables[0] ) 
				end
			
			--What are we missing ?
			elseif smokables == nil and vehicle:getBatteryCharge() > 0 and (vehicle:isHotwired() or vehicle:isKeysInIgnition()) then
				 menu:addSlice(getText('ContextMenu_CarLighter')  ..":" .. getText('ContextMenu_CarOutOfCigarette'), getTexture("media/ui/vehicles/carSmokingBatteryContactNoCigarette.png"))	
				 
			elseif smokables == nil and vehicle:getBatteryCharge() == 0 and (vehicle:isHotwired() or vehicle:isKeysInIgnition()) then
				menu:addSlice(getText('ContextMenu_CarLighter') ..":" .. getText('ContextMenu_CarOutOfCigarette') .. getText('ContextMenu_CarNoBattery'),getTexture("media/ui/vehicles/carSmokingNoBatteryContactNoCigarette.png")) 						

			elseif smokables == nil and vehicle:getBatteryCharge() == 0 and (not vehicle:isHotwired() or not vehicle:isKeysInIgnition()) then
				menu:addSlice(getText('ContextMenu_CarLighter') ..":" .. getText('ContextMenu_CarOutOfCigarette') .. getText('ContextMenu_CarNoBattery') .. getText('ContextMenu_CarNoKeyOrWire'),getTexture("media/ui/vehicles/carSmokingNoBatteryNoContactNoCigarette.png") )

			elseif smokables == nil and vehicle:getBatteryCharge() > 0 and (not vehicle:isHotwired() or not vehicle:isKeysInIgnition()) then
				menu:addSlice(getText('ContextMenu_CarLighter') ..":".. getText('ContextMenu_CarOutOfCigarette') .. getText('ContextMenu_CarNoKeyOrWire'),getTexture("media/ui/vehicles/carSmokingBatteryNoContactNoCigarette.png") ) 

			elseif smokables ~= nil and vehicle:getBatteryCharge() > 0 and (not vehicle:isHotwired() or not vehicle:isKeysInIgnition()) then
				menu:addSlice(getText('ContextMenu_CarLighter') ..":" .. getText('ContextMenu_CarNoKeyOrWire'),getTexture("media/ui/vehicles/carSmokingBatteryNoContactCigarette.png")) 

			elseif smokables ~= nil and vehicle:getBatteryCharge() == 0 and  (vehicle:isHotwired() or  vehicle:isKeysInIgnition()) then
				 menu:addSlice(getText('ContextMenu_CarLighter') ..":".. getText('ContextMenu_CarNoBattery'),getTexture("media/ui/vehicles/carSmokingNoBatteryContactCigarette.png")) 

			elseif smokables ~= nil and vehicle:getBatteryCharge() == 0 and (not vehicle:isHotwired() or not vehicle:isKeysInIgnition()) then
				 menu:addSlice(getText('ContextMenu_CarLighter') ..":".. getText('ContextMenu_CarNoBattery') .. getText('ContextMenu_CarNoKeyOrWire'),getTexture("media/ui/vehicles/carSmokingNoBatteryNoContactCigarette.png")) 
			end
		end
		menu:addToUIManager()
	end
end

		--This is the function for the Sub-Menu for the modded version of the car lighter to show-up smokable while in a car
function IDNALOnSubMenu(player)
	local smokables = CheckInventoryForCigarette(player) --TODO : this could be a parameter, we are wasting power
	local menu = getPlayerRadialMenu(player:getPlayerNum())
	menu:clear()
	

	
	--Draw the radial menu again
	menu:setX(getPlayerScreenLeft(player:getPlayerNum()) + getPlayerScreenWidth(player:getPlayerNum()) / 2 - menu:getWidth() / 2)
	menu:setY(getPlayerScreenTop(player:getPlayerNum()) + getPlayerScreenHeight(player:getPlayerNum()) / 2 - menu:getHeight() / 2)

	local texture = Joypad.Texture.AButton

	
	for i=0, getTableSize(smokables) -1 do --TODO : this need to have a hardcap to not fuck up the radialmenu
		menu:addSlice(smokables[i]:getDisplayName(), smokables[i]:getTexture(), OnCarSmoking, player, smokables[i] )
	end
	
	menu:addToUIManager()

	if JoypadState.players[player:getPlayerNum()+1] then
		menu:setHideWhenButtonReleased(Joypad.DPadUp)
		setJoypadFocus(player:getPlayerNum(), menu)
		player:setJoypadIgnoreAimUntilCentered(true)
	end

end

	--This is the function starting the car smoking sequence
function OnCarSmoking(_player, _cigarette)
	
	--Do we need to transfer cigarette from a bag first ? 
	if _cigarette:getContainer() ~= _player:getInventory() then
		ISTimedActionQueue.add(ISInventoryTransferAction:new (_player,  _cigarette, _cigarette:getContainer(), _player:getInventory(), 5))
	end

	--We need some time for the lighter to heat
	ISTimedActionQueue.add(IsCarLighting:new (_player, _cigarette, 300))
	
	--Let's smoke now
	ISTimedActionQueue.add(IsCarSmoking:new(_player, _cigarette, 460))
end