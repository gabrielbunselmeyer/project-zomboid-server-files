--- give the health of the item, depending on your masonry level + if you're a construction worker
buildUtil.getBrickHealth = function(ISItem)
	if not ISItem or not ISItem.player then
		return 150;
	end
	local playerObj = getSpecificPlayer(ISItem.player)
	local health;
	
	health = (playerObj:getPerkLevel(Perks.Masonry) * 75)

	if playerObj:HasTrait("Handy") then
		health = health + 150;
	end
	return health;
end

-- all those infos are saved in java
function buildUtil.setInfo(javaObject, ISItem)
	if instanceof(javaObject, "IsoWindow") then return end

	javaObject:setCanPassThrough(ISItem.canPassThrough);
	javaObject:setCanBarricade(ISItem.canBarricade);
	javaObject:setThumpDmg(ISItem.thumpDmg);
	javaObject:setIsContainer(ISItem.isContainer);
	javaObject:setIsDoor(ISItem.isDoor);
	javaObject:setIsDoorFrame(ISItem.isDoorFrame);
	javaObject:setCrossSpeed(ISItem.crossSpeed);
	javaObject:setBlockAllTheSquare(ISItem.blockAllTheSquare);
	javaObject:setName(ISItem.name);
	javaObject:setIsDismantable(ISItem.dismantable);
	javaObject:setCanBePlastered(ISItem.canBePlastered);
	javaObject:setIsHoppable(ISItem.hoppable);
	javaObject:setModData(copyTable(ISItem.modData));
    javaObject:setIsThumpable(ISItem.isThumpable);
    if ISItem.containerType and javaObject:getContainer() then
       javaObject:getContainer():setType(ISItem.containerType);
    end
    if ISItem.canBeLockedByPadlock then
        javaObject:setCanBeLockByPadlock(ISItem.canBeLockedByPadlock);
    end
	if ISItem.modData and ISItem.modData["use:Base.BlowTorch"] then
		javaObject:setThumpSound("ZombieThumpMetal")
	end
end