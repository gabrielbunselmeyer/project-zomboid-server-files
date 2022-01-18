require 'NPCs/ZombiesZoneDefinition'


--Winter Jacket (Leon RE4)
local LeonKennedy = {
	name="SpongieWinterJacket",
	toSpawn=1,
	gender="male",
	mandatory="true",
	beardStyles="null:100",
	hairStyles="Donny:100",
},

table.insert(ZombiesZoneDefinition.SecretBase,{LeonKennedy});

table.insert(ZombiesZoneDefinition.Default,{name="SpongieWinterJacket",chance=0.05,});
table.insert(ZombiesZoneDefinition.Bar,{name="SpongieWinterJacket",chance=1,});


--Armored Police (Leon RE2)
table.insert(ZombiesZoneDefinition.Police,{name="SpongiePoliceArmored",chance=20,});
table.insert(ZombiesZoneDefinition.Default,{name = "SpongiePoliceArmored", chance=0.2});


--Biker (Claire RE2)
table.insert(ZombiesZoneDefinition.StreetPoor,{name="SpongieBikerChick",chance=7,});
table.insert(ZombiesZoneDefinition.Rocker,{name="SpongieBikerChick",chance=5,});
table.insert(ZombiesZoneDefinition.Default,{name = "SpongieBikerChick", chance=0.2});
table.insert(ZombiesZoneDefinition.Bar,{name = "SpongieBikerChick", chance=2});