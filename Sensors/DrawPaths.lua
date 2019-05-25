local sensorInfo = {
	name = "DrawPaths",
	desc = "Sends data to example debug widget",
	author = "Azghort",
	date = "2019-05-16"
}

VFS.Include("modules.lua") 
VFS.Include(modules.attach.data.path .. modules.attach.data.head)

attach.Module(modules, "message") 

local EVAL_PERIOD_DEFAULT = -1 

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

return function(points)
	local ID = 1
	for point, pred in pairs(points) do
		ID = ID+1
		if (Script.LuaUI('drawPaths_update')) then
			Script.LuaUI.drawPaths_update(
				ID, 
				{	
					startPos = point,
					endPos = pred
				}
			)
		end
		
	end
	return 	{1, -- key
				{	-- data
					startPos = 1,
					endPos = next(points)
				}
			}
end