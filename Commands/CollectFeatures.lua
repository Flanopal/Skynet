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
end

-- @load unit
function Run(self, units, parameter)
	local collector = parameter.collector
	local position = parameter.position
	local radius = parameter.radius

	Order(collector, CMD.RECLAIM,{position.x, position.y, position.z, radius},{})

	-- jak poznat success? zavolat znovu
	if Sensors.Skynet.GetTrashAtLinePoint(position, radius) == nil then
		return SUCCESS
	end
	return RUNNING
end

function Reset(self)
	ClearState(self)
end
