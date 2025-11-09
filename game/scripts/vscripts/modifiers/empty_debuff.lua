local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["22"] = 12,["23"] = 13,["26"] = 15,["27"] = 16,["28"] = 9,["29"] = 4,["30"] = 4,["31"] = 4,["32"] = 3,["35"] = 4,["36"] = 22,["37"] = 23,["38"] = 22,["39"] = 23,["40"] = 24,["41"] = 25,["42"] = 24,["43"] = 27,["44"] = 28,["45"] = 27,["46"] = 23,["47"] = 23,["48"] = 23,["49"] = 22,["52"] = 23});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.empty_debuff_applier = __TS__Class()
local empty_debuff_applier = ____exports.empty_debuff_applier
empty_debuff_applier.name = "empty_debuff_applier"
__TS__ClassExtends(empty_debuff_applier, BaseModifier)
function empty_debuff_applier.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function empty_debuff_applier.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if event.attacker:GetName() ~= parent:GetName() then
        return
    end
    local duration = 1
    event.unit:AddNewModifier(parent, event.inflictor, ____exports.empty_debuff.name, {duration = duration})
end
empty_debuff_applier = __TS__Decorate(
    empty_debuff_applier,
    empty_debuff_applier,
    {registerModifier(nil)},
    {kind = "class", name = "empty_debuff_applier"}
)
____exports.empty_debuff_applier = empty_debuff_applier
____exports.empty_debuff = __TS__Class()
local empty_debuff = ____exports.empty_debuff
empty_debuff.name = "empty_debuff"
__TS__ClassExtends(empty_debuff, BaseModifier)
function empty_debuff.prototype.IsPurgable(self)
    return true
end
function empty_debuff.prototype.IsDebuff(self)
    return true
end
empty_debuff = __TS__Decorate(
    empty_debuff,
    empty_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "empty_debuff"}
)
____exports.empty_debuff = empty_debuff
return ____exports
