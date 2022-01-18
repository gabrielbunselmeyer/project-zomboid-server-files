require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

	local Clay = {
	type = "filcher.SFClay",
	skill = 0,
	minCount = 1,
	maxCount = 3,
	xp = 2,
	isOnWater = true,
        categories = { "Stones" },
	zones={ Forest=4, DeepForest=4, FarmLand=4, Farm=4, Vegitation=3, TrailerPark=2 },
	spriteAffinities        = {
		"blends_natural_02_01",
		"blends_natural_02_02",
		"blends_natural_02_03",
		"blends_natural_02_04",
		"blends_natural_02_08",
		"blends_natural_02_09",
		"blends_natural_02_10",
		"blends_natural_02_11",
		"blends_natural_02_12",
		"blends_natural_02_13",
		"blends_natural_02_14",
		"blends_natural_02_15",
		 },
	};

forageSystem.addItemDef(Clay);

end)