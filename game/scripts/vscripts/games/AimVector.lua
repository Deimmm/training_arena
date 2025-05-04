local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__Number = ____lualib.__TS__Number
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 2,["16"] = 2,["17"] = 3,["18"] = 3,["19"] = 5,["20"] = 5,["21"] = 6,["22"] = 6,["23"] = 7,["24"] = 7,["25"] = 8,["26"] = 8,["27"] = 10,["28"] = 10,["29"] = 10,["30"] = 10,["32"] = 10,["33"] = 17,["34"] = 18,["35"] = 19,["36"] = 20,["37"] = 21,["38"] = 22,["39"] = 23,["40"] = 25,["41"] = 33,["42"] = 34,["43"] = 35,["44"] = 38,["45"] = 39,["46"] = 40,["47"] = 38,["48"] = 43,["49"] = 44,["50"] = 45,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 49,["55"] = 50,["56"] = 51,["57"] = 52,["58"] = 53,["59"] = 54,["60"] = 54,["61"] = 54,["62"] = 54,["64"] = 58,["65"] = 59,["66"] = 59,["67"] = 59,["68"] = 59,["69"] = 60,["70"] = 61,["71"] = 62,["72"] = 64,["73"] = 43,["74"] = 67,["75"] = 68,["76"] = 69,["77"] = 70,["78"] = 71,["81"] = 74,["82"] = 75,["83"] = 76,["84"] = 76,["85"] = 76,["86"] = 76,["87"] = 76,["88"] = 76,["89"] = 76,["90"] = 81,["91"] = 82,["92"] = 82,["93"] = 82,["94"] = 82,["95"] = 82,["96"] = 82,["97"] = 82,["98"] = 87,["99"] = 67,["100"] = 90,["101"] = 91,["104"] = 94,["105"] = 95,["106"] = 96,["107"] = 96,["108"] = 96,["109"] = 96,["110"] = 97,["111"] = 90,["112"] = 100,["113"] = 101,["114"] = 102,["115"] = 103,["116"] = 100,["117"] = 108,["118"] = 109,["119"] = 109,["120"] = 110,["121"] = 110,["122"] = 111,["123"] = 112,["124"] = 112,["125"] = 112,["126"] = 112,["127"] = 115,["128"] = 116,["129"] = 117,["130"] = 119,["131"] = 120,["132"] = 122,["133"] = 122,["134"] = 123,["135"] = 124,["136"] = 125,["138"] = 127,["139"] = 127,["140"] = 127,["141"] = 128,["142"] = 127,["143"] = 127,["144"] = 127,["145"] = 130,["146"] = 131,["147"] = 132,["150"] = 110,["151"] = 110,["152"] = 138,["153"] = 138,["154"] = 139,["155"] = 139,["156"] = 140,["157"] = 141,["158"] = 141,["159"] = 141,["160"] = 141,["161"] = 139,["162"] = 139,["163"] = 145,["164"] = 145,["165"] = 146,["166"] = 146,["167"] = 147,["168"] = 147,["169"] = 147,["170"] = 147,["171"] = 149,["172"] = 149,["173"] = 149,["174"] = 149,["175"] = 156,["176"] = 156,["177"] = 156,["178"] = 156,["179"] = 156,["180"] = 156,["181"] = 156,["182"] = 146,["183"] = 146,["184"] = 108,["185"] = 170,["186"] = 171,["187"] = 174,["188"] = 174,["189"] = 174,["190"] = 174,["191"] = 174,["192"] = 174,["193"] = 171,["194"] = 170,["195"] = 184,["196"] = 185,["197"] = 186,["198"] = 184,["199"] = 188,["200"] = 189,["201"] = 190,["202"] = 191,["203"] = 192,["204"] = 193,["205"] = 194,["206"] = 195,["207"] = 196,["208"] = 198,["209"] = 199,["210"] = 200,["211"] = 201,["213"] = 203,["214"] = 188,["215"] = 209,["216"] = 210,["217"] = 210,["218"] = 210,["219"] = 211,["220"] = 212,["221"] = 213,["222"] = 214,["223"] = 215,["224"] = 216,["225"] = 218,["226"] = 209,["227"] = 220,["228"] = 221,["229"] = 222,["230"] = 224,["231"] = 225,["234"] = 228,["235"] = 229,["236"] = 230,["237"] = 230,["238"] = 230,["239"] = 230,["240"] = 220,["241"] = 233,["242"] = 234,["243"] = 235,["244"] = 236,["247"] = 239,["248"] = 240,["249"] = 241,["250"] = 241,["251"] = 241,["252"] = 241,["253"] = 233,["254"] = 243,["255"] = 244,["256"] = 244,["257"] = 246,["258"] = 244,["259"] = 244,["260"] = 248,["261"] = 248,["262"] = 243,["263"] = 11});
local ____exports = {}
local ____VectorGroup = require("units.VectorGroup")
local VectorGroupSpawn = ____VectorGroup.VectorGroupSpawn
local ____Api = require("core.api.Api")
local API = ____Api.API
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Box = require("utils.Box")
local Geometry = ____Box.Geometry
local ____HeroInventory = require("utils.HeroInventory")
local HeroInventory = ____HeroInventory.HeroInventory
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____vector_aim_hero_boost = require("modifiers.vector_aim_hero_boost")
local vector_aim_hero_boost = ____vector_aim_hero_boost.vector_aim_hero_boost
____exports.AimVector = __TS__Class()
local AimVector = ____exports.AimVector
AimVector.name = "AimVector"
__TS__ClassExtends(AimVector, GameBase)
function AimVector.prototype.____constructor(self)
    GameBase.prototype.____constructor(self, ____exports.AimVector._game_name)
    self.result = 0
    self.streak = 0
    self.avgTime = 0
    self.maxStreak = 0
    self.killedUnits = 0
    self.totalUnits = 40
    self.killTimes = {}
    self.heroPreviousState = {attack_capability = nil, return_ability_name = nil}
    self.isGameRunning = false
    self.unsubs = {}
