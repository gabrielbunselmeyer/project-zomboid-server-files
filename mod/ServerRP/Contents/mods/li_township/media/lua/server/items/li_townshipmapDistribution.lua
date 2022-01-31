local function preDistributionMerge()
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, "li_townshipmap");
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, 50);
end
Events.OnPreDistributionMerge.Add(preDistributionMerge); 