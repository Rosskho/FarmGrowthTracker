FarmTrackerUtils = {}

function FarmTrackerUtils.getCropData()
    local crops = {}
    for _, plant in ipairs(farming_plant_list) do
        table.insert(crops, {
            name = plant.typeOfSeed,
            growthStage = plant.nbOfGrow,
            waterLevel = plant.waterLvl,
            diseaseLevel = plant.mildewLvl, -- Example disease level
            timeToHarvest = plant.nextGrowing or 0 -- Hours left to next stage
        })
    end
    return crops
end
