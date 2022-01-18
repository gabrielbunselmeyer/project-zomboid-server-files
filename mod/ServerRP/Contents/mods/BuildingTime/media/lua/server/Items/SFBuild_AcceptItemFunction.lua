require 'Items/AcceptItemFunction'

function AcceptItemFunction.HandTruck(container, item)
	if item:getWeight() >= 1.0 then
		return true
	end
	return false
end

