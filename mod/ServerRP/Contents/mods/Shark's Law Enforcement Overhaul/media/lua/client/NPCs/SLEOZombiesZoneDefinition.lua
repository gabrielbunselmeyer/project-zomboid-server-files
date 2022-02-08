SLEOZombiesZoneDefinition = ZombiesZoneDefinition or {};

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
SLEOZombiesZoneDefinition.Default = ZombiesZoneDefinition.Default or {};


SLEOZombiesZoneDefinition.Police = {
	Police = {
		name="Police",
		chance=40,
	},

    SharkBlueSWATBelt = {
		name="SharkBlueSWATBelt",
		chance=10,
	},

    SharkBlueSWAT = {
		name="SharkBlueSWAT",
		chance=5,
	},

    SharkBlueSWATRiot = {
		name="SharkBlueSWATRiot",
		chance=5,
	},
    
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=20,
		gender="female",
	},

	OfficeWorker = {
		name="OfficeWorker",
		chance=20,
		gender="male",
		beardStyles="null:80",
	},
}


SLEOZombiesZoneDefinition.PoliceState = {
	Police = {
		name="PoliceState",
		chance=40,
	},

    SharkGreenSWATBelt = {
		name="SharkGreenSWATBelt",
		chance=10,
	},

    SharkGreenSWAT = {
		name="SharkGreenSWAT",
		chance=5,
	},

    SharkGreenSWATRiot = {
		name="SharkGreenSWATRiot",
		chance=5,
	},

	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=20,
		gender="female",
	},

	OfficeWorker = {
		name="OfficeWorker",
		chance=20,
		gender="male",
		beardStyles="null:80",
	},
}

table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlueSWATBelt", chance=0.02});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlueSWAT", chance=0.02});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlueSWATGasMask", chance=0.02});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkBlueSWATRiot", chance=0.02});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkGreenSWATBelt", chance=0.02});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkGreenSWAT", chance=0.02});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkGreenSWATGasMask", chance=0.02});
table.insert(SLEOZombiesZoneDefinition.Default,{name = "SharkGreenSWATRiot", chance=0.02});