ISInventoryPaneContextMenu.equipHandtruckMenu = function(player, context, items)
    --context.origin = origin;

	local unequip = false;
	local handtruck = nil;
	
	local playerObj = getSpecificPlayer(player)

	local containerList = ISInventoryPaneContextMenu.getContainers(playerObj)
    local testItem = nil;
    local editItem = nil;
    for i,v in ipairs(items) do
        testItem = v;
        if not instanceof(v, "InventoryItem") then
            --print(#v.items);
            if #v.items == 2 then
                editItem = v.items[1];
            end
            testItem = v.items[1];
        else
            editItem = v
        end
	if getSpecificPlayer(player):isEquipped(testItem) then
		unequip = true;
        end
	if instanceof(testItem, "InventoryContainer") and testItem:isRequiresEquippedBothHands() then
            handtruck = testItem;
        end

	if handtruck and unequip then
		context:addOption(getText("ContextMenu_Drop"), handtruck, ISInventoryPaneContextMenu.dropItem, player);
	end
	end
	--return context
end

Events.OnFillInventoryObjectContextMenu.Add(ISInventoryPaneContextMenu.equipHandtruckMenu);