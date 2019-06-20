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

local function ClearState(self)
	self.commandGiven = false
end

-- @unload unit
function Run(self, units, parameter)
	local transporter = parameter.transporter
	local position = parameter.position
	local unit = parameter.unit

	if not self.commandGiven then
		Spring.GiveOrderToUnit(transporter,CMD.UNLOAD_UNITS,{position.x, position.y, position.z, 150},{})
		self.commandGiven = true
	end

	if Spring.GetUnitTransporter(unit) == nil then
		return SUCCESS
	end

	return RUNNING
end

function Reset(self)
	ClearState(self)
end
