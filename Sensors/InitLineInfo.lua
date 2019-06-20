local sensorInfo = {
	name = "InitLineInfo",
	desc = "Initialize info about given line",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

return function(points)
	local lineInfo = {}
	lineInfo["points"] = points
	return points
end