-- Existing code of PER_PumpRuntime.lua

-- Function to check water supply
function checkWaterSupply()
    -- Check if pump is running
    if pumpIsRunning() then
        local tankFill = getTankFillPercentage()
        
        -- Check if tank has sufficient water pressure
        if tankFill >= 30 then
            supplyWaterToNearbyFixtures()
        end
    end
end

-- Placeholder function for water supply logic to fixtures
function supplyWaterToNearbyFixtures()
    local radius = 20  -- 20 tile radius
    local fixtures = getNearbyWaterFixtures(radius)
    for _, fixture in ipairs(fixtures) do
        if fixture.needsWater() then
            fixture.supplyWater()
        end
    end
end

-- Call the check function continuously
while true do
    checkWaterSupply()
end