local sensorInfo = {
	name = "PlanRecruiting",
	desc = "Plans recruiting of units",
	author = "AzGhort",
	date = "2019-05-09"
}

VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

attach.Module(modules, "message") 

local EVAL_PERIOD_DEFAULT = -1 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

function safeBuy(list, what, metal, prices)
	if metal.metal > prices[what] then
		list[#list + 1] = what
		metal.metal = metal.metal - prices[what]
	end
end

function checkUnit(list, units, amount, unit, metal, prices)
	local total = #units
	while total < amount do
		safeBuy(list, unit, metal, prices)
		total = total + 1
	end
end

return function(unitsMap, prices)
	local list = {}
	local metalMap = {}
	metalMap["metal"] = Sensors.Skynet.GetTeamMetal()
	local radars = unitsMap["radars"]
	local lugers = unitsMap["lugers"]
	local atlases = unitsMap["atlases"]

	checkUnit(list, radars, 1, "armseer", metalMap, prices)
	checkUnit(list, lugers, 16, "armmart", metalMap, prices)
	checkUnit(list, atlases, 5, "armatlas", metalMap, prices)

	return list
end