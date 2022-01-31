local bedforddistributionTable = {

    bedfordgasstation = {

            shelvesmag = {
            procedural = true,
            procList = {
                {name="MagazineRackMapsRingo", min=5, max=10, forceForZones="Unique"},
                {name="MagazineRackMixed", min=2, max=5, forceForZones="Unique"},
                {name="MagazineRackMapsRingo", min=1, max=5},
                {name="MagazineRackNewspaper", min=1, max=1},
                {name="MagazineRackMixed", min=0, max=99},
                    }
            },
    },
    all = {
            shelvesmag = {
            procedural = true,
            procList = {
                {name="MagazineRackNewspaper", min=1, max=5},
                {name="MagazineRackMixed", min=2, max=99},
                {name="MagazineRackMapsRingo", min=2, max=5},
                }
            },
    }
}

 

table.insert(Distributions, 2, bedforddistributionTable);