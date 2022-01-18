require 'Maps/ISMapDefinitions'

local MINZ = 0
local MAXZ = 24

local function overlayPNG(mapUI, x, y, scale, layerName, tex, alpha)
	local texture = getTexture(tex)
	if not texture then return end
	local mapAPI = mapUI.javaObject:getAPIv1()
	local styleAPI = mapAPI:getStyleAPI()
	local layer = styleAPI:newTextureLayer(layerName)
	layer:setMinZoom(MINZ)
	layer:addFill(MINZ, 255, 255, 255, (alpha or 1.0) * 255)
	layer:addTexture(MINZ, tex)
	layer:setBoundsInSquares(x, y, x + texture:getWidth() * scale, y + texture:getHeight() * scale)
end


LootMaps.Init.PZAZ_hitlist1 = function(mapUI)

	-- Your custom initialization for PZAZ_hitlist1
	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10540, 9240, 12990, 10480)
	overlayPNG(mapUI, 10524, 9222, 1.0, "lootMapPNG", "media/ui/LootableMaps/PZAZ_hitlist.png", 1.0)

end

LootMaps.Init.PZAZ_hitlist2 = function(mapUI)

	-- Your custom initialization for PZAZ_hitlist2
	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10540, 9240, 12990, 10480)
	overlayPNG(mapUI, 10524, 9222, 1.0, "lootMapPNG", "media/ui/LootableMaps/PZAZ_hitlist_2.png", 1.0)

end

LootMaps.Init.PZAZ_hitlist3 = function(mapUI)

	-- Your custom initialization for PZAZ_hitlist3
	local mapAPI = mapUI.javaObject:getAPIv1()
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Muldraugh, KY')
	mapAPI:setBoundsInSquares(10540, 9240, 12990, 10480)
	overlayPNG(mapUI, 10524, 9222, 1.0, "lootMapPNG", "media/ui/LootableMaps/PZAZ_hitlist_3.png", 1.0)

end