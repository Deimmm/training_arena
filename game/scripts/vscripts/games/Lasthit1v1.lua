local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["21"] = 5,["22"] = 7,["23"] = 9,["24"] = 10,["25"] = 11,["26"] = 12,["27"] = 14,["28"] = 17,["29"] = 18,["30"] = 19,["31"] = 20,["32"] = 17,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 29,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 31,["43"] = 32,["44"] = 33,["45"] = 34,["47"] = 23,["48"] = 37,["49"] = 38,["50"] = 39,["51"] = 40,["53"] = 42,["54"] = 43,["55"] = 44,["56"] = 44,["57"] = 44,["58"] = 44,["60"] = 48,["61"] = 49,["62"] = 50,["63"] = 51,["64"] = 51,["65"] = 51,["66"] = 51,["68"] = 53,["69"] = 54,["70"] = 55,["71"] = 55,["72"] = 55,["73"] = 55,["75"] = 57,["76"] = 58,["77"] = 37,["78"] = 61,["79"] = 62,["80"] = 63,["81"] = 66,["82"] = 70,["83"] = 71,["84"] = 73,["85"] = 74,["88"] = 78,["89"] = 79,["90"] = 80,["91"] = 82,["92"] = 83,["93"] = 85,["94"] = 85,["95"] = 86,["96"] = 86,["97"] = 86,["98"] = 86,["99"] = 86,["101"] = 91,["103"] = 85,["104"] = 93,["105"] = 93,["106"] = 94,["107"] = 94,["108"] = 94,["109"] = 94,["110"] = 94,["112"] = 99,["114"] = 93,["115"] = 101,["116"] = 101,["117"] = 101,["118"] = 101,["119"] = 101,["120"] = 101,["121"] = 101,["122"] = 108,["123"] = 108,["124"] = 108,["125"] = 108,["126"] = 108,["127"] = 108,["128"] = 108,["129"] = 61,["130"] = 116,["131"] = 117,["132"] = 118,["133"] = 119,["136"] = 122,["137"] = 123,["138"] = 124,["139"] = 124,["140"] = 124,["141"] = 124,["142"] = 116,["143"] = 127,["144"] = 131,["145"] = 132,["146"] = 135,["147"] = 136,["150"] = 139,["151"] = 140,["152"] = 141,["153"] = 141,["154"] = 141,["155"] = 141,["156"] = 127,["157"] = 143,["158"] = 144,["159"] = 146,["160"] = 147,["163"] = 150,["164"] = 151,["165"] = 151,["166"] = 151,["167"] = 151,["168"] = 151,["169"] = 151,["170"] = 151,["171"] = 151,["172"] = 159,["173"] = 159,["174"] = 161,["175"] = 162,["178"] = 165,["179"] = 166,["180"] = 167,["181"] = 168,["182"] = 169,["183"] = 175,["184"] = 176,["185"] = 176,["186"] = 177,["187"] = 177,["188"] = 177,["190"] = 178,["191"] = 178,["192"] = 178,["196"] = 181,["197"] = 182,["198"] = 182,["199"] = 182,["200"] = 182,["201"] = 187,["202"] = 190,["203"] = 190,["204"] = 191,["205"] = 191,["206"] = 191,["208"] = 192,["209"] = 192,["210"] = 192,["213"] = 194,["214"] = 159,["215"] = 159,["216"] = 159,["217"] = 206,["218"] = 211,["219"] = 143});
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
    self.pKills = 0
    self.pDenies = 0
    self.sKills = 0
    self.sDenies = 0
end
function Lasthit1V1.prototype.relaunch(self, options)
    DeepPrintTable(options)
    self:finish()
    self:launch(options)