end
function AimVector.prototype.relaunch(self, options)
    self:finish()
    self:launch(options)
end
function AimVector.prototype.finish(self)
    self.vectorSpawn:kill()
    self.isGameRunning = false
    self.result = 0
    self.streak = 0
    self.avgTime = 0
    self.maxStreak = 0
    self.killedUnits = 0
    self.killTimes = {}
    local listeners = self.listeners
    if #listeners > 0 then
        __TS__ArrayForEach(
            listeners,
            function(____, listener) return CustomGameEventManager:UnregisterListener(listener) end
        )
    end
    StopListeningToAllGameEvents(self.context)
    __TS__ArrayMap(
        self.unsubs,
        function(____, e) return e(nil) end
    )
    self.outerBox:destroyBox()
    self:resetHero()
    self:returnHero()
    self:listenEvents()
end
function AimVector.prototype.launch(self, options)
    self:moveHero(self.controller)
    self:setupHero()
    local startPosition = Entities:FindByName(nil, "main_training_spawn")
    if not startPosition then
        return
    end
    local startVector = startPosition:GetAbsOrigin()
    self.outerBox = __TS__New(Geometry)
    self.outerBox:createBox(
        startVector,
        700,
        150,
        true,
        {widthCoef = 1.3, heightCoef = 0.9}
    )
    self.heroBox = __TS__New(Geometry)
    self.heroBox:createBox(
        startVector,
        100,
        50,
        false,
        {widthCoef = 1.3, heightCoef = 0.9}
    )
    self:spawnEntities()
end
function AimVector.prototype.spawnEntities(self)
    if self.isGameRunning then
        return
    end
    self.isGameRunning = true
    self:spawnVectors()
    EmitSoundOn(
        "drums",
        self.controller:GetAssignedHero()
    )
    self:listenVectorEvents()
end
function AimVector.prototype.spawnVectors(self)
    self.isGameRunning = true
    self.vectorSpawn = __TS__New(VectorGroupSpawn, self.controller)
    self.vectorSpawn:spawn(self.outerBox, self.heroBox, {entities_count = self.totalUnits})
