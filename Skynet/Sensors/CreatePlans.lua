local sensorInfo = {
	name = "CreatePlans",
	desc = "Given list of targets and table of predecessors, creates a plan for each target.",
	author = "AzGhort",
	date = "2019-05-12"
}

local EVAL_PERIOD_DEFAULT = -1 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

function createPlan(paths, points, target)
    local endGridPoint = Sensors.nota_sta_hw.FindClosestPoint(points, target)
    local plan = {target, endGridPoint}
    local currentPoint = paths[endGridPoint]
    while currentPoint ~= nil do
        plan[#plan + 1] = currentPoint
        currentPoint = paths[currentPoint]
    end
    return plan
end

function reversePlan(plan)
    local rev = {}
	for i=#plan, 1, -1 do
        rev[#plan-i+1] = plan[i]
    end
    return rev
end

return function(pred, points, targets)
	local plans = {}
    for i=1, #targets["positions"] do
        local paths = {}
        local planToBase = createPlan(pred, points, targets["positions"][i])
        local planToTarget = reversePlan(planToBase)
        planToBase[#planToBase + 1] = targets["basePositions"][i % (#targets.basePositions + 1)]
        paths["toBase"] = planToBase
        paths["toTarget"] = planToTarget
        paths["targetID"] = targets["ids"][i]
        plans[targets["positions"][i]] = paths
    end
    metaplans = {}
    metaplans["plans"] = plans
    metaplans["targets"] = targets["positions"]
    metaplans["ids"] = targets["ids"]
    metaplans["evPoints"] = targets["evPoints"]
    metaplans["firstUnassigned"] = 1
    return metaplans
end