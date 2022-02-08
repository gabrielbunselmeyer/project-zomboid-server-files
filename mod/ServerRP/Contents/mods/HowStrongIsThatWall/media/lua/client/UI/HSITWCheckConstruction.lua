--[[
***********************************************************
** PseudonymousEd, the Dev
** How Strong is that Wall 41.51
***********************************************************
Copyright 2021 PseudonymousEd

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

HSITW = {};

HSITW.contextMenu = function(_player, context, worldobjects)
    local player = getSpecificPlayer(_player);
    local thisObject = worldobjects[1];

	if thisObject:getObjectName() then
		local objectName = thisObject:getObjectName()

		if objectName == "Thumpable" then
			if thisObject:getHealth() then
				local health = thisObject:getHealth()
				local maxHealth = thisObject:getMaxHealth()
				local woodworkLevel = player:getPerkLevel(Perks.Woodwork)
				
				--print("PseudoEdHSITW: Health is " .. health)
				--player:Say("HSITW Health is  " .. health)
				--player:Say("HSITW MaxHealth is  " .. maxHealth)
				--player:Say("HSITW Woodwork level is " .. woodworkLevel)
				
				local percentHealth = health / maxHealth
				--player:Say("HSITW percentage is " .. percentHealth)

				local healthDescription = health
				
				-- Determine Health Description, based on woodworkLevel
				if woodworkLevel >= 10 then
					if health ~= maxHealth then
						healthDescription = (health .. " out of " .. maxHealth)
					else
						healthDescription = maxHealth
					end
				elseif woodworkLevel >= 7 then
					if percentHealth > 0.75 then
						healthDescription = "Solid " .. maxHealth .. " max strength construction"
					elseif percentHealth > 0.5 then
						healthDescription = "Lightly damaged " .. maxHealth .. " max strength construction"
					elseif percentHealth > 0.25 then
						healthDescription = "Moderately damaged " .. maxHealth .. " max strength construction"
					else
						healthDescription = "Heavily damaged " .. maxHealth .. " max strength construction"
					end
				elseif woodworkLevel >= 2 then
					if percentHealth > 0.75 then
						healthDescription = "Solid"
					elseif percentHealth > 0.5 then
						healthDescription = "Light damage"
					elseif percentHealth > 0.25 then
						healthDescription = "Moderate damage"
					else
						healthDescription = "Heavy damage"
					end
				elseif (health * 2) > maxHealth then
					healthDescription = "Looks good"
				else
					healthDescription = "Looks damaged"
				end
		
				local contextMenu = "ContextMenu_Examine"
				context:addOption(getText(contextMenu),
								  worldobjects,
								  HSITW.onCheckConstruction,
								  player,
								  thisObject,
								  healthDescription);
			end
		end
	end
end

HSITW.onCheckConstruction = function(worldobjects, player, thisObject, healthDescription)
	if luautils.walkAdj(player, thisObject:getSquare()) then
		ISTimedActionQueue.add(HSITWExamineConstruction:new(player, thisObject, healthDescription));
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(HSITW.contextMenu);
