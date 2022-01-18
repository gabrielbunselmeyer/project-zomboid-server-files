--***********************************************************
--**                    ROBERT JOHNSON                     **
--**       Contextual menu for building when clicking somewhere on the ground       **
--***********************************************************

ISMasonryMenu = {};
ISMasonryMenu.concrete = 0;
ISMasonryMenu.bricks = 0;
ISMasonryMenu.hinge = 0;
ISMasonryMenu.doorknob = 0;
ISMasonryMenu.cheat = false;
ISMasonryMenu.masonryXp = 0;

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

ISMasonryMenu.doMasonryMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end

	local playerObj = getSpecificPlayer(player)
	
	ISMasonryMenu.masonryXp = playerObj:getPerkLevel(Perks.Masonry);
	
	local playerInv = playerObj:getInventory();

	if playerObj:getVehicle() then return; end

	local thump = nil;

	local square = nil;
	local brickOven = nil;
	
	local sq;

    local lighter = nil
    local matches = nil
    local petrol = nil
    local percedWood = nil
    local branch = nil
    local stick = nil
    local lightFireList = {}
    local lightFromPetrol = nil;
    local lightFromKindle = nil
    local lightFromLiterature = nil
    local lightOvenFromPetrol = nil;
    local lightOvenFromKindle = nil
    local lightOvenFromLiterature = nil
    local metalFence;
    local bellows;
    local coal = nil;
	
	local containers = ISInventoryPaneContextMenu.getContainers(playerObj)
    for i=1,containers:size() do
        local container = containers:get(i-1)
        for j=1,container:getItems():size() do
            local item = container:getItems():get(j-1)
            local type = item:getType()
            if type == "Lighter" then
                lighter = item
            elseif type == "Matches" then
                matches = item
            elseif type == "PetrolCan" then
                petrol = item
            elseif type == "PercedWood" then
                percedWood = item
            elseif type == "TreeBranch" then
                branch = item
            elseif type == "WoodenStick" then
                stick = item
            elseif type == "MetalFence" then
                metalFence = item
            elseif type == "Coal" or type == "Charcoal" then
                coal = item
            elseif type == "Bellows" then
                bellows = item
            end

            if campingLightFireType[type] then
                if campingLightFireType[type] > 0 then
                    table.insert(lightFireList, item)
                end
            elseif campingLightFireCategory[item:getCategory()] then
                table.insert(lightFireList, item)
            end
        end
    end

	-- we get the thumpable item (like wall/door/furniture etc.) if exist on the tile we right clicked
	for i,v in ipairs(worldobjects) do
		square = v:getSquare();
		if instanceof(v, "IsoThumpable") and not v:isDoor() then
			thump = v;
		end
        if v:getName() == "Brick Kiln" then
            brickOven = v;
        end
			
	if (lighter or matches) and petrol and brickOven and (brickOven:getModData()["fuelAmount"] >= 1) and not brickOven:getModData()["isLit"] and not brickOven:getModData()["haveBricks"] then
            lightOvenFromPetrol = brickOven;
        end
        if percedWood and (stick or branch) and brickOven and (brickOven:getModData()["fuelAmount"] >= 1) and not brickOven:getModData()["isLit"] and not brickOven:getModData()["haveBricks"] and playerObj:getStats():getEndurance() > 0 then
            lightOvenFromKindle = brickOven
        end
        if (lighter or matches) and brickOven and (brickOven:getModData()["fuelAmount"] >= 1) and not brickOven:getModData()["isLit"] and not brickOven:getModData()["haveBricks"] then
            lightOvenFromLiterature = brickOven
        end
		
	end



	-- build menu
	-- if we have any thing to build in our inventory
	if ISMasonryMenu.haveSomethingtoBuild(player) then

        if test then return ISWorldObjectContextMenu.setTest() end

		local buildOption = context:addOption(getText("ContextMenu_Masonry"), worldobjects, nil);
		-- create a brand new context menu wich contain our different material (wood, stone etc.) to build
		local subMenu = ISContextMenu:getNew(context);
		-- We create the different option for this new menu (wood, stone etc.)
		-- check if we can build something in wood material
		if haveSomethingtoBuildStone(player) then
			-- we add the subMenu to our current option (Build)
			context:addSubMenu(buildOption, subMenu);

			------------------ FENCE ------------------
--			local fenceOption = subMenu:addOption(getText("ContextMenu_Fence"), worldobjects, nil);
--			local subMenuFence = subMenu:getNew(subMenu);
			-- we add our new menu to the option we want (here build)
--			context:addSubMenu(fenceOption, subMenuFence);
			ISMasonryMenu.buildFenceMenu(subMenu, player);
			------------------ WALL ------------------
			ISMasonryMenu.buildWallMenu(subMenu, player);
--~ 			------------------ FLOOR ------------------
--			local floorOption = subMenu:addOption(getText("ContextMenu_Floor"), worldobjects, nil);
--			local subMenuFloor = subMenu:getNew(subMenu);
			-- we add our new menu to the option we want (here build)
