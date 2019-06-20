local sensorInfo = {
	name = "SplitAtlases",
	desc = "Splits atlases into two groups",
	author = "AzGhort"
}

local EVAL_PERIOD_DEFAULT = -1

return function(atlases, firstGroup)
    local split = {}
    local first = {}
    local second = {}
    for i=1,firstGroup do
        first[#first + 1] = atlases[i]
    end
    for j=firstGroup+1,#atlases do
        second[#second + 1] = atlases[j]
    end
    split[1] = first
    split[2] = second
    return split
end