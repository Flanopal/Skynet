function IsUnitOfType(ID, type)
    local unitDefID = Spring.GetUnitDefID(ID)
    local name = UnitDefs[unitDefID].name
    if name == type then 
        return true
    else 
        return false
    end
end

return function()
    local unitz = Spring.GetTeamUnits(Spring.GetMyTeamID())
    local list = {}
    local total = 0
    for i=1, #unitz do 
        if IsUnitOfType(unitz[i], "armfark") then
            total = total + 1
        end
    end
    while total < 2 do 
        list[#list + 1] = "armfark"
        total = total + 1
    end
    return list
end