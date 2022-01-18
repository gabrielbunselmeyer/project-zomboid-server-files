require 'NPCs/ZombiesZoneDefinition'


AZ_ZombiesZoneDefinition = ZombiesZoneDefinition or {};

-- name of the zone for the zone type ZombiesType (in worldzed)
ZombiesZoneDefinition.Airfield = {
	AirCrew = {
		name="AirCrew",
		chance=25,
	},
	AirCrewM = {
		name="AirCrew",
		toSpawn=1,
		mandatory="true",
	},
	AuthenticJimmyGibbsM = {
		name="AuthenticJimmyGibbs",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},	
}

ZombiesZoneDefinition.Airfield2 = {
	AirCrew = {
		name="AirCrew",
		chance=25,
	},
	AuthenticJimmyGibbsM = {
		name="AuthenticJimmyGibbs",
		chance=2,
		gender="male",
	},	
}

ZombiesZoneDefinition.AnthraxBurned = {
	AuthenticCharcoal = {
		name="AuthenticCharcoal",
		chance=90,
	},
}

ZombiesZoneDefinition.ArtGallery = {
	AuthenticBobRoss = {
		name="AuthenticBobRoss",
		chance=2,
		gender="male",		
	},
}

ZombiesZoneDefinition.Back4Blood = {
	AuthenticB4BEvangeloM = {
		name="AuthenticB4BEvangelo",
		toSpawn=1,
		gender="male",
		mandatory="true"
	},
	AuthenticB4BHoffmanM = {
		name="AuthenticB4BHoffman",
		gender="male",
		toSpawn=1,
		mandatory="true",
	},	
	AuthenticB4BHollyM = {
		name="AuthenticB4BHolly",
		gender="female",
		toSpawn=1,
		mandatory="true",
	},	
	AuthenticB4BMomM = {
		name="AuthenticB4BMom",
		toSpawn=1,
		gender="female",
		mandatory="true",
	},		
	AuthenticB4BWalkerM = {
		name="AuthenticB4BWalker",
		gender="male",
		toSpawn=1,
		mandatory="true",
	},		
}

ZombiesZoneDefinition.BacktotheFutureIII = {
	AuthenticDocBrown = {
		name="AuthenticDocBrown",
		toSpawn=1,
		gender="male",
		mandatory="true"
	},
	AuthenticMartyMcFly = {
		name="AuthenticMartyMcFly",
		toSpawn=1,
		gender="male",
		mandatory="true"
	},	
	AuthenticMiner = {
		name="AuthenticMiner",
		chance=5,
		gender="male",			
	},		
}

