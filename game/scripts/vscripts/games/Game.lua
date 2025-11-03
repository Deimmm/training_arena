local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 13,["8"] = 13,["9"] = 13,["10"] = 20,["11"] = 15,["12"] = 16,["13"] = 17,["14"] = 21,["15"] = 20,["16"] = 24,["17"] = 25,["18"] = 26,["19"] = 26,["20"] = 28,["21"] = 29,["22"] = 30,["23"] = 31,["24"] = 32,["25"] = 33,["26"] = 34,["27"] = 35,["28"] = 35,["29"] = 37,["30"] = 38,["31"] = 39,["32"] = 40,["33"] = 42,["34"] = 48,["35"] = 35,["36"] = 35,["37"] = 56,["38"] = 56,["39"] = 58,["40"] = 59,["41"] = 60,["42"] = 61,["43"] = 62,["44"] = 56,["45"] = 56,["46"] = 69,["47"] = 70,["49"] = 26,["50"] = 26,["51"] = 78,["52"] = 78,["53"] = 24,["54"] = 80,["55"] = 80,["56"] = 81,["57"] = 81,["58"] = 82,["59"] = 82,["60"] = 84,["61"] = 88,["62"] = 90,["63"] = 91,["66"] = 94,["67"] = 95,["68"] = 96,["69"] = 96,["70"] = 96,["71"] = 96,["72"] = 84});
local ____exports = {}
____exports.GameBase = __TS__Class()
local GameBase = ____exports.GameBase
GameBase.name = "GameBase"
function GameBase.prototype.____constructor(self, game_name)
    self.listeners = {}
    self.game_event_listeners = {}
    self.context = {}
    self.game_name = game_name
end
function GameBase.prototype.listenEvents(self, cb)
    local name = self.game_name
    local id = CustomGameEventManager:RegisterListener(
        "game_launch." .. name,
        function(userId, event)
            print("[SERVER] ", "game_launch." .. name, event)
            DeepPrintTable(event)
            local playerController = PlayerResource:GetPlayer(event.PlayerID)
            if playerController then
                self.controller = playerController
                self:launch(event)
                local relaunchId = CustomGameEventManager:RegisterListener(
                    "game_relaunch." .. name,
                    function(userId, event)
                        print("[SERVER] ", "game_relaunch." .. name)
                        DeepPrintTable(event)
                        self:relaunch(event)
                        CustomGameEventManager:Send_ServerToPlayer(playerController, ("game_relaunch." .. name) .. ".success", {data = nil})
                        CustomGameEventManager:Send_ServerToPlayer(playerController, ("game_launch." .. name) .. ".success", {data = nil})
                    end
                )
                local finishId = CustomGameEventManager:RegisterListener(
                    "game_finish." .. name,
                    function(userId, event)
                        print("[SERVER] ", "game_finish." .. name, event)
                        DeepPrintTable(event)
                        self:finish()
                        CustomGameEventManager:Send_ServerToPlayer(playerController, ("game_finish." .. name) .. ".success", {data = nil})
                    end
                )
                __TS__ArrayConcat(self.listeners, {relaunchId, finishId})
                CustomGameEventManager:Send_ServerToPlayer(playerController, ("game_launch." .. name) .. ".success", {data = nil})
            end
        end
    )
    local ____self_listeners_0 = self.listeners
    ____self_listeners_0[#____self_listeners_0 + 1] = id
end
function GameBase.prototype.launch(self, options)
end
function GameBase.prototype.relaunch(self, options)
end
function GameBase.prototype.finish(self)
end
function GameBase.moveHero(self, controller, spawn_name)
    local hero = controller:GetAssignedHero()
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
return ____exports
