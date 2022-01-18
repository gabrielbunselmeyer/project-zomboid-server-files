------------------------------------------------------------------------------------------------------------------
-- Notes:
-- All Mod Items should appear in "Mods" Category. 
-- Until they get their own Buttons, they get a Prefix in name.
-- Mod Item Icons - keep the "media/textures/Item_IconName.png" format, it's good for performance.
------------------------------------------------------------------------------------------------------------------
-- {"Category Name" x 3, "Display Name", "Module.ItemID", "Item_(Icon)", R, G, B, Function, State, Extra, X, Y, Z}
------------------------------------------------------------------------------------------------------------------
-- Plug-In Code based on NF Plug-In code by blindcoder.
------------------------------------------------------------------------------------------------------------------
-- Supported Mods: By Mod ID
--
------------------------------------------------------------------------------------------------------------------

local function ModCheck(mod)
	local mods = getActivatedMods();
	for i=0, mods:size()-1, 1 do
		if mods:get(i) == mod then
			return true;
		end
	end
	return false;
end

Events.OnGameStart.Add( function ()
	if NecroList then
		print ("[NecroForge] - Adding SFBuildingTime to NecroForge");
		NecroList.Items.SFBuild1 = {"Mods", "SFBuild", nil, "SFBuild - Brick Mold", "filcher.SFBrickMold", "media/textures/Item_SFBrickMold.png", nil, nil, nil};
		NecroList.Items.SFBuild2 = {"Mods", "SFBuild", nil, "SFBuild - Bricks", "filcher.Bricks", "media/textures/Item_SFBricks.png", nil, nil, nil};
		NecroList.Items.SFBuild3 = {"Mods", "SFBuild", nil, "SFBuild - Chisel", "filcher.SFChisel", "media/textures/Item_SFChisel.png", nil, nil, nil};
		NecroList.Items.SFBuild4 = {"Mods", "SFBuild", nil, "SFBuild - Clay", "filcher.SFClay", "media/textures/Item_SFClay.png", nil, nil, nil};
		NecroList.Items.SFBuild5 = {"Mods", "SFBuild", nil, "SFBuild - Clay Bag", "filcher.SFClayBag", "media/textures/Item_Sandbag.png", nil, nil, nil};
		NecroList.Items.SFBuild6 = {"Mods", "SFBuild", nil, "SFBuild - Glass Panel", "filcher.SFGlassPanel", "media/textures/Item_Mirror.png", nil, nil, nil};
		NecroList.Items.SFBuild7 = {"Mods", "SFBuild", nil, "SFBuild - Mason's Trowel", "filcher.MasonsTrowel", "media/textures/Item_SFMasonsTrowel.png", nil, nil, nil};
		NecroList.Items.SFBuild8 = {"Mods", "SFBuild", nil, "SFBuild - Masonry for Beginners", "filcher.BookMasonry1", "media/textures/Item_BookBrick.png", nil, nil, nil};
		NecroList.Items.SFBuild9 = {"Mods", "SFBuild", nil, "SFBuild - Masonry for Intermediates", "filcher.BookMasonry2", "media/textures/Item_BookBrick.png", nil, nil, nil};
		NecroList.Items.SFBuild10 = {"Mods", "SFBuild", nil, "SFBuild - Advanced Masonry", "filcher.BookMasonry3", "media/textures/Item_BookBrick.png", nil, nil, nil};
		NecroList.Items.SFBuild11 = {"Mods", "SFBuild", nil, "SFBuild - Expert Masonry", "filcher.BookMasonry4", "media/textures/Item_BookBrick.png", nil, nil, nil};
		NecroList.Items.SFBuild12 = {"Mods", "SFBuild", nil, "SFBuild - Master Masonry", "filcher.BookMasonry5", "media/textures/Item_BookBrick.png", nil, nil, nil};
		NecroList.Items.SFBuild13 = {"Mods", "SFBuild", nil, "SFBuild - Masonry Magazine", "filcher.SFMasonMag", "media/textures/Item_SFMasonMag.png", nil, nil, nil};
		NecroList.Items.SFBuild14 = {"Mods", "SFBuild", nil, "SFBuild - The Metalwork Magazine Vol.5", "filcher.SFMetalworkMag5", "media/textures/Item_SFWeldMag5.png", nil, nil, nil};
		NecroList.Items.SFBuild15 = {"Mods", "SFBuild", nil, "SFBuild - Sealant", "filcher.SFSealant", "media/textures/Item_SFSealant.png", nil, nil, nil};
		NecroList.Items.SFBuild16 = {"Mods", "SFBuild", nil, "SFBuild - Hand Truck", "filcher.HandTruckBlue", "media/textures/Item_HandTruckBlue.png", nil, nil, nil};
		NecroList.Items.SFBuild17 = {"Mods", "SFBuild", nil, "SFBuild - Hand Truck", "filcher.HandTruckRed", "media/textures/Item_HandTruckRed.png", nil, nil, nil};
	end
end)