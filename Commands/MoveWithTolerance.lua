function getInfo() 
    return
    {
	    onNoUnits = SUCCESS, -- instant success
		tooltip = "Move selected units to given targets, being tolerant up to threshold",
        parameterDefs =
        {
            { 
				name = "targets",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
            },
            { 
				name = "threshold",
				variableType = "number",
				componentType = "editBox",
				defaultValue = "",
            }
        }
    }
end

function Run(self, units, parameter)
    local counter = 0
    local j = 1
    local targetIndex = 1
    for _, ID in ipairs(units) do
        local recentlyDied = Spring.GetUnitIsDead(ID)
        if recentlyDied or recentlyDied == nil then
            counter = counter + 1
        else
            local position = Vec3(Spring.GetUnitPosition(ID))
            if targetIndex > #parameter.targets then
                targetIndex = 1
            end
            if position:Distance(parameter.targets[targetIndex]) < parameter.threshold then
                counter = counter + 1
            else
                Spring.GiveOrderToUnit(ID, CMD.MOVE, parameter.targets[targetIndex]:AsSpringVector(), {})
            end
        end
        j = j + 1
        targetIndex = targetIndex + 1
    end
    if counter + 1 < j then
        return RUNNING
    else
        return SUCCESS
    end
end