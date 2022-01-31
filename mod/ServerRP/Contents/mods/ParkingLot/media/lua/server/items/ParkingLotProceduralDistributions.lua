local function preDistributionMerge()
    ProceduralDistributions.list.MagazineRackMapsRingo = {
        rolls = 6,
        items = {
            "MuldraughMap", 5,
            "WestpointMap", 5,
            "MarchRidgeMap", 5,
            "RosewoodMap", 5,
            "RiversideMap", 5,
            "BedfordMap", 5,
            "BedfordMap", 5,
        },
    }
end
Events.OnPreDistributionMerge.Add(preDistributionMerge);