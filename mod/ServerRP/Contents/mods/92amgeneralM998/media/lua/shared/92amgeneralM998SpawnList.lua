if VehicleZoneDistribution then

VehicleZoneDistribution.parkingstall.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerM101A3cargo"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.trailerpark.vehicles["Base.92amgeneralM998"] = {index = 4, spawnChance = 2};
VehicleZoneDistribution.trailerpark.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerM101A3cargo"] = {index = 4, spawnChance = 5};

VehicleZoneDistribution.bad.vehicles["Base.92amgeneralM998"] = {index = 0, spawnChance = 1};
VehicleZoneDistribution.bad.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.junkyard.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.junkyard.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.ranger.vehicles["Base.92amgeneralM998"] = {index = 0, spawnChance = 1};
VehicleZoneDistribution.ranger.vehicles["Base.TrailerM101A3cargo"] = {index = 0, spawnChance = 2};

-- Trafficjam spawns --

VehicleZoneDistribution.trafficjamw.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjame.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjame.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trafficjame.vehicles["Base.TrailerM101A3cargo"] = {index = -1, spawnChance = 4};

VehicleZoneDistribution.trafficjamn.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.trafficjams.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjams.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 2};

-- Military spawn --

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

VehicleZoneDistribution.military.vehicles["Base.92amgeneralM998"] = {index = -1, spawnChance = 20};

VehicleZoneDistribution.military.vehicles["Base.92amgeneralM998Burnt"] = {index = -1, spawnChance = 10};

VehicleZoneDistribution.military.vehicles["Base.TrailerM101A3cargo"] = {index = -1, spawnChance = 25};

end