local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 2});
local ____exports = {}
____exports.Geometry = __TS__Class()
local Geometry = ____exports.Geometry
Geometry.name = "Geometry"
function Geometry.prototype.____constructor(self)
end
function Geometry.getTriangleOppsiteAngle(self, a, b)
    local sinA = a / b
    local angleARad = math.asin(sinA)
    return angleARad * (180 * math.pi)
end
return ____exports
