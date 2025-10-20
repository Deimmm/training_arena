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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 2,["16"] = 2,["17"] = 3,["18"] = 3,["19"] = 4,["20"] = 4,["21"] = 5,["22"] = 5,["23"] = 6,["24"] = 6,["25"] = 8,["26"] = 8,["27"] = 8,["28"] = 8,["30"] = 8,["31"] = 13,["32"] = 14,["33"] = 15,["34"] = 16,["35"] = 17,["36"] = 18,["37"] = 19,["38"] = 21,["39"] = 25,["40"] = 26,["41"] = 27,["42"] = 30,["43"] = 31,["44"] = 32,["45"] = 30,["46"] = 35,["47"] = 36,["48"] = 37,["49"] = 38,["50"] = 39,["51"] = 40,["52"] = 41,["53"] = 42,["54"] = 43,["55"] = 44,["56"] = 45,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["62"] = 50,["63"] = 51,["64"] = 51,["65"] = 51,["66"] = 51,["67"] = 52,["68"] = 53,["69"] = 54,["70"] = 56,["71"] = 35,["72"] = 59,["73"] = 60,["74"] = 61,["75"] = 62,["76"] = 63,["79"] = 66,["80"] = 67,["81"] = 68,["82"] = 68,["83"] = 68,["84"] = 68,["85"] = 68,["86"] = 68,["87"] = 68,["88"] = 73,["89"] = 74,["90"] = 74,["91"] = 74,["92"] = 74,["93"] = 74,["94"] = 74,["95"] = 74,["96"] = 79,["97"] = 59,["98"] = 82,["99"] = 83,["102"] = 86,["103"] = 87,["104"] = 88,["105"] = 91,["106"] = 91,["107"] = 91,["108"] = 91,["109"] = 93,["110"] = 93,["111"] = 94,["112"] = 94,["113"] = 95,["114"] = 96,["115"] = 96,["116"] = 96,["117"] = 96,["118"] = 99,["119"] = 100,["120"] = 101,["121"] = 103,["122"] = 104,["123"] = 105,["124"] = 105,["125"] = 106,["126"] = 107,["127"] = 108,["129"] = 110,["130"] = 110,["131"] = 110,["132"] = 111,["133"] = 110,["134"] = 110,["135"] = 110,["136"] = 113,["137"] = 114,["138"] = 115,["141"] = 94,["142"] = 94,["143"] = 125,["144"] = 125,["145"] = 126,["146"] = 126,["147"] = 127,["148"] = 126,["149"] = 126,["150"] = 130,["151"] = 130,["152"] = 131,["153"] = 131,["154"] = 132,["155"] = 133,["156"] = 133,["157"] = 133,["158"] = 133,["159"] = 131,["160"] = 131,["161"] = 136,["162"] = 136,["163"] = 137,["164"] = 137,["165"] = 138,["166"] = 138,["167"] = 138,["168"] = 138,["169"] = 139,["170"] = 139,["171"] = 139,["172"] = 140,["173"] = 139,["174"] = 139,["175"] = 146,["176"] = 146,["177"] = 146,["178"] = 147,["179"] = 147,["180"] = 147,["181"] = 147,["182"] = 147,["183"] = 146,["184"] = 146,["185"] = 137,["186"] = 137,["187"] = 82,["188"] = 161,["189"] = 162,["190"] = 165,["191"] = 165,["192"] = 165,["193"] = 165,["194"] = 165,["195"] = 165,["196"] = 162,["197"] = 161,["198"] = 175,["199"] = 176,["200"] = 177,["201"] = 175,["202"] = 179,["203"] = 180,["204"] = 181,["205"] = 182,["206"] = 185,["207"] = 186,["208"] = 187,["209"] = 179,["210"] = 190,["211"] = 191,["212"] = 192,["213"] = 193,["214"] = 194,["215"] = 190,["216"] = 196,["217"] = 197,["218"] = 198,["219"] = 200,["220"] = 201,["223"] = 204,["224"] = 205,["225"] = 206,["226"] = 206,["227"] = 206,["228"] = 206,["229"] = 196,["230"] = 209,["231"] = 210,["232"] = 211,["233"] = 212,["236"] = 215,["237"] = 216,["238"] = 217,["239"] = 217,["240"] = 217,["241"] = 217,["242"] = 209,["243"] = 219,["244"] = 220,["245"] = 220,["246"] = 222,["247"] = 220,["248"] = 220,["249"] = 224,["250"] = 224,["251"] = 219});
local ____exports = {}
local ____Api = require("core.api.Api")
local API = ____Api.API
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local _____41Ebserver = require("units.Оbserver")
local AIMCOMMON_ObserverWardSpawn = _____41Ebserver.AIMCOMMON_ObserverWardSpawn
local ____Box = require("utils.Box")
local Geometry = ____Box.Geometry
local ____HeroInventory = require("utils.HeroInventory")
local HeroInventory = ____HeroInventory.HeroInventory
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
____exports.AimCommon = __TS__Class()
local AimCommon = ____exports.AimCommon
AimCommon.name = "AimCommon"
__TS__ClassExtends(AimCommon, GameBase)
function AimCommon.prototype.____constructor(self)
    GameBase.prototype.____constructor(self, "aim_common")
    self.result = 0
    self.streak = 0
    self.avgTime = 0
    self.maxStreak = 0
    self.killedWards = 0
    self.totalWards = 100
    self.killTimes = {}
    self.heroPreviousState = {attack_capability = nil}
    self.isGameRunning = false
    self.unsubs = {}
