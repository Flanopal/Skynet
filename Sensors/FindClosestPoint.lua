local sensorInfo = {
	name = "FindClosestPoint",
	desc = "Finds closest point to given position.",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

return function(points, position)
    local closest = nil
    local minDist = math.huge
    for i=1, #points do
        local current = points[i]
        local dist = current:Distance(position)
        if dist < minDist then
            closest = current
            minDist = dist
        end
    end
    return closest
end