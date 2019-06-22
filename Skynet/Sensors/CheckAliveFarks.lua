return function(farks)
    if not farks.ready then
        return farks
    end
    for i, fark in pairs(farks) do
        if i ~= "ready" then
            if not Spring.ValidUnitID(fark) then
                farks.ready = false
                return farks
            end
        end
    end
    -- everything is fine
    return farks
end