--			context:addSubMenu(floorOption, subMenuFloor);
			ISMasonryMenu.buildFloorMenu(subMenu, player);
			------------------ DOOR FRAME ------------------
			ISMasonryMenu.buildDoorFrameMenu(subMenu, player);
--~ 			----------------- WINDOWS FRAME-----------------
			ISMasonryMenu.buildWindowsFrameMenu(subMenu, player);
--~ 			------------------ STAIRS ------------------
--			local stairsOption = subMenu:addOption(getText("ContextMenu_Stairs"), worldobjects, nil);
--			local subMenuStairs = subMenu:getNew(subMenu);
			-- we add our new menu to the option we want (here wood)
--			context:addSubMenu(stairsOption, subMenuStairs);
--			ISMasonryMenu.buildStairsMenu(subMenu, player);
--~ 			------------------ BRICK OVEN ------------------
			if playerObj:getKnownRecipes():contains("Make Brick Kiln") or ISBuildMenu.cheat then
				ISMasonryMenu.buildBrickOvenMenu(subMenu, player);
			end
			------------------ MISC ------------------
			local miscOption = subMenu:addOption(getText("ContextMenu_Misc"), worldobjects, nil);
			local subMenuMisc = subMenu:getNew(subMenu);
			context:addSubMenu(miscOption, subMenuMisc);
			ISMasonryMenu.buildMiscMenu(subMenuMisc, miscOption, player);

		end
	end

    if lightOvenFromPetrol or lightOvenFromKindle or (lightOvenFromLiterature and #lightFireList > 0) then
        if test then return ISWorldObjectContextMenu.setTest() end
        local lightOption = context:addOption(getText("ContextMenu_LitOven"), worldobjects, nil);
        local subMenuLight = ISContextMenu:getNew(context);
        context:addSubMenu(lightOption, subMenuLight);
        if lightOvenFromPetrol then
            if lighter then
                local LitOption = subMenuLight:addOption(petrol:getName()..' + '..lighter:getName(), worldobjects, ISMasonryMenu.onLightOvenFromPetrol, player, lighter, petrol, lightOvenFromPetrol)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitOven"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
            if matches then
                local LitOption = subMenuLight:addOption(petrol:getName()..' + '..matches:getName(), worldobjects, ISMasonryMenu.onLightOvenFromPetrol, player, matches, petrol, lightOvenFromPetrol)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitOven"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
        end
        for i,v in pairs(lightFireList) do
            local label = v:getName()
            if lighter then
                local LitOption = subMenuLight:addOption(label..' + '..lighter:getName(), worldobjects, ISMasonryMenu.onLightOvenFromLiterature, player, v, lighter, lightOvenFromLiterature, coal)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitOven"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
            if matches then
                local LitOption = subMenuLight:addOption(label..' + '..matches:getName(), worldobjects, ISMasonryMenu.onLightOvenFromLiterature, player, v, matches, lightOvenFromLiterature, coal)
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitOven"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
        end
        if lightFromKindle then
            if stick then
                local LitOption = subMenuLight:addOption(percedWood:getName()..' + '..stick:getName(), worldobjects, ISMasonryMenu.onLightOvenFromKindle, player, percedWood, stick, lightOvenFromKindle);
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitOven"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            elseif branch then
                local LitOption = subMenuLight:addOption(percedWood:getName()..' + '..branch:getName(), worldobjects, ISMasonryMenu.onLightOvenFromKindle, player, percedWood, branch, lightOvenFromKindle);
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_LitOven"))
                tooltip.description = getText("Tooltip_Charcoal");
                LitOption.toolTip = tooltip
            end
        end
    end
	
	if brickOven and playerObj:DistToSquared(brickOven:getX() + 0.5, brickOven:getY() + 0.5) < 2 * 2 then
			local option = context:addOption(getText("ContextMenu_Brick_Oven"), worldobjects, nil)
			local subMenuDrum = ISContextMenu:getNew(context);
			context:addSubMenu(option, subMenuDrum);
			local tooltip = ISWorldObjectContextMenu.addToolTip()
			tooltip:setName(getText("ContextMenu_Info"))
			if brickOven:getModData()["fuelAmount"] then
				local luaDrum = SFBrickOven.getLuaObject(brickOven);
				if luaDrum then
					tooltip.description = getText("ContextMenu_Fuel") .. (luaDrum.fuelAmount.. "%");

					if brickOven:getModData()["haveClay"] and brickOven:getModData()["isLit"] then
						if not luaDrum.charcoalTick then
							tooltip.description = getText("ContextMenu_Fuel") .. (luaDrum.fuelAmount.. "%") .. " <LINE>".. getText("ContextMenu_Progression") .. "0%";
						else
							tooltip.description = getText("ContextMenu_Fuel") .. (luaDrum.fuelAmount.. "%") .. " <LINE>".. getText("ContextMenu_Progression") .. (round((luaDrum.charcoalTick / 18) * 100)) .. "%";
						end
					end
					option.toolTip = tooltip
				end
			end
			
			if brickOven and coal and (brickOven:getModData()["fuelAmount"] < 100) then
				subMenuDrum:addOption(getText("ContextMenu_Add_fuel_to_fire"), worldobjects, ISMasonryMenu.onAddFuel, brickOven, coal, playerObj);
			end

        if not brickOven:getModData()["haveClay"] and not brickOven:getModData()["haveBricks"] then
                local addWoodOption = subMenuDrum:addOption(getText("ContextMenu_AddMoldedBricks"), worldobjects, ISMasonryMenu.onAddClay, brickOven, playerObj);
                local tooltip = ISWorldObjectContextMenu.addToolTip()
                tooltip:setName(getText("ContextMenu_AddMoldedBricks"))
                tooltip.description = "Add 5 molded bricks, once done, lit up the kiln with a lighter and wait";
                addWoodOption.toolTip = tooltip
                if playerObj:getInventory():getItemCount("filcher.SFMoldedBricks") < 5 then
                   addWoodOption.notAvailable = true;
                end
         else
                if brickOven:getModData()["isLit"] then
                    subMenuDrum:addOption(getText("ContextMenu_Put_out_fire"), worldobjects, ISMasonryMenu.onPutOutFireOven, brickOven, playerObj);
                elseif not brickOven:getModData()["isLit"] and not brickOven:getModData()["haveBricks"] then
                    subMenuDrum:addOption(getText("ContextMenu_RemoveMoldedBricks"), worldobjects, ISMasonryMenu.onRemoveClay, brickOven, playerObj);
                end
         end
         if brickOven:getModData()["haveBricks"] then
                subMenuDrum:addOption(getText("ContextMenu_RemoveBricks"), worldobjects, ISMasonryMenu.onRemoveBricks, brickOven, playerObj);
         end

	end

end

-- **********************************************
-- **                  *OVEN FUNCTIONS*        **
-- **********************************************

ISMasonryMenu.onRemoveBricks = function(worldobjects, brickOven, player)
    if luautils.walkAdj(player, brickOven:getSquare()) then
        ISTimedActionQueue.add(ISRemoveBricks:new(player, brickOven))
    end
end

ISMasonryMenu.onPutOutFireOven = function(worldobjects, brickOven, player)
    if luautils.walkAdj(player, brickOven:getSquare()) then
        ISTimedActionQueue.add(ISPutOutFireOven:new(player, brickOven))
    end
end

ISMasonryMenu.onAddFuel = function(worldobjects, brickOven, coal, player)
    if luautils.walkAdj(player, brickOven:getSquare()) then
        ISTimedActionQueue.add(ISAddCoalInOven:new(brickOven, coal, player))
    end
end

ISMasonryMenu.onRemoveClay = function(worldobjects, brickOven, player)
    if luautils.walkAdj(player, brickOven:getSquare()) then
        ISTimedActionQueue.add(ISAddClayInOven:new(player, brickOven, false))
    end
end

ISMasonryMenu.onAddClay = function(worldobjects, brickOven, player)
    if luautils.walkAdj(player, brickOven:getSquare()) then
        ISTimedActionQueue.add(ISAddClayInOven:new(player, brickOven, true))
    end
end

ISMasonryMenu.onLightOvenFromPetrol = function(worldobjects, player, lighter, petrol, brickOven)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, lighter)
    ISCampingMenu.toPlayerInventory(playerObj, petrol)
    if luautils.walkAdj(playerObj, brickOven:getSquare(), true) then
        ISTimedActionQueue.add(ISOvenLightFromPetrol:new(playerObj, brickOven, lighter, petrol, 20));
    end
