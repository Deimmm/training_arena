local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 2,["12"] = 5,["13"] = 5,["15"] = 7,["16"] = 8,["19"] = 11,["20"] = 12,["21"] = 2,["22"] = 15,["23"] = 15,["24"] = 15,["26"] = 16,["27"] = 17,["28"] = 15});
local ____exports = {}
____exports.Utils = __TS__Class()
local Utils = ____exports.Utils
Utils.name = "Utils"
function Utils.prototype.____constructor(self)
end
function Utils.moveEntityToEntity(self, entity, target, offset)
    if offset == nil then
        offset = Vector()
    end
    local targetEnt = Entities:FindByName(nil, target)
    if not targetEnt then
        return
    end
    local vector = targetEnt:GetAbsOrigin():__add(offset)
    entity:SetAbsOrigin(vector)
end
function Utils.randomInt(self, min, max, step)
    if step == nil then
        step = 1
    end
    local range = math.floor((max - min) / step)
    return math.floor(math.random() * (range + 1)) * step + min
end
return ____exports
