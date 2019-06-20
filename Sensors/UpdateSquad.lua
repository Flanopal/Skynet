local sensorInfo = {
	name = "UpdateSquad",
	desc = "Updates squad",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

return function(unitsMap, squad)
    if squad.ready then
        return squad
    end
    local squad = {}
    if #unitsMap.lugers > 11 and #unitsMap.atlases > 12 and #unitsMap.radars > 0 then
        squad.lugers = unitsMap.lugers
        squad.lugers[#squad.lugers + 1] = unitsMap.radars[1]
        squad.atlases = unitsMap.atlases
        unitsMap.lugers = {}
        unitsMap.atlases = {}
        unitsMap.radars = {}
        squad.ready = true
        return squad
    end
    squad.ready = false
    return squad
end