-- PER_SolarPanel.lua

-- Simplified solar panel logic
local SolarPanel = {}
SolarPanel.converters = {}

function SolarPanel:new()
    local newObj = {  }
    self.__index = self
    return setmetatable(newObj, self)
end

function SolarPanel:addConverter(converter)
    if #self.converters < 1 then  -- limit to 1 panel per converter
        table.insert(self.converters, converter)
    else
        print("Cannot add another solar panel. Limit reached.")
    end
end

return SolarPanel
