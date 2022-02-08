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

require "TimedActions/ISBaseTimedAction"

HSITWExamineConstruction = ISBaseTimedAction:derive("HSITWExamineConstruction");

function HSITWExamineConstruction:isValid()
	return true;
end

function HSITWExamineConstruction:waitToStart()
	self.character:faceThisObject(self.construction)
   return self.character:shouldBeTurning()
end

function HSITWExamineConstruction:update()
	self.character:faceThisObject(self.construction)
end

function HSITWExamineConstruction:start()
	self:setActionAnim("Loot")
end

function HSITWExamineConstruction:stop()
	ISBaseTimedAction.stop(self);
end

function HSITWExamineConstruction:perform()
	self.character:Say(tostring(self.health))
	
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function HSITWExamineConstruction:new(character, construction, health)
   local o = {}
   setmetatable(o, self)
   self.__index = self
   o.character = character
   o.construction = construction
   o.health = health;
   o.maxTime = 5
   return o;
end
