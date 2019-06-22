local sensorInfo = {
	name = "SetStates",
	desc = "Set states of all units to the given state",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

return function(units, state)
    for id, unit in pairs(units) do
        unit["state"] = state
    end
    return units
end