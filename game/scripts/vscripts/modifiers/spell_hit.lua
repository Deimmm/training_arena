local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 6,["20"] = 7,["21"] = 4,["22"] = 10,["23"] = 11,["24"] = 10,["25"] = 13,["26"] = 14,["27"] = 13,["28"] = 16,["29"] = 17,["30"] = 16,["31"] = 19,["32"] = 20,["33"] = 19,["34"] = 23,["35"] = 24,["38"] = 26,["39"] = 27,["40"] = 28,["41"] = 29,["42"] = 31,["45"] = 32,["48"] = 34,["51"] = 35,["54"] = 38,["57"] = 23,["58"] = 5,["59"] = 5,["60"] = 5,["61"] = 4,["64"] = 5,["65"] = 49,["66"] = 50,["67"] = 49,["68"] = 50,["69"] = 51,["70"] = 52,["71"] = 51,["72"] = 55,["73"] = 56,["76"] = 58,["77"] = 59,["78"] = 60,["79"] = 62,["80"] = 62,["81"] = 62,["83"] = 62,["85"] = 62,["86"] = 63,["87"] = 63,["88"] = 63,["90"] = 63,["92"] = 63,["93"] = 64,["94"] = 64,["95"] = 64,["97"] = 64,["99"] = 64,["100"] = 70,["101"] = 70,["102"] = 71,["103"] = 72,["104"] = 72,["105"] = 72,["107"] = 72,["109"] = 70,["110"] = 70,["111"] = 70,["112"] = 70,["113"] = 70,["114"] = 70,["115"] = 70,["116"] = 70,["117"] = 70,["118"] = 70,["119"] = 55,["120"] = 50,["121"] = 50,["122"] = 50,["123"] = 49,["126"] = 50});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.spell_hit_modifier = __TS__Class()
local spell_hit_modifier = ____exports.spell_hit_modifier
spell_hit_modifier.name = "spell_hit_modifier"
__TS__ClassExtends(spell_hit_modifier, BaseModifier)
function spell_hit_modifier.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.targetModifier = ____exports.spell_hitted_modifier.name
    self.applyDuration = 1
end
function spell_hit_modifier.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_TAKEDAMAGE}
end
function spell_hit_modifier.prototype.IsHidden(self)
    return true
end
function spell_hit_modifier.prototype.IsPurgable(self)
    return false
end
function spell_hit_modifier.prototype.RemoveOnDeath(self)
    return false
end
function spell_hit_modifier.prototype.OnTakeDamage(self, event)
    if not IsServer() then
        return
    end
    local victim = event.unit
    local attacker = event.attacker
    local inflictor = event.inflictor
    local dmgCat = event.damage_category
    if attacker ~= self:GetParent() then
        return
    end
    if not victim or victim:IsNull() then
        return
    end
    if not inflictor then
        return
    end
    if dmgCat ~= DOTA_DAMAGE_CATEGORY_SPELL then
        return
    end
    if self.onlyTargetEntindex ~= nil and victim:entindex() ~= self.onlyTargetEntindex then
        return
    end
end
spell_hit_modifier = __TS__Decorate(
    spell_hit_modifier,
    spell_hit_modifier,
    {registerModifier(nil)},
    {kind = "class", name = "spell_hit_modifier"}
)
____exports.spell_hit_modifier = spell_hit_modifier
____exports.spell_hitted_modifier = __TS__Class()
local spell_hitted_modifier = ____exports.spell_hitted_modifier
spell_hitted_modifier.name = "spell_hitted_modifier"
__TS__ClassExtends(spell_hitted_modifier, BaseModifier)
function spell_hitted_modifier.prototype.IsHidden(self)
    return false
end
function spell_hitted_modifier.prototype.OnCreated(self, _)
    if not IsServer() then
        return
    end
    local parent = self:GetParent()
    local caster = self:GetCaster()
    local ability = self:GetAbility()
    local ____caster_0
    if caster then
        ____caster_0 = caster:GetUnitName()
    else
        ____caster_0 = "unknown_caster"
    end
    local casterName = ____caster_0
    local ____parent_1
    if parent then
        ____parent_1 = parent:GetUnitName()
    else
        ____parent_1 = "unknown_victim"
    end
    local victimName = ____parent_1
    local ____ability_2
    if ability then
        ____ability_2 = ability:GetAbilityName()
    else
        ____ability_2 = "unknown_ability"
    end
    local abilityName = ____ability_2
    local ____eventBus_5 = eventBus
    local ____eventBus_emit_6 = eventBus.emit
    local ____temp_4 = parent:entindex()
    local ____caster_3
    if caster then
        ____caster_3 = caster:entindex()
    else
        ____caster_3 = -1
    end
    ____eventBus_emit_6(
        ____eventBus_5,
        "dodge_training_spell_hit",
        {
            victim_entindex = ____temp_4,
            caster_entindex = ____caster_3,
            ability_name = abilityName,
            timestamp = GameRules:GetDOTATime(false, false)
        }
    )
end
spell_hitted_modifier = __TS__Decorate(
    spell_hitted_modifier,
    spell_hitted_modifier,
    {registerModifier(nil)},
    {kind = "class", name = "spell_hitted_modifier"}
)
____exports.spell_hitted_modifier = spell_hitted_modifier
return ____exports
