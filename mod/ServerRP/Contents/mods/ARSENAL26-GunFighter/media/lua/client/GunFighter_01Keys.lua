--[[							
OPTION CONFIGURED MULTI-DISTRIBUTION METHOD SYSTEM DESIGNED BY ARSENAL[26].							
THIS IS A WORK IN PROGRESS, AND AS SUCH… NO PERMISSION IS GRANTED FOR USE OF							
ANY PORTION OF THIS FILE FOR 3RD PARTY MODS, TWEAKS, PATCHES, OR ANYTHING OF							
THE LIKE. THAT MEANS YOU DO NOT HAVE PERMISSION TO CHANGE A FEW NUMBERS							
AROUND AND POST ANY OF THIS AS YOUR OWN MOD.							
]]							

local key_data_AMMO_TYPE_1 = {
	key = Keyboard.KEY_COMMA,
	name = "AMMO_TYPE_1",
}
local key_data_AMMO_TYPE_2 = {
	key = Keyboard.KEY_PERIOD,
	name = "AMMO_TYPE_2",
}
local key_data_MAG_TYPE_1 = {
	key = Keyboard.KEY_LBRACKET,
	name = "MAG_TYPE_1",
}
local key_data_MAG_TYPE_2 = {
	key = Keyboard.KEY_RBRACKET,
	name = "MAG_TYPE_2",
}
local key_data_FOLD_STOCK = {
	key = Keyboard.KEY_SLASH,
	name = "FOLD_STOCK",
}
local key_data_MELEE_MODE = {
	key = Keyboard.KEY_HOME,
	name = "MELEE_MODE",
}
local key_data_SELECT_FIRE = {
	key = Keyboard.KEY_BACK,
	name = "SELECT_FIRE",
}
local key_data_ALT_LOAD = {
	key = Keyboard.KEY_BACKSLASH,
	name = "ALT_LOAD",
}
local key_data_TRAJECTORY_DOWN = {
	key = Keyboard.KEY_MINUS,
	name = "TRAJECTORY_DOWN",
}
local key_data_TRAJECTORY_UP = {
	key = Keyboard.KEY_EQUALS,
	name = "TRAJECTORY_UP",
}
local key_data_WEAPON_LIGHT = {
	key = Keyboard.KEY_RCONTROL,
	name = "WEAPON_LIGHT",
}
local key_data_REFRESH_SCRIPT = {
	key = Keyboard.KEY_Z,
	name = "REFRESH_SCRIPT",
}

local category = "[GunFighter Mod]";
ModOptions:AddKeyBinding(category, key_data_AMMO_TYPE_1);
ModOptions:AddKeyBinding(category, key_data_AMMO_TYPE_2);
ModOptions:AddKeyBinding(category, key_data_MAG_TYPE_1);
ModOptions:AddKeyBinding(category, key_data_MAG_TYPE_2);
ModOptions:AddKeyBinding(category, key_data_FOLD_STOCK);
ModOptions:AddKeyBinding(category, key_data_MELEE_MODE);
ModOptions:AddKeyBinding(category, key_data_SELECT_FIRE);
ModOptions:AddKeyBinding(category, key_data_ALT_LOAD);
ModOptions:AddKeyBinding(category, key_data_TRAJECTORY_DOWN);
ModOptions:AddKeyBinding(category, key_data_TRAJECTORY_UP);
ModOptions:AddKeyBinding(category, key_data_WEAPON_LIGHT);
ModOptions:AddKeyBinding(category, key_data_REFRESH_SCRIPT);