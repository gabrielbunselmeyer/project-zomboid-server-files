
-- Drink 6 pack and 12 pack MOD

-- 2022-01-04 Version 2.04

-- Log display processing

print("************************************************************");
print("*                                                          *");
print("*  Drink 6 pack and 12 pack MOD                            *");
print("*  2022-01-04 Version 2.04 (Compatible with build 41)      *");
print("*  Mods have been added to the game system.                *");
print("*                                                          *");
print("************************************************************");

-- Add items processing

require"SuburbsDistributions"
require"ProceduralDistributions"
require"VehicleDistributions"

-- Procedural Lists

-- DrinkPackMod.BeerPack
-- DrinkPackMod.BeerBottlePack
-- DrinkPackMod.PopPack
-- DrinkPackMod.Pop2Pack
-- DrinkPackMod.Pop3Pack
-- DrinkPackMod.PopBottlePack
-- DrinkPackMod.WhiskeyBottledPack
-- DrinkPackMod.WineBottledPack
-- DrinkPackMod.Wine2BottledPack


-- ProceduralDistributions

--Pop

table.insert(ProceduralDistributions.list["FridgeBottles"].items, "DrinkPackMod.PopPack");
table.insert(ProceduralDistributions.list["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions.list["FridgeBottles"].items, "DrinkPackMod.Pop2Pack");
table.insert(ProceduralDistributions.list["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions.list["FridgeBottles"].items, "DrinkPackMod.Pop3Pack");
table.insert(ProceduralDistributions.list["FridgeBottles"].items, 2);

table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.PopPack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);
table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.Pop2Pack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);
table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.Pop3Pack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);
table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.PopBottlePack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);

table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.PopPack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.Pop2Pack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.Pop3Pack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.PopBottlePack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);

table.insert(ProceduralDistributions.list["KitchenBottles"].items, "DrinkPackMod.PopPack");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions.list["KitchenBottles"].items, "DrinkPackMod.Pop2Pack");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions.list["KitchenBottles"].items, "DrinkPackMod.Pop3Pack");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions.list["KitchenBottles"].items, "DrinkPackMod.PopBottlePack");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);


--Beer

table.insert(ProceduralDistributions.list["FridgeBottles"].items, "Base.BeerCan");
table.insert(ProceduralDistributions.list["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions.list["FridgeBottles"].items, "Base.BeerBottle");
table.insert(ProceduralDistributions.list["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions.list["FridgeBottles"].items, "DrinkPackMod.BeerPack");
table.insert(ProceduralDistributions.list["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions.list["FridgeBottles"].items, "DrinkPackMod.BeerBottlePack");
table.insert(ProceduralDistributions.list["FridgeBottles"].items, 2);

table.insert(ProceduralDistributions.list["GigamartBottles"].items, "Base.BeerCan");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);
table.insert(ProceduralDistributions.list["GigamartBottles"].items, "Base.BeerBottle");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);
table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.BeerPack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);
table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.BeerBottlePack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 2);

table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "Base.BeerCan");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "Base.BeerBottle");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.BeerPack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.BeerBottlePack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 2);

table.insert(ProceduralDistributions.list["KitchenBottles"].items, "Base.BeerCan");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions.list["KitchenBottles"].items, "Base.BeerBottle");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions.list["KitchenBottles"].items, "DrinkPackMod.BeerPack");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions.list["KitchenBottles"].items, "DrinkPackMod.BeerBottlePack");
table.insert(ProceduralDistributions.list["KitchenBottles"].items, 1);


--Whiskey

table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.WhiskeyBottledPack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 1);

table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.WhiskeyBottledPack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 1);


--Wine

table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.WineBottledPack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 1);
table.insert(ProceduralDistributions.list["GigamartBottles"].items, "DrinkPackMod.Wine2BottledPack");
table.insert(ProceduralDistributions.list["GigamartBottles"].items, 1);

table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.WineBottledPack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, "DrinkPackMod.Wine2BottledPack");
table.insert(ProceduralDistributions.list["StoreShelfSnacks"].items, 1);


-- VehicleDistributions

table.insert(VehicleDistributions.Spiffo["TruckBed"].items, "Base.BeerCan");
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, 1);
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, "Base.BeerBottle");
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, 1);
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, "DrinkPackMod.PopPack");
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, 1);
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, "DrinkPackMod.Pop2Pack");
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, 1);
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, "DrinkPackMod.Pop3Pack");
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, 1);
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, "DrinkPackMod.BeerPack");
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, 1);
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, "DrinkPackMod.BeerBottlePack");
table.insert(VehicleDistributions.Spiffo["TruckBed"].items, 1);