end

ISMasonryMenu.onLightOvenFromLiterature = function(worldobjects, player, literature, lighter, brickOven, fuelAmt)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, literature)
    ISCampingMenu.toPlayerInventory(playerObj, lighter)
    if luautils.walkAdj(playerObj, brickOven:getSquare(), true) then
        if playerObj:isEquipped(literature) then
            ISTimedActionQueue.add(ISUnequipAction:new(playerObj, literature, 50));
        end
        ISTimedActionQueue.add(ISOvenLightFromLiterature:new(playerObj, literature, lighter, brickOven, fuelAmt, 100));
    end
end

ISMasonryMenu.onLightOvenFromKindle = function(worldobjects, player, percedWood, stickOrBranch, brickOven)
    local playerObj = getSpecificPlayer(player)
    ISCampingMenu.toPlayerInventory(playerObj, percedWood)
    ISCampingMenu.toPlayerInventory(playerObj, stickOrBranch)
    if luautils.walkAdj(playerObj, brickOven:getSquare(), true) then
        ISTimedActionQueue.add(ISOvenLightFromKindle:new(playerObj, percedWood, stickOrBranch, brickOven, 1500));
    end
end

-- **********************************************
-- **                  *MASONRY*               **
-- **********************************************

function ISMasonryMenu.haveSomethingtoBuild(player)
--~ 	return true;
	return haveSomethingtoBuildStone(player);
