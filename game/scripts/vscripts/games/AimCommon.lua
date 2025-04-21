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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 4,["21"] = 4,["22"] = 5,["23"] = 5,["24"] = 7,["25"] = 7,["26"] = 7,["27"] = 7,["29"] = 7,["30"] = 12,["31"] = 13,["32"] = 14,["33"] = 15,["34"] = 16,["35"] = 17,["36"] = 18,["37"] = 20,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 29,["42"] = 30,["43"] = 31,["44"] = 29,["45"] = 34,["46"] = 35,["47"] = 36,["48"] = 37,["49"] = 38,["50"] = 39,["51"] = 40,["52"] = 41,["53"] = 42,["54"] = 43,["55"] = 44,["56"] = 45,["57"] = 45,["58"] = 45,["59"] = 45,["61"] = 49,["62"] = 50,["63"] = 50,["64"] = 50,["65"] = 50,["66"] = 51,["67"] = 52,["68"] = 53,["69"] = 55,["70"] = 34,["71"] = 58,["72"] = 59,["73"] = 60,["74"] = 61,["75"] = 62,["78"] = 65,["79"] = 66,["80"] = 67,["81"] = 69,["82"] = 70,["83"] = 72,["84"] = 58,["85"] = 75,["86"] = 76,["89"] = 79,["90"] = 80,["91"] = 81,["92"] = 84,["93"] = 84,["94"] = 84,["95"] = 84,["96"] = 86,["97"] = 86,["98"] = 87,["99"] = 87,["100"] = 88,["101"] = 89,["102"] = 89,["103"] = 89,["104"] = 89,["105"] = 92,["106"] = 93,["107"] = 94,["108"] = 96,["109"] = 97,["110"] = 98,["111"] = 98,["112"] = 99,["113"] = 100,["114"] = 101,["116"] = 103,["117"] = 103,["118"] = 103,["119"] = 104,["120"] = 103,["121"] = 103,["122"] = 103,["123"] = 106,["124"] = 107,["125"] = 108,["126"] = 109,["127"] = 109,["128"] = 109,["129"] = 109,["130"] = 109,["133"] = 87,["134"] = 87,["135"] = 118,["136"] = 118,["137"] = 119,["138"] = 119,["139"] = 120,["140"] = 119,["141"] = 119,["142"] = 123,["143"] = 123,["144"] = 124,["145"] = 124,["146"] = 125,["147"] = 126,["148"] = 126,["149"] = 126,["150"] = 126,["151"] = 124,["152"] = 124,["153"] = 129,["154"] = 129,["155"] = 130,["156"] = 130,["157"] = 131,["158"] = 131,["159"] = 131,["160"] = 131,["161"] = 132,["162"] = 132,["163"] = 132,["164"] = 132,["165"] = 130,["166"] = 130,["167"] = 75,["168"] = 143,["169"] = 144,["170"] = 147,["171"] = 147,["172"] = 147,["173"] = 147,["174"] = 147,["175"] = 147,["176"] = 144,["177"] = 143,["178"] = 157,["179"] = 158,["180"] = 159,["181"] = 157,["182"] = 161,["183"] = 162,["184"] = 163,["185"] = 164,["186"] = 167,["187"] = 168,["188"] = 169,["189"] = 161,["190"] = 172,["191"] = 173,["192"] = 174,["193"] = 175,["194"] = 176,["195"] = 172,["196"] = 178,["197"] = 179,["198"] = 180,["199"] = 182,["200"] = 183,["203"] = 186,["204"] = 187,["205"] = 188,["206"] = 188,["207"] = 188,["208"] = 188,["209"] = 178,["210"] = 191,["211"] = 192,["212"] = 193,["213"] = 194,["216"] = 197,["217"] = 198,["218"] = 199,["219"] = 199,["220"] = 199,["221"] = 199,["222"] = 191});
local ____exports = {}
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
return ____exports
