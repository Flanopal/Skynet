local sensorInfo = {
	name = "CheckUnitsAlive",
	desc = "Go through table and erase dead units",
	author = "Flanopal",
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

return function(table)
	for ID, _ in pairs(table) do
		if Spring.GetUnitIsDead(ID) ~= false then
			table[ID] = nil
		end
	end
end