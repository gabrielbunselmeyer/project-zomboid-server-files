SLEO_Recipe = {}


-- Code by Chuck and written originally for Expanded Helicopter Events

function SLEO_Recipe.CanOpenBoxes(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("CanOpenBoxes"))
end

function SLEO_Recipe.POLICEGOGGLES(recipe, result, player)
	player:getInventory():AddItems("SLEOClothing.TacticalGoggles", 1)
end

SLEO_Recipe.typesThatCanOpenBoxes = SLEO_Recipe.typesThatCanOpenBoxes or {}

---@param list table of type paths
function SLEO_Recipe.addCanOpenBoxTypes(list)
	for _,type in pairs(list) do
		table.insert(SLEO_Recipe.typesThatCanOpenBoxes, type)
	end
end

---Sub-mod authors will have to use the following function to add more types
SLEO_Recipe.addCanOpenBoxTypes(
		{"Base.Fork","Base.ButterKnife","Base.HuntingKnife","Base.KitchenKnife","Base.Scissors",
		 "Base.RedPen","Base.BluePen","Base.Pen","Base.Pencil","Base.Screwdriver","Base.GardenFork",
		 "Base.Scalpel","Base.LetterOpener","Base.IcePick","Base.BreadKnife","Base.MeatCleaver","Base.FlintKnife",
		 "Base.Machete","Base.Katana","Base.HandAxe","Base.Axe","Base.WoodAxe","Base.HandScythe",})


---Adds "CanOpenBoxes" tag to scripts for type
---@param type string
function SLEO_Recipe.addCanOpenBoxesTag(type)
	local item = ScriptManager.instance:getItem(type);
	if item then
		local tags = item:getTags()
		local tagString = "CanOpenBoxes"

		for i=0, tags:size()-1 do
			---@type string
			local tag = tags:get(i)
			tagString = tagString..";"..tag
		end

		item:DoParam("Tags = "..tagString);
		print("--AddTag:"..type..": "..tagString);
	end
end

---For each type in SLEO_Recipe.addCanOpenBoxTypes process SLEO_Recipe.addCanOpenBoxesTag(type)
function SLEO_Recipe.addCanOpenBoxesTagToTypesThatCan()
	for _,type in pairs(SLEO_Recipe.typesThatCanOpenBoxes) do
		SLEO_Recipe.addCanOpenBoxesTag(type)
	end
end

Events.OnGameBoot.Add(SLEO_Recipe.addCanOpenBoxesTagToTypesThatCan)
