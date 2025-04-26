local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 14,["31"] = 18,["34"] = 21,["35"] = 22,["37"] = 6,["38"] = 26,["39"] = 27,["40"] = 28,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 28,["45"] = 28,["46"] = 26,["47"] = 34,["48"] = 35,["49"] = 34,["50"] = 38,["51"] = 39,["52"] = 38,["53"] = 42,["54"] = 43,["55"] = 42,["56"] = 46,["57"] = 47,["58"] = 46,["59"] = 50,["60"] = 51,["61"] = 50,["62"] = 5,["63"] = 5,["64"] = 5,["65"] = 4,["68"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
____exports.item_custom_qblade = __TS__Class()
local item_custom_qblade = ____exports.item_custom_qblade
item_custom_qblade.name = "item_custom_qblade"
__TS__ClassExtends(item_custom_qblade, BaseItem)
function item_custom_qblade.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if target then
        local targetName = target:GetUnitName()
        if targetName == "npc_dota_observer_wards" then
            target:Kill(nil, nil)
            eventBus:emit(
                "qblade.hit",
                {
                    custom = "hit",
                    index = target:GetEntityIndex()
                }
            )
            caster:EmitSound("frog")
        end
    else
        eventBus:emit("qblade.miss", {custom = "miss"})
        caster:EmitSound("sheep")
    end
end
function item_custom_qblade.prototype.GetBehavior(self)
    return bit.bor(
        bit.bor(
            bit.bor(DOTA_ABILITY_BEHAVIOR_UNIT_TARGET, DOTA_ABILITY_BEHAVIOR_POINT),
            DOTA_ABILITY_BEHAVIOR_IMMEDIATE
        ),
        DOTA_ABILITY_BEHAVIOR_IGNORE_BACKSWING
    )
end
function item_custom_qblade.prototype.GetCastRange(self)
    return 1500
end
function item_custom_qblade.prototype.GetCooldown(self)
    return 0
end
function item_custom_qblade.prototype.GetManaCost(self)
    return 0
end
function item_custom_qblade.prototype.GetAbilityTargetTeam(self)
    return DOTA_UNIT_TARGET_TEAM_BOTH
end
function item_custom_qblade.prototype.GetAbilityTargetType(self)
    return DOTA_UNIT_TARGET_ALL
end
item_custom_qblade = __TS__Decorate(
    item_custom_qblade,
    item_custom_qblade,
    {registerAbility(nil)},
    {kind = "class", name = "item_custom_qblade"}
)
____exports.item_custom_qblade = item_custom_qblade
return ____exports
