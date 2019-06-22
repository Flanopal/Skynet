local sensorInfo = {
	name = "GetTeamMetal",
	desc = "Current level of metal",
	author = "AzGhort",
	date = "2019-05-09"
}

local EVAL_PERIOD_DEFAULT = -1

return function()
    local currentLevel,
         storage,
         pull,
         income,
         expense,
         share,
         sent,
         received =	Spring.GetTeamResources(Spring.GetMyTeamID(), "metal")
    return currentLevel
end