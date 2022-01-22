if not getMoreBuildInstance then
  require('MoreBuildings/MoreBuilds_Main')
end

local MoreBuild = getMoreBuildInstance()

MoreBuild.pillarsMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuild.neededMaterials = {
    {
      Material = 'Plank',
      Amount = 2,
      Text = getItemNameFromFullType('Base.Plank')
    },
    {
      Material = 'Nails',
      Amount = 3,
      Text = getItemNameFromFullType('Base.Nails')
    }
  }

  MoreBuild.neededTools = {'Hammer'}

  _sprite = {}
  _sprite.sprite = 'location_restaurant_pileocrepe_01_3'
  _sprite.northSprite = 'location_restaurant_pileocrepe_01_3'

  _name = getText 'ContextMenu_Light_Brown_WoodPillar'

  _option = subMenu[getText 'ContextMenu_Light_BrownWood']:addOption(_name, nil, MoreBuild.onBuildWoodenPillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.wallObject, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = MoreBuild.textPillarDescription .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'location_shop_bargNclothes_01_27'
  _sprite.northSprite = 'location_shop_bargNclothes_01_27'

  _name = getText 'ContextMenu_DarkBrownWood_Wall'

  _option = subMenu[getText 'ContextMenu_Dark_BrownWood']:addOption(_name, nil, MoreBuild.onBuildWoodenPillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.wallObject, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = MoreBuild.textPillarDescription .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'walls_garage_02_19'
  _sprite.northSprite = 'walls_garage_02_19'

  _name = getText 'ContextMenu_Gray_Plaster_Pillar'

  _option = subMenu[getText 'ContextMenu_Gray_Plaster']:addOption(_name, nil, MoreBuild.onBuildWoodenPillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.wallObject, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = MoreBuild.textPillarDescription .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'walls_exterior_wooden_01_31'
  _sprite.northSprite = 'walls_exterior_wooden_01_31'

  _name = getText 'ContextMenu_Gray_Wood_Pillar'

  _option = subMenu[getText 'ContextMenu_Gray_Wood']:addOption(_name, nil, MoreBuild.onBuildWoodenPillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.wallObject, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = MoreBuild.textPillarDescription .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'walls_exterior_wooden_01_3'
  _sprite.northSprite = 'walls_exterior_wooden_01_3'

  _name = getText 'ContextMenu_Red_Barnwood_Pillar'

  _option = subMenu[getText 'ContextMenu_Red_Barnwood']:addOption(_name, nil, MoreBuild.onBuildWoodenPillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.wallObject, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = MoreBuild.textPillarDescription .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'location_shop_mall_01_3'
  _sprite.northSprite = 'location_shop_mall_01_3'

  _name = getText 'ContextMenu_White_Plaster_Pillar'

  _option = subMenu[getText 'ContextMenu_White_Plaster']:addOption(_name, nil, MoreBuild.onBuildWoodenPillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.wallObject, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = MoreBuild.textPillarDescription .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'walls_exterior_wooden_02_3'
  _sprite.northSprite = 'walls_exterior_wooden_02_3'

  _name = getText 'ContextMenu_White_Wood_Pillar'

  _option = subMenu[getText 'ContextMenu_White_Wood']:addOption(_name, nil, MoreBuild.onBuildWoodenPillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.wallObject, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = MoreBuild.textPillarDescription .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  MoreBuild.neededMaterials = {
    {
      Material = 'Plank',
      Amount = 2,
      Text = getItemNameFromFullType('Base.Plank')
    },
    {
      Material = 'Nails',
      Amount = 3,
      Text = getItemNameFromFullType('Base.Nails')
    }
  }

  MoreBuild.neededTools = {'Hammer'}

  _sprite = {}
  _sprite.sprite = 'walls_commercial_03_3'
  _sprite.northSprite = 'walls_commercial_03_3'

  _name = getText 'ContextMenu_BrownCinder_Block_Pillar'

  _option = subMenu[getText 'ContextMenu_Brown_Cinder_Block']:addOption(_name, nil, MoreBuild.onBuildStonePillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.stoneArchitecture, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_BrownCinder_Block_Pillar' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'walls_commercial_03_35'
  _sprite.northSprite = 'walls_commercial_03_35'

  _name = getText 'ContextMenu_GrayCinder_Block_Pillar'

  _option = subMenu[getText 'ContextMenu_Gray_Cinder_Block']:addOption(_name, nil, MoreBuild.onBuildStonePillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.stoneArchitecture, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_GrayCinder_Block_Pillar' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'walls_commercial_01_51'
  _sprite.northSprite = 'walls_commercial_01_51'

  _name = getText 'ContextMenu_WhiteCinder_Block_Pillar'

  _option = subMenu[getText 'ContextMenu_White_CinderBlock']:addOption(_name, nil, MoreBuild.onBuildStonePillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.stoneArchitecture, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_WhiteCinder_Block_Pillar' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)

  _sprite = {}
  _sprite.sprite = 'walls_exterior_house_01_7'
  _sprite.northSprite = 'walls_exterior_house_01_7'

  _name = getText 'ContextMenu_RedBrick_Wall'

  _option = subMenu[getText 'ContextMenu_RedBrick_Wall']:addOption(_name, nil, MoreBuild.onBuildStonePillar, _sprite, player, _name)

  _tooltip = MoreBuild.canBuildObject(MoreBuild.skillLevel.stoneArchitecture, MoreBuild.skillLevel.none, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_RedBrick_Wall' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite)
end

MoreBuild.onBuildWoodenPillar = function(ignoreThisArgument, sprite, player, name)
  local _pillar = ISWoodenWall:new(sprite.sprite, sprite.northSprite, nil)

  _pillar.canPassThrough = true
  _pillar.canBarricade = false
  _pillar.isCorner = true
  _pillar.player = player
  _pillar.name = name

  _pillar.modData['need:Base.Plank'] = '2'
  _pillar.modData['need:Base.Nails'] = '3'
  _pillar.modData['xp:Woodwork'] = '5'
  _pillar.modData['wallType'] = 'pillar'

  getCell():setDrag(_pillar, player)
end

MoreBuild.onBuildStonePillar = function(ignoreThisArgument, sprite, player, name)
  local _pillar = ISWoodenWall:new(sprite.sprite, sprite.northSprite, nil)

  _pillar.canPassThrough = true
  _pillar.canBarricade = false
  _pillar.isCorner = true
  _pillar.player = player
  _pillar.name = name

  _pillar.modData['need:Base.Plank'] = '2'
  _pillar.modData['need:Base.Nails'] = '3'
  _pillar.modData['xp:Woodwork'] = '5'
  _pillar.modData['wallType'] = 'pillar'

  function _pillar:getHealth()
    return MoreBuild.healthLevel.stoneWall + buildUtil.getWoodHealth(self)
  end

  MoreBuild.equipToolPrimary(_pillar, player, 'Trowel')

  getCell():setDrag(_pillar, player)
end