local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["21"] = 5,["22"] = 7,["23"] = 9,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 12,["28"] = 17,["29"] = 18,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 20,["34"] = 21,["35"] = 22,["36"] = 23,["38"] = 17,["39"] = 26,["40"] = 27,["41"] = 28,["42"] = 29,["44"] = 31,["45"] = 32,["46"] = 33,["47"] = 33,["48"] = 33,["49"] = 33,["51"] = 37,["52"] = 38,["53"] = 39,["54"] = 40,["55"] = 40,["56"] = 40,["57"] = 40,["59"] = 42,["60"] = 43,["61"] = 44,["62"] = 44,["63"] = 44,["64"] = 44,["66"] = 46,["67"] = 47,["68"] = 26,["69"] = 50,["70"] = 51,["71"] = 53,["72"] = 55,["73"] = 56,["74"] = 57,["75"] = 58,["78"] = 62,["79"] = 63,["80"] = 64,["81"] = 65,["82"] = 65,["83"] = 65,["84"] = 65,["85"] = 65,["86"] = 65,["87"] = 65,["88"] = 72,["89"] = 72,["90"] = 72,["91"] = 72,["92"] = 72,["93"] = 72,["94"] = 72,["95"] = 50,["96"] = 80,["97"] = 81,["98"] = 82,["99"] = 83,["102"] = 86,["103"] = 87,["104"] = 88,["105"] = 88,["106"] = 88,["107"] = 88,["108"] = 80,["109"] = 91,["110"] = 95,["111"] = 96,["112"] = 99,["113"] = 100,["116"] = 103,["117"] = 104,["118"] = 105,["119"] = 105,["120"] = 105,["121"] = 105,["122"] = 91,["123"] = 107,["124"] = 108,["125"] = 110,["126"] = 111,["129"] = 114,["130"] = 115,["131"] = 115,["132"] = 115,["133"] = 115,["134"] = 115,["135"] = 115,["136"] = 115,["137"] = 115,["138"] = 123,["139"] = 123,["140"] = 125,["141"] = 126,["144"] = 129,["145"] = 130,["146"] = 131,["147"] = 132,["148"] = 133,["149"] = 138,["151"] = 140,["152"] = 140,["153"] = 140,["154"] = 140,["155"] = 140,["156"] = 140,["157"] = 140,["159"] = 123,["160"] = 123,["161"] = 123,["162"] = 151,["163"] = 156,["164"] = 107});
local ____exports = {}
local ____Sniper = require("ai.Sniper")
local sniper_ai = ____Sniper.sniper_ai
local _____421reeps = require("units.Сreeps")
local CreepSpawn = _____421reeps.CreepSpawn
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
____exports.Lasthit1V1 = __TS__Class()
local Lasthit1V1 = ____exports.Lasthit1V1
Lasthit1V1.name = "Lasthit1V1"
__TS__ClassExtends(Lasthit1V1, GameBase)
function Lasthit1V1.prototype.____constructor(self)
    GameBase.prototype.____constructor(self, "1v1")
    self.spawns = {}
end
function Lasthit1V1.prototype.reLaunch(self, options)
    self:finish()
    self:launch(options)
end
function Lasthit1V1.prototype.launch(self, options)
    local controller = self.controller
    local ____options_0 = options
    local isSniper = ____options_0.isSniper
    local terrain = ____options_0.terrain
    self:moveHero(controller, terrain)
    self:initCreepSpawns(terrain)
    if isSniper == 1 then
        self.sniper = self:createSniper(terrain)
    end
end
function Lasthit1V1.prototype.finish(self)
    local sniper = self.sniper
    if sniper and not sniper:IsNull() then
        sniper:Destroy()
    end
    local listeners = self.listeners
    if #listeners > 0 then
        __TS__ArrayForEach(
            listeners,
            function(____, listener) return CustomGameEventManager:UnregisterListener(listener) end
        )
    end
    StopListeningToAllGameEvents(self.context)
    local spawns = self.spawns
    if #spawns > 0 then
        __TS__ArrayForEach(
            spawns,
            function(____, spawn) return spawn:stopSpawn() end
        )
    end
    local creeps = Entities:FindAllByClassname("npc_dota_creep_lane")
    if creeps and #creeps > 0 then
        __TS__ArrayForEach(
            creeps,
            function(____, creep) return creep:Destroy() end
        )
    end
    self:returnHero()
    self:listenEvents()
