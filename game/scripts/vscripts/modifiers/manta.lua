local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 6,["19"] = 6,["20"] = 6,["21"] = 6,["22"] = 6,["23"] = 5,["24"] = 15,["25"] = 16,["26"] = 15,["27"] = 18,["28"] = 19,["29"] = 18,["30"] = 21,["31"] = 22,["32"] = 21,["33"] = 25,["34"] = 26,["35"] = 25,["36"] = 29,["37"] = 30,["40"] = 31,["41"] = 32,["44"] = 34,["45"] = 35,["48"] = 37,["49"] = 29,["50"] = 4,["51"] = 4,["52"] = 4,["53"] = 3,["56"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.manta_modifier = __TS__Class()
local manta_modifier = ____exports.manta_modifier
manta_modifier.name = "manta_modifier"
__TS__ClassExtends(manta_modifier, BaseModifier)
function manta_modifier.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_STATUS_RESISTANCE,
        MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE,
        MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_EVENT_ON_MODIFIER_ADDED
    }
end
function manta_modifier.prototype.GetModifierConstantHealthRegen(self)
    return 50
end
function manta_modifier.prototype.GetModifierIncomingDamage_Percentage(self)
    return -80
end
function manta_modifier.prototype.GetModifierMoveSpeed_Absolute(self)
    return 200
end
function manta_modifier.prototype.GetModifierStatusResistance(self)
    return 80
end
function manta_modifier.prototype.OnModifierAdded(self, event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if not event or event.unit ~= parent then
        return
    end
    local added = event.added_buff
    if not added or not added:IsDebuff() then
        return
    end
    print("[DODGE_TRAINING] HIT BY SPELL}")
end
manta_modifier = __TS__Decorate(
    manta_modifier,
    manta_modifier,
    {registerModifier(nil)},
    {kind = "class", name = "manta_modifier"}
)
____exports.manta_modifier = manta_modifier
return ____exports
