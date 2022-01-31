function canUseTrainLayout (playerIndex, context, worldObjects, test)
	local groupName = nil
	local player = getSpecificPlayer(playerIndex)
	local bTrainLayout = false
	local trainLayoutObject = nil
	
	-- Check if player has train controller in inventory
	if not player:getInventory():contains("PZCF_TrainController") then
		return
	end
	
	-- Lets check for objects where we clicked
	for k, v in pairs(worldObjects) do
		if not bTrainLayout then -- Have we already found a train layout?
			if v:getProperties() ~= nil and v:getProperties():Val("GroupName") == "TrainLayout" then	-- Is the object a train layout?
				local square = v:getSquare()
				if not square:isOutside() then	-- Is it indoors?
					if (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier()) or square:haveElectricity() then -- is the layout powered?
						bTrainLayout = true
						trainLayoutObject = v
					end
				end
			end
		end
	end
	
	-- If player has a train controller and we found a layout then add option to context menu	
	if bTrainLayout then 
		context:addOption(getText("ContextMenu_OperateTrainLayout"), worldobjects, useTrainLayout, player, trainLayoutObject);	
	end
end

useTrainLayout = function (worldObjects, playerObj, trainLayoutObject)
	ISTimedActionQueue.add(GetTrainLayoutAction:new(playerObj, trainLayoutObject))
end

Events.OnFillWorldObjectContextMenu.Add(canUseTrainLayout)