end
function Lasthit1V1.prototype.initCreepSpawns(self, terrain)
    local padawan_spawn_name = terrain == "plain" and "radiant_creep_spawn_plain" or "radiant_creep_spawn"
    local sniper_spawn_name = terrain == "plain" and "dire_creep_spawn_plain" or "dire_creep_spawn"
    local padawan_spawn = Entities:FindByName(nil, padawan_spawn_name)
    local sniper_spawn = Entities:FindByName(nil, sniper_spawn_name)
    if not padawan_spawn or not sniper_spawn then
        print("WARNING: ", "Cant find spawns")
        return
    end
    local badguys_spawn = __TS__New(CreepSpawn)
    local goodguys_spawn = __TS__New(CreepSpawn)
    self.spawns = __TS__ArrayConcat(self.spawns, {goodguys_spawn, badguys_spawn})
    badguys_spawn:startSpawn(
        padawan_spawn:GetAbsOrigin(),
        sniper_spawn:GetAbsOrigin(),
        {melee = 3, range = 1, business = 0},
        30,
        DOTA_TEAM_GOODGUYS
    )
    goodguys_spawn:startSpawn(
        sniper_spawn:GetAbsOrigin(),
        padawan_spawn:GetAbsOrigin(),
        {melee = 3, range = 1, business = 0},
        30,
        DOTA_TEAM_BADGUYS
    )
end
function Lasthit1V1.prototype.returnHero(self)
    local hero = self.controller:GetAssignedHero()
    local game_start = Entities:FindByName(nil, "start")
    if not game_start then
        return
    end
    local vector = game_start:GetAbsOrigin()
    hero:SetAbsOrigin(vector)
    CenterCameraOnUnit(
        self.controller:GetPlayerID(),
        hero
    )
end
function Lasthit1V1.prototype.moveHero(self, controller, terrain)
    local hero = controller:GetAssignedHero()
    local padawan_spawn_name = terrain == "plain" and "padawan_spawn_plain" or "padawan_spawn"
    local padawan_spawn = Entities:FindByName(nil, padawan_spawn_name)
    if not padawan_spawn then
        return
    end
    local vector = padawan_spawn:GetAbsOrigin()
    hero:SetAbsOrigin(vector)
    CenterCameraOnUnit(
        controller:GetPlayerID(),
        hero
    )
end
function Lasthit1V1.prototype.createSniper(self, terrain)
    local sniper_spawn_name = terrain == "plain" and "sniper_spawn_plain" or "sniper_spawn"
    local sniper_spawn = Entities:FindByName(nil, sniper_spawn_name)
    if not sniper_spawn then
        return
    end
    local spawn_vector = sniper_spawn:GetAbsOrigin()
    local sniper_hero = CreateUnitByName(
        "npc_dota_hero_sniper",
        spawn_vector,
        true,
        nil,
        nil,
        DOTA_TEAM_BADGUYS
    )
    ListenToGameEvent(
        "entity_killed",
        function(____, event)
            if self.sniper:IsNull() then
                return
            end
            if event.entindex_attacker == sniper_hero:GetEntityIndex() then
                local entity = EntIndexToHScript(event.entindex_killed)
                if entity then
                    local position = entity:GetAbsOrigin()
                    local particle = ParticleManager:CreateParticle("particles/msg_fx/msg_death.vpcf", 8, nil)
                    ParticleManager:SetParticleControl(particle, 0, position)
                end
                print(
                    "entity_killed ",
                    "KILLED BY: ",
                    event.entindex_attacker,
                    "SNIPERID",
                    sniper_hero:GetEntityIndex()
                )
            end
        end,
        self.context
    )
    sniper_hero:AddNewModifier(nil, nil, sniper_ai.name, {damage = 62, base_attack_time = 1, spawn_name = sniper_spawn_name})
    return sniper_hero
end
return ____exports
