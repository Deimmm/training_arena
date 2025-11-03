local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 11,["23"] = 13,["24"] = 15,["27"] = 17,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 9,["35"] = 4,["36"] = 4,["37"] = 4,["38"] = 3,["41"] = 4,["42"] = 24,["43"] = 25,["44"] = 24,["45"] = 25,["46"] = 26,["47"] = 27,["48"] = 26,["49"] = 30,["50"] = 31,["51"] = 30,["52"] = 34,["53"] = 35,["54"] = 34,["55"] = 25,["56"] = 25,["57"] = 25,["58"] = 24,["61"] = 25});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.empty_debuff_applier = __TS__Class()
local empty_debuff_applier = ____exports.empty_debuff_applier
empty_debuff_applier.name = "empty_debuff_applier"
__TS__ClassExtends(empty_debuff_applier, BaseModifier)
function empty_debuff_applier.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_DAMAGE_CALCULATED}
end
function empty_debuff_applier.prototype.OnDamageCalculated(self, event)
    DeepPrintTable(event)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    if event.attacker ~= parent then
        return
    end
    local duration = 1
    parent:AddNewModifier(
        parent,
        self:GetAbility(),
        "modifier_user_debuff",
        {duration = duration}
    )
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
function empty_debuff.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE}
end
function empty_debuff.prototype.GetModifierMoveSpeedBonus_Percentage(self)
    return 0
end
empty_debuff = __TS__Decorate(
    empty_debuff,
    empty_debuff,
    {registerModifier(nil)},
    {kind = "class", name = "empty_debuff"}
)
____exports.empty_debuff = empty_debuff
return ____exports
