require "TimedActions/ISClimbSheetRopeAction"

function ISClimbSheetRopeAction:perform()
    local primary = self.character:getPrimaryHandItem()
	if primary and (primary:getType() == "HandTruckBlue" or primary:getType() == "HandTruckRed") then
        	self.character:getInventory():Remove(primary)
        	local dropX,dropY,dropZ = ISInventoryTransferAction.GetDropItemOffset(self.character, self.character:getCurrentSquare(), primary)
        	self.character:getCurrentSquare():AddWorldInventoryItem(primary, dropX, dropY, dropZ)
        	self.character:removeFromHands(primary)
        	ISInventoryPage.renderDirty = true
	end

	if self.down then
		self.character:climbDownSheetRope()
	else
		self.character:climbSheetRope()
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end
