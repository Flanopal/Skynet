local sensorInfo = {
	name = "CreateGrid",
	desc = "Creates grid of points where every point is stored as key with his neighbours (in range) as values",
	author = "Ondrelord",
	date = "2018-04-16",
	license = "MIT",
}

local EVAL_PERIOD_DEFAULT = math.huge -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return current wind statistics
return function(pointSamples, range)
	local points = {}
	local dist

	for i = 1, #pointSamples, 1 do
		points[pointSamples[i]] = {}
		for j = 1, #pointSamples, 1 do
			dist = -1
			if i ~= j then
				dist = math.sqrt((pointSamples[i].x - pointSamples[j].x) * (pointSamples[i].x - pointSamples[j].x) + (pointSamples[i].z - pointSamples[j].z) * (pointSamples[i].z - pointSamples[j].z))
			end
			if dist ~= -1 and dist <= range then
				points[pointSamples[i]][#points[pointSamples[i]] + 1] = pointSamples[j]
			end
		end
	end

	return points
end