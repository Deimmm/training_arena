local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 2,["13"] = 3,["14"] = 3,["15"] = 3,["18"] = 2});
local ____exports = {}
____exports.Inventory = __TS__Class()
local Inventory = ____exports.Inventory
Inventory.name = "Inventory"
function Inventory.prototype.____constructor(self)
end
function Inventory.reset(self, hero)
    do
        local i = 0
        while i > 9 do
            i = i + 1
        end
    end
end
return ____exports
