local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["21"] = 5,["22"] = 7,["23"] = 9,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 12,["29"] = 18,["30"] = 19,["31"] = 20,["32"] = 20,["33"] = 20,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 24,["39"] = 18,["40"] = 27,["41"] = 28,["42"] = 29,["43"] = 30,["45"] = 32,["46"] = 33,["47"] = 34,["48"] = 34,["49"] = 34,["50"] = 34,["52"] = 38,["53"] = 39,["54"] = 40,["55"] = 41,["56"] = 41,["57"] = 41,["58"] = 41,["60"] = 43,["61"] = 44,["62"] = 45,["63"] = 45,["64"] = 45,["65"] = 45,["67"] = 47,["68"] = 48,["69"] = 27,["70"] = 51,["71"] = 52,["72"] = 54,["73"] = 56,["74"] = 57,["75"] = 58,["76"] = 59,["79"] = 63,["80"] = 64,["81"] = 65,["82"] = 66,["83"] = 66,["84"] = 66,["85"] = 66,["86"] = 66,["87"] = 66,["88"] = 66,["89"] = 73,["90"] = 73,["91"] = 73,["92"] = 73,["93"] = 73,["94"] = 73,["95"] = 73,["96"] = 51,["97"] = 81,["98"] = 82,["99"] = 83,["100"] = 84,["103"] = 87,["104"] = 88,["105"] = 89,["106"] = 89,["107"] = 89,["108"] = 89,["109"] = 81,["110"] = 92,["111"] = 96,["112"] = 97,["113"] = 100,["114"] = 101,["117"] = 104,["118"] = 105,["119"] = 106,["120"] = 106,["121"] = 106,["122"] = 106,["123"] = 92,["124"] = 108,["125"] = 109,["126"] = 111,["127"] = 112,["130"] = 115,["131"] = 116,["132"] = 116,["133"] = 116,["134"] = 116,["135"] = 116,["136"] = 116,["137"] = 116,["138"] = 116,["139"] = 124,["140"] = 124,["141"] = 126,["142"] = 127,["145"] = 130,["146"] = 131,["147"] = 132,["148"] = 133,["149"] = 134,["150"] = 139,["153"] = 124,["154"] = 124,["155"] = 124,["156"] = 145,["157"] = 150,["158"] = 108});
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
function Lasthit1V1.prototype.relaunch(self, options)
    DeepPrintTable(options)
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
            end
        end,
        self.context
    )
    sniper_hero:AddNewModifier(nil, nil, sniper_ai.name, {damage = 62, base_attack_time = 1, spawn_name = sniper_spawn_name})
    return sniper_hero
end
return ____exports
