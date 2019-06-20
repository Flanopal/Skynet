local sensorInfo = {
	name = "GetDangerInRadius",
	desc = "Returns enemy units in the circle of given radius.",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

return function(position, radius)
	local enemyIDs = Sensors.core.EnemyTeamIDs()
	local allEn = {}
	for i=1, #enemyIDs do
		enemies = Spring.GetUnitsInCylinder(position.x, position.z, radius, enemyIDs[i])
		if (#enemies > 0) then
			allEn[#allEn + 1] = enemies
		end
	end
	return allEn
end

-- ( number x, number z, number radius [,number teamID] )
-- -> nil | unitTable = { [1] = number unitID, etc... }