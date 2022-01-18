-- *********************************
-- ** DarkSlayerEX's Item Tweaker **
-- *********************************

if not ItemTweaker then  ItemTweaker = {} end
if not TweakItem then  TweakItem = {} end
if not TweakItemData then  TweakItemData = {} end

--Prep code to make the changes to all item in the TweakItemData table.
function ItemTweaker.tweakItems()
	local item;
	for k,v in pairs(TweakItemData) do
		for t,y in pairs(v) do
			item = ScriptManager.instance:getItem(k);
			if item ~= nil then
				item:DoParam(t.." = "..y);
			----print(k..": "..t..", "..y);
			end
		end
	end
end

function TweakItem(itemName, itemProperty, propertyValue)
	if not TweakItemData[itemName] then
		TweakItemData[itemName] = {};
	end
	TweakItemData[itemName][itemProperty] = propertyValue;
end

-- Modify Base Cigarettes --
TweakItem("Base.Cigarettes","Count", "1");
TweakItem("Base.Cigarettes","Weight", "0.05");
TweakItem("Base.Cigarettes","Type", "Normal");
TweakItem("Base.Cigarettes","Icon", "SMPackClosed");
TweakItem("Base.Cigarettes","CantBeFrozen", "TRUE");

--- Support Hydrocraft ---
if getActivatedMods():contains("Hydrocraft") then
	TweakItem("Hydrocraft.HCFuelcanister","Type", "Drainable"); -- Брелок канистра
	TweakItem("Hydrocraft.HCFuelcanister","UseDelta", "0.0"); -- Брелок канистра
	TweakItem("Hydrocraft.HCFuelcanister","Weight", "0.1"); -- Брелок канистра
	TweakItem("Hydrocraft.HCPipetobacco","StressChange", "-5"); -- Глинянная трубка
	TweakItem("Hydrocraft.HCPipetobacco","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");  -- Глинянная трубка
	TweakItem("Hydrocraft.HCCorncobpipetobacco","StressChange", "-5"); -- Кукурузная трубка
	TweakItem("Hydrocraft.HCCorncobpipetobacco","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches"); -- Кукурузная трубка
	TweakItem("Hydrocraft.HCCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCCigarhandrolled","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCPipetobacco","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCCorncobpipetobacco","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCPipeopiumpure","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCCorncobpipeopiumpure","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCBongfull","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCBongacrylicfull","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCPipehemp","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Hydrocraft.HCCorncobpipehemp","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");	
end

-- Support GreenFire mod ---
if getActivatedMods():contains("jiggasGreenfireMod") then
	TweakItem("Greenfire.Bong","Icon", "BongSmoker");
	TweakItem("Greenfire.WeedBong","Icon", "BongSmoker");
	TweakItem("Greenfire.TobaccoBong","Icon", "BongSmoker");
	TweakItem("Greenfire.ShakeBong","Icon", "BongSmoker");
	TweakItem("Greenfire.KiefBong","Icon", "BongSmoker");
	TweakItem("Greenfire.HashBong","Icon", "BongSmoker");
	TweakItem("Greenfire.Joint","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.Spliff","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.Blunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.MixedBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfMixedBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.KiefBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfKiefBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HashBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfHashBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.SpaceBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfSpaceBlunt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfJoint","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.KiefJoint","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfKiefJoint","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HashJoint","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfHashJoint","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.WeedBong","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.WeedPipe","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.ShakeBong","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.ShakePipe","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.KiefBong","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.KiefPipe","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HashBong","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HashPipe","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.CannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfCannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.PreCannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfPreCannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.DelCannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfDelCannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.ResCannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfResCannaCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.GFCigarette","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.BluntCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfBluntCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.GFCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.HalfCigar","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.TobaccoBong","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("Greenfire.TobaccoPipe","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
end

if not getActivatedMods():contains("SVGLittering") then
	TweakItemData["Base.Chocolate"] = { ["ReplaceOnUse"] = "SM.ChocolateFoil"};
end

--- Support Littering mod ---
if getActivatedMods():contains("SVGLittering") then
	TweakItem("littering.CigaretteButt","Weight", "0.001");
	TweakItem("littering.CigaretteButt","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("littering.CigaretteButt","Type", "Food");
	TweakItem("littering.CigaretteButt","DisplayName", "Butt");
	TweakItem("littering.CigaretteButt","StressChange", "-1");
	TweakItem("littering.CigaretteButt","UnhappyChange", "3");
	TweakItem("littering.CigaretteButt","Icon", "SVGCigaretteLButt");
	TweakItem("littering.CigaretteButt","CustomContextMenu", "Smoke");
	TweakItem("littering.CigaretteButt","CantBeFrozen", "TRUE");
	TweakItem("littering.CigaretteButt","OnEat", "OnEat_Cigarettes");
	TweakItem("littering.CigaretteButt","EatType", "Cigarettes");
	TweakItem("littering.CigaretteButt","CustomEatSound", "sm_smoking");
	TweakItem("littering.CigaretteButt","ReplaceOnUse", "SM.CarbonizedFilter");

	TweakItem("littering.CigaretteButtL","HungerChange", "0");
	TweakItem("littering.CigaretteButtL","Weight", "0.001");
	TweakItem("littering.CigaretteButtL","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("littering.CigaretteButtL","Type", "Food");
	TweakItem("littering.CigaretteButtL","DisplayName", "Butt");
	TweakItem("littering.CigaretteButtL","StressChange", "-1");
	TweakItem("littering.CigaretteButtL","UnhappyChange", "3");
	TweakItem("littering.CigaretteButtL","Icon", "SVGCigaretteLButt");
	TweakItem("littering.CigaretteButtL","CustomContextMenu", "Smoke");
	TweakItem("littering.CigaretteButtL","CantBeFrozen", "TRUE");
	TweakItem("littering.CigaretteButtL","OnEat", "OnEat_Cigarettes");
	TweakItem("littering.CigaretteButtL","EatType", "Cigarettes");
	TweakItem("littering.CigaretteButtL","CustomEatSound", "sm_smoking");
	TweakItem("littering.CigaretteButtL","ReplaceOnUse", "SM.CarbonizedFilter");

	TweakItem("littering.CigaretteButtM","HungerChange", "0");
	TweakItem("littering.CigaretteButtM","Weight", "0.001");
	TweakItem("littering.CigaretteButtM","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
	TweakItem("littering.CigaretteButtM","Type", "Food");
	TweakItem("littering.CigaretteButtM","DisplayName", "Butt");
	TweakItem("littering.CigaretteButtM","StressChange", "-1");
	TweakItem("littering.CigaretteButtM","UnhappyChange", "3");
	TweakItem("littering.CigaretteButtM","Icon", "SVGCigaretteLButt");
	TweakItem("littering.CigaretteButtM","CustomContextMenu", "Smoke");
	TweakItem("littering.CigaretteButtM","CantBeFrozen", "TRUE");
	TweakItem("littering.CigaretteButtM","OnEat", "OnEat_Cigarettes");
	TweakItem("littering.CigaretteButtM","EatType", "Cigarettes");
	TweakItem("littering.CigaretteButtM","CustomEatSound", "sm_smoking");
	TweakItem("littering.CigaretteButtM","ReplaceOnUse", "SM.CarbonizedFilter");
	
end

--- Support ExploringTime mod ---
if getActivatedMods():contains("ExploringTime") then
--	TweakItem("filcher.XXXXXXXXXX","RequireInHandOrInventory", "Base.Lighter/Base.Matches/SM.Matches");
end

Events.OnGameBoot.Add(ItemTweaker.tweakItems)