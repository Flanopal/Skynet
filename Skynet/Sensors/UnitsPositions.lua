local sensorInfo = {
	name = "UnitsPositions",
	desc = "Returns table with fields \"positions\" and \"ids\" containing info about units of given type",
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

return function(type)
	positions = {}
	ids = {}
	ret = {}
	for _, ID in ipairs(units) do
		local unitDefID = Spring.GetUnitDefID(ID)
        local name = UnitDefs[unitDefID].name
        if name == type then
            local x, y, z = Spring.GetUnitPosition(ID)
			positions[#positions + 1] = Vec3(x, y, z)
			ids[#ids + 1] = ID
        end
	end
	ret["positions"] = positions
	ret["ids"] = ids
    return ret
end