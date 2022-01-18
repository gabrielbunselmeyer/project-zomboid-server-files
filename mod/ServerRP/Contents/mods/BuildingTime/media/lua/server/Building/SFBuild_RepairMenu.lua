--***********************************************************
--**                    SOUL FILCHER                       **
--**     Contextual menu for repairing walls and windows   **
--***********************************************************

ISRepairMenu = {};
ISRepairMenu.plank = 0;
ISRepairMenu.nails = 0;
ISRepairMenu.log = 0;
ISRepairMenu.sfsealant = 0;
ISRepairMenu.glass = 0;
ISRepairMenu.cheat = false;
ISRepairMenu.woodWorkXp = 0;

ISRepairMenu.doRepairMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end

	ISRepairMenu.woodWorkXp = getSpecificPlayer(player):getPerkLevel(Perks.Woodwork);
	local thump = nil;

	local square = nil;

	-- we get the thumpable item (like wall/door/furniture etc.) if exist on the tile we right clicked
	for i,v in ipairs(worldobjects) do
		square = v:getSquare();
		if (instanceof(v, "IsoThumpable")) or (instanceof(v, "IsoWindow")) or (instanceof(v, "IsoDoor")) then
			thump = v;
		end
    end

    if thump and haveSomethingtoRepair(player) then
        local repairOption = context:addOption(getText("ContextMenu_Repair"), worldobjects, nil);
        local repairSubMenu = ISContextMenu:getNew(context);
        context:addSubMenu(repairOption, repairSubMenu);
        local keepMenu = false;	

	if instanceof(thump, "IsoWindow") and thump:isDestroyed() then
		ISRepairMenu.repairWindowMenu(repairSubMenu, player, thump);
		keepMenu = true;	
	elseif instanceof(thump, "IsoDoor") and (thump:getHealth() < (thump:getMaxHealth() * 0.9)) then
		ISRepairMenu.repairDoorMenu(repairSubMenu, player, thump);
		keepMenu = true;
	elseif thump:getName() == "Log Wall" and thump:getHealth() < (thump:getMaxHealth() * 0.9) then
		ISRepairMenu.repairLogWallMenu(repairSubMenu, player, thump);
		keepMenu = true;
	elseif instanceof(thump, "IsoThumpable") and thump:getHealth() < (thump:getMaxHealth() * 0.9) then
		ISRepairMenu.repairMiscMenu(repairSubMenu, player, thump);
		keepMenu = true;
	end

	if not keepMenu then
            context:removeLastOption()
        end
    end

end

ISRepairMenu.repairWindowMenu = function(context, player, thump)
	local windowOption = context:addOption(getText("ContextMenu_Window"), worldobjects, ISRepairMenu.onRepairWindow, getSpecificPlayer(player), thump);
	local tooltip = ISRepairMenu.canRepair(0,0,0,1,1,6,windowOption, player);
end

ISRepairMenu.onRepairWindow = function(worldobjects, player, thump)
	if luautils.walkAdj(player, thump:getSquare()) then
		local square = thump:getSquare();
		ISTimedActionQueue.add(ISRepairWindow:new(player, thump));
	end
end

ISRepairMenu.repairDoorMenu = function(context, player, thump)
--	local sprite = thump:getSprite():getTexture();
	local doorOption = context:addOption(getText("ContextMenu_Door"), worldobjects, ISRepairMenu.onRepairDoor, getSpecificPlayer(player), thump);
	local tooltip = ISRepairMenu.canRepair(1,1,0,0,0,3,doorOption, player);
--	tooltip:setName(thump:getObjectName());
--	tooltip.description = getText("Tooltip_craft_WoodenDoorDesc") .. tooltip.description;
--	tooltip:setTexture(sprite);
end

ISRepairMenu.onRepairDoor = function(worldobjects, player, thump)
	if luautils.walkAdj(player, thump:getSquare()) then
		local square = thump:getSquare();
		ISTimedActionQueue.add(ISRepairDoor:new(player, thump));
	end
end

ISRepairMenu.repairLogWallMenu = function(context, player, thump)
	local wallOption = context:addOption(thump:getName(), worldobjects, ISRepairMenu.onRepairLogWall, getSpecificPlayer(player), thump);
	local tooltip = ISRepairMenu.canRepair(0,0,1,0,0,0,wallOption, player);
end

ISRepairMenu.onRepairLogWall = function(worldobjects, player, thump)
	if luautils.walkAdj(player, thump:getSquare()) then
		local square = thump:getSquare();
		ISTimedActionQueue.add(ISRepairLogWall:new(player, thump));
	end