end
function AimCommon.prototype.relaunch(self, options)
    self:finish()
    self:launch(options)
end
function AimCommon.prototype.finish(self)
    self.isGameRunning = false
    self.obsSpawn:kill()
    self.result = 0
    self.streak = 0
    self.avgTime = 0
    self.maxStreak = 0
    self.killedWards = 0
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
function AimCommon.prototype.launch(self, options)
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
        675,
        125,
        true,
        {widthCoef = 1.3, heightCoef = 0.9}
    )
    self.heroBox = __TS__New(Geometry)
    self.heroBox:createBox(
        startVector,
        100,
        75,
        false,
        {widthCoef = 1.3, heightCoef = 0.9}
    )
    self:spawnEntities()
end
function AimCommon.prototype.spawnEntities(self)
    if self.isGameRunning then
        return
    end
    self.isGameRunning = true
    self.obsSpawn = __TS__New(AIMCOMMON_ObserverWardSpawn)
    self.obsSpawn:spawn(self.outerBox, self.heroBox, {wards_count = self.totalWards})
    EmitSoundOn(
        "drums",
        self.controller:GetAssignedHero()
    )
    local ____self_unsubs_1 = self.unsubs
    ____self_unsubs_1[#____self_unsubs_1 + 1] = eventBus:on(
        "qblade.hit",
        function(____, event)
            if event.index then
                local obs = __TS__ArrayFind(
                    self.obsSpawn.wards,
                    function(____, elem) return elem.index == event.index end
                )
                if obs then
                    local ttd = 1000 - obs.ttl
                    local streakCoef = self.streak == 0 and 1 or self.streak
                    local points = 100 * (100 / ttd) * streakCoef
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
                    self.killedWards = self.killedWards + 1
                    self.avgTime = __TS__Number(killTimeSum / #self.killTimes / 1000)
                    self:emitResultChange()
                end
            end
        end
    )
    local ____self_unsubs_2 = self.unsubs
    ____self_unsubs_2[#____self_unsubs_2 + 1] = eventBus:on(
        "qblade.miss",
        function()
            self:dropResult()
        end
    )
    local ____self_unsubs_3 = self.unsubs
    ____self_unsubs_3[#____self_unsubs_3 + 1] = eventBus:on(
        "obs.expire",
        function()
            self:dropResult()
            EmitSoundOn(
                "sheep",
                self.controller:GetAssignedHero()
            )
        end
    )
    local ____self_unsubs_4 = self.unsubs
    ____self_unsubs_4[#____self_unsubs_4 + 1] = eventBus:on(
        "obsspawn.finish",
        function()
            EmitSoundOn(
                "drums",
                self.controller:GetAssignedHero()
            )
            Timers:CreateTimer(
                3,
                function()
                    CustomGameEventManager:Send_ServerToPlayer(self.controller, "round_finish.aim_common", {})
                end
            )
            Timers:CreateTimer(
                1,
                function() return API:updateCommonAim({
                    steamId = PlayerResource:GetSteamID(self.controller:GetPlayerID()):__tostring(),
                    result = self.result,
                    streak = self.maxStreak,
                    avgTime = self.avgTime,
                    killedWards = self.killedWards
                }) end
            )
        end
    )
end
function AimCommon.prototype.emitResultChange(self)
    CustomGameEventManager:Send_ServerToPlayer(self.controller, "aim_common.result_update", {
        result = self.result,
        streak = self.streak,
        avgTime = self.avgTime,
        totalWards = self.totalWards,
        maxStreak = self.maxStreak,
        killedWards = self.killedWards
    })
end
function AimCommon.prototype.dropResult(self)
    self.streak = 0
    self:emitResultChange()
end
function AimCommon.prototype.setupHero(self)
    local hero = self.controller:GetAssignedHero()
    HeroInventory:reset(hero)
    self.heroPreviousState = {attack_capability = hero:GetAttackCapability()}
    hero:SetMoveCapability(0)
    hero:SetAttackCapability(0)
    hero:AddItemByName("item_custom_qblade")
end
function AimCommon.prototype.resetHero(self)
    local hero = self.controller:GetAssignedHero()
    hero:SetMoveCapability(1)
    hero:SetAttackCapability(self.heroPreviousState.attack_capability)
    HeroInventory:reset(hero)
end
function AimCommon.prototype.moveHero(self, controller)
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
function AimCommon.prototype.returnHero(self)
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
function AimCommon.prototype.listen(self)
    local listener = CustomGameEventManager:RegisterListener(
        "aim_common.table.get.response",
        function()
        end
    )
    local ____self_listeners_5 = self.listeners
    ____self_listeners_5[#____self_listeners_5 + 1] = listener
end
return ____exports
