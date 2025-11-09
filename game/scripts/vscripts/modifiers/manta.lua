local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 5,["16"] = 4,["17"] = 5,["19"] = 5,["20"] = 6,["21"] = 12,["22"] = 4,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 14,["31"] = 13,["32"] = 23,["33"] = 24,["34"] = 23,["35"] = 26,["36"] = 27,["37"] = 26,["38"] = 29,["39"] = 30,["40"] = 29,["41"] = 33,["42"] = 34,["43"] = 33,["44"] = 37,["45"] = 38,["48"] = 39,["49"] = 40,["50"] = 42,["53"] = 43,["54"] = 44,["55"] = 45,["56"] = 47,["57"] = 50,["58"] = 51,["59"] = 52,["60"] = 53,["61"] = 54,["62"] = 55,["63"] = 56,["64"] = 57,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["71"] = 37,["72"] = 5,["73"] = 5,["74"] = 5,["75"] = 4,["78"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
local ____empty_debuff = require("modifiers.empty_debuff")
local empty_debuff = ____empty_debuff.empty_debuff
____exports.manta_modifier = __TS__Class()
local manta_modifier = ____exports.manta_modifier
manta_modifier.name = "manta_modifier"
__TS__ClassExtends(manta_modifier, BaseModifier)
function manta_modifier.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.special_abilities = {"axe_berserkers_call", "dark_willow_terrorize", "warlock_rain_of_chaos"}
    self.index = 0
end
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
    local ability = event.added_buff:GetAbility()
    if not event or event.unit ~= parent or not ability then
        return
    end
    local ability_name = ability:GetDebugName()
    local added = event.added_buff
    local added_name = added:GetName()
    if added_name == empty_debuff.name or __TS__ArrayIncludes(self.special_abilities, ability_name) then
        print("[DODGE_TRAINING] HIT BY SPELL}")
        local time = LocalTime()
        GameRules:GetTimeOfDay()
        local index = self.index
        self.index = self.index + 1
        local hours = time.Hours
        local min = time.Minutes
        local sec = time.Seconds
        GameRules:SendCustomMessage(
            ((("[" .. tostring(index)) .. "]<b> You didn't dodge ") .. ability_name) .. " :( </b>",
            0,
            1
        )
    end
end
manta_modifier = __TS__Decorate(
    manta_modifier,
    manta_modifier,
    {registerModifier(nil)},
    {kind = "class", name = "manta_modifier"}
)
____exports.manta_modifier = manta_modifier
return ____exports
