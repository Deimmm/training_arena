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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 2,["17"] = 2,["18"] = 3,["19"] = 3,["20"] = 5,["21"] = 5,["22"] = 6,["23"] = 6,["24"] = 7,["25"] = 7,["26"] = 9,["27"] = 9,["28"] = 9,["29"] = 9,["31"] = 9,["32"] = 14,["33"] = 15,["34"] = 16,["35"] = 17,["36"] = 18,["37"] = 19,["38"] = 20,["39"] = 22,["40"] = 26,["41"] = 27,["42"] = 28,["43"] = 31,["44"] = 32,["45"] = 33,["46"] = 31,["47"] = 36,["48"] = 37,["49"] = 38,["50"] = 39,["51"] = 40,["52"] = 41,["53"] = 42,["54"] = 43,["55"] = 44,["56"] = 45,["57"] = 46,["58"] = 47,["59"] = 47,["60"] = 47,["61"] = 47,["63"] = 51,["64"] = 52,["65"] = 52,["66"] = 52,["67"] = 52,["68"] = 53,["69"] = 54,["70"] = 55,["71"] = 57,["72"] = 36,["73"] = 60,["74"] = 61,["75"] = 62,["76"] = 63,["77"] = 64,["80"] = 67,["81"] = 68,["82"] = 69,["83"] = 71,["84"] = 72,["85"] = 74,["86"] = 60,["87"] = 77,["88"] = 78,["91"] = 81,["92"] = 86,["93"] = 90,["94"] = 90,["95"] = 90,["96"] = 90,["97"] = 92,["98"] = 92,["99"] = 93,["100"] = 93,["101"] = 94,["102"] = 95,["103"] = 95,["104"] = 95,["105"] = 95,["106"] = 98,["107"] = 99,["108"] = 100,["109"] = 102,["110"] = 103,["111"] = 104,["112"] = 104,["113"] = 105,["114"] = 106,["115"] = 107,["117"] = 109,["118"] = 109,["119"] = 109,["120"] = 110,["121"] = 109,["122"] = 109,["123"] = 109,["124"] = 112,["125"] = 113,["126"] = 114,["127"] = 115,["128"] = 115,["129"] = 115,["130"] = 115,["131"] = 115,["134"] = 93,["135"] = 93,["136"] = 124,["137"] = 124,["138"] = 125,["139"] = 125,["140"] = 126,["141"] = 125,["142"] = 125,["143"] = 129,["144"] = 129,["145"] = 130,["146"] = 130,["147"] = 131,["148"] = 132,["149"] = 132,["150"] = 132,["151"] = 132,["152"] = 130,["153"] = 130,["154"] = 135,["155"] = 135,["156"] = 136,["157"] = 136,["158"] = 137,["159"] = 137,["160"] = 137,["161"] = 137,["162"] = 138,["163"] = 138,["164"] = 138,["165"] = 138,["166"] = 145,["167"] = 145,["168"] = 145,["169"] = 145,["170"] = 145,["171"] = 145,["172"] = 145,["173"] = 136,["174"] = 136,["175"] = 77,["176"] = 159,["177"] = 160,["178"] = 163,["179"] = 163,["180"] = 163,["181"] = 163,["182"] = 163,["183"] = 163,["184"] = 160,["185"] = 159,["186"] = 173,["187"] = 174,["188"] = 175,["189"] = 173,["190"] = 177,["191"] = 178,["192"] = 179,["193"] = 180,["194"] = 183,["195"] = 184,["196"] = 185,["197"] = 177,["198"] = 188,["199"] = 189,["200"] = 190,["201"] = 191,["202"] = 192,["203"] = 188,["204"] = 194,["205"] = 195,["206"] = 196,["207"] = 198,["208"] = 199,["211"] = 202,["212"] = 203,["213"] = 204,["214"] = 204,["215"] = 204,["216"] = 204,["217"] = 194,["218"] = 207,["219"] = 208,["220"] = 209,["221"] = 210,["224"] = 213,["225"] = 214,["226"] = 215,["227"] = 215,["228"] = 215,["229"] = 215,["230"] = 207,["231"] = 217,["232"] = 218,["233"] = 218,["234"] = 220,["235"] = 218,["236"] = 218,["237"] = 222,["238"] = 222,["239"] = 217});
local ____exports = {}
local ____VectorGroup = require("units.VectorGroup")
local VectorGroupSpawn = ____VectorGroup.VectorGroupSpawn
local ____Api = require("core.api.Api")
local API = ____Api.API
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Box = require("utils.Box")
local Box = ____Box.Box
local ____HeroInventory = require("utils.HeroInventory")
local HeroInventory = ____HeroInventory.HeroInventory
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
____exports.AimVector = __TS__Class()
local AimVector = ____exports.AimVector
AimVector.name = "AimVector"
__TS__ClassExtends(AimVector, GameBase)
function AimVector.prototype.____constructor(self)
    GameBase.prototype.____constructor(self, "aim_common")
    self.result = 0
    self.streak = 0
    self.avgTime = 0
    self.maxStreak = 0
    self.killedWards = 0
    self.totalWards = 10
    self.killTimes = {}
    self.heroPreviousState = {attack_capability = nil}
    self.isGameRunning = false
    self.unsubs = {}
end
function AimVector.prototype.relaunch(self, options)
    self:finish()
    self:launch(options)
end
function AimVector.prototype.finish(self)
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
function AimVector.prototype.launch(self, options)
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
function AimVector.prototype.spawnEntities(self)
    if self.isGameRunning then
        return
    end
    self.isGameRunning = true
    __TS__New(VectorGroupSpawn):spawn(self.outerBox, self.heroBox, {entities_count = 10})
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
function AimVector.prototype.emitResultChange(self)
    CustomGameEventManager:Send_ServerToPlayer(self.controller, "aim_common.result_update", {
        result = self.result,
        streak = self.streak,
        avgTime = self.avgTime,
        totalWards = self.totalWards,
        maxStreak = self.maxStreak,
        killedWards = self.killedWards
    })
end
function AimVector.prototype.dropResult(self)
    self.streak = 0
    self:emitResultChange()
end
function AimVector.prototype.setupHero(self)
    local hero = self.controller:GetAssignedHero()
    HeroInventory:reset(hero)
    self.heroPreviousState = {attack_capability = hero:GetAttackCapability()}
    hero:SetMoveCapability(0)
    hero:SetAttackCapability(0)
    hero:AddItemByName("item_custom_qblade")
end
function AimVector.prototype.resetHero(self)
    local hero = self.controller:GetAssignedHero()
    hero:SetMoveCapability(1)
    hero:SetAttackCapability(self.heroPreviousState.attack_capability)
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
        "aim_common.table.get.response",
        function()
        end
    )
    local ____self_listeners_5 = self.listeners
    ____self_listeners_5[#____self_listeners_5 + 1] = listener
end
return ____exports
