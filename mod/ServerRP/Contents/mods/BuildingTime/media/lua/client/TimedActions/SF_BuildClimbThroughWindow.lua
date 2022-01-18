require "TimedActions/ISClimbThroughWindow"

function ISClimbThroughWindow:perform()
    local primary = self.character:getPrimaryHandItem()
	if primary and (primary:getType() == "HandTruckBlue" or primary:getType() == "HandTruckRed") then
        self.character:getInventory():Remove(primary)
        local dropX,dropY,dropZ = ISInventoryTransferAction.GetDropItemOffset(self.character, self.character:getCurrentSquare(), primary)
        self.character:getCurrentSquare():AddWorldInventoryItem(primary, dropX, dropY, dropZ)
        self.character:removeFromHands(primary)
        ISInventoryPage.renderDirty = true
	end

    --self.item:ToggleWindow(self.character);
    if IsoWindowFrame.isWindowFrame(self.item) then
        self.character:climbThroughWindowFrame(self.item)
    else
        self.character:climbThroughWindow(self.item);
    end
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end