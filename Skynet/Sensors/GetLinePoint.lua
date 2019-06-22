local sensorInfo = {
	name = "GetLinePoint",
	desc = "Returns a current fight point in a line",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

return function(line, radius)
	local points = line["points"]
	local enemyTeamIDs = Sensors.core.EnemyTeamIDs()
	local max = 0
	local linePoint = nil
	for i=1, #points do
		local curEnemies = 0
		for j=1, #enemyTeamIDs do
			enemies = Spring.GetUnitsInCylinder(points[i].position.x, points[i].position.z, radius, enemyTeamIDs[j])
			curEnemies = curEnemies + #enemies
		end
		if curEnemies > max then
			max = curEnemies
			linePoint = points[i]
		end
	end
	if (linePoint == nil) then
		linePoint = points[#points - 1]
	end
	return linePoint
end