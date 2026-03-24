-- Simplified Battery Logic

-- Define the battery class
Battery = {}
Battery.__index = Battery

-- Constructor for Battery class
function Battery:new(capacity)
    local obj = setmetatable({}, Battery)
    obj.capacity = capacity or 5000  -- Default capacity is 5000
    obj.level = 0  -- Battery starts empty
    return obj
end

-- Method to charge the battery
function Battery:charge(amount)
    self.level = math.min(self.level + amount, self.capacity)
end

-- Method to discharge the battery
function Battery:discharge(amount)
    self.level = math.max(self.level - amount, 0)
end

-- Method to check battery status
function Battery:status()
    return self.level / self.capacity
end

-- Define the converter class
Converter = {}
Converter.__index = Converter

-- Constructor for Converter class
function Converter:new()
    local obj = setmetatable({}, Converter)
    obj.battery = Battery:new()  -- Each converter has one battery
    return obj
end

-- Dummy method to demonstrate converter behavior
function Converter:useBattery(amount)
    self.battery:discharge(amount)
end

-- Example usage
local myConverter = Converter:new()
myConverter.battery:charge(3000)  -- Charge the battery
print("Battery status:", myConverter.battery:status())  -- Print battery status