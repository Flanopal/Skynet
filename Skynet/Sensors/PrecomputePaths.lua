local sensorInfo = {
	name = "PrecomputePaths",
	desc = "Using BFS, computes predecessor of each point in grid on a path from start",
	author = "AzGhort",
	date = "2019-05-12"
}

local EVAL_PERIOD_DEFAULT = -1 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

---------------------------------------------------------------
-- queue implementation, from https://www.lua.org/pil/11.4.html
Queue = {}
function Queue.new()
    return {first = 0, last = -1}
end
  
function Queue.push(list, value)
	local first = list.first - 1
	list.first = first
	list[first] = value
end
  
function Queue.pop(list)
    local last = list.last
    if Queue.empty(list) then error("queue is empty") end
    local value = list[last]
    list[last] = nil         
    list.last = last - 1
    return value
end

function Queue.empty(list)
    return list.first > list.last
end
--------------------------------------------------------------

return function(startPoints, points, paths, grid)
	local frontier = Queue.new()
	local startGrids = {}
	for i=1,#startPoints do
		local startPoint = startPoints[i]
		local startGridPoint = Sensors.nota_sta_hw.FindClosestPoint(points, startPoint) 	
		Queue.push(frontier, startGridPoint)
		startGrids[#startGrids + 1] = startGridPoint
	end
    while not(Queue.empty(frontier)) do
        local current = Queue.pop(frontier)
		local neighbours = grid[current]
		for i=1,#neighbours do
			if paths[neighbours[i]] == nil then
				paths[neighbours[i]] = current
				Queue.push(frontier, neighbours[i])
			end
		end
	end

	for i=1, #startGrids do
		paths[startGrids[i]] = nil
	end
	return paths
end