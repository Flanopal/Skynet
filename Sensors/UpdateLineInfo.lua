local sensorInfo = {
	name = "UpdateLineInfo",
	desc = "Updates info about the middle line",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

return function(missionInfo)
    local lineInfo = {}
    local points = {}
    local strongpoints = {}
    local lastOurStrongpoint = nil
    local firstEnemyStrongpoint = nil
    local mid = missionInfo.corridors.Middle.points
    for i=1,#mid do
        local current = mid[i]
        points[#points + 1] = current.position
        if current.isStrongpoint then
            local strongpoint = {}
            strongpoint.position = current.position
            if current.ownerAllyID == Spring.GetMyTeamID() then
                strongpoint.isCaptured = true
                lastOurStrongpoint = strongpoint.position
            else
                strongpoint.isCaptured = false
                if firstEnemyStrongpoint == nil then
                    firstEnemyStrongpoint = strongpoint.position
                end
            end
            strongpoints[#strongpoints + 1] = strongpoint
        end
    end
    lineInfo["points"] = points
    lineInfo["currentEnemyStrongpoint"] = firstEnemyStrongpoint
    lineInfo["lastStrongpoint"] = lastOurStrongpoint
    lineInfo["strongpoints"] = strongpoints
    lineInfo["reclaimPoint"] = lastOurStrongpoint
    return lineInfo
end