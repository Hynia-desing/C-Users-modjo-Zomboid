-- PER_PumpWaterDistribution.lua

-- This script manages water distribution to vanilla installations
-- within a 20 tiles radius.

-- Constants
local TANK_CAPACITY = 200  -- Capacity in liters
local DISTRIBUTION_RADIUS = 20  -- Radius for distribution in tiles

-- Main water tank
local mainTank = {capacity = TANK_CAPACITY, currentWater = TANK_CAPACITY}

-- Function to check water availability
function isWaterAvailable(amount)
    return mainTank.currentWater >= amount
end

-- Function to distribute water
function distributeWater(fixture, amount)
    if isWaterAvailable(amount) then
        mainTank.currentWater = mainTank.currentWater - amount
        print("Distributed " .. amount .. "L to " .. fixture)
    else
        print("Not enough water in the tank to distribute to " .. fixture)
    end
end

-- Function to check if a fixture is within distribution range
function isWithinRange(fixturePos, playerPos)
    local dx = fixturePos.x - playerPos.x
    local dy = fixturePos.y - playerPos.y
    return (dx * dx + dy * dy) <= (DISTRIBUTION_RADIUS * DISTRIBUTION_RADIUS)
end

-- Function to handle fixtures within range
function handleFixtures(playerPos)
    local fixtures = {"toilet", "sink", "shower"}
    for _, fixture in ipairs(fixtures) do
        local fixturePos = getFixturePosition(fixture)  -- Assuming this function retrieves fixture's position
        if isWithinRange(fixturePos, playerPos) then
            distributeWater(fixture, 5)  -- Assuming 5L is distributed to each fixture
        end
    end
end

-- Function to handle water pressure and flow rate (simplified for this example)
function handlePressureAndFlow()
    -- Here we can implement logic to manage pressure and flow rate
    print("Handling water pressure and flow rate")
end

-- Main function to control water distribution
function main(playerPos)
    handleFixtures(playerPos)
    handlePressureAndFlow()
end

-- Call main function with player position (example)
main({x = 0, y = 0})  -- Replace with actual player position
