function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Load unit to transporter",
		parameterDefs = {
			{ 
				name = "transporter",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "unit",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}
		}
	}
end


local MoveOrder = Spring.GiveOrderToUnit

local function ClearState(self)
end

-- @load unit
function Run(self, units, parameter)
	local transporter = parameter.transporter
	local unit = parameter.unit

	MoveOrder(transporter,CMD.LOAD_UNITS,{unit},{})

	if Spring.GetUnitTransporter(unit) == transporter then
		return SUCCESS
	end

	return RUNNING
end

function Reset(self)
	ClearState(self)
end