ZombiesZoneDefinition.Barbershop = {
	AuthenticBarbershopQuartetBlueM = {
		name="AuthenticBarbershopQuartetBlue",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticBarbershopQuartetGreenM = {
		name="AuthenticBarbershopQuartetGreen",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticBarbershopQuartetPurpleM = {
		name="AuthenticBarbershopQuartetPurple",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticBarbershopQuartetRedM= {
		name="AuthenticBarbershopQuartetRed",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
	AuthenticBarbershopQuartetYellowM= {
		name="AuthenticBarbershopQuartetYellow",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
}

ZombiesZoneDefinition.BillMurray = {
	AuthenticBillMurrayM = {
		name="AuthenticBillMurray",
		toSpawn=1,
		gender="male",
		mandatory="true"
	},
}

ZombiesZoneDefinition.BlockDuster = {
	AuthenticBillMurrayM = {
		name="AuthenticBillMurray",
		chance=4,
		gender="male",
	},
}

ZombiesZoneDefinition.CampBlood2 = {
	VarsityM = {
		name="VarsityMale",
		chance=35,
		gender="male",
	},
	VarsityF = {
		name="VarsityFemale",
		chance=35,
		gender="female",
	},	
	Teacher = {
		name="Teacher",
		chance=10,
	},
	Camper = {
		name="Camper",
		chance=10,
	},	
	HockeyPsychoM = {
		name="HockeyPsycho",
		chance=2,
		gender="male",
	},
	AuthenticJasonPart3M = {
		name="AuthenticJasonPart3",
		chance=2,
		gender="male",
	},
	AuthenticJasonPart2M = {
		name="AuthenticJasonPart2",
		chance=2,
		gender="male",
	},
	AuthenticHalloweenM = {
		name="AuthenticHalloween",
		chance=2,
		gender="male",
	},
	AuthenticFreddyKruegerM = {
		name="AuthenticFreddyKrueger",
		chance=2,
		gender="male",
	},
	AuthenticLeatherFaceM = {
		name="AuthenticLeatherFace",
		chance=2,
		gender="male",
	},
	AuthenticGhostFaceM = {
		name="AuthenticGhostFace",
		chance=2,
		gender="male",
	},
	AuthenticClownPennywiseM = {
		name="AuthenticClownPennywise",
		chance=2,
		gender="male",
	},		
}

ZombiesZoneDefinition.CampBlood = {
	VarsityM = {
		name="VarsityMale",
		chance=35,
		gender="male",
	},
	VarsityF = {
		name="VarsityFemale",
		chance=35,
		gender="female",
	},	
	Teacher = {
		name="Teacher",
		chance=10,
	},
	Camper = {
		name="Camper",
		chance=10,
	},	
	HockeyPsychoM = {
		name="HockeyPsycho",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticJasonPart3M = {
		name="AuthenticJasonPart3",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
	AuthenticJasonPart2M = {
		name="AuthenticJasonPart2",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
	AuthenticHalloweenM = {
		name="AuthenticHalloween",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
	AuthenticFreddyKruegerM = {
		name="AuthenticFreddyKrueger",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticLeatherFaceM = {
		name="AuthenticLeatherFace",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticGhostFaceM = {
		name="AuthenticGhostFace",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticClownPennywiseM = {
		name="AuthenticClownPennywise",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},		
}

ZombiesZoneDefinition.Campgrounds= {
	Camper = {
		name="Camper",
		chance=30,
	},
	AuthenticPoncho= {
		name="Camper",
		chance=15,
	},
	
}

ZombiesZoneDefinition.Clementine= {
	AuthenticClementineM = {
		name="AuthenticClementine",
		toSpawn=1,
		mandatory="true",
		gender="female",
	},
	
}

ZombiesZoneDefinition.ChainsawMaid= {
	AuthenticChainsawMaidM = {
		name="AuthenticChainsawMaid",
		toSpawn=1,
		mandatory="true",
		gender="female",
	},
	
}

ZombiesZoneDefinition.CoffeeShop = {
	AuthenticCook_SeahorseM = {
		name="AuthenticCook_Seahorse",
		toSpawn=1,
		mandatory="true",
	},
	AuthenticCook_Seahorse = {
		name="AuthenticCook_Seahorse",
		chance=55,
	},
}

ZombiesZoneDefinition.Crackhouse = {
	Naked = {
		name="Naked",
		chance=30,
	},
	AuthenticHomeless = {
		name="AuthenticHomeless",
		chance=40,
	},
	TinFoilHat = {
		name="TinFoilHat",
		chance=15,
	},
}
--[[
ZombiesZoneDefinition.CrossroadsMallDR1 = {
	AuthenticDRJessieMcCarney = {
		name="AuthenticDRJessieMcCarney",
		toSpawn=1,
		gender="female",
		mandatory="true",
	},
	AuthenticDRBradGarrison = {
		name="AuthenticDRBradGarrison",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},	
	Postal = {
		name="Postal",
		chance=5,
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=5,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=5,
		gender="male",
		beardStyles="null:80",
	},
	MallSecurityM = {
		name="MallSecurity",
		toSpawn=1,
		gender="male",
		mandatory="true",
		room="security",
	},	
}
--]]

ZombiesZoneDefinition.CrossroadsMallFoodCourt = {
	Party = {
		name="Party",
		chance=15,
	},
	Party2 = {
		name="Party2",
		chance=15,
	},		
	Generic01 = {
		name="Generic01",
		chance=3,
	},
	Generic02 = {
		name="Generic02",
		chance=2,
	},	
	Generic03 = {
		name="Generic03",
		chance=3,
	},
	Generic04 = {
		name="Generic04",
		chance=2,
	},
	Generic05 = {
		name="Generic05",
		chance=3,
	},
	AuthenticGeneric06 = {
		name="AuthenticGeneric06",
		chance=2,
	},	
	SportsFan = {
		name="SportsFan",
		chance=5,
	},
	ThunderGas = {
		name="ThunderGas",
		chance=5,
	},	
	Tourist = {
		name="Tourist",
		chance=5,
	},
	AuthenticDRChuckGreeneM = {
		name="AuthenticDRChuckGreene",
		gender="male",
		chance=1,		
	},	
}
--[[
ZombiesZoneDefinition.CrossroadsMallFoodCourtShops = {
	Cook_Generic = {
		name="Cook_Generic",
		chance=70,
	},
	Generic01 = {
		name="Generic01",
		chance=10,
	},
	Generic02 = {
		name="Generic02",
		chance=10,
	},	
	Generic03 = {
		name="Generic03",
		chance=10,
	},
	Generic04 = {
		name="Generic04",
		chance=5,
	},	
	Party = {
		name="Party",
		chance=10,
	},
	Party2 = {
		name="Party2",
		chance=10,
	},	
}
ZombiesZoneDefinition.CrossroadsMallMiddleShops = {
	Waiter_Market = {
		name="Waiter_Market",
		chance=10,
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=5,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=5,
		gender="male",
		beardStyles="null:80",
	},	
}
ZombiesZoneDefinition.CrossroadsMallMiscShops = {
	FitnessInstructor = {
		name="FitnessInstructor",
		chance=10,
	},
	Gas2Go = {
		name="Gas2Go",
		chance=5,
	},	
	ThunderGas = {
		name="ThunderGas",
		chance=5,
	},	
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=5,
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=5,
		beardStyles="null:80",
	},	
}
ZombiesZoneDefinition.CrossroadsMallDeptStore = {
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=5,
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=5,
		beardStyles="null:80",
	},
	Tourist = {
		name="Tourist",
		chance=5,
	},	
}
--]]
ZombiesZoneDefinition.CrossroadsMall = {
	Random = {
		name="MallSecurity",
		chance=170,
		toSpawn=200,
		gender="female",		
	},

	MallSecurityM = {
		name="MallSecurity",
		chance=50,
		gender="male",
		room="security",
	},
	MallSecurityM = {
		name="MallSecurity",
		chance=90,
		gender="female",
		room="hall",
	},	
	MallSecurity = {
		name="MallSecurity",
		chance=1,
		gender="male",
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=5,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=5,
		gender="male",
		beardStyles="null:80",
	},
	Generic01 = {
		name="Generic01",
		chance=5,
	},
	Generic02 = {
		name="Generic02",
		chance=5,
	},	
	Generic03 = {
		name="Generic03",
		chance=5,
	},	
	Tourist = {
		name="Tourist",
		chance=5,
	},
	AuthenticSportsFan = {
		name="AuthenticSportsFan",
		chance=5,
	},	
	AuthenitcDRFrankWestM = {
		name="AuthenticDRFrankWest",
		chance=1,
		gender="male",
		room="hall",
	},	
	AuthenticDRJessieMcCarneyM = {
		name="AuthenticDRJessieMcCarney",
		chance=1,
		gender="female",
	},
	AuthenticDRBradGarrisonM = {
		name="AuthenticDRBradGarrison",
		chance=1,
		gender="male",
		room="hall",
	},		
	AuthenitcFlyboyM = {
		name="AuthenitcFlyboy",
		chance=1,
		gender="male",
		room="hall",
	},
	AuthenticJimmyGibbsM = {
		name="AuthenticJimmyGibbs",
		chance=1,
		gender="male",
		room="hall",
	},
	AuthenticDRChuckGreeneM = {
		name="AuthenticDRChuckGreene",
		chance=1,
		gender="male",
		room="hall",
	},
	Santa = {
		name="Santa",
		chance=1,
		gender="male",
		room="hall",
		beardStyles="Long:100",	
	},
	SantaGreen = {
		name="SantaGreen",
		chance=1,
	},	
	AuthenticDRTrueEyeCultM = {
		name="AuthenticDRTrueEyeCult",
		chance=2,
		gender="male",
		room="hall",
	},	
	AuthenticDRTrueEyeCult = {
		name="AuthenticDRTrueEyeCult",
		chance=80,
		gender="male",
		room="office",
	},		
}

ZombiesZoneDefinition.DayZBleu = { --
	AuthenticDayZHeroBleuM = {
		name="AuthenticDayZHeroBleu",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.Dianne = {
	AuthenticDianneCaldwell = {
		name="AuthenticDianneCaldwell",
		toSpawn=1,
		mandatory="true",
		gender="female",
	},
}

ZombiesZoneDefinition.DonutShop = {
	AuthenticCook_Donut = {
		name="AuthenticCook_Donut",
		chance=55,
	},
	AuthenticCook_DonutM = {
		name="AuthenticCook_Donut",
		chance=75,
		room="donut_dining",
	},
}

ZombiesZoneDefinition.Dormitory = {
	Security = {
		name="Security",
		chance=9,
		room="office",
		gender="male",
	},
	AuthenticSportsFan = {
		name="AuthenticSportsFan",
		chance=20,
		room="recreation",
	},
	BaseBallPlayer_Rangers  = {
		name="BaseBallPlayer_Rangers",
		chance=5,
		room="recreation",
	},
	BaseballPlayer_KY = {
		name="BaseballPlayer_KY",
		chance=5,
		room="recreation",
	},
	BaseballPlayer_Z = {
		name="BaseballPlayer_Z",
		chance=5,
		room="recreation",
	},
	MechanicM = {
		name="Mechanic",
		toSpawn=1,
		mandatory="true",
		room="janitor",
		gender="male",
	},
	PostalM = {
		name="Postal",
		toSpawn=1,
		mandatory="true",
		room="storageunit",
	},
	AuthenticEllisM = {
		name="AuthenticEllis",
		chance=3,
		gender="male",
	},
	AuthenticCoachM = {
		name="AuthenticCoach",
		chance=3,
		mandatory="true",
		gender="male",
	},
	AuthenticRochelleM = {
		name="AuthenticRochelle",
		chance=2,
		gender="female",
	},
	AuthenticNickM = {
		name="AuthenticNick",
		chance=3,
		gender="male",
	},	
}

ZombiesZoneDefinition.EvilDead = { 
	AuthenticAshEvilDeadM = {
		name="AuthenticAshEvilDead",
		gender="male",
		chance=3,
	},		
}

ZombiesZoneDefinition.ExclusionZone = {
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=100,
	},
}

ZombiesZoneDefinition.FishingZone = {
	Fisherman = {
		name="Fisherman",
		chance=80,
		gender="male",
	},
	AuthenticPoncho= {
		name="Camper",
		chance=19,
	},	
}

ZombiesZoneDefinition.GhillieBrush = {
	Ghillie = {
		name="Ghillie",
		gender="male",
		chance=40,
	},
	SnowGhillie = {
		name="AuthenticSnowGhillie",
		gender="male",		
		chance=10,
	},	
}

ZombiesZoneDefinition.GMan = {
	AuthenticGManM = {
		name="AuthenticGMan",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.Grimes = {
	AuthenticRickGrimesM = {
		name="AuthenticRickGrimes",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.HankHill = {
	AuthenticHankHillM = {
		name="AuthenticHankHill",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
}

ZombiesZoneDefinition.HitchHikingInmates = {
	AuthenticPrisonerClassicM = {
		name="AuthenticPrisonerClassic",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
	InmateKhakiM = {
		name="InmateKhaki",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
	AuthenticPrisonerClassic = {
		name="AuthenticPrisonerClassic",
		chance=5,
		gender="male",
	},
	InmateKhaki = {
		name="InmateKhaki",
		chance=5,
		gender="male",
	},	
}

ZombiesZoneDefinition.HuntingZone = {
	Hunter = {
		name="Hunter",
		chance=80,
		gender="male",
	},
	Hunter = {
		name="Hunter",
		chance=80,
		gender="male",
	},
	HunterM = {
		name="Hunter",
		toSpawn=1,
		gender="male",
		mandatory="true",
		room="kitchen",            
	},		
	AuthenticPoncho= {
		name="Camper",
		chance=10,
	},	
}

ZombiesZoneDefinition.IceCream = {
	Cook_IceCreamM = {
		name="Cook_IceCream",
		toSpawn=1,
		mandatory="true",
	},
	Cook_IceCream = {
		name="Cook_IceCream",
		chance=55,
	},
	Cook_IceCreamM2 = {
		name="Cook_IceCream",
		toSpawn=1,
		mandatory="true",
		room="icecreamkitchen",
	},
}

ZombiesZoneDefinition.Killa = { --
	AuthenticKillaM = {
		name="AuthenticKilla",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.Left4Dead = {
	AuthenticBillOverbeckM = {
		name="AuthenticBillOverbeck",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticZoeyM = {
		name="AuthenticZoey",
		toSpawn=1,
		mandatory="true",
		gender="female",
	},
	AuthenticLouisM = {
		name="AuthenticLouis",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticFrancisM = {
		name="AuthenticFrancis",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
}

ZombiesZoneDefinition.LVCityHall = {
	AuthenticAbeLincolnM = {
		name="AuthenticAbeLincoln",
		gender="male",
		chance=2,
	},
	AuthenticSecretService = {
		name="AuthenticSecretService",
		chance=5,
		gender="male",
	},
	AuthenticPolitician = {
		name="AuthenticPolitician",
		gender="male",
		chance=2,		
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=30,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=30,
		gender="male",
		beardStyles="null:80",
	},
	AuthenticUncleSamM = {
		name="AuthenticUncleSam",
		gender="male",
		chance=2,
	},	
}

ZombiesZoneDefinition.LBMWStationHQ = { --
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=30,
		room="office",
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=30,
		room="office",
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.LBMWRadioHQ = { --
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		gender="female",
		chance=30,
		room="office",
	},
	OfficeWorker = {
		name="OfficeWorker",
		gender="male",
		chance=30,
		room="office",
		beardStyles="null:80",
	},
}

ZombiesZoneDefinition.Militia = {
	PrivateMilitia = {
		name="PrivateMilitia",
		chance=30,
	},
		PrivateMilitia = {
		name="PrivateMilitia",
		chance=30,
		gender="male",
		
	},
		AuthenticDawnoftheDead = {
		name="AuthenticDawnoftheDead",
		chance=10,
		gender="male",
		
	},
}

ZombiesZoneDefinition.MovieNight = {
	AuthenticAuthenticAndyDotDM = {
		name="AuthenticAndyDotD",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
	AuthenticGhostbusterVenkmanM = {
		name="AuthenticGhostbusterVenkman",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticGhostbusterStantzM = {
		name="AuthenticGhostbusterStantz",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticGhostbusterSpenglerM = {
		name="AuthenticGhostbusterSpengler",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticGhostbusterZeddemoreM = {
		name="AuthenticGhostbusterZeddemore",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticJokerM = {
		name="AuthenticJoker",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
	AuthenticNMRIHBadassM = {
		name="AuthenticNMRIHBadass",
		toSpawn=1,
		mandatory="true",
		gender="female",
	},	
	AuthenticNMRIHBatemanM = {
		name="AuthenticNMRIHBateman",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},		
	AuthenticNMRIHButcherM = {
		name="AuthenticNMRIHButcher",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},	
	AuthenticNMRIHHunterM = {
		name="AuthenticNMRIHHunter",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticNMRIHJiveM = {
		name="AuthenticNMRIHJive",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticNMRIHMolotovM = {
		name="AuthenticNMRIHMolotov",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticNMRIHRojeM = {
		name="AuthenticNMRIHRoje",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticNMRIHWallyM = {
		name="AuthenticNMRIHWally",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticSexyBunny = {
		name="AuthenticSexyBunny",
		toSpawn=1,
		mandatory="true",
		gender="female",
	},		
}

ZombiesZoneDefinition.MovieNight2 = {
	AuthenticAuthenticAndyDotDM = {
		name="AuthenticAndyDotD",
		chance=1,
		gender="male",
	},	
	AuthenticGhostbusterVenkmanM = {
		name="AuthenticGhostbusterVenkman",
		chance=2,
		gender="male",
	},
	AuthenticGhostbusterStantzM = {
		name="AuthenticGhostbusterStantz",
		chance=2,
		gender="male",
	},
	AuthenticGhostbusterSpenglerM = {
		name="AuthenticGhostbusterSpengler",
		chance=2,
		gender="male",
	},
	AuthenticGhostbusterZeddemoreM = {
		name="AuthenticGhostbusterZeddemore",
		chance=2,
		gender="male",
	},
	AuthenticJokerM = {
		name="AuthenticJoker",
		chance=2,
		gender="male",
	},	
	AuthenticNMRIHBadassM = {
		name="AuthenticNMRIHBadass",
		chance=2,
		gender="female",
	},	
	AuthenticNMRIHBatemanM = {
		name="AuthenticNMRIHBateman",
		chance=2,
		gender="male",
	},		
	AuthenticNMRIHButcherM = {
		name="AuthenticNMRIHButcher",
		chance=2,
		gender="male",
	},	
	AuthenticNMRIHHunterM = {
		name="AuthenticNMRIHHunter",
		chance=2,
		gender="male",
	},
	AuthenticNMRIHJiveM = {
		name="AuthenticNMRIHJive",
		chance=2,
		gender="male",
	},
	AuthenticNMRIHMolotovM = {
		name="AuthenticNMRIHMolotov",
		chance=2,
		gender="male",
	},
	AuthenticNMRIHRojeM = {
		name="AuthenticNMRIHRoje",
		chance=2,
		gender="male",
	},
	AuthenticNMRIHWallyM = {
		name="AuthenticNMRIHWally",
		chance=2,
		gender="male",
	},
	AuthenticSexyBunny = {
		name="AuthenticSexyBunny",
		chance=2,
		gender="female",
	},		
}

ZombiesZoneDefinition.Nate = { --
	AuthenticNateAndersonM = {  --
		name="AuthenticNateAnderson",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
}

ZombiesZoneDefinition.Nukem = {
	AuthenticDukeNukemM = {
		name="AuthenticDukeNukem",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.ParkPlaza = {
	Cyclist = {
		name="Cyclist",
		chance=10,
	},
	AuthenticCountrySinger = {
		name="AuthenticCountrySinger",
		chance=10,
	},	
	Mannequin1 = {
		name="Mannequin1",
		chance=10,
		gender="female",
	},		
	AuthenticTravelingBand = {
		name="AuthenticTravelingBand",
		chance=10,
	},
	Ranger = {
		name="Ranger",
		chance=10,
	},
	StudentM = {
		name="StudentMale",
		chance=5,
		gender="male",
	},
	StudentF = {
		name="StudentFemale",
		chance=5,
		gender="female",
	},	
	AuthenticFitnessInstructor = {
		name="AuthenticFitnessInstructor",
		chance=10,
	},		
}

ZombiesZoneDefinition.PizzaDelivery = {
	AuthenticPizzaDeliveryM = {
		name="AuthenticPizzaDelivery",
		toSpawn=1,
		mandatory="true",
	},
		AuthenticPizzaDelivery = {
		name="AuthenticPizzaDelivery",
		chance=10,
	},
}

ZombiesZoneDefinition.PlanetTerror = { 	  --Name of a custom zone on the map
	AuthenticGrindhouseCherryM = {		  -- Just a reference name
		name="AuthenticGrindhouseCherry", -- name of the outfit in Clothing.XML
		gender="female", 				  -- This is a female only zombie, state it as such.
		chance=3,	              
	},
	PoliceState = {
		name="PoliceState", 			  -- name of the outfit in Clothing.XML, has both m/f outfits linked
		chance=10,						  -- guarenteed chance to spawn
	},
	Cook_GenericM = {
		name="Cook_Generic",			  -- name of the outfit in Clothing.XML
		gender="male",					  -- This is a male only zombie, state it as such.
		toSpawn=1,
		mandatory="true",
	},	
}

ZombiesZoneDefinition.Postal2 = {
	AuthenticPostalDudeM = {
		name="AuthenticPostalDude",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.Psycho = {
	AuthenticWinslowM = {
		name="AuthenticWinslow",
		toSpawn=1,
		gender="male",
		mandatory="true"
	},
	AuthenticNakedBlueVeinsM = {
		name="AuthenticNakedBlueVeins",
		toSpawn=1,
		mandatory="true",
	},	
}

ZombiesZoneDefinition.Psycho2 = {
	AuthenticWinslowM2 = {
		name="AuthenticWinslow",
		chance=5,
		gender="male",
	},
	AuthenticNakedBlueVeinsM2 = {
		name="AuthenticNakedBlueVeins",
		chance=15,
	},	
}

ZombiesZoneDefinition.ResidentEvil = {
	AuthenticJillValentineM = {
		name="AuthenticJillValentine",
		toSpawn=1,
		gender="female",
		mandatory="true"
	},
	AuthenticLeonKennedyM = {
		name="AuthenticLeonKennedy",
		gender="male",
		toSpawn=1,
		mandatory="true",
	},		
	AuthenticBillyChumpez = {
		name="AuthenticBillyChumpez",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.ScrapYard = {
	Mechanic = {
		name="Mechanic",
		chance=45,
		gender="male",
		beardStyles="Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
	MetalWorker = {
		name="MetalWorker",
		chance=35,
		gender="male",
		beardStyles="Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",
	},
}

ZombiesZoneDefinition.SecretBase = {
	Priest = {
		name="Priest",
		gender="male",
		chance=5,
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=5,
		gender="male",
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=30,
	},
	ArmyCamoDesert = {
		name="ArmyCamoDesert",
		chance=5,
	},
	AuthenticSecretService = {
		name="AuthenticSecretService",
		gender="male",
		chance=5,
	},	
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=10,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=10,
		gender="male",
		beardStyles="null:80",
	},
	Doctor = {
		name="Doctor",
		chance=7,
	},
	ArmyServiceUniform = {
		name="ArmyServiceUniform",
		chance=10,
		room="garage",
	},
	AuthenticKleiner = {
		name="AuthenticKleiner",
		toSpawn=1,
		gender="male",
		mandatory="true",
		room="medical",
	},
	AuthenticGordonFreeman = {
		name="AuthenticGordonFreeman",
		gender="male",
		chance=10,
		room="empty",
	},		
	AuthenticErinRedfire = {
		name="AuthenticErinRedfire",
		chance=3,
		gender="female",
		room="office",
	},		
	AuthenticHazardSuit = {
		name="AuthenticHazardSuit",
		toSpawn=1,
		mandatory="true",
		room="medical",
	},
	AuthenticCEDAHazmatGreentM = {
		name="AuthenticCEDAHazmatGreen",
		toSpawn=1,
		mandatory="true",
		room="medical",
	},
	AuthenticCEDAHazmatBlackM = {
		name="AuthenticCEDAHazmatBlack",
		toSpawn=1,
		mandatory="true",
		room="medical",
	},	
	AuthenticNBHHazmatM = {
		name="AuthenticNBHHazmat",
		toSpawn=1,
		mandatory="true",
		room="medical",
	},		
	AuthenticBubM = {
		name="AuthenticBub",
		chance=3,
		gender="male",
	},		
}

ZombiesZoneDefinition.SpeakingEvent = {
	AuthenticAbeLincolnM = {
		name="AuthenticAbeLincoln",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
	AuthenticSecretService = {
		name="AuthenticSecretService",
		chance=20,
		gender="male",
	},
	AuthenticSecretServiceM = {
		name="AuthenticSecretService",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
	AuthenticPolitician = {
		name="AuthenticPolitician",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=30,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=30,
		gender="male",
		beardStyles="null:80",
	},
	AuthenticUncleSamM = {
		name="AuthenticUncleSam",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},	
}

ZombiesZoneDefinition.Studio = {
	MallSecurity = {
		name="MallSecurity",
		gender="male",
		chance=10,
	},
	Tourist = {
		name="Tourist",
		chance=20,
	},
	Golfer = {
		name="Golfer",
		chance=15,
	},
	Classy = {
		name="Classy",
		chance=20,
	},
	OfficeWorkerSkirt = {
		name="OfficeWorkerSkirt",
		chance=10,
		gender="female",
	},
	OfficeWorker = {
		name="OfficeWorker",
		chance=10,
		gender="male",
		beardStyles="null:80",
	},
	AuthenticBobRoss = {
		name="AuthenticBobRoss",
		toSpawn=1,
		gender="male",
		mandatory="true"
	},	
}
--Tattoo'd Zs coming soon
ZombiesZoneDefinition.TattooShop = {
}

ZombiesZoneDefinition.TheDregs = {
	AuthenticNakedBlueVeinsM = {
		name="AuthenticNakedBlueVeins",
		toSpawn=1,
		mandatory="true",
	},
	AuthenticMinerM = {
		name="AuthenticMiner",
		toSpawn=1,
		gender="male",		
		mandatory="true",
	},	
	AuthenticNakedBlueVeins = {
		name="AuthenticNakedBlueVeins",
		chance=5,
	},
	AuthenticMiner = {
		name="AuthenticMiner",
		chance=5,
		gender="male",			
	},		
	AuthenticTf2SpyBlueM = {
		name="AuthenticTF2SpyBlue",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}

ZombiesZoneDefinition.TheyLive = {
	AuthenticTheyLiveM = {
		name="AuthenticTheyLive",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}
--[[
ZombiesZoneDefinition.TrueEyeCult = {
	AuthenticDRTrueEyeCultM = {
		name="AuthenticDRTrueEyeCult",
		toSpawn=1,
		mandatory="true",
		gender="male",
	},
	AuthenticDRTrueEyeCult = {
		name="AuthenticDRTrueEyeCult",
		chance=100,
	},				
}
--]]
ZombiesZoneDefinition.Wedding = {
	-- you have a 50% chance of having this zone spawning, to bring more randomness to the world
	chanceToSpawn = 50,
	-- max 1 wedding per map
	toSpawn = 1,
	-- Mandatory zed
	WeddingDress = {
		-- name of the outfit
		name="WeddingDress",
		-- number to spawn
		toSpawn=1,
		-- The wedding dress is only on female
		gender="female",
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		room="church",
	},
	WeddingDress = {
		-- name of the outfit
		name="AuthenticBridePink",
		-- number to spawn
		toSpawn=1,
		-- The wedding dress is only on female
		gender="female",
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		room="church",
	},
	WeddingDress = {
		-- name of the outfit
		name="AuthenticBrideBlue",
		-- number to spawn
		toSpawn=1,
		-- The wedding dress is only on female
		gender="female",
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		room="church",
	},
	Bridesmate = {
		name="AuthenticBridesmate",
		toSpawn=2,
		gender="female",
		mandatory="true",
		room="church",
	},		
	Groom = {
		name="Groom",
		toSpawn=1,
		gender="male",
		mandatory="true",
		room="church",
	},
	Priest = {
		name="Priest",
		toSpawn=1,
		gender="male",
		mandatory="true",
		room="church",
	},
	-- Others
	Classy = {
		name="Classy",
		-- Chance at 75 means 75% of the zombies spawning (except mandatory) will have this outfit, the other 10% will have generic, the total chance of them all should be <= 100
		chance=75,
		-- no gender selected because we have Classy outfit for both gender
	},
	Waiter = {
		name="Waiter_Classy",
		chance=15,
	}
};

ZombiesZoneDefinition.WorldsEnd = {  --
	AuthenticMadMax = {
		name="AuthenticMadMax",
		gender="male",
		chance=5,
	},	
	AuthenticMadMaxM = {
		name="AuthenticMadMax",
		toSpawn=1,
		gender="male",
		mandatory="true",
	},		
}



local AuthenticFitnessInstructor = {
		name="AuthenticFitnessInstructor",
		chance=5,
	};
ZombiesZoneDefinition.Baseball[AuthenticFitnessInstructor] = AuthenticFitnessInstructor;
ZombiesZoneDefinition.StreetSports[AuthenticFitnessInstructor] = AuthenticFitnessInstructor;

local AuthenticBiker = {
		name="AuthenticBiker",
		chance=20,
		gender="male",
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",		
	};
ZombiesZoneDefinition.Bar[AuthenticBiker] = AuthenticBiker;

local Punk = {
		name="Punk",
		chance=15,	
	};
ZombiesZoneDefinition.Bar[Punk] = Punk;

local AuthenticSportsFan = {
		name="AuthenticSportsFan",
		chance=10,
	};
ZombiesZoneDefinition.Bar[AuthenticSportsFan] = AuthenticSportsFan;

local AuthenticShaunoftheDead = {
		name="AuthenticShaunoftheDead",
		chance=2,
		gender="male",		
	};
ZombiesZoneDefinition.Bar[AuthenticShaunoftheDead] = AuthenticShaunoftheDead;

local AuthenticBankRobber = {
		name="AuthenticBankRobber",
		chance=5,
		gender="male",
	};
ZombiesZoneDefinition.Bank[AuthenticBankRobber] = AuthenticBankRobber;

local AuthenticWildSalesMan = {
		name="AuthenticWildSalesMan",
		chance=3,
		gender="male",
	};
ZombiesZoneDefinition.Bank[AuthenticWildSalesMan] = AuthenticWildSalesMan;
ZombiesZoneDefinition.CountryClub[AuthenticWildSalesMan] = AuthenticWildSalesMan;

local AuthenticFitnessInstructor2 = {
		name="AuthenticFitnessInstructor",
		chance=150,
		room="gym",	
	};
ZombiesZoneDefinition.CountryClub[AuthenticFitnessInstructor2] = AuthenticFitnessInstructor2;

local PokerDealer = {
		name="PokerDealer",
		chance=150,
		gender="male",
		room="livingroom",
	};
ZombiesZoneDefinition.CountryClub[PokerDealer] = PokerDealer;

local Trader = {
		name="Trader",
		chance=10,
		gender="male",
		beardStyles="null:80",		
	};
ZombiesZoneDefinition.Bank[Trader] = Trader;

local AuthenticSexyNurse = {
		name="AuthenticSexyNurse",
		chance=3,
		gender="female",
	};	
ZombiesZoneDefinition.Doctor[AuthenticSexyNurse] = AuthenticSexyNurse;

local AuthenticBiker2 = {
		name="AuthenticBiker",
		chance=3,
		gender="male",
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",		
	};	
ZombiesZoneDefinition.Fossoil[AuthenticBiker2] = AuthenticBiker2;
ZombiesZoneDefinition.ThunderGas[AuthenticBiker2] = AuthenticBiker2;

local Party = {
		name="Party",			
		chance=5,
	};
ZombiesZoneDefinition.Spiffo[Party] = Party;

local Party2 = {
		name="Party2",			
		chance=5,
	};
ZombiesZoneDefinition.Spiffo[Party2] = Party2;

local AuthenticPizzaDelivery = {
		name="AuthenticPizzaDelivery",			
		chance=5,
	};
ZombiesZoneDefinition.PizzaWhirled[AuthenticPizzaDelivery] = AuthenticPizzaDelivery;

local InmateKhaki = {
		name="InmateKhaki",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.Prison[InmateKhaki] = InmateKhaki;

local AuthenticBillyChumpez = {
		name="AuthenticBillyChumpez",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.Bar[AuthenticBillyChumpez] = AuthenticBillyChumpez;
ZombiesZoneDefinition.FancyHotel[AuthenticBillyChumpez] = AuthenticBillyChumpez;

local AuthenticSwimmer = {
		name="AuthenticSwimmer",
		chance=4,
		gender="female",
	};
ZombiesZoneDefinition.FancyHotel[AuthenticSwimmer] = AuthenticSwimmer;

local AuthenticMaid = {
		name="AuthenticMaid",
		chance=5,
		gender="female",
	};
ZombiesZoneDefinition.FancyHotel[AuthenticMaid] = AuthenticMaid;

local AuthenticMaid = {
		name="AuthenticMaid",
		chance=5,
		gender="female",
	};
ZombiesZoneDefinition.FancyHotel[AuthenticMaid] = AuthenticMaid;
local AuthenticMaid2 = {
		name="AuthenticMaid",
		chance=3,
		gender="female",
	};
ZombiesZoneDefinition.HotelRich[AuthenticMaid2] = AuthenticMaid2;
local AuthenticDIPurnaJacksonM = {
		name="AuthenticDIPurnaJacksonM",
		chance=2,
		gender="female",
	};
ZombiesZoneDefinition.FancyHotel[AuthenticDIPurnaJacksonM] = AuthenticDIPurnaJacksonM;
local AuthenticDIXianMei = {
		name="AuthenticDIXianMei",
		chance=2,
		gender="female",
	};
ZombiesZoneDefinition.FancyHotel[AuthenticDISamBM] = AuthenticDIXianMei;	
local AuthenticDISamBM = {
		name="AuthenticDISamBM",
		chance=2,
		gender="male",
	};	
ZombiesZoneDefinition.FancyHotel[AuthenticDISamBM] = AuthenticDISamBM;
local AuthenticDILoganCarter = {
		name="AuthenticDILoganCarter",
		chance=2,
		gender="male",
	};	
ZombiesZoneDefinition.FancyHotel[AuthenticDILoganCarter] = AuthenticDILoganCarter;

local AuthenticDIJohnMorgan = {
		name="AuthenticDIJohnMorgan",
		chance=2,
		gender="male",
	};	
ZombiesZoneDefinition.FancyHotel[AuthenticDIJohnMorgan] = AuthenticDIJohnMorgan;

local AuthenticPrisonerClassic2 = {
		name="AuthenticPrisonerClassic",
		gender="male",		
		chance=0.5,
	};
ZombiesZoneDefinition.Prison[AuthenticPrisonerClassic2] = AuthenticPrisonerClassic2;

local Ghillie = {
		name="Ghillie",
		gender="male",		
		chance=0.5,
	};
ZombiesZoneDefinition.SecretBase[Ghillie] = Ghillie;

local AuthenticSnowGhillie = {
		name="AuthenticSnowGhillie",
		gender="male",		
		chance=0.009,
	};
ZombiesZoneDefinition.SecretBase[AuthenticSnowGhillie] = AuthenticSnowGhillie;

local AuthenticNBHHazmat = {
		name="AuthenticNBHHazmat",
		chance=1,
		room="medical",
	};
ZombiesZoneDefinition.SecretBase[AuthenticNBHHazmat] = AuthenticNBHHazmat;

local AuthenticSamRivot = {
		name="AuthenticSamRivot",
		chance=1,
	};
ZombiesZoneDefinition.Offices[AuthenticSamRivot] = AuthenticSamRivot;

local AuthenticCEDAHazmatBlack = {
		name="AuthenticCEDAHazmatBlack",
		chance=1,
		room="medical",
	};
ZombiesZoneDefinition.SecretBase[AuthenticCEDAHazmatBlack] = AuthenticCEDAHazmatBlack;

local AuthenticCEDAHazmatGreen = {
		name="AuthenticCEDAHazmatGreen",
		chance=1,
		room="medical",
	};
ZombiesZoneDefinition.SecretBase[AuthenticCEDAHazmatGreen] = AuthenticCEDAHazmatGreen;

local AuthenticBub = {
		name="AuthenticBub",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.SecretBase[AuthenticBub] = AuthenticBub;

local AuthenticGordonFreeman = {
		name="AuthenticGordonFreeman",
		gender="male",		
		chance=1,
		room="empty",		
	};
ZombiesZoneDefinition.SecretBase[AuthenticGordonFreeman] = AuthenticGordonFreeman;

local AuthenticErinRedfire = {
		name="AuthenticErinRedfire",
		gender="female",			
		chance=1,
	};
ZombiesZoneDefinition.SecretBase[AuthenticErinRedfire] = AuthenticErinRedfire;

local AuthenticDayZHeroBleu = {
		name="AuthenticDayZHeroBleu",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.SecretBase[AuthenticDayZHeroBleu] = AuthenticDayZHeroBleu;

local AuthenticSecretService = {
		name="AuthenticSecretService",
		gender="male",			
		chance=3,
	};
ZombiesZoneDefinition.SecretBase[AuthenticSecretService] = AuthenticSecretService;

local AirCrew = {
		name="AirCrew",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.SecretBase[AirCrew] = AirCrew;

local AuthenticKleiner = {
		name="AuthenticKleiner",
		chance=5,
		gender="male",			
		room="medical",		
	};
ZombiesZoneDefinition.SecretBase[AuthenticKleiner] = AuthenticKleiner;

local ArmyServiceUniform = {
		name="ArmyServiceUniform",
		toSpawn=1,
		mandatory="true",
		room="garage",		
	};
ZombiesZoneDefinition.SecretBase[ArmyServiceUniform] = ArmyServiceUniform;

local AuthenticHazardSuit = {
		name="AuthenticHazardSuit",
		toSpawn=1,
		mandatory="true",
		room="medical",
	};
ZombiesZoneDefinition.SecretBase[AuthenticHazardSuit] = AuthenticHazardSuit;

local AuthenticSwimmer1 = {
		name="AuthenticSwimmer",
		chance=5,
		gender="female",
	};	
ZombiesZoneDefinition.Beach[AuthenticSwimmer1] = AuthenticSwimmer1;
ZombiesZoneDefinition.Spa[AuthenticSwimmer1] = AuthenticSwimmer1;

local AuthenticSwimmer2 = {
		name="AuthenticSwimmer",
		chance=50,
		gender="female",			
		mandatory="true",
		room="pool",
	};
ZombiesZoneDefinition.StreetSports[AuthenticSwimmer2] = AuthenticSwimmer2;

local BaseBallPlayer_Rangers = {
		name="BaseBallPlayer_Rangers",
		chance=5,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[BaseBallPlayer_Rangers] = BaseBallPlayer_Rangers;

local BaseBallPlayer_Z = {
		name="BaseBallPlayer_Z",
		chance=5,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[BaseBallPlayer_Z] = BaseBallPlayer_Z;

local BaseBallPlayer_KY = {
		name="BaseBallPlayer_KY",
		chance=5,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[BaseBallPlayer_KY] = BaseBallPlayer_KY;

local AuthenticFootballPlayerRedSkull = {
		name="AuthenticFootballPlayerRedSkull",
		chance=1,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[AuthenticFootballPlayerRedSkull] = AuthenticFootballPlayerRedSkull;

local AuthenticFootballPlayerRedSkull = {
		name="AuthenticFootballPlayerRedSkull",
		chance=1,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[AuthenticFootballPlayerRedSkull] = AuthenticFootballPlayerRedSkull;

local AuthenticFootballPlayerBlueStar = {
		name="AuthenticFootballPlayerBlueStar",
		chance=1,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[AuthenticFootballPlayerBlueStar] = AuthenticFootballPlayerBlueStar;

local AuthenticFootballChiefs = {
		name="AuthenticFootballChiefs",
		chance=0.5,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[AuthenticFootballChiefs] = AuthenticFootballChiefs;

local AuthenticFootballPatriots = {
		name="AuthenticFootballPatriots",
		chance=0.5,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[AuthenticFootballPatriots] = AuthenticFootballPatriots;

local AuthenticFootballGreenBayPacker = {
		name="AuthenticFootballGreenBayPacker",
		chance=0.5,
		gender="male",
	};
ZombiesZoneDefinition.StreetSports[AuthenticFootballGreenBayPacker] = AuthenticFootballGreenBayPacker;

local AuthenticSwimmer3 = {
		name="AuthenticSwimmer",
		gender="female",			
		chance=20,
	};
ZombiesZoneDefinition.SwimmingPool[AuthenticSwimmer3] = AuthenticSwimmer3;

local AuthenticSwimmer4 = {
		name="AuthenticSwimmer",
		gender="female",			
		chance=3,
	};
ZombiesZoneDefinition.FancyHotel[AuthenticSwimmer4] = AuthenticSwimmer4;

local AuthenticSwimmer5 = {
		name="AuthenticSwimmer",
		gender="female",			
		chance=10,
	};
ZombiesZoneDefinition.Spa[AuthenticSwimmer5] = AuthenticSwimmer5;

local AuthenticLeonKennedy = {
		name="AuthenticLeonKennedy",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.Police[AuthenticLeonKennedy] = AuthenticLeonKennedy;

local AuthenticRickGrimes = {
		name="AuthenticRickGrimes",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.Police[AuthenticRickGrimes] = AuthenticRickGrimes;

local AuthenticJillValentine = {
		name="AuthenticJillValentine",
		gender="female",			
		chance=1,
	};
ZombiesZoneDefinition.Police[AuthenticJillValentine] = AuthenticJillValentine;

local AuthenticBridesmate = {
		name="AuthenticBridesmate",
		gender="female",			
		chance=5,
	};
ZombiesZoneDefinition.Wedding[AuthenticBridesmate] = AuthenticBridesmate;

local AuthenticBrideBlue = {
		name="AuthenticBrideBlue",
		gender="female",			
		chance=1,
	};
ZombiesZoneDefinition.Wedding[AuthenticBrideBlue] = AuthenticBrideBlue;

local AuthenticBridePink = {
		name="AuthenticBridePink",
		gender="female",			
		chance=1,
	};
ZombiesZoneDefinition.Wedding[AuthenticBridePink] = AuthenticBridePink;

local AuthenticCountryHick = {
		name="AuthenticCountryHick",
		gender="male",			
		chance=5,
	};
ZombiesZoneDefinition.Farm[AuthenticCountryHick] = AuthenticCountryHick;

local AuthenticCrossingGuard = {
		name="AuthenticCrossingGuard",
		gender="male",			
		chance=2,
		beardStyles="Long:10;Chops:10;Goatee:10;Moustache:10;Full:10;BeardOnly:10",		
	};
ZombiesZoneDefinition.ConstructionSite[AuthenticCrossingGuard] = AuthenticCrossingGuard;

local AuthenticConstructionPainter = {
		name="AuthenticConstructionPainter",
		gender="male",			
		chance=4,
	};
ZombiesZoneDefinition.ConstructionSite[AuthenticConstructionPainter] = AuthenticConstructionPainter;

local AuthenticSamRivot = {
		name="AuthenticSamRivot",
		chance=3,
		gender="male",	
	};
ZombiesZoneDefinition.Offices[AuthenticSamRivot] = AuthenticSamRivot;

local AuthenticLeonKennedy = {
		name="AuthenticLeonKennedy",
		chance=2,
		gender="male",
	};
ZombiesZoneDefinition.Police[AuthenticLeonKennedy] = AuthenticLeonKennedy;

local PoliceRiot = {
		name="PoliceRiot",
		chance=3,
		gender="male",
	};
ZombiesZoneDefinition.Police[PoliceRiot] = PoliceRiot;
ZombiesZoneDefinition.Prison[PoliceRiot] = PoliceRiot;

local InmateKhaki = {
		name="InmateKhaki",
		chance=1,
		gender="male",
		room="prisoncells;hall;cafeteria;classroom;laundry;janitor",		
	};
ZombiesZoneDefinition.Prison[InmateKhaki] = InmateKhaki;

local AuthenticPrisonerClassic = {
		name="AuthenticPrisonerClassic",
		chance=1,
		gender="male",
		room="prisoncells;hall;cafeteria;classroom;laundry;janitor",		
	};
ZombiesZoneDefinition.Prison[AuthenticPrisonerClassic] = AuthenticPrisonerClassic;

local InmateKhakiLowerZone = {
		name="InmateKhaki",
		chance=.1,
		gender="male",
		room="bathroom;kitchen;medicalstorage;library",		
	};
ZombiesZoneDefinition.Prison[InmateKhakiLowerZone] = InmateKhakiLowerZone;

local AuthenticPostalDude = {
		name="AuthenticPostalDude",
		gender="male",			
		chance=2,
	};
ZombiesZoneDefinition.TrailerPark[AuthenticPostalDude] = AuthenticPostalDude;

local AuthenticPolitician = {
		name="AuthenticPolitician",
		gender="male",			
		chance=3,
	};
ZombiesZoneDefinition.Bank[AuthenticPolitician] = AuthenticPolitician;

local AuthenticNateAnderson = {
		name="AuthenticNateAnderson",
		gender="male",			
		chance=1,
	};
ZombiesZoneDefinition.Survivalist[AuthenticNateAnderson] = AuthenticNateAnderson;

local PrivateMilitia = {
		name="PrivateMilitia",			
		chance=1,
	};
ZombiesZoneDefinition.Survivalist[PrivateMilitia] = PrivateMilitia;

local Student = {
		name="StudentMale",
		chance=35,
		gender="male",
	};
ZombiesZoneDefinition.School[Student] = Student;

local StudentF = {
		name="StudentFemale",
		chance=35,
		gender="female",
	};
ZombiesZoneDefinition.School[StudentF] = StudentF;

local AuthenticCFTDJim = {
		name="AuthenticCFTDJim",
		chance=1,
		gender="male",
	};
ZombiesZoneDefinition.School[AuthenticCFTDJim] = AuthenticCFTDJim;

local Cheerleader = {
		name="AuthenticCheerleader",
		chance=7,
		gender="female",
	};
ZombiesZoneDefinition.School[Cheerleader] = Cheerleader;

local AuthenticMaid = {
		name="AuthenticMaid",
		gender="female",			
		chance=3,
	};
ZombiesZoneDefinition.FancyHotel[AuthenticMaid] = AuthenticMaid;

local SportsFan = {
		name="SportsFan",	
		chance=15,
	};
ZombiesZoneDefinition.Boxing[SportsFan] = SportsFan;

-- total chance can be over 100% we don't care as we'll roll on the totalChance and not a 100 (unlike the specific outfits on top of this)
AZ_ZombiesZoneDefinition.Default = ZombiesZoneDefinition.Default or {};

table.insert(ZombiesZoneDefinition.Default,{name = "Police", chance=0.25});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBiker", chance=0.05});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBlackMamba", chance=0.002, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFreshPrinceBelAir", chance=0.005, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFitnessInstructor", chance=0.05});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNeonFitnessInstructor", chance=0.008, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGeneric06", chance=9});
table.insert(ZombiesZoneDefinition.Default,{name = "Mannequin1", chance=0.5, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticHazardSuit", chance=0.003});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSurvivorPolice", chance=0.003});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSurvivorHazardSuit", chance=0.003});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSurvivorSplatter", chance=0.003});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSurvivorRanger", chance=0.003});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSurvivorCovid", chance=0.003});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSurvivorL4D", chance=0.003, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticWaldo", chance=0.001, gender="male"});

table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCountryHick", chance=0.04, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticClown", chance=0.04, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticClownBarotrauma", chance=0.01, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticClownMime", chance=0.04});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHVegan", chance=0.05, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSexyBunny", chance=0.003, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCEDAHazmatGreen", chance=0.005});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCEDAHazmatBlack", chance=0.001});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCEDAHazmatBlue", chance=0.001});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCEDAHazmatRed", chance=0.001});
table.insert(ZombiesZoneDefinition.Default,{name = "StudentMale", chance=0.5, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "StudentFemale", chance=0.5, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCheerleader", chance=2, room="classroom", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCFTDJim", chance=.05, room="classroom", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSexyNurse", chance=1, room="medical", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSexyNurse", chance=10, room="medclinic", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSexyNurse", chance=5, room="stripclub", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSexyBunny", chance=10, room="stripclub", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGrindhouseCherry", chance=1, room="stripclub", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCook_Seahorse", chance=15, room="cafe"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFootballPlayerBlueStar", gender="male", chance=0.01});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFootballChiefs", gender="male", chance=0.01});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFootballGreenBayPacker", gender="male", chance=0.01});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFootballPatriots", gender="male", chance=0.01});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFootballPlayerRedSkull", gender="male", chance=0.01});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticMadMax", gender="male", chance=0.001});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticMiner", chance=80, room="traincar", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Cook_IceCream", chance=55, room="icecream"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticTravelingBand", chance=55, room="picnic"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticMiner", chance=60, room="railroadrepair", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticMiner", chance=10, room="railroad", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGMan", chance=3, room="newsroom", gender="male"});

table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBillOverbeck", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticLouis", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFrancis", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticZoey", chance=0.0009, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticJimmyGibbs", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNick", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticEllis", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticCoach", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticRochelle", chance=0.0009, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticB4BEvangelo", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticB4BHoffman", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticB4BWalker", chance=0.0009, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticB4BHolly", chance=0.0009, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticB4BMom", chance=0.0009, gender="female"});
	table.insert(ZombiesZoneDefinition.Default,{name = "MallSecurity", chance=60, toSpawn=100, room="departmentstore"});
	table.insert(ZombiesZoneDefinition.Default,{name = "OfficeWorkerSkirt", chance=60, toSpawn=100, room="departmentstore"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDRFrankWest", chance=1, room="departmentstore", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDawnoftheDead", chance=1, room="departmentstore", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenitcFlyboy", chance=1, room="departmentstore", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDRBradGarrison", chance=1, room="departmentstore", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDRTrueEyeCult", chance=1, room="departmentstore", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDRJessieMcCarney", chance=1, room="departmentstore", gender="female"});

table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticClementine", chance=0.0009, gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticUncleSam", chance=0.0001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDukeNukem", chance=0.001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNakedBlueVeins", chance=0.001});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticTheyLive", chance=0.0001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticTF2SpyBlue", chance=0.0001, gender="male"});

table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticClownPennywise", chance=0.00001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGhostFace", chance=0.00001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticLeatherFace", chance=0.00001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFreddyKrueger", chance=0.00001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticHalloween", chance=0.00001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticJasonPart2", chance=0.00001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticJasonPart3", chance=0.00001, gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticWinslow", chance=0.00001, gender="male"});

table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBarbershopQuartetYellow", chance=5, room="aesthetic", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBarbershopQuartetRed", chance=5, room="aesthetic", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBarbershopQuartetPurple", chance=5, room="aesthetic", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBarbershopQuartetGreen", chance=5, room="aesthetic", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBarbershopQuartetBlue", chance=5, room="aesthetic", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Camper", chance=5, room="camping", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Hunter", chance=5, room="camping", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticPoncho", chance=5, room="camping"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticSportsFan", chance=5, room="recreation"});

table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHBadass", chance=1, room="theatre", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHMolotov", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHRoje", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHWally", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHBateman", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHJive", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNMRIHHunter", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGhostbusterVenkman", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGhostbusterStantz", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGhostbusterSpengler", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticGhostbusterZeddemore", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticAbeLincoln", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticJoker", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticAndyDotD", chance=1, room="theatre", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticShaunoftheDead", chance=1, room="bar", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticHomeless", chance=15, room="drugshack"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBobRoss", chance=3, room="Gallery", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Party2", chance=3, room="jayschicken_dining"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDocBrown", chance=1, room="railroad", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticMartyMcFly", chance=1, room="railroad", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticBillMurray", chance=1, room="bowllingalley", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticAshEvilDead", chance=1, room="barbacuestore", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticHankHill", chance=1, room="metalshipping", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticKilla", chance=.001, room="factory", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticDianneCaldwell", chance=0.5, room="clothesstore", gender="female"});

table.insert(ZombiesZoneDefinition.Default,{name = "Jockey01", chance=10, room="horsebox", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey02", chance=10, room="horsebox", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey03", chance=10, room="horsebox", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey06", chance=10, room="horsebox", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey04", chance=10, room="horsebox", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey05", chance=10, room="horsebox", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey01", chance=10, room="stable", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey02", chance=10, room="stable", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey03", chance=10, room="stable", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey06", chance=10, room="stable", gender="male"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey04", chance=10, room="stable", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "Jockey05", chance=10, room="stable", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNeonFitnessInstructor", chance=20, room="gym", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticNeonFitnessInstructor", chance=20, room="fitness", gender="female"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFitnessInstructor", chance=25, room="gym"});
table.insert(ZombiesZoneDefinition.Default,{name = "AuthenticFitnessInstructor", chance=25, room="fitness"});