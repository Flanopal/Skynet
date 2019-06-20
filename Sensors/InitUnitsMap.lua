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
    local unitz = Spring.GetTeamUnits(Spring.GetMyTeamID())
    for i=1, #unitz do
        if (IsUnitOfType(unitz[i], "armseer")) then
            AppendNewUnit(radars, unitz[i])
        elseif (IsUnitOfType(unitz[i], "armatlas")) then
            AppendNewUnit(atlases, unitz[i])
        elseif (IsUnitOfType(unitz[i], "armmart")) then
            AppendNewUnit(lugers, unitz[i])
        end
    end
    unitsMap["atlases"] = atlases
    unitsMap["lugers"] = lugers
    unitsMap["radars"] = radars
    unitsMap["farks"] = {}
    return unitsMap
end