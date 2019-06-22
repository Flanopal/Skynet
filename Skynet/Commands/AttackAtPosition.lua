function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Shoots at position",
		parameterDefs = {
			{ 
				name = "unit",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "position",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}
		}
	}
end

function Run(self, units, parameter)
    local unit = parameter.unit
	local target = parameter.position
	
	if (not Spring.ValidUnitID(unit)) then
		return FAILURE
	end

	Spring.GiveOrderToUnit(unit, CMD.FIRE_STATE, {1}, {})
    Spring.GiveOrderToUnit(unit, CMD.ATTACK, {target.x, target.y, target.z}, {})
    return SUCCESS
end