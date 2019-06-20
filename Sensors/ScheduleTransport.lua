local sensorInfo = {
	name = "ScheduleTransport",
	desc = "Schedules a transport of all given units to positions (as understood by Atlas-transport tree)",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

function tableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

return function(unitz, atlases, positions)
    local unitsForOneAtlas = #unitz / #atlases 
    local atlasIndex = 1
    local currentAtlasLoaded = 0
    local schedule = {}
    for i=1, #unitz do
        local transport = {}
        transport["unit"] = unitz[i]["id"]
        transport["atlas"] = atlases[atlasIndex]["id"]
        transport["toPos"] = positions[i]
        schedule[#schedule + 1] = transport
        currentAtlasLoaded = currentAtlasLoaded + 1
        if currentAtlasLoaded == unitsForOneAtlas then
            atlasIndex = atlasIndex + 1
            currentAtlasLoaded = 0
        end
    end
    return schedule
end