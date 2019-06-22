local sensorInfo = {
	name = "IsUnitAtPosition",
	desc = "Returns whether a unit is near given position",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

return function(unit, target, tolerance)
    local position = Vec3(Spring.GetUnitPosition(unit))

	if position:Distance(target) < tolerance then
		return true
    else
        return false
    end
end