end

ISRepairMenu.repairMiscMenu = function(context, player, thump)
	local wallOption = context:addOption(thump:getName(), worldobjects, ISRepairMenu.onRepairDoor, getSpecificPlayer(player), thump);
	local tooltip = ISRepairMenu.canRepair(1,1,0,0,0,0,wallOption, player);
end

function haveSomethingtoRepair(player)
	ISRepairMenu.materialOnGround = buildUtil.checkMaterialOnGround(getSpecificPlayer(player):getCurrentSquare())
	if ISBuildMenu.cheat then
		return true;
	end
	ISRepairMenu.plank = 0;
	ISRepairMenu.nails = 0;
	ISRepairMenu.log = 0;
	ISRepairMenu.sfsealant = 0;
	ISRepairMenu.glass = 0;
	ISRepairMenu.hasHammer = getSpecificPlayer(player):getInventory():contains("Hammer")
	if ISRepairMenu.hasHammer then
		-- most objects require a hammer
	else
		return false
	end
	ISRepairMenu.plank = ISRepairMenu.countMaterial(player, "Base.Plank")
	ISRepairMenu.nails = ISRepairMenu.countMaterial(player, "Base.Nails")
	ISRepairMenu.log = ISRepairMenu.countMaterial(player, "Base.Log")
	ISRepairMenu.sfsealant = ISRepairMenu.countMaterial(player, "filcher.SFSealant")
	ISRepairMenu.glass = ISRepairMenu.countMaterial(player, "filcher.SFGlassPanel")
	return true;
end


-- **********************************************
-- **                  OTHER                   **
-- **********************************************

-- Create our toolTip, depending on the required material
ISRepairMenu.canRepair = function(plankNb, nailsNb, logNb, glassNb, sfsealantNb, carpentrySkill, option, player)
	-- create a new tooltip
	local tooltip = ISRepairMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	if ISRepairMenu.cheat then
		return tooltip;
	end
	tooltip.description = "<LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
	-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
	if ISRepairMenu.plank < plankNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Planks") .. " " .. ISRepairMenu.plank .. "/" .. plankNb .. " <LINE>";
		result = false;
	elseif plankNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Planks") .. " " .. plankNb .. " <LINE>";
	end
	if ISRepairMenu.nails < nailsNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Nails") .. " " .. ISRepairMenu.nails .. "/" .. nailsNb .. " <LINE>";
		result = false;
	elseif nailsNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Nails") .. " " .. nailsNb .. " <LINE>";
	end
    if ISRepairMenu.log < logNb then
        tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Log") .. " " .. ISRepairMenu.log .. "/" .. logNb .. " <LINE>";
		result = false;
    elseif logNb > 0 then
        tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Log") .. " " .. logNb .. " <LINE>";
    end
	if ISRepairMenu.glass < glassNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Glass Panel") .. " " .. ISRepairMenu.glass .. "/" .. glassNb .. " <LINE>";
		result = false;
	elseif glassNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Glass Panel") .. " " .. glassNb .. " <LINE>";
	end
	if ISRepairMenu.sfsealant < sfsealantNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Sealant") .. " " .. ISRepairMenu.sfsealant .. "/" .. sfsealantNb .. " <LINE>";
		result = false;
	elseif sfsealantNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Sealant") .. " " .. sfsealantNb .. " <LINE>";
	end
	if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
		result = false;
	elseif carpentrySkill > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

ISRepairMenu.addToolTip = function()
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	return toolTip;
end

ISRepairMenu.countMaterial = function(player, fullType)
    local inv = getSpecificPlayer(player):getInventory()
    local count = 0
    local items = inv:getItemsFromFullType(fullType, true)
    for i=1,items:size() do
        local item = items:get(i-1)
        if not instanceof(item, "InventoryContainer") or item:getInventory():getItems():isEmpty() then
            count = count + 1
        end
    end
    local type = string.split(fullType, "\\.")[2]
    for k,v in pairs(ISRepairMenu.materialOnGround) do
        if k == type then count = count + v end
    end
    return count
end

ISRepairMenu.requireHammer = function(option)
	if not ISRepairMenu.hasHammer and not ISRepairMenu.cheat then
		option.notAvailable = true
		option.onSelect = nil
	end
end

Events.OnFillWorldObjectContextMenu.Add(ISRepairMenu.doRepairMenu);