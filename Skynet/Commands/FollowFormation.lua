function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Execute movement for units",
		parameterDefs = {
			{ 
				name = "unitsToMove",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "positions",
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
	local unitsToMove = parameter.unitsToMove
	local positions = parameter.positions

	if positions == nil then
		return SUCCESS
	end

	local notAtPlace = 0
	local move = CMD.MOVE
	
	for i = 1,#unitsToMove do
		local position = Vec3(Spring.GetUnitPosition(unitsToMove[i]))
		local target = positions[i]

		if position:Distance(target) > 50 then
			notAtPlace = notAtPlace + 1;
			if positions.state == nil then
				MoveOrder(unitsToMove[i], CMD.MOVE, {target.x,target.y,target.z}, {})
			end
		end
	end
	positions.state = 'Running'
	positions.notAt = notAtPlace
	if notAtPlace > 0 then
		return RUNNING
	end
	return SUCCESS
end

function Reset(self)
	ClearState(self)
end