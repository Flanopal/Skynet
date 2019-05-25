-- from nota_hlaa_2019b_common

local sensorInfo = {
	name = "MapCanyons",
	desc = "Maps terrain as grid with granularity of certain height (between minHeight and maxHeight). Storing points in list with unified height (= maxHeight).",
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

--speedups


-- @description 
return function(granularity, minHeight, maxHeight)
	local canyonSamples = {}

	for x = 0,  Game.mapSizeX, granularity do
		for z = 0,  Game.mapSizeZ, granularity do
			y = Spring.GetGroundHeight(x, z)
			
			if y >= minHeight and y < maxHeight then
				canyonSamples[#canyonSamples+1] = Vec3(x,maxHeight,z)
			end
		end
	end
	
	return canyonSamples
end
