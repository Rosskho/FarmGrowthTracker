FarmTrackerUI = ISPanel:derive("FarmTrackerUI")

function FarmTrackerUI:initialise()
    ISPanel.initialise(self)
    self.title = "Farm Growth Tracker"
    self.crops = FarmTrackerUtils.getCropData()
end

function FarmTrackerUI:render()
    self:drawText(self.title, 10, 10, 1, 1, 1, 1, UIFont.Medium)
    local y = 40
    for _, crop in ipairs(self.crops) do
        self:drawText(
            string.format("%s: Stage %d, Water: %d, Disease: %d, Harvest in: %d hrs",
            crop.name, crop.growthStage, crop.waterLevel, crop.diseaseLevel, crop.timeToHarvest),
            10, y, 1, 1, 1, 1, UIFont.Small
        )
        y = y + 20
    end
end

function FarmTrackerUI:new(x, y, width, height)
    local o = ISPanel.new(self, x, y, width, height)
    o:setX(x)
    o:setY(y)
    o:setWidth(width)
    o:setHeight(height)
    o:addToUIManager()
    return o
end
