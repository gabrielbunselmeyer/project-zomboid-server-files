require "Definitions/AttachedWeaponDefinitions"

-- For Specific Outfits --

-- assault rifle on back
AttachedWeaponDefinitions.LongGunOnBack = {
	id = "LongGunOnBack",
	chance = 30,
	outfit = {"SharkBlueSWAT","SharkBlueSWATBelt","SharkGreenSWAT","SharkGreenSWATBelt","SharkGreenSWATRiot","SharkGreenSWATGasMask,","SharkGreenSWATBelt","SharkBlueSWATWebbing","SharkBlueSWATRiot","SharkBlueSWATGasMask"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.AssaultRifle",
		"Base.AssaultRifle2",
		"Base.Shotgun",
	},
}

AttachedWeaponDefinitions.PoliceHandGun = {
	id = "PoliceHandGun",
	chance = 30,
	outfit = {"SharkBlueSWAT","SharkBlueSWATBelt","SharkGreenSWAT","SharkGreenSWATBelt","SharkGreenSWATRiot","SharkGreenSWATGasMask,","SharkGreenSWATBelt","SharkBlueSWATWebbing","SharkBlueSWATRiot","SharkBlueSWATGasMask"},
	weaponLocation = {"Holster Left", "Holster Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.HolsterSimple",
	weapons = {
    "Base.Pistol",
	"Base.Pistol2",
	},
}	

-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkBlueSWAT = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
		AttachedWeaponDefinitions.LongGunOnBack,	
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkBlueSWATGasMask = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
		AttachedWeaponDefinitions.LongGunOnBack,	
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkBlueSWATBelt = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkGreenSWAT = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
		AttachedWeaponDefinitions.LongGunOnBack,	
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkGreenSWATGasMask = {
	chance = 30;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
		AttachedWeaponDefinitions.LongGunOnBack,	
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.SharkGreenSWATBelt = {
	chance = 70;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.PoliceHandGun,
	},

	
}