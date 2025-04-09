local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 4,["15"] = 4,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 4,["21"] = 11,["22"] = 12,["23"] = 12,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 21,["31"] = 21,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 30,["36"] = 21,["37"] = 21,["38"] = 38,["39"] = 38,["40"] = 40,["41"] = 41,["42"] = 42,["43"] = 38,["44"] = 38,["45"] = 49,["46"] = 50,["48"] = 12,["49"] = 12,["50"] = 58,["51"] = 58,["52"] = 11,["53"] = 61,["54"] = 62,["55"] = 63,["56"] = 61,["57"] = 66,["58"] = 67,["59"] = 67,["60"] = 67,["61"] = 68,["62"] = 69,["63"] = 70,["64"] = 71,["66"] = 66,["67"] = 75,["68"] = 76,["69"] = 77,["70"] = 78,["72"] = 80,["73"] = 81,["74"] = 82,["75"] = 82,["76"] = 82,["77"] = 82,["79"] = 86,["80"] = 87,["81"] = 88,["82"] = 89,["83"] = 89,["84"] = 89,["85"] = 89,["87"] = 91,["88"] = 92,["89"] = 93,["90"] = 93,["91"] = 93,["92"] = 93,["94"] = 95,["95"] = 96,["96"] = 75,["97"] = 99,["98"] = 100,["99"] = 102,["100"] = 104,["101"] = 105,["102"] = 106,["103"] = 107,["106"] = 111,["107"] = 112,["108"] = 113,["109"] = 114,["110"] = 114,["111"] = 114,["112"] = 114,["113"] = 114,["114"] = 114,["115"] = 114,["116"] = 121,["117"] = 121,["118"] = 121,["119"] = 121,["120"] = 121,["121"] = 121,["122"] = 121,["123"] = 99,["124"] = 129,["125"] = 130,["126"] = 131,["127"] = 132,["130"] = 135,["131"] = 136,["132"] = 137,["133"] = 137,["134"] = 137,["135"] = 137,["136"] = 129,["137"] = 140,["138"] = 144,["139"] = 145,["140"] = 148,["141"] = 149,["144"] = 152,["145"] = 153,["146"] = 154,["147"] = 154,["148"] = 154,["149"] = 154,["150"] = 140,["151"] = 156,["152"] = 157,["153"] = 159,["154"] = 160,["157"] = 163,["158"] = 164,["159"] = 164,["160"] = 164,["161"] = 164,["162"] = 164,["163"] = 164,["164"] = 164,["165"] = 164,["166"] = 172,["167"] = 172,["168"] = 174,["169"] = 175,["172"] = 178,["173"] = 179,["174"] = 180,["175"] = 181,["176"] = 182,["177"] = 187,["179"] = 189,["180"] = 189,["181"] = 189,["182"] = 189,["183"] = 189,["184"] = 189,["185"] = 189,["187"] = 172,["188"] = 172,["189"] = 172,["190"] = 200,["191"] = 205,["192"] = 156});
local ____exports = {}
local ____Sniper = require("ai.Sniper")
local sniper_ai = ____Sniper.sniper_ai
local ____creeps = require("units.creeps")
local CreepSpawn = ____creeps.CreepSpawn
____exports.Lasthit1V1 = __TS__Class()
local Lasthit1V1 = ____exports.Lasthit1V1
Lasthit1V1.name = "Lasthit1V1"
function Lasthit1V1.prototype.____constructor(self)
    self.context = {}
    self.spawns = {}
    self.listeners = {}
end
function Lasthit1V1.prototype.listenEvents(self)
    local id = CustomGameEventManager:RegisterListener(
        "game_launch.1v1",
        function(userId, event)
            print("game_launch.1v1 EVENT AAA", event.isSniper)
            local playerController = PlayerResource:GetPlayer(event.PlayerID)
            if playerController then
                self.controller = playerController
                self:launch(playerController, event)
                local relaunchId = CustomGameEventManager:RegisterListener(
                    "game_relaunch.1v1",
                    function(userId, event)
                        self:reLaunch(playerController, event)
                        CustomGameEventManager:Send_ServerToPlayer(playerController, "game_relaunch.1v1.success", {data = nil})
                        CustomGameEventManager:Send_ServerToPlayer(playerController, "game_launch.1v1.success", {data = nil})
                    end
                )
                local finishId = CustomGameEventManager:RegisterListener(
                    "game_finish.1v1",
                    function(userId, event)
                        self:finish()
                        CustomGameEventManager:Send_ServerToPlayer(playerController, "game_finish.1v1.success", {data = nil})
                    end
                )
                __TS__ArrayConcat(self.listeners, {relaunchId, finishId})
                CustomGameEventManager:Send_ServerToPlayer(playerController, "game_launch.1v1.success", {data = nil})
            end
        end
    )
    local ____self_listeners_0 = self.listeners
    ____self_listeners_0[#____self_listeners_0 + 1] = id
end
function Lasthit1V1.prototype.reLaunch(self, controller, options)
    self:finish()
    self:launch(controller, options)
end
function Lasthit1V1.prototype.launch(self, controller, options)
    local ____options_1 = options
    local isSniper = ____options_1.isSniper
    local terrain = ____options_1.terrain
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
