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

return function(unitz, atlases, num, position) 
    local positionsIndex = 1
    local schedule = {}
    for i=1,num do
        local transport = {}
        transport["unit"] = unitz[i]["id"]
        transport["atlas"] = atlases[i]["id"]
        transport["toPos"] = position
        schedule[#schedule + 1] = transport
    end
    return schedule
end