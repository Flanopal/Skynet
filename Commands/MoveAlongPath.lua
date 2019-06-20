function getInfo()
	return {
		onNoUnits = SUCCESS,
		tooltip = "Move unit along a path of given points",
		parameterDefs = {
			{ 
				name = "units",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "points",
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

function Run(self, units, parameter)
    local unit = parameter.units[1]
    local path = parameter.points
    local tolerance = parameter.tolerance

    local position = Vec3(Spring.GetUnitPosition(unit["id"]))
    local currentIndex = unit["state"]
    local target = path[currentIndex].position
    if currentIndex <= #path then
        target = path[currentIndex].position
        if position:Distance(target) < tolerance then
            parameter.units[1]["state"] = parameter.units[1]["state"] + 1
	    else
            Spring.GiveOrderToUnit(unit["id"], CMD.MOVE, {target.x,target.y,target.z}, {})
        end
        return RUNNING
    end
    return SUCCESS
end