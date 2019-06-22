local sensorInfo = {
	name = "UpdateUnitsMap",
	desc = "Updates units map",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

function checkUnitList(unitsMap, type, unit)
    local list = unitsMap[type]
    for i=1,#list do
        if list[i] == unit then
            return
        end
    end
    unitsMap[type][#unitsMap[type] + 1] = unit
end

return function(unitsMap)
    local units = Spring.GetTeamUnits(Spring.GetMyTeamID())
    for _, ID in ipairs(units) do
        local unitDefID = Spring.GetUnitDefID(ID)
        local name = UnitDefs[unitDefID].name
        if name == "armmart" then
            checkUnitList(unitsMap, "lugers", ID)
        elseif name == "armatlas" then
            checkUnitList(unitsMap, "atlases", ID)
        elseif name == "armseer" then
            checkUnitList(unitsMap, "radars", ID)
        elseif name == "armfark" then
            checkUnitList(unitsMap, "farks", ID)
        end
    end
    return unitsMap
end