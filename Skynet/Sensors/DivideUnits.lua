local sensorInfo = {
	name = "DivideUnits",
	desc = "Divides units by type to artillery, farcs, atlases, and ground units",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

return function()
    local unitsMap = {}
    local farcs = {}
    local towers = {}
    local atlases = {}
    local zeuses = {}
    local other = {}
    for _, ID in ipairs(units) do
        local unitInfo = {}
        unitInfo["unit"] = ID
        local unitDefID = Spring.GetUnitDefID(ID)
        local name = UnitDefs[unitDefID].name
        if name == "armmart" or name == "armbox" then
            towers[ID] = {}
        elseif name == "armatlas" then
            atlases[ID] = {}
        elseif name == "armfark" then
            farcs[ID] = {}
        elseif name == "armzeus" then
            zeuses[ID] = {}
        else
            other[ID] = {}
        end
    end
    unitsMap["farks"] = farcs
    unitsMap["towers"] = towers
    unitsMap["atlases"] = atlases
    unitsMap["other"] = other
    unitsMap["zeuses"] = zeuses
    return unitsMap
end