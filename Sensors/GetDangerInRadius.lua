local sensorInfo = {
	name = "GetTrashNearLinePoint",
	desc = "Returns enemy units in the circle of given radius.",
	author = "AzGhort"
}

return function(position, radius, teamID)
    return enemies = Spring.GetUnitsInCylinder(position.x, position.z, radius, teamID)
end