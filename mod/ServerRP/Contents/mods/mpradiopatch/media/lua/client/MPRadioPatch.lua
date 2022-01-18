oldProcessSayMessage = processSayMessage;
processSayMessage = function(spokenMessage)
	if not spokenMessage then return end
	local trimmedMessage = luautils.trim(spokenMessage);
	if not trimmedMessage or #trimmedMessage == 0 then return end
	getPlayer():setLastSpokenLine(trimmedMessage); -- This is the line that actually makes the patch work.
	-- The radio relies heavily on IsoGamePlayer.lastSpokenLine to pick up messages.
	-- However, ISChat.lua uses processSayMessage and other various helpers defined in LuaManager.java, which doesn't set lastSpokenLine.
	-- By either adding setLastSpokenLine(text) in ISChat.lua or in the actual source code for processSayMessage, you can get the radio to work.
	-- Since I don't want to have to do Java modding to fix this bug, I opted for the former.
	oldProcessSayMessage(trimmedMessage);
end