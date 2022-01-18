SFBuildCarpentryMenu = {};

function SFBuildCarpentryMenu.doBuildMenu(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

	local playerObj = getSpecificPlayer(player)
	
	--What you use to add to the existing build submenu in your own script:
	local subMenu = nil;
	local carpentryOption = nil;
	for i,v in ipairs(context.options) do
		if v.name == getText("ContextMenu_Build") then
			carpentryOption = v;
			subMenu = context:getSubMenu(carpentryOption.subOption);
		end
	end

	local furnitureOption = nil;
	local furnitureSubMenu = nil;
	if subMenu then
		for i,v in ipairs(subMenu.options) do
			if v.name == getText("ContextMenu_Furniture") then
				furnitureOption = v;
				furnitureSubMenu = subMenu:getSubMenu(furnitureOption.subOption);
			end
		end
	end

	if subMenu then
		context:addSubMenu(carpentryOption, subMenu);
		--Now you can add your stuff to the build menu.
			------------------ CRATES ------------------
			local cratesOption = subMenu:addOption(getText("ContextMenu_PaintedCrates"), worldobjects, nil);
			local subMenuCrates = subMenu:getNew(subMenu);
			-- we add our new menu to the option we want (here wood)
			subMenu:addSubMenu(cratesOption, subMenuCrates);
			SFBuildCarpentryMenu.buildCratesMenu(subMenuCrates, cratesOption, player);
			------------------ WINDOWS ------------------
			--local windowOption = subMenu:addOption(getText("ContextMenu_Windows"), worldobjects, nil);
			--local subMenuWindows = subMenu:getNew(subMenu);
			-- we add our new menu to the option we want (here wood)
			--subMenu:addSubMenu(windowOption, subMenuWindows);
			--SFBuildCarpentryMenu.buildWindowMenu(subMenuWindows, windowOption, player);

	end

	if furnitureSubMenu then
		subMenu:addSubMenu(furnitureOption, furnitureSubMenu);
		--Now you can add your stuff to the build menu.
			------------------ FURNITURE ------------------
    			local displaySprite = {sprite = "location_shop_generic_01_89", northSprite = "location_shop_generic_01_88", eastSprite = "location_shop_generic_01_90", southSprite = "location_shop_generic_01_91"};
    			local displayOption = furnitureSubMenu:addOption(getText("ContextMenu_DisplayCounter"), worldobjects, SFBuildCarpentryMenu.onDisplayCounter, square, displaySprite, player);
    			local tooltip2 = ISBuildMenu.canBuild(3,3,0,0,0,3,displayOption, player);
    			tooltip2:setName(getText("ContextMenu_DisplayCounter"));
    			tooltip2.description = getText("Tooltip_craft_DisplayCounterDesc") .. tooltip2.description;
    			tooltip2:setTexture(displaySprite.sprite);
			ISBuildMenu.requireHammer(displayOption)
	end
end

SFBuildCarpentryMenu.buildCratesMenu = function(subMenu, option, player)
    	local blackSprite = {sprite = "sfbuild_cratecolors_01_14", northSprite = "sfbuild_cratecolors_01_14"};
	local blackOption = subMenu:addOption(getText("ContextMenu_Black_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, blackSprite, player, "Base.PaintBlack");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,blackOption, player, "Base.PaintBlack");
	toolTip:setName(getText("ContextMenu_Black_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(blackSprite.sprite);
	ISBuildMenu.requireHammer(blackOption)

    	local blueSprite = {sprite = "sfbuild_cratecolors_01_0", northSprite = "sfbuild_cratecolors_01_0"};
	local blueOption = subMenu:addOption(getText("ContextMenu_Blue_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, blueSprite, player, "Base.PaintBlue");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,blueOption, player, "Base.PaintBlue");
	toolTip:setName(getText("ContextMenu_Blue_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(blueSprite.sprite);
	ISBuildMenu.requireHammer(blueOption)

    	local brownSprite = {sprite = "sfbuild_cratecolors_01_1", northSprite = "sfbuild_cratecolors_01_1"};
	local brownOption = subMenu:addOption(getText("ContextMenu_Brown_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, brownSprite, player, "Base.PaintBrown");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,brownOption, player, "Base.PaintBrown");
	toolTip:setName(getText("ContextMenu_Brown_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(brownSprite.sprite);
	ISBuildMenu.requireHammer(brownOption)

    	local cyanSprite = {sprite = "sfbuild_cratecolors_01_2", northSprite = "sfbuild_cratecolors_01_2"};
	local cyanOption = subMenu:addOption(getText("ContextMenu_Cyan_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, cyanSprite, player, "Base.PaintCyan");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,cyanOption, player, "Base.PaintCyan");
	toolTip:setName(getText("ContextMenu_Cyan_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(cyanSprite.sprite);
	ISBuildMenu.requireHammer(cyanOption)

    	local greenSprite = {sprite = "sfbuild_cratecolors_01_3", northSprite = "sfbuild_cratecolors_01_3"};
	local greenOption = subMenu:addOption(getText("ContextMenu_Green_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, greenSprite, player, "Base.PaintGreen");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,greenOption, player, "Base.PaintGreen");
	toolTip:setName(getText("ContextMenu_Green_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(greenSprite.sprite);
	ISBuildMenu.requireHammer(greenOption)

    	local greySprite = {sprite = "sfbuild_cratecolors_01_4", northSprite = "sfbuild_cratecolors_01_4"};
	local greyOption = subMenu:addOption(getText("ContextMenu_Grey_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, greySprite, player, "Base.PaintGrey");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,greyOption, player, "Base.PaintGrey");
	toolTip:setName(getText("ContextMenu_Grey_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(greySprite.sprite);
	ISBuildMenu.requireHammer(greyOption)

    	local ltblueSprite = {sprite = "sfbuild_cratecolors_01_5", northSprite = "sfbuild_cratecolors_01_5"};
	local ltblueOption = subMenu:addOption(getText("ContextMenu_LightBlue_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, ltblueSprite, player, "Base.PaintLightBlue");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,ltblueOption, player, "Base.PaintLightBlue");
	toolTip:setName(getText("ContextMenu_LightBlue_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(ltblueSprite.sprite);
	ISBuildMenu.requireHammer(ltblueOption)

    	local ltbrownSprite = {sprite = "sfbuild_cratecolors_01_6", northSprite = "sfbuild_cratecolors_01_6"};
	local ltbrownOption = subMenu:addOption(getText("ContextMenu_LightBrown_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, ltbrownSprite, player, "Base.PaintLightBrown");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,ltbrownOption, player, "Base.PaintLightBrown");
	toolTip:setName(getText("ContextMenu_LightBrown_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(ltbrownSprite.sprite);
	ISBuildMenu.requireHammer(ltbrownOption)

    	local orangeSprite = {sprite = "sfbuild_cratecolors_01_7", northSprite = "sfbuild_cratecolors_01_7"};
	local orangeOption = subMenu:addOption(getText("ContextMenu_Orange_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, orangeSprite, player, "Base.PaintOrange");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,orangeOption, player, "Base.PaintOrange");
	toolTip:setName(getText("ContextMenu_Orange_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(orangeSprite.sprite);
	ISBuildMenu.requireHammer(orangeOption)

    	local pinkSprite = {sprite = "sfbuild_cratecolors_01_8", northSprite = "sfbuild_cratecolors_01_8"};
	local pinkOption = subMenu:addOption(getText("ContextMenu_Pink_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, pinkSprite, player, "Base.PaintPink");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,pinkOption, player, "Base.PaintPink");
	toolTip:setName(getText("ContextMenu_Pink_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(pinkSprite.sprite);
	ISBuildMenu.requireHammer(pinkOption)

    	local purpleSprite = {sprite = "sfbuild_cratecolors_01_9", northSprite = "sfbuild_cratecolors_01_9"};
	local purpleOption = subMenu:addOption(getText("ContextMenu_Purple_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, purpleSprite, player, "Base.PaintPurple");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,purpleOption, player, "Base.PaintPurple");
	toolTip:setName(getText("ContextMenu_Purple_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(purpleSprite.sprite);
	ISBuildMenu.requireHammer(purpleOption)

    	local redSprite = {sprite = "sfbuild_cratecolors_01_13", northSprite = "sfbuild_cratecolors_01_13"};
	local redOption = subMenu:addOption(getText("ContextMenu_Red_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, redSprite, player, "Base.PaintRed");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,redOption, player, "Base.PaintRed");
	toolTip:setName(getText("ContextMenu_Red_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(redSprite.sprite);
	ISBuildMenu.requireHammer(redOption)

    	local turquoiseSprite = {sprite = "sfbuild_cratecolors_01_10", northSprite = "sfbuild_cratecolors_01_10"};
	local turquoiseOption = subMenu:addOption(getText("ContextMenu_Turquoise_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, turquoiseSprite, player, "Base.PaintTurquoise");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,turquoiseOption, player, "Base.PaintTurquoise");
	toolTip:setName(getText("ContextMenu_Turquoise_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(turquoiseSprite.sprite);
	ISBuildMenu.requireHammer(turquoiseOption)

    	local whiteSprite = {sprite = "sfbuild_cratecolors_01_11", northSprite = "sfbuild_cratecolors_01_11"};
	local whiteOption = subMenu:addOption(getText("ContextMenu_White_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, whiteSprite, player, "Base.PaintWhite");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,whiteOption, player, "Base.PaintWhite");
	toolTip:setName(getText("ContextMenu_White_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(whiteSprite.sprite);
	ISBuildMenu.requireHammer(whiteOption)

    	local yellowSprite = {sprite = "sfbuild_cratecolors_01_12", northSprite = "sfbuild_cratecolors_01_12"};
	local yellowOption = subMenu:addOption(getText("ContextMenu_Yellow_Crate"), worldobjects, SFBuildCarpentryMenu.onPaintedCrate, square, yellowSprite, player, "Base.PaintYellow");
	local toolTip = SFBuildCarpentryMenu.canBuildPaint(3,3,0,0,0,7,yellowOption, player, "Base.PaintYellow");
	toolTip:setName(getText("ContextMenu_Yellow_Crate"));
	toolTip.description = getText("Tooltip_craft_woodenCrateDesc") .. toolTip.description;
	toolTip:setTexture(yellowSprite.sprite);
	ISBuildMenu.requireHammer(yellowOption)

	if blackOption.notAvailable and blueOption.notAvailable and brownOption.notAvailable and cyanOption.notAvailable and greenOption.notAvailable and greyOption.notAvailable and ltblueOption.notAvailable and ltbrownOption.notAvailable and orangeOption.notAvailable and pinkOption.notAvailable and purpleOption.notAvailable and redOption.notAvailable and turquoiseOption.notAvailable and whiteOption.notAvailable and yellowOption.notAvailable then
		option.notAvailable = true;
	end
end

SFBuildCarpentryMenu.buildWindowMenu = function(subMenu, option, player)
    local crossSprite = {sprite = "fixtures_windows_01_56", northSprite = "fixtures_windows_01_57", openSprite = "fixtures_windows_01_58", openNorthSprite = "fixtures_windows_01_59"};
	local crossOption = subMenu:addOption(getText("ContextMenu_Window"), worldobjects, SFBuildCarpentryMenu.onWoodenWindow, square, crossSprite, player);
	local toolTip = ISBuildMenu.canBuild(4,4,0,0,0,0,crossOption, player);
	toolTip.description = getText("Tooltip_craft_woodenCrossDesc") .. toolTip.description;
	toolTip:setName(getText("ContextMenu_Window"));
	toolTip:setTexture(crossSprite.sprite);
	ISBuildMenu.requireHammer(crossOption);

	if crossOption.notAvailable then
		option.notAvailable = true;
	end
end

SFBuildCarpentryMenu.onDisplayCounter = function(worldobjects, square, sprite, player)
-- name, sprite, northSprite
    local furniture = ISSimpleFurniture:new("Display Counter", sprite.sprite, sprite.northSprite);
    furniture.canBeAlwaysPlaced = true;
    furniture.isContainer = true;
    furniture.containerType = "counter";
    furniture.modData["xp:Woodwork"] = 3;
    furniture.modData["need:Base.Plank"] = "3";
    furniture.modData["need:Base.Nails"] = "3";
    -- our furniture has 4 tiles (north, east, south and west)
    -- then we define our east and south sprite
    furniture:setEastSprite(sprite.eastSprite);
    furniture:setSouthSprite(sprite.southSprite);
    furniture.player = player
    getCell():setDrag(furniture, player);
end

SFBuildCarpentryMenu.onPaintedCrate = function(worldobjects, square, crateSprite, player, paint)
	-- sprite, northSprite
	local crate = ISWoodenContainer:new(crateSprite.sprite, crateSprite.northSprite);
	crate.renderFloorHelper = true
	crate.canBeAlwaysPlaced = true;
    crate.modData["xp:Woodwork"] = 3;
	crate.modData["need:Base.Plank"] = "3";
	crate.modData["need:Base.Nails"] = "3";
	crate.modData["use:" .. paint] = "1";
	crate:setEastSprite(crateSprite.eastSprite);
	crate.player = player
	getCell():setDrag(crate, player);
end

SFBuildCarpentryMenu.onWoodenWindow = function(worldobjects, square, sprite, player)
	-- sprite, northsprite, openSprite, openNorthSprite
	local door = ISWoodenWindow:new(sprite.sprite, sprite.northSprite, sprite.openSprite, sprite.openNorthSprite);
    door.modData["xp:Woodwork"] = 3;
	door.modData["need:Base.Plank"] = "4";
	door.modData["need:Base.Nails"] = "4";
	door.player = player
	getCell():setDrag(door, player);
end

-- Sprites definitions


-- Create our toolTip, depending on the required material
SFBuildCarpentryMenu.canBuildPaint = function(plankNb, nailsNb, hingeNb, doorknobNb, baredWireNb, carpentrySkill, option, player, paint)
	local playerInv = getSpecificPlayer(player):getInventory()

	-- create a new tooltip
	local tooltip = ISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	tooltip.description = "<LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. ": <LINE>";
	-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
	if ISBuildMenu.planks < plankNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. ISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
		result = false;
	elseif plankNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. ISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
	end
	if ISBuildMenu.nails < nailsNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. ISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
		result = false;
	elseif nailsNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. ISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
	end
	if ISBuildMenu.doorknob < doorknobNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Doorknob") .. " " .. ISBuildMenu.doorknob .. "/" .. doorknobNb .. " <LINE>";
		result = false;
	elseif doorknobNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Doorknob") .. " " .. ISBuildMenu.doorknob .. "/" .. doorknobNb .. " <LINE>";
	end
	if ISBuildMenu.hinge < hingeNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Hinge") .. " " .. ISBuildMenu.hinge .. "/" .. hingeNb .. " <LINE>";
		result = false;
	elseif hingeNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Hinge") .. " " .. ISBuildMenu.hinge .. "/" .. hingeNb .. " <LINE>";
	end

	if not playerInv:containsTypeRecurse("Paintbrush") then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Paintbrush") .. " " .. "0/1" .. " <LINE>";
		result = false;
	else
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Paintbrush") .. " " .. "1/1" .. " <LINE>";
	end

	if not playerInv:containsTypeRecurse(paint) then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType(paint) .. " " .. getText("ContextMenu_Uses") .. " " .. "0/1" .. " <LINE>";
		result = false;
	else
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType(paint) .. " " .. getText("ContextMenu_Uses") .. " " .. "1/1" .. " <LINE>";
	end

	if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
		result = false;
	elseif carpentrySkill > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
	end
	if ISBuildMenu.cheat then
		return tooltip;
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

Events.OnFillWorldObjectContextMenu.Add(SFBuildCarpentryMenu.doBuildMenu);