local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 3,["13"] = 2,["14"] = 3,["15"] = 9,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 18,["20"] = 20,["21"] = 9,["22"] = 23,["23"] = 24,["24"] = 23,["25"] = 27,["26"] = 28,["29"] = 29,["30"] = 30,["33"] = 32,["34"] = 33,["35"] = 34,["36"] = 35,["39"] = 27,["40"] = 40,["41"] = 41,["42"] = 40,["43"] = 48,["44"] = 49,["45"] = 50,["46"] = 50,["47"] = 50,["48"] = 50,["49"] = 49,["50"] = 51,["51"] = 51,["52"] = 51,["53"] = 51,["54"] = 51,["55"] = 48,["56"] = 3,["57"] = 3,["58"] = 3,["59"] = 2,["62"] = 3});
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
    return {MODIFIER_EVENT_ON_UNIT_MOVED, MODIFIER_EVENT_ON_ORDER}
end
function soft_wall.prototype.OnUnitMoved(self, event)
    if not IsServer() then
        return
    end
    local unit = self:GetParent()
    if event.unit ~= unit then
        return
    end
    if event.new_pos then
        if self:isOutside(event.new_pos) then
            local tp_pos = self:nearestOnBox(event.new_pos)
            unit:SetAbsOrigin(tp_pos)
        end
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
