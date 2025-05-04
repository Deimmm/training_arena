local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 4,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 6,["20"] = 6,["21"] = 6,["22"] = 6,["23"] = 6,["24"] = 6,["25"] = 6,["26"] = 5,["27"] = 17,["28"] = 18,["29"] = 17,["30"] = 20,["31"] = 21,["32"] = 20,["33"] = 23,["34"] = 24,["35"] = 23,["36"] = 27,["37"] = 28,["38"] = 27,["39"] = 30,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 32,["46"] = 30,["47"] = 36,["48"] = 37,["49"] = 36,["50"] = 39,["51"] = 40,["52"] = 39,["53"] = 4,["54"] = 4,["55"] = 4,["56"] = 3,["59"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.vector_aim_hero_boost = __TS__Class()
local vector_aim_hero_boost = ____exports.vector_aim_hero_boost
vector_aim_hero_boost.name = "vector_aim_hero_boost"
__TS__ClassExtends(vector_aim_hero_boost, BaseModifier)
function vector_aim_hero_boost.prototype.DeclareFunctions(self)
    return {
        MODIFIER_PROPERTY_CAST_RANGE_BONUS,
        MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
        MODIFIER_PROPERTY_COOLDOWN_REDUCTION_CONSTANT,
        MODIFIER_PROPERTY_MANACOST_REDUCTION_CONSTANT,
        MODIFIER_EVENT_ON_ABILITY_START,
        MODIFIER_PROPERTY_CASTTIME_PERCENTAGE,
        MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE
    }
end
function vector_aim_hero_boost.prototype.GetModifierCastRangeBonus(self)
    return 3000
end
function vector_aim_hero_boost.prototype.GetModifierManacostReduction_Constant(self, event)
    return 100
end
function vector_aim_hero_boost.prototype.GetModifierCooldownReduction_Constant(self, event)
    return 99
end
function vector_aim_hero_boost.prototype.GetModifierSpellAmplify_Percentage(self, event)
    return 3000
end
function vector_aim_hero_boost.prototype.OnAbilityStart(self, event)
    if not __TS__StringIncludes(
        event.target:GetClassname(),
        "tree"
    ) then
        event.unit:Interrupt()
    end
end
function vector_aim_hero_boost.prototype.GetModifierTotalPercentageManaRegen(self)
    return 1000
end
function vector_aim_hero_boost.prototype.GetModifierPercentageCasttime(self, event)
    return 100
end
vector_aim_hero_boost = __TS__Decorate(
    vector_aim_hero_boost,
    vector_aim_hero_boost,
    {registerModifier(nil)},
    {kind = "class", name = "vector_aim_hero_boost"}
)
____exports.vector_aim_hero_boost = vector_aim_hero_boost
return ____exports
