local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 3,["11"] = 2,["12"] = 5,["13"] = 6,["14"] = 5});
local ____exports = {}
____exports.Sniper = __TS__Class()
local Sniper = ____exports.Sniper
Sniper.name = "Sniper"
function Sniper.prototype.____constructor(self)
    self:init()
end
function Sniper.prototype.init(self)
    print("Sniper inited")
end
return ____exports
