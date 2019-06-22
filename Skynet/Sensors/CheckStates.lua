local sensorInfo = {
	name = "CheckStates",
	desc = "Checks whether all units given have the given state",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

return function(units, state)
    for i=1, #units do
        if units[i]["state"] ~= state then
            return false
        end
    end
    return true
end