-- get madatory module operators
VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

-- get other madatory dependencies
attach.Module(modules, "message") -- communication backend load

function getInfo()
    return {
        onNoUnits = SUCCESS, -- instant success
        tooltip = "Buy units in params",
        parameterDefs = {
            { 
                name = "units",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "",
            }
        }
    }
end

function Run(self, units, parameter)
    local list = parameter.units
    for i=1,#list do
        message.SendRules({
            subject = "swampdota_buyUnit",
            data = {
                unitName = list[i]
            },
        })
    end

    return SUCCESS
end


function Reset(self)
    return self
end