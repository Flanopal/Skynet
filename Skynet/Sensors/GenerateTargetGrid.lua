local sensorInfo = {
	name = "GenerateTargetGrid",
	desc = "Generate a star shaped grid around target position",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

function tableLength(table)
    local count = 0
    for x, y in pairs(table) do
        count = count + 1
    end
    return count
end

return function(position, unitz)
    local positions = {}
    local radius = 100
    local quarter = radius/math.sqrt(2)
    local circles = (#unitz / 8) + 1
    local y = position.y
    local z = position.z
    local x = position.x
    for i=1, circles do
        -- halfs
        positions[#positions + 1] = Vec3(x + i*radius, y, z)
        positions[#positions + 1] = Vec3(x, y, z - i*radius)
        positions[#positions + 1] = Vec3(x - i*radius, y, z)
        positions[#positions + 1] = Vec3(x, y, z + i*radius)
        -- quarters
        positions[#positions + 1] = Vec3(x + i*quarter, y, z + i*quarter)
        positions[#positions + 1] = Vec3(x + i*quarter, y, z - i*quarter)
        positions[#positions + 1] = Vec3(x - i*quarter, y, z + i*quarter)
        positions[#positions + 1] = Vec3(x - i*quarter, y, z - i*quarter)
    end
    return positions
end