end
function Lasthit1V1.prototype.launch(self, options)
    self.pKills = 0
    self.pDenies = 0
    self.sKills = 0
    self.sDenies = 0
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
    local isPlain = terrain == "plain"
    local padawan_spawn_name = isPlain and "radiant_creep_spawn_plain" or "radiant_creep_spawn"
    local sniper_spawn_name = isPlain and "dire_creep_spawn_plain" or "dire_creep_spawn"
    local padawan_spawn = Entities:FindByName(nil, padawan_spawn_name)
    local sniper_spawn = Entities:FindByName(nil, sniper_spawn_name)
    if not padawan_spawn or not sniper_spawn then
        print("WARNING: ", "Cant find spawns")
        return
    end
    local badguys_spawn = __TS__New(CreepSpawn)
    local goodguys_spawn = __TS__New(CreepSpawn)
    self.spawns = __TS__ArrayConcat(self.spawns, {goodguys_spawn, badguys_spawn})
    local wayp_1 = Entities:FindByName(nil, "creep_mpoint_plain_1")
    local wayp_2 = Entities:FindByName(nil, "creep_mpoint_plain_2")
    local ____isPlain_1
    if isPlain then
        ____isPlain_1 = {
            wayp_1:GetAbsOrigin(),
            wayp_2:GetAbsOrigin(),
            sniper_spawn:GetAbsOrigin()
        }
    else
        ____isPlain_1 = {sniper_spawn:GetAbsOrigin()}
    end
    local radiant_waypoints = ____isPlain_1
    local ____isPlain_2
    if isPlain then
        ____isPlain_2 = {
            wayp_2:GetAbsOrigin(),
            wayp_1:GetAbsOrigin(),
            padawan_spawn:GetAbsOrigin()
        }
    else
        ____isPlain_2 = {padawan_spawn:GetAbsOrigin()}
    end
    local dire_waypoints = ____isPlain_2
    goodguys_spawn:startSpawn(
        padawan_spawn:GetAbsOrigin(),
        radiant_waypoints,
        {melee = 3, range = 1, business = 0},
        30,
        DOTA_TEAM_GOODGUYS
    )
    badguys_spawn:startSpawn(
        sniper_spawn:GetAbsOrigin(),
        dire_waypoints,
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
            local entity = EntIndexToHScript(event.entindex_killed)
            if event.entindex_attacker == sniper_hero:GetEntityIndex() then
                if entity then
                    local position = entity:GetAbsOrigin()
                    local particle = ParticleManager:CreateParticle("particles/msg_fx/msg_death.vpcf", 8, nil)
                    ParticleManager:SetParticleControl(particle, 0, position)
                    local ____temp_5
                    if entity:GetTeam() == DOTA_TEAM_GOODGUYS then
                        local ____temp_3 = self.sKills + 1
                        self.sKills = ____temp_3
                        ____temp_5 = ____temp_3
                    else
                        local ____temp_4 = self.sDenies + 1
                        self.sDenies = ____temp_4
                        ____temp_5 = ____temp_4
                    end
                end
            end
            print("ATTACKER: ", event.entindex_attacker)
            print(
                "PLAYER CONTROLLER: ",
                self.controller:GetAssignedHero():GetEntityIndex()
            )
            if event.entindex_attacker == self.controller:GetAssignedHero():GetEntityIndex() then
                local ____temp_8
                if entity:GetTeam() == DOTA_TEAM_BADGUYS then
                    local ____temp_6 = self.pKills + 1
                    self.pKills = ____temp_6
                    ____temp_8 = ____temp_6
                else
                    local ____temp_7 = self.pDenies + 1
                    self.pDenies = ____temp_7
                    ____temp_8 = ____temp_7
                end
            end
            CustomGameEventManager:Send_ServerToAllClients("1v1.result_update", {pKills = self.pKills, pDenies = self.pDenies, sKills = self.sKills, sDenies = self.sDenies})
        end,
        self.context
    )
    sniper_hero:AddNewModifier(nil, nil, sniper_ai.name, {damage = 62, base_attack_time = 1, spawn_name = sniper_spawn_name})
    return sniper_hero
end
return ____exports
