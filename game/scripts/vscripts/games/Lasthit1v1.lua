local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 4,["15"] = 4,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 4,["21"] = 11,["22"] = 12,["23"] = 12,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 21,["31"] = 21,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 21,["36"] = 21,["37"] = 33,["38"] = 33,["39"] = 35,["40"] = 36,["41"] = 37,["42"] = 33,["43"] = 33,["44"] = 44,["45"] = 45,["47"] = 12,["48"] = 12,["49"] = 53,["50"] = 53,["51"] = 11,["52"] = 56,["53"] = 57,["54"] = 58,["55"] = 56,["56"] = 61,["57"] = 62,["58"] = 63,["59"] = 64,["60"] = 65,["62"] = 61,["63"] = 69,["64"] = 70,["65"] = 71,["66"] = 72,["68"] = 74,["69"] = 75,["70"] = 76,["71"] = 76,["72"] = 76,["73"] = 76,["75"] = 80,["76"] = 81,["77"] = 82,["78"] = 83,["79"] = 83,["80"] = 83,["81"] = 83,["83"] = 85,["84"] = 86,["85"] = 87,["86"] = 87,["87"] = 87,["88"] = 87,["90"] = 89,["91"] = 90,["92"] = 69,["93"] = 93,["94"] = 94,["95"] = 95,["96"] = 96,["97"] = 97,["100"] = 101,["101"] = 102,["102"] = 103,["103"] = 104,["104"] = 104,["105"] = 104,["106"] = 104,["107"] = 104,["108"] = 104,["109"] = 104,["110"] = 111,["111"] = 111,["112"] = 111,["113"] = 111,["114"] = 111,["115"] = 111,["116"] = 111,["117"] = 93,["118"] = 119,["119"] = 120,["120"] = 121,["121"] = 122,["124"] = 125,["125"] = 126,["126"] = 127,["127"] = 127,["128"] = 127,["129"] = 127,["130"] = 119,["131"] = 129,["132"] = 130,["133"] = 131,["134"] = 132,["137"] = 135,["138"] = 136,["139"] = 137,["140"] = 137,["141"] = 137,["142"] = 137,["143"] = 129,["144"] = 139,["145"] = 140,["146"] = 141,["149"] = 144,["150"] = 145,["151"] = 145,["152"] = 145,["153"] = 145,["154"] = 145,["155"] = 145,["156"] = 145,["157"] = 145,["158"] = 153,["159"] = 153,["160"] = 155,["161"] = 156,["164"] = 159,["165"] = 160,["166"] = 161,["167"] = 162,["168"] = 163,["169"] = 168,["171"] = 170,["172"] = 170,["173"] = 170,["174"] = 170,["175"] = 170,["176"] = 170,["177"] = 170,["179"] = 153,["180"] = 153,["181"] = 153,["182"] = 181,["183"] = 185,["184"] = 139});
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
    self:moveHero(controller)
    self:initCreepSpawns()
    if options.isSniper == 1 then
        self.sniper = self:createSniper()
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
function Lasthit1V1.prototype.initCreepSpawns(self)
    local padawan_spawn = Entities:FindByName(nil, "radiant_creep_spawn")
    local sniper_spawn = Entities:FindByName(nil, "dire_creep_spawn")
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
function Lasthit1V1.prototype.moveHero(self, controller)
    local hero = controller:GetAssignedHero()
    local padawan_spawn = Entities:FindByName(nil, "padawan_spawn")
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
function Lasthit1V1.prototype.createSniper(self)
    local sniper_spawn = Entities:FindByName(nil, "sniper_spawn")
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
    sniper_hero:AddNewModifier(nil, nil, sniper_ai.name, {damage = 62, base_attack_time = 1})
    return sniper_hero
end
return ____exports
