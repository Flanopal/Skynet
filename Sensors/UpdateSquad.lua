local sensorInfo = {
	name = "UpdateSquad",
	desc = "Updates squad, that is finds available zeuses from the pool",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

return function(sq, units, squadCount)
    local squad = sq
    if sq == nil then 
        squad = {}
    end
    local curSquad = #squad
    if curSquad < squadCount then
        for ID, info in pairs(units) do
            if info["squad"] == nil then
                squad[#squad + 1] = ID
                curSquad = curSquad + 1
                units[ID]["squad"] = true
            end
            if curSquad > squadCount-1 then
                break
            end
        end
    end
    return squad
end