end
function AimVector.prototype.listenVectorEvents(self)
    local ____self_unsubs_1 = self.unsubs
    ____self_unsubs_1[#____self_unsubs_1 + 1] = eventBus:on(
        "vector_dummy.killed",
        function(____, event)
            if event.index then
                local entity = __TS__ArrayFind(
                    self.vectorSpawn.entities,
                    function(____, elem) return elem.index == event.index end
                )
                if entity then
                    local ttd = 3000 - entity.ttl
                    local streakCoef = self.streak == 0 and 1 or self.streak
                    local points = 100 * streakCoef
                    self.result = math.floor(self.result + points)
                    local ____self_killTimes_0 = self.killTimes
                    ____self_killTimes_0[#____self_killTimes_0 + 1] = ttd
                    self.streak = self.streak + 1
                    if self.streak > self.maxStreak then
                        self.maxStreak = self.streak
                    end
                    local killTimeSum = __TS__ArrayReduce(
                        self.killTimes,
                        function(____, acc, elem)
                            return acc + elem
                        end,
                        0
                    )
                    self.killedUnits = self.killedUnits + 1
                    self.avgTime = __TS__Number(killTimeSum / #self.killTimes / 1000)
                    self:emitResultChange()
                end
            end
        end
    )
    local ____self_unsubs_2 = self.unsubs
    ____self_unsubs_2[#____self_unsubs_2 + 1] = eventBus:on(
        "vector_dummy.expire",
        function()
            self:dropResult()
            EmitSoundOn(
                "sheep",
                self.controller:GetAssignedHero()
            )
        end
    )
    local ____self_unsubs_3 = self.unsubs
    ____self_unsubs_3[#____self_unsubs_3 + 1] = eventBus:on(
        "vector_spawn.finish",
        function()
            EmitSoundOn(
                "drums",
                self.controller:GetAssignedHero()
            )
            Timers:CreateTimer(
                3,
                function() return CustomGameEventManager:Send_ServerToPlayer(self.controller, "round_finish.aim_vector", {}) end
            )
            API:updateVectorAim({
                steamId = PlayerResource:GetSteamID(self.controller:GetPlayerID()):__tostring(),
                result = self.result,
                streak = self.maxStreak,
                avgTime = self.avgTime,
                killedUnits = self.killedUnits
            })
        end
    )
end
function AimVector.prototype.emitResultChange(self)
    CustomGameEventManager:Send_ServerToPlayer(self.controller, ____exports.AimVector._game_name .. ".result_update", {
        result = self.result,
        streak = self.streak,
        avgTime = self.avgTime,
        totalUnits = self.totalUnits,
        maxStreak = self.maxStreak,
        killedUnits = self.killedUnits
    })
end
function AimVector.prototype.dropResult(self)
    self.streak = 0
    self:emitResultChange()
end
function AimVector.prototype.setupHero(self)
    local hero = self.controller:GetAssignedHero()
    local abilityName
    local heroAttackCapability = hero:GetAttackCapability()
    hero:SetMoveCapability(0)
    hero:SetAttackCapability(0)
    hero:AddAbility("muerta_dead_shot"):SetLevel(1)
    hero:AddNewModifier(nil, nil, vector_aim_hero_boost.name, {})
    local originalAbility = hero:GetAbilityByIndex(0)
    if originalAbility then
        local originalAbilityName = originalAbility:GetAbilityName()
        abilityName = originalAbility:GetAbilityName()
        hero:SwapAbilities("muerta_dead_shot", originalAbilityName, true, false)
    end
    self.heroPreviousState = {attack_capability = heroAttackCapability, return_ability_name = abilityName}
end
function AimVector.prototype.resetHero(self)
    local ____self_heroPreviousState_4 = self.heroPreviousState
    local attack_capability = ____self_heroPreviousState_4.attack_capability
    local return_ability_name = ____self_heroPreviousState_4.return_ability_name
    local hero = self.controller:GetAssignedHero()
    hero:SetMoveCapability(1)
    hero:SetAttackCapability(attack_capability)
    hero:SwapAbilities(return_ability_name, "muerta_dead_shot", true, true)
    hero:RemoveAbility("muerta_dead_shot")
    hero:RemoveModifierByName(vector_aim_hero_boost.name)
    HeroInventory:reset(hero)
end
function AimVector.prototype.moveHero(self, controller)
    local hero = controller:GetAssignedHero()
    local spawn_name = "main_training_spawn"
    local padawan_spawn = Entities:FindByName(nil, spawn_name)
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
function AimVector.prototype.returnHero(self)
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
function AimVector.prototype.listen(self)
    local listener = CustomGameEventManager:RegisterListener(
        ____exports.AimVector._game_name .. ".table.get.response",
        function()
        end
    )
    local ____self_listeners_5 = self.listeners
    ____self_listeners_5[#____self_listeners_5 + 1] = listener
end
AimVector._game_name = "aim_vector"
return ____exports
