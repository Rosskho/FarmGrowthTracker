FarmTrackerUI = ISPanel:derive("FarmTrackerUI")

-- Initialize the FarmTrackerUI
function FarmTrackerUI:initialise()
    ISPanel.initialise(self)
    self.title = "Farm Growth Tracker"
    self.crops = FarmTrackerUtils.getCropData()
end

-- Render the UI elements
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

-- Create a new instance of the UI
function FarmTrackerUI:new(x, y, width, height)
    local o = ISPanel.new(self, x, y, width, height)
    o:setX(x)
    o:setY(y)
    o:setWidth(width)
    o:setHeight(height)
    o:addToUIManager()
    return o
end

-- Hotkey function to toggle the tracker UI
Events.OnKeyPressed.Add(function(key)
    if key == Keyboard.KEY_T then -- Replace KEY_T with your desired hotkey
        if not FarmTrackerUI.instance then
            FarmTrackerUI.instance = FarmTrackerUI:new(200, 200, 400, 300)
        else
            FarmTrackerUI.instance:removeFromUIManager()
            FarmTrackerUI.instance = nil
        end
    end
end)
