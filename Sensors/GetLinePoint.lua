local sensorInfo = {
	name = "GetLinePoint",
	desc = "Returns a current fight point in a line",
	author = "AzGhort",
	date = "2019-05-09"
}

return function(line, enemyTeamID, radius)
	local points = line["points"]
	local max = 0
	local linePoint = nil
	for i=1, #points do
		enemies = Spring.GetUnitsInCylinder(points[i].x, points[i].z, radius, enemyTeamID)
		if #enemies > max then
			max = #enemies
			linePoint = points[i]
		end
	end
	return linePoint
end