ISWeldMenu = {};

function ISWeldMenu.doBuildMenu(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

	local playerObj = getSpecificPlayer(player)
	
	--What you use to add to the existing build submenu in your own script:
	local subMenu = nil;
	local buildMWOption = nil;
	for i,v in ipairs(context.options) do
		if v.name == getText("ContextMenu_MetalWelding") then
			buildMWOption = v;
			subMenu = context:getSubMenu(buildMWOption.subOption);
		end
	end

	local wallsOption = nil;
	local wallsSubMenu = nil;
	if subMenu then
		for i,v in ipairs(subMenu.options) do
			if v.name == getText("ContextMenu_WallFencing") then
				wallsOption = v;
				wallsSubMenu = subMenu:getSubMenu(wallsOption.subOption);
			end
		end
	end

	if subMenu then
		context:addSubMenu(buildMWOption, subMenu);
		--Now you can add your stuff to the build menu.
        	if playerObj:getKnownRecipes():contains("Make Metal Stairs") or ISBuildMenu.cheat then
			local stairsOption = subMenu:addOption(getText("ContextMenu_Metal_Stairs"), worldobjects, ISWeldMenu.onMetalStairs, player, "8");
			local toolTip = ISBlacksmithMenu.addToolTip(stairsOption, getText("ContextMenu_Metal_Stairs"), "fixtures_stairs_01_3");
        		local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(8,6,0,0,4,8,6,playerObj, toolTip);
        		if not canDo then stairsOption.notAvailable = true; end
		end
	end

	if wallsSubMenu then
		subMenu:addSubMenu(wallsOption, wallsSubMenu);
		--Now you can add your stuff to the build menu.
        	if playerObj:getKnownRecipes():contains("Make Metal Walls") or ISBuildMenu.cheat then
			local doorFrameSprites = ISWeldMenu.getMetalDoorFrameSprites(playerObj);
			local doorFrameOption = wallsSubMenu:addOption(getText("ContextMenu_MetalDoorFrame"), worldobjects, ISWeldMenu.onMetalDoorFrame, doorFrameSprites, player, "8");
			local toolTip = ISBlacksmithMenu.addToolTip(doorFrameOption, getText("ContextMenu_MetalDoorFrame"), doorFrameSprites.sprite);
        		local canDo, toolTip = ISBlacksmithMenu.checkMetalWeldingFurnitures(0,0,3,0,0,8,2,playerObj, toolTip);
        		if not canDo then doorFrameOption.notAvailable = true; end
		end
	end
end

ISWeldMenu.onMetalDoorFrame = function(worldobjects, sprites, player, torchUse)
    local doorFrame = ISWoodenDoorFrame:new(sprites.sprite, sprites.northSprite, sprites.corner);
    doorFrame.firstItem = "BlowTorch";
    doorFrame.firstPredicate = predicateDrainableUsesInt
    doorFrame.firstArg = tonumber(torchUse)
    doorFrame.secondItem = "WeldingMask";
    doorFrame.craftingBank = "BlowTorch";
    doorFrame.health = 200;
    doorFrame.name = "MetalDoorFrame";
    doorFrame.noNeedHammer = true;
    doorFrame.modData["xp:MetalWelding"] = 20;
    doorFrame.modData["need:Base.SheetMetal"]= "3";
    doorFrame.modData["use:Base.BlowTorch"] = torchUse;
    doorFrame.modData["use:Base.WeldingRods"] = ISBlacksmithMenu.weldingRodUses(torchUse);
    doorFrame.player = player
    getCell():setDrag(doorFrame, player);
end

ISWeldMenu.onMetalStairs = function(worldobjects, player, torchUse)
    local stairs = ISWoodenStairs:new("fixtures_stairs_01_3", "fixtures_stairs_01_4", "fixtures_stairs_01_5", "fixtures_stairs_01_11", "fixtures_stairs_01_12", "fixtures_stairs_01_13", "fixtures_stairs_01_14", "fixtures_stairs_01_14");
    stairs.name = "Metal Stairs"
    stairs.noNeedHammer = true;
    stairs.firstItem = "BlowTorch";
    stairs.firstPredicate = predicateDrainableUsesInt
    stairs.firstArg = tonumber(torchUse)
    stairs.secondItem = "WeldingMask";
    stairs.craftingBank = "BlowTorch";
    stairs.modData["xp:MetalWelding"] = 25;
    stairs.modData["need:Base.MetalPipe"]= "8";
    stairs.modData["need:Base.SmallSheetMetal"]= "6";
    stairs.modData["need:Base.ScrapMetal"]= "4";
    stairs.modData["use:Base.BlowTorch"] = torchUse;
    stairs.modData["use:Base.WeldingRods"] = torchUse / 2;
    stairs.player = player
    getCell():setDrag(stairs, player);
end

-- Sprites definitions

ISWeldMenu.getMetalDoorFrameSprites = function(player)
    local sprites = {};
    if player:getPerkLevel(Perks.Metalwelding) <= 1 then
        sprites.sprite = "constructedobjects_01_74";
        sprites.northSprite = "constructedobjects_01_75";
    else
        sprites.sprite = "constructedobjects_01_58";
        sprites.northSprite = "constructedobjects_01_59";
    end
    sprites.corner = nil;
    return sprites;
end

Events.OnFillWorldObjectContextMenu.Add(ISWeldMenu.doBuildMenu);