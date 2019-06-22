function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Stop all actions",
		parameterDefs = {
			{ 
				name = "unit",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}
		}
	}
end

function Run(self, units, parameter)
	local unit = parameter.unit

	if not Spring.ValidUnitID(unit) then
		return FAILURE
	end

	Spring.GiveOrderToUnit(unit, CMD.STOP, {}, {})
	return SUCCESS
end