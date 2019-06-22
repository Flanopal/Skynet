local sensorInfo = {
	name = "UpdateLineInfo",
	desc = "Updates info about the middle line",
	author = "AzGhort",
	date = "2019-05-09"
}

function IsUnitOfType(ID, type)
    local unitDefID = Spring.GetUnitDefID(ID)
    if unitDefID == nil then
        return false
    end
    local name = UnitDefs[unitDefID].name
    if name == type then 
        return true
    else 
        return false
    end
end

return function(missionInfo)
    local lineInfo = {}
    local points = {}
    local strongpoints = {}
    local firstEnemyStrongpoint = nil
    local lastStrongpoint = nil
    local frontIndex = -1
    local mid = missionInfo.corridors.Middle.points
    for i=1, #mid do
        local current = mid[i]
        points[#points + 1] = current.position
        if current.isStrongpoint then
            local strongpoint = {}
            strongpoint.position = current.position
            if current.ownerAllyID == Spring.GetMyTeamID() then
                strongpoint.isCaptured = true
                lastStrongpoint = current.position
            else
                strongpoint.isCaptured = false
                if firstEnemyStrongpoint == nil then
                    firstEnemyStrongpoint = strongpoint.position
                    frontIndex = i
                end
            end
            strongpoints[#strongpoints + 1] = strongpoint
        end
    end

    -- shika location
    local enemyIDs = Sensors.core.EnemyTeamIDs()
    local closest = firstEnemyStrongpoint
    local dist = math.huge
    for i=1, #enemyIDs do
        local enemies = Spring.GetTeamUnits(enemyIDs[i])
        for j=1,#enemies do
            if IsUnitOfType(enemies[j], "shika") and Spring.ValidUnitID(enemies[j]) then
                local position = Vec3(Spring.GetUnitPosition(enemies[j]))
                if position ~= nil then
                    if position:Distance(firstEnemyStrongpoint) < dist then
                        closest = position
                        dist = position:Distance(firstEnemyStrongpoint)
                    end
                end
            end
        end
    end
    lineInfo["points"] = points
    lineInfo["currentEnemyStrongpoint"] = closest
    if frontIndex > 9  then
        lineInfo["reclaimPoint"] = mid[frontIndex - 3].position
        lineInfo["lastStrongpoint"] = mid[frontIndex - 2].position
    else
        lineInfo["reclaimPoint"] = lastStrongpoint
        lineInfo["lastStrongpoint"] = lastStrongpoint
    end
    lineInfo["strongpoints"] = strongpoints
    return lineInfo
end