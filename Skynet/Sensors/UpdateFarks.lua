function IsUnitOfType(ID, type)
    local unitDefID = Spring.GetUnitDefID(ID)
    local name = UnitDefs[unitDefID].name
    if name == type then 
        return true
    else 
        return false
    end
end

return function(unitsMap, farks)
    if farks.ready then
        return farks
    end
    local frks = {}
    if #unitsMap.farks > 1 then
        frks[1]=unitsMap.farks[1].id
        frks[2]=unitsMap.farks[2].id
        frks.ready = true
        unitsMap.farks = {}
        return frks
    end
    return farks
end