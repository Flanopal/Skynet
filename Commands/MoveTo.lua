function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Do movement for unit",
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
			},
			{
				name = "tolerance",
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

-- @execute plan
function Run(self, units, parameter)
	local unit = parameter.unit
	local target = parameter.position
	local tolerance = parameter.tolerance
	local position = Vec3(Spring.GetUnitPosition(unit))

	if position:Distance(target) < tolerance then
		return SUCCESS
	else
		MoveOrder(unit, CMD.MOVE, {target.x,target.y,target.z}, {})
		return RUNNING
	end
end

function Reset(self)
	ClearState(self)
end