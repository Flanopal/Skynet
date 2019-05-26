function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Unload unit from transporter",
		parameterDefs = {
			{ 
				name = "transporter",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "position",
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

-- @unload unit
function Run(self, units, parameter)
	local transporter = parameter.transporter
	local position = parameter.position
	local unit = parameter.unit

	MoveOrder(transporter,CMD.UNLOAD_UNIT,{position.x,position.y,position.z},{})

	if Spring.GetUnitTransporter(unit) == nil then
		return SUCCESS
	end

	return RUNNING
end

function Reset(self)
	ClearState(self)
end
