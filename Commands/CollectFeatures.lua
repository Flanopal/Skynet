function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Collect metal from features",
		parameterDefs = {
			{ 
				name = "collector",
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
				name = "radius",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}
		}
	}
end


local Order = Spring.GiveOrderToUnit

local function ClearState(self)
	self.orderGiven = false
end

-- @load unit
function Run(self, units, parameter)
	local collector = parameter.collector
	local position = parameter.position
	local radius = parameter.radius

	local cmdQLen = Spring.GetCommandQueue(collector, 0)
	if not self.orderGiven then
		Order(collector, CMD.RECLAIM,{position.x, position.y, position.z, radius},{})
		self.orderGiven = true
	end
	if cmdQLen == 0 then
		return SUCCESS
	end
	return RUNNING
end

function Reset(self)
	ClearState(self)
end
