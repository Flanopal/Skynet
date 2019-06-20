local sensorInfo = {
	name = "InitUnitsMap",
	desc = "Initializes a map of units",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

function IsUnitOfType(ID, type)
    local unitDefID = Spring.GetUnitDefID(ID)
    local name = UnitDefs[unitDefID].name
    if name == type then 
        return true
    else 
        return false
    end
end

function AppendNewUnit(list, unit)
    local newState = {}
    newState["id"] = unit
    newState["state"] = "idle"
    list[#list + 1] = newState
end

return function()
    local unitsMap = {}
    local atlases = {}
    local lugers = {}
    local radars = {}
    local peepers = {}
    local units = Spring.GetTeamUnits(Spring.GetMyTeamID())
    for i=1, #units do
        if (IsUnitOfType(units[i], "armseer")) then
            AppendNewUnit(radars, units[i])
        elseif (IsUnitOfType(units[i], "armatlas")) then
            AppendNewUnit(atlases, units[i])
        elseif (IsUnitOfType(units[i], "armmart")) then
            AppendNewUnit(lugers, units[i])
        elseif (IsUnitOfType(units[i], "armpeep")) then
            AppendNewUnit(peepers, units[i])
            peepers[#peepers]["state"] = 1
        end
    end
    unitsMap["atlases"] = atlases
    unitsMap["lugers"] = lugers
    unitsMap["radars"] = radars
    unitsMap["peepers"] = peepers
    return unitsMap
end