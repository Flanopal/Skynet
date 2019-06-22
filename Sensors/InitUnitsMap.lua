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
    list[#list + 1] = unit
end

return function()
    local unitsMap = {}
    local atlases = {}
    local lugers = {}
    local radars = {}
    local peepers = {}
    local farks = {}
    local unitz = Spring.GetTeamUnits(Spring.GetMyTeamID())
    for i=1, #unitz do
        if (IsUnitOfType(unitz[i], "armseer")) then
            AppendNewUnit(radars, unitz[i])
        elseif (IsUnitOfType(unitz[i], "armatlas")) then
            AppendNewUnit(atlases, unitz[i])
        elseif (IsUnitOfType(unitz[i], "armmart")) then
            AppendNewUnit(lugers, unitz[i])
        elseif (IsUnitOfType(unitz[i], "armfark")) then
            AppendNewUnit(farks, unitz[i])
        end
    end
    unitsMap["atlases"] = atlases
    unitsMap["lugers"] = lugers
    unitsMap["radars"] = radars
    unitsMap["farks"] = farks
    return unitsMap
end