local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 2,["14"] = 3,["15"] = 9,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 18,["20"] = 20,["21"] = 9,["22"] = 23,["23"] = 24,["24"] = 23,["25"] = 27,["26"] = 28,["29"] = 29,["30"] = 30,["33"] = 31,["34"] = 32,["35"] = 33,["37"] = 27,["38"] = 37,["39"] = 38,["40"] = 37,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 47,["45"] = 47,["46"] = 47,["47"] = 46,["48"] = 48,["49"] = 48,["50"] = 48,["51"] = 48,["52"] = 48,["53"] = 45,["54"] = 3,["55"] = 3,["56"] = 3,["57"] = 2,["60"] = 3});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.soft_wall = __TS__Class()
local soft_wall = ____exports.soft_wall
soft_wall.name = "soft_wall"
__TS__ClassExtends(soft_wall, BaseModifier)
function soft_wall.prototype.OnCreated(self, opt)
    self.minX = opt.minX
    self.maxX = opt.maxX
    self.minY = opt.minY + 50
    self.maxY = opt.maxY
    print(self.minX, self.maxX, self.minY, self.maxY)
end
function soft_wall.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_UNIT_MOVED}
end
function soft_wall.prototype.OnUnitMoved(self, event)
    if not IsServer() then
        return
    end
    local unit = self:GetParent()
    if event.unit ~= unit then
        return
    end
    if self:isOutside(unit:GetAbsOrigin()) then
        local tp_pos = self:nearestOnBox(unit:GetAbsOrigin())
        unit:SetAbsOrigin(tp_pos)
    end
end
function soft_wall.prototype.isOutside(self, pos)
    return pos.x < self.minX or pos.x > self.maxX or pos.y < self.minY or pos.y > self.maxY
end
function soft_wall.prototype.nearestOnBox(self, p)
    local function clamp(____, v, lo, hi)
        return math.max(
            lo,
            math.min(hi, v)
        )
    end
    return Vector(
        clamp(nil, p.x, self.minX, self.maxX),
        clamp(nil, p.y, self.minY, self.maxY),
        p.z
    )
end
soft_wall = __TS__Decorate(
    soft_wall,
    soft_wall,
    {registerModifier(nil)},
    {kind = "class", name = "soft_wall"}
)
____exports.soft_wall = soft_wall
return ____exports
