Events.OnPostRender.Add(function()
    for _, crop in ipairs(FarmTrackerUtils.getCropData()) do
        if crop and crop.isoObject then
            local screenX, screenY = IsoUtils.worldToScreen(crop.isoObject:getX(), crop.isoObject:getY(), crop.isoObject:getZ())
            local text = string.format("Growth: %d, Water: %d, Disease: %d", crop.growthStage, crop.waterLevel, crop.diseaseLevel)
            UIManager.DrawTextCentre(screenX, screenY - 20, text, 1, 1, 1, 1)
        end
    end
end)
