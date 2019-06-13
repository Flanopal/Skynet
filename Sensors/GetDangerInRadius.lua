local sensorInfo = {
	name = "GetDangerInRadius",
	desc = "Returns enemy units in the circle of given radius.",
	author = "AzGhort"
}

return function(position, radius, teamID)
	return enemies = Spring.GetUnitsInCylinder(position.x, position.z, radius, teamID)
end

-- ( number x, number z, number radius [,number teamID] )
-- -> nil | unitTable = { [1] = number unitID, etc... }