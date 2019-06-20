local sensorInfo = {
	name = "CheckDeadUnits",
	desc = "Schedules a transport of all given units to positions (as understood by Atlas-transport tree)",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

return function(unitsMap)
    local uMap = {}
    for unitType, units in pairs(unitsMap) do
        local un = {}
        for i=1,#units do
            if Spring.GetUnitIsDead(units[i]["id"]) == false then
                un[#un + 1] = units[i]
            end
        end
        uMap[unitType] = un
    end
    return uMap
end