end

function haveSomethingtoBuildStone(player)
	ISMasonryMenu.materialOnGround = buildUtil.checkMaterialOnGround(getSpecificPlayer(player):getCurrentSquare())
	if ISBuildMenu.cheat then
		return true;
	end
	ISMasonryMenu.concrete = 0;
	ISMasonryMenu.bricks = 0;
	ISMasonryMenu.hinge = 0;
	ISMasonryMenu.doorknob = 0;
	ISMasonryMenu.hasMasonsTrowel = getSpecificPlayer(player):getInventory():contains("MasonsTrowel")
	ISMasonryMenu.hasHydrocraftTrowel = getSpecificPlayer(player):getInventory():contains("HCMasontrowel")
	if ISMasonryMenu.hasMasonsTrowel then
		-- most objects require a hammer
	elseif ISMasonryMenu.hasHydrocraftTrowel then
		-- Hydrocraft Trowel can activate it too
	else
		return false
	end
	--ISMasonryMenu.concrete = ISMasonryMenu.countMaterial(player, "Base.BucketConcreteFull")
	ISMasonryMenu.bricks = ISMasonryMenu.countMaterial(player, "filcher.Bricks")
	ISMasonryMenu.hinge = ISMasonryMenu.countMaterial(player, "Base.Hinge")
	ISMasonryMenu.doorknob = ISMasonryMenu.countMaterial(player, "Base.Doorknob")

	local inv = getSpecificPlayer(player):getInventory();
	if not inv:contains("BucketConcreteFull") then
        	ISMasonryMenu.concrete = 0;
	else
        	local concrete = inv:getItemFromType("BucketConcreteFull");
        	ISMasonryMenu.concrete = round(concrete:getUsedDelta() / concrete:getUseDelta());
	end
	return true;
end

ISMasonryMenu.onMultiStageBuild = function(worldobjects, stage, item, player)
    local playerObj = getSpecificPlayer(player);
    if luautils.walkAdj(playerObj, item:getSquare(), false) then
        -- equip required items
        local first = true;
        for i=0,stage:getItemsToKeep():size() - 1 do
            local itemToEquip =  stage:getItemsToKeep():get(i);
            if not playerObj:hasEquipped(itemToEquip) and playerObj:getInventory():getItemFromType(itemToEquip) then
                ISInventoryPaneContextMenu.equipWeapon(playerObj:getInventory():getItemFromType(itemToEquip), first, false, player)
            end
            if not first then
                break;
            end
            first = false;
        end
        ISTimedActionQueue.add(ISMultiStageBuild:new(playerObj, stage, item, stage:getTimeNeeded(playerObj)));
    end
end

ISMasonryMenu.canDoStage = function(player, stage)
    local items = stage:getItemsLua();
    for x=0,stage:getItemsToKeep():size()-1 do
        local item = InventoryItemFactory.CreateItem(stage:getItemsToKeep():get(x));
        if item then
            if not player:getInventory():containsWithModule(stage:getItemsToKeep():get(x)) then
                return false;
            end
        end
    end
    for x,v in pairs(items) do
        local item = InventoryItemFactory.CreateItem(x);
        if item then
            if instanceof(item, "DrainableComboItem") then
                local drainable = player:getInventory():getItemFromType(x);
                local useLeft = 0;
                if (drainable and drainable:getRemainingUses() < tonumber(v)) or not drainable then
                    return false;
                end
            else
                if player:getInventory():getItemCount(x) < tonumber(v) then
                    return false;
                end
            end
        end
    end
    return true;
end

-- **********************************************
-- **                   *MISC*                  **
-- **********************************************
ISMasonryMenu.buildMiscMenu = function(subMenu, option, player)
	local sprite, northsprite = "location_community_cemetary_01_0", "location_community_cemetary_01_1"
	local tomb1Option = subMenu:addOption(getText("ContextMenu_Tombstone"), worldobjects, ISMasonryMenu.onTombstone, square, player, sprite, northsprite);
	local toolTip = ISMasonryMenu.canBuild(1,0,0,0,0,1,tomb1Option, player);
	toolTip:setName(getText("ContextMenu_Tombstone"));
	toolTip:setTexture("location_community_cemetary_01_1");
	ISMasonryMenu.requireMasonsTrowel(tomb1Option);

	local sprite, northsprite = "location_community_cemetary_01_2", "location_community_cemetary_01_3"
	local tomb2Option = subMenu:addOption(getText("ContextMenu_Tombstone"), worldobjects, ISMasonryMenu.onTombstone, square, player, sprite, northsprite);
	local toolTip = ISMasonryMenu.canBuild(1,0,0,0,0,1,tomb2Option, player);
	toolTip:setName(getText("ContextMenu_Tombstone"));
	toolTip:setTexture("location_community_cemetary_01_3");
	ISMasonryMenu.requireMasonsTrowel(tomb2Option);
	
	local sprite, northsprite = "location_community_cemetary_01_4", "location_community_cemetary_01_5"
	local tomb3Option = subMenu:addOption(getText("ContextMenu_Tombstone"), worldobjects, ISMasonryMenu.onTombstone, square, player, sprite, northsprite);
	local toolTip = ISMasonryMenu.canBuild(1,0,0,0,0,1,tomb3Option, player);
	toolTip:setName(getText("ContextMenu_Tombstone"));
	toolTip:setTexture("location_community_cemetary_01_5");
	ISMasonryMenu.requireMasonsTrowel(tomb3Option);
	
	local sprite, northsprite = "location_community_cemetary_01_8", "location_community_cemetary_01_9"
	local tomb4Option = subMenu:addOption(getText("ContextMenu_Tombstone"), worldobjects, ISMasonryMenu.onTombstone, square, player, sprite, northsprite);
	local toolTip = ISMasonryMenu.canBuild(1,0,0,0,0,1,tomb4Option, player);
	toolTip:setName(getText("ContextMenu_Tombstone"));
	toolTip:setTexture("location_community_cemetary_01_9");
	ISMasonryMenu.requireMasonsTrowel(tomb4Option);

	if tomb1Option.notAvailable and tomb2Option.notAvailable and tomb3Option.notAvailable and tomb4Option.notAvailable then
		option.notAvailable = true;
	end
end

ISMasonryMenu.onTombstone = function(worldobjects, square, player, sprite, northsprite)
	local cross = ISSimpleFurniture:new("Tombstone", sprite, northsprite);
	cross.canPassThrough = true;
	cross.canBarricade = false;
	cross.ignoreNorth = true;
	cross.canBeAlwaysPlaced = false;
	cross.isThumpable = false;
    cross.actionAnim = "BlowTorchMid";
    cross.noNeedHammer = true;
	cross.modData["xp:Masonry"] = 6;
	cross.modData["use:Base.BucketConcreteFull"] = "1";
	cross.player = player
	cross.maxTime = 100;
	getCell():setDrag(cross, player);
end

-- **********************************************
-- **                  *FENCE*                 **
-- **********************************************

ISMasonryMenu.buildFenceMenu = function(subMenu, player)
	local sprite = ISMasonryMenu.getBrickFenceSprites(player);
	local fenceOption = subMenu:addOption(getText("ContextMenu_Brick_Fence"), worldobjects, ISMasonryMenu.onBrickFence, square, sprite, player);
	local tooltip = ISMasonryMenu.canBuild(2,3,0,0,0,2,fenceOption, player);
	tooltip:setName(getText("ContextMenu_Brick_Fence"));
	tooltip.description = getText("Tooltip_craft_BrickFenceDesc") .. tooltip.description;
	tooltip:setTexture(sprite.sprite);
	ISMasonryMenu.requireMasonsTrowel(fenceOption)
end

ISMasonryMenu.onBrickFence = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local fence = SFBrickWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
	-- you can hopp a fence
	fence.hoppable = true;
	fence.isThumpable = false;
    fence.canBarricade = false;
    fence.actionAnim = "BlowTorchMid";
    fence.noNeedHammer = true;
    fence.modData["xp:Masonry"] = 6;
	fence.modData["use:Base.BucketConcreteFull"] = "2";
	fence.modData["need:filcher.Bricks"] = "3";
	fence.player = player
	fence.name = "Brick Fence"
	getCell():setDrag(fence, player);
end

-- **********************************************
-- **                  *WALL*                  **
-- **********************************************

ISMasonryMenu.buildWallMenu = function(subMenu, player)
	local sprite = ISMasonryMenu.getWoodenWallSprites(player);
	local wallOption = subMenu:addOption(getText("ContextMenu_Brick_Wall"), worldobjects, ISMasonryMenu.onWoodenWall, sprite, player);
	local tooltip = ISMasonryMenu.canBuild(4, 5, 0, 0, 0, 2, wallOption, player);
	tooltip:setName(getText("ContextMenu_Brick_Wall"));
	tooltip.description = getText("Tooltip_craft_woodenWallDesc") .. tooltip.description;
	tooltip:setTexture(sprite.sprite);
	ISMasonryMenu.requireMasonsTrowel(wallOption)
end

ISMasonryMenu.onWoodenWall = function(worldobjects, sprite, player)
	-- sprite, northSprite, corner
	local wall = SFBrickWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
    if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) >= 8 then
	    wall.canBePlastered = true;
    end
	wall.canBarricade = false
	-- set up the required material
    wall.actionAnim = "BlowTorchMid";
    wall.noNeedHammer = true;
    wall.modData["wallType"] = "wall";
    wall.modData["xp:Masonry"] = 9;
	wall.modData["use:Base.BucketConcreteFull"] = "4";
	wall.modData["need:filcher.Bricks"] = "5";
    wall.player = player;
    getCell():setDrag(wall, player);
end

-- **********************************************
-- **              *WINDOWS FRAME*             **
-- **********************************************
ISMasonryMenu.buildWindowsFrameMenu = function(subMenu, player)
	local sprite = ISMasonryMenu.getWoodenWindowsFrameSprites(player);
	local wallOption = subMenu:addOption(getText("ContextMenu_Windows_Frame"), worldobjects, ISMasonryMenu.onWoodenWindowsFrame, square, sprite, player);
	local tooltip = ISMasonryMenu.canBuild(3, 4, 0, 0, 0, 2, wallOption, player);
	tooltip:setName(getText("ContextMenu_Windows_Frame"));
	tooltip.description = getText("Tooltip_craft_woodenFrameDesc") .. tooltip.description;
	tooltip:setTexture(sprite.sprite);
	ISMasonryMenu.requireMasonsTrowel(wallOption)
end

ISMasonryMenu.onWoodenWindowsFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local frame = SFBrickWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
    if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) >= 8 then
	    frame.canBePlastered = true;
    end
	frame.hoppable = true;
	frame.isThumpable = false
	-- set up the required material
    frame.actionAnim = "BlowTorchMid";
    frame.noNeedHammer = true;
    frame.modData["xp:Masonry"] = 9;
    frame.modData["wallType"] = "windowsframe";
	frame.modData["use:Base.BucketConcreteFull"] = "3";
	frame.modData["need:filcher.Bricks"] = "4";
	frame.player = player
	frame.name = "Window Frame"
	getCell():setDrag(frame, player);
end

-- **********************************************
-- **                  *FLOOR*                 **
-- **********************************************

ISMasonryMenu.buildFloorMenu = function(subMenu, player)
	-- concrete floor
    local floorSprite = ISMasonryMenu.getWoodenFloorSprites(player);
	local floorOption = subMenu:addOption(getText("ContextMenu_Concrete_Floor"), worldobjects, ISMasonryMenu.onConcreteFloor, square, floorSprite, player);
	local tooltip = ISMasonryMenu.canBuild(1,0,0,0,0,0,floorOption, player);
	tooltip:setName(getText("ContextMenu_Concrete_Floor"));
	tooltip.description = getText("Tooltip_craft_ConcreteFloorDesc") .. tooltip.description;
	tooltip:setTexture(floorSprite.sprite);
	ISMasonryMenu.requireMasonsTrowel(floorOption)
end

ISMasonryMenu.onConcreteFloor = function(worldobjects, square, sprite, player)
	-- sprite, northSprite
	local foor = SFConcreteFloor:new(sprite.sprite, sprite.northSprite)
    foor.actionAnim = "BlowTorchMid";
    foor.secondItem = "BucketConcreteFull";
    foor.noNeedHammer = true;
	foor.modData["use:Base.BucketConcreteFull"] = "1";
	foor.modData["xp:Masonry"] = 3;
	foor.player = player
	getCell():setDrag(foor, player);
end

-- **********************************************
-- **                 *STAIRS*                 **
-- **********************************************

ISMasonryMenu.buildStairsMenu = function(subMenu, player)
--	local darkStairsOption = subMenu:addOption(getText("ContextMenu_Dark_Wooden_Stairs"), worldobjects, ISMasonryMenu.onDarkWoodenStairs, square, player);
--	local tooltip = ISMasonryMenu.canBuild(8,8,0,0,0,3,darkStairsOption, player);
--	tooltip:setName(getText("ContextMenu_Dark_Wooden_Stairs"));
--	tooltip.description = getText("Tooltip_craft_stairsDesc") .. tooltip.description;
--	tooltip:setTexture("fixtures_stairs_01_16");

	local stairsOption = subMenu:addOption(getText("ContextMenu_Stairs"), worldobjects, ISMasonryMenu.onBrownWoodenStairs, square, player);
	local tooltip2 = ISMasonryMenu.canBuild(15,15,0,0,0,6,stairsOption, player);
	tooltip2:setName(getText("ContextMenu_Stairs"));
	tooltip2.description = getText("Tooltip_craft_stairsDesc") .. tooltip2.description;
	tooltip2:setTexture("carpentry_02_88");
	ISMasonryMenu.requireMasonsTrowel(stairsOption)

--	local lightStairsOption = subMenu:addOption(getText("ContextMenu_Light_Brown_Wooden_Stairs"), worldobjects, ISMasonryMenu.onLightBrownWoodenStairs, square, player);
--	local tooltip3 = ISMasonryMenu.canBuild(8,8,0,0,0,3,lightStairsOption, player);
--	tooltip3:setName(getText("ContextMenu_Light_Brown_Wooden_Stairs"));
--	tooltip3.description = getText("Tooltip_craft_stairsDesc") .. tooltip3.description;
--	tooltip3:setTexture("fixtures_stairs_01_32");

--    if darkStairsOption.notAvailable and stairsOption.notAvailable and lightStairsOption.notAvailable then
--        option.notAvailable = true;
--    end
end

ISMasonryMenu.onDarkWoodenStairs = function(worldobjects, square, player)
	local stairs = ISWoodenStairs:new("fixtures_stairs_01_16", "fixtures_stairs_01_17", "fixtures_stairs_01_18", "fixtures_stairs_01_24", "fixtures_stairs_01_25", "fixtures_stairs_01_26", "fixtures_stairs_01_22", "fixtures_stairs_01_23");
    stairs.actionAnim = "BlowTorch";
    stairs.noNeedHammer = true;
    stairs.modData["xp:Masonry"] = 25;
	stairs.modData["need:Base.Plank"] = "8";
	stairs.modData["need:Base.Nails"] = "8";
    stairs.isThumpable = false;
    stairs.player = player
    getCell():setDrag(stairs, player);
end

-- **********************************************
-- **              *DOOR FRAME*                **
-- **********************************************

ISMasonryMenu.buildDoorFrameMenu = function(subMenu, player)
	local frameSprite = ISMasonryMenu.getWoodenDoorFrameSprites(player);
	local doorFrameOption = subMenu:addOption(getText("ContextMenu_Door_Frame"), worldobjects, ISMasonryMenu.onWoodenDoorFrame, square, frameSprite, player);
	local tooltip = ISMasonryMenu.canBuild(2,3,0,0,0,2,doorFrameOption, player);
	tooltip:setName(getText("ContextMenu_Door_Frame"));
	tooltip.description = getText("Tooltip_craft_doorFrameDesc") .. tooltip.description;
	tooltip:setTexture(frameSprite.sprite);
	ISMasonryMenu.requireMasonsTrowel(doorFrameOption)
end

ISMasonryMenu.onWoodenDoorFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local doorFrame = SFBrickDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)
	if getCore():getVersionNumber() == "41.50 - IWBUMS" then
		if getSpecificPlayer(player):getModData().skills["Masonry"].level >= 8 then
			doorFrame.canBePlastered = true;
		end
	else
		if getSpecificPlayer(player):getPerkLevel(Perks.Masonry) >= 8 then
			doorFrame.canBePlastered = true;
		end
	end
    doorFrame.actionAnim = "BlowTorch";
    doorFrame.secondItem = "BucketConcreteFull";
    doorFrame.noNeedHammer = true;
    doorFrame.modData["xp:Masonry"] = 9;
    doorFrame.modData["wallType"] = "doorframe";
	doorFrame.modData["use:Base.BucketConcreteFull"] = "2";
	doorFrame.modData["need:filcher.Bricks"] = "3";
	doorFrame.player = player
	getCell():setDrag(doorFrame, player);
end

-- **********************************************
-- **               *BRICK OVEN*               **
-- **********************************************

ISMasonryMenu.buildBrickOvenMenu = function(subMenu, player)
	local sprite = ISMasonryMenu.getBrickOvenFrameSprites(player);
	local ovenOption = subMenu:addOption(getText("ContextMenu_Brick_Oven"), worldobjects, ISMasonryMenu.onBrickOven, square, sprite, player);
	local tooltip = ISMasonryMenu.canBuild(4,3,0,0,0,4,ovenOption, player);
	tooltip:setName(getText("ContextMenu_Brick_Oven"));
	tooltip.description = getText("Tooltip_craft_BrickOvenDesc") .. tooltip.description;
	tooltip:setTexture("crafted_01_44");
	ISMasonryMenu.requireMasonsTrowel(ovenOption)
end

ISMasonryMenu.onBrickOven = function(worldobjects, square, sprite, player)
	-- sprite, northSprite
	local oven = SFBrickOven:new(player, sprite.sprite);
	oven.isThumpable = false;
    oven.canBarricade = false
    oven.modData["xp:Masonry"] = 12;
	oven.modData["use:Base.BucketConcreteFull"] = "4";
	oven.modData["need:filcher.Bricks"] = "3";
	oven.player = player
	oven.name = "Brick Kiln"
	getCell():setDrag(oven, player);
end

-- **********************************************
-- **            SPRITE FUNCTIONS              **
-- **********************************************

ISMasonryMenu.getBrickFenceSprites = function(player)
	local sprite = {};
		sprite.sprite = "walls_exterior_house_01_36";
		sprite.northSprite = "walls_exterior_house_01_37";
		sprite.corner = "walls_exterior_house_01_38";
	return sprite;
end

ISMasonryMenu.getWoodenFloorSprites = function(player)
    local spriteLvl = ISMasonryMenu.getSpriteLvl(player);
    local sprite = {};
        sprite.sprite = "floors_exterior_street_01_10";
        sprite.northSprite = "floors_exterior_street_01_10";
    return sprite;
end

ISMasonryMenu.getWoodenWallFrameSprites = function(player)
    local sprite = {};
    sprite.sprite = "carpentry_02_100";
    sprite.northSprite = "carpentry_02_101";
    return sprite;
end

ISMasonryMenu.getWoodenWallSprites = function(player)
	local sprite = {};
		sprite.sprite = "walls_exterior_house_01_4";
		sprite.northSprite = "walls_exterior_house_01_5";
		sprite.corner = "walls_exterior_house_01_6";
	return sprite;
end

ISMasonryMenu.getWoodenWindowsFrameSprites = function(player)
	local sprite = {};
		sprite.sprite = "walls_exterior_house_01_12";
		sprite.northSprite = "walls_exterior_house_01_13";
		sprite.corner = "walls_exterior_house_01_7";
	return sprite;
end

ISMasonryMenu.getWoodenDoorFrameSprites = function(player)
	local sprite = {};
		sprite.sprite = "walls_exterior_house_01_14";
		sprite.northSprite = "walls_exterior_house_01_15";
	sprite.corner = "walls_exterior_house_01_7";
	return sprite;
end

ISMasonryMenu.getBrickOvenFrameSprites = function(player)
	local sprite = {};
		sprite.sprite = "crafted_01_44";
		sprite.northSprite = "crafted_01_44";
	return sprite;
end

ISMasonryMenu.getSpriteLvl = function(player)
	-- 0 to 1 wood work xp mean lvl 1 sprite
	if ISMasonryMenu.masonryXp <= 3 then
		return 1;
	-- 2 to 3 wood work xp mean lvl 2 sprite
	elseif ISMasonryMenu.masonryXp <= 6 then
		return 2;
	-- 4 to 5 wood work xp mean lvl 3 sprite
	else
		return 3;
	end
end

-- **********************************************
-- **                  OTHER                   **
-- **********************************************

function ISMasonryMenu.getFirstConcreteWithUses(container, uses)
    return container:getFirstTypeEvalArgRecurse("Base.BucketConcreteFull", predicateDrainableUsesInt, uses)
end

function ISMasonryMenu.getConcreteWithMostUses(container)
    return container:getBestTypeEvalRecurse("Base.BucketConcreteFull", comparatorDrainableUsesInt)
end

-- Create our toolTip, depending on the required material
ISMasonryMenu.canBuild = function(plankNb, nailsNb, hingeNb, doorknobNb, baredWireNb, carpentrySkill, option, player)
	local playerObj = getSpecificPlayer(player);
	local inv = playerObj:getInventory();
	-- create a new tooltip
	local tooltip = ISMasonryMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	local concrete = ISBlacksmithMenu.getMaterialUses(playerObj, "BucketConcreteFull") --ISMasonryMenu.getFirstConcreteWithUses(inv, plankNb) or ISMasonryMenu.getConcreteWithMostUses(inv)
	local concreteUseLeft = 0;
	if concrete then
	    concreteUseLeft = concrete --concrete:getDrainableUsesInt()
	end

	tooltip.description = "<LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
	-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
	if concreteUseLeft < plankNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Concrete") .. " " .. getText("ContextMenu_Uses") .. " " .. concreteUseLeft .. "/" .. plankNb .. " <LINE>";
		result = false;
	elseif plankNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Concrete") .. " " .. getText("ContextMenu_Uses") .. " " .. concreteUseLeft .. "/" .. plankNb .. " <LINE>";
	end
	if ISMasonryMenu.bricks < nailsNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Bricks") .. " " .. ISMasonryMenu.bricks .. "/" .. nailsNb .. " <LINE>";
		result = false;
	elseif nailsNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Bricks") .. " " .. nailsNb .. " <LINE>";
	end
	if ISMasonryMenu.doorknob < doorknobNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Doorknob") .. " " .. ISMasonryMenu.doorknob .. "/" .. doorknobNb .. " <LINE>";
		result = false;
	elseif doorknobNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Doorknob") .. " " .. doorknobNb .. " <LINE>";
	end
	if ISMasonryMenu.hinge < hingeNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Door Hinge") .. " " .. ISMasonryMenu.hinge .. "/" .. hingeNb .. " <LINE>";
		result = false;
	elseif hingeNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Door Hinge") .. " " .. hingeNb .. " <LINE>";
	end
	if ISMasonryMenu.masonryXp < carpentrySkill then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("ContextMenu_Masonry") .. " " .. ISMasonryMenu.masonryXp .. "/" .. carpentrySkill .. " <LINE>";
		result = false;
	elseif carpentrySkill > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("ContextMenu_Masonry") .. " " .. carpentrySkill .. " <LINE>";
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

ISMasonryMenu.addToolTip = function()
	local toolTip = ISWorldObjectContextMenu.addToolTip();
	toolTip.footNote = getText("Tooltip_craft_pressToRotate", Keyboard.getKeyName(getCore():getKey("Rotate building")))
	return toolTip;
end

ISMasonryMenu.countMaterial = function(player, fullType)
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
    for k,v in pairs(ISMasonryMenu.materialOnGround) do
        if k == type then count = count + v end
    end
    return count
end

ISMasonryMenu.requireMasonsTrowel = function(option)
	if not (ISMasonryMenu.hasMasonsTrowel or ISMasonryMenu.hasHydrocraftTrowel) and not ISBuildMenu.cheat then
		option.notAvailable = true
		option.onSelect = nil
	end
end

Events.OnFillWorldObjectContextMenu.Add(ISMasonryMenu.doMasonryMenu);
