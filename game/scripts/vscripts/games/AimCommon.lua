local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__New = ____lualib.__TS__New
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberToFixed = ____lualib.__TS__NumberToFixed
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 4,["21"] = 4,["22"] = 5,["23"] = 5,["24"] = 6,["25"] = 6,["26"] = 8,["27"] = 8,["28"] = 8,["29"] = 8,["31"] = 8,["32"] = 13,["33"] = 14,["34"] = 15,["35"] = 16,["36"] = 17,["37"] = 18,["38"] = 19,["39"] = 21,["40"] = 25,["41"] = 26,["42"] = 27,["43"] = 30,["44"] = 31,["45"] = 32,["46"] = 30,["47"] = 35,["48"] = 36,["49"] = 37,["50"] = 38,["51"] = 39,["52"] = 40,["53"] = 41,["54"] = 42,["55"] = 43,["56"] = 44,["57"] = 45,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 46,["63"] = 50,["64"] = 51,["65"] = 51,["66"] = 51,["67"] = 51,["68"] = 52,["69"] = 53,["70"] = 54,["71"] = 56,["72"] = 35,["73"] = 59,["74"] = 60,["75"] = 61,["76"] = 62,["77"] = 63,["80"] = 66,["81"] = 67,["82"] = 68,["83"] = 70,["84"] = 71,["85"] = 73,["86"] = 59,["87"] = 76,["88"] = 77,["91"] = 80,["92"] = 81,["93"] = 82,["94"] = 85,["95"] = 85,["96"] = 85,["97"] = 85,["98"] = 87,["99"] = 87,["100"] = 88,["101"] = 88,["102"] = 89,["103"] = 90,["104"] = 90,["105"] = 90,["106"] = 90,["107"] = 93,["108"] = 94,["109"] = 95,["110"] = 97,["111"] = 98,["112"] = 99,["113"] = 99,["114"] = 100,["115"] = 101,["116"] = 102,["118"] = 104,["119"] = 104,["120"] = 104,["121"] = 105,["122"] = 104,["123"] = 104,["124"] = 104,["125"] = 107,["126"] = 108,["127"] = 109,["128"] = 110,["129"] = 110,["130"] = 110,["131"] = 110,["132"] = 110,["135"] = 88,["136"] = 88,["137"] = 119,["138"] = 119,["139"] = 120,["140"] = 120,["141"] = 121,["142"] = 120,["143"] = 120,["144"] = 124,["145"] = 124,["146"] = 125,["147"] = 125,["148"] = 126,["149"] = 127,["150"] = 127,["151"] = 127,["152"] = 127,["153"] = 125,["154"] = 125,["155"] = 130,["156"] = 130,["157"] = 131,["158"] = 131,["159"] = 132,["160"] = 132,["161"] = 132,["162"] = 132,["163"] = 133,["164"] = 133,["165"] = 133,["166"] = 133,["167"] = 140,["168"] = 140,["169"] = 140,["170"] = 140,["171"] = 140,["172"] = 140,["173"] = 140,["174"] = 131,["175"] = 131,["176"] = 76,["177"] = 154,["178"] = 155,["179"] = 158,["180"] = 158,["181"] = 158,["182"] = 158,["183"] = 158,["184"] = 158,["185"] = 155,["186"] = 154,["187"] = 168,["188"] = 169,["189"] = 170,["190"] = 168,["191"] = 172,["192"] = 173,["193"] = 174,["194"] = 175,["195"] = 178,["196"] = 179,["197"] = 180,["198"] = 172,["199"] = 183,["200"] = 184,["201"] = 185,["202"] = 186,["203"] = 187,["204"] = 183,["205"] = 189,["206"] = 190,["207"] = 191,["208"] = 193,["209"] = 194,["212"] = 197,["213"] = 198,["214"] = 199,["215"] = 199,["216"] = 199,["217"] = 199,["218"] = 189,["219"] = 202,["220"] = 203,["221"] = 204,["222"] = 205,["225"] = 208,["226"] = 209,["227"] = 210,["228"] = 210,["229"] = 210,["230"] = 210,["231"] = 202,["232"] = 212,["233"] = 213,["234"] = 213,["235"] = 215,["236"] = 213,["237"] = 213,["238"] = 217,["239"] = 217,["240"] = 212});
local ____exports = {}
local ____Api = require("core.api.Api")
local API = ____Api.API
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local _____41Ebserver = require("units.Оbserver")
local AIMCOMMON_ObserverWardSpawn = _____41Ebserver.AIMCOMMON_ObserverWardSpawn
local ____Box = require("utils.Box")
local Box = ____Box.Box
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
    self.totalWards = 120
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
    self.outerBox = __TS__New(Box)
    self.outerBox:createBox(startVector, 700, 150, true)
    self.heroBox = __TS__New(Box)
    self.heroBox:createBox(startVector, 75, 50, false)
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
                    GameRules:SendCustomMessage(
                        "<b>Time</b>: " .. __TS__NumberToFixed(ttd / 1000, 3),
                        0,
                        2
                    )
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
                function() return CustomGameEventManager:Send_ServerToPlayer(self.controller, "round_finish.aim_common", {}) end
            )
            API:updateCommonAim({
                steamId = PlayerResource:GetSteamID(self.controller:GetPlayerID()):__tostring(),
                result = self.result,
                streak = self.maxStreak,
                avgTime = self.avgTime,
                killedWards = self.killedWards
            })
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
