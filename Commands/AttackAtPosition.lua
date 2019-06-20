function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Shoots at position",
		parameterDefs = {
			{ 
				name = "units",
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
    local units = parameter.units
    local target = parameter.position
    for i=1, #units do
        Spring.GiveOrderToUnit(units[i]["id"], CMD.ATTACK, {target.x, target.y, target.z}, {})
    end
    return RUNNING
end