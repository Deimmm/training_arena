local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 12,["8"] = 12,["9"] = 12,["10"] = 18,["11"] = 14,["12"] = 15,["13"] = 19,["14"] = 18,["15"] = 22,["16"] = 23,["17"] = 24,["18"] = 24,["19"] = 26,["20"] = 27,["21"] = 28,["22"] = 29,["23"] = 30,["24"] = 31,["25"] = 32,["26"] = 33,["27"] = 33,["28"] = 35,["29"] = 36,["30"] = 37,["31"] = 38,["32"] = 40,["33"] = 46,["34"] = 33,["35"] = 33,["36"] = 54,["37"] = 54,["38"] = 56,["39"] = 57,["40"] = 58,["41"] = 59,["42"] = 60,["43"] = 54,["44"] = 54,["45"] = 67,["46"] = 68,["48"] = 24,["49"] = 24,["50"] = 76,["51"] = 76,["52"] = 22,["53"] = 78,["54"] = 78,["55"] = 79,["56"] = 79,["57"] = 80,["58"] = 80});
local ____exports = {}
____exports.GameBase = __TS__Class()
local GameBase = ____exports.GameBase
GameBase.name = "GameBase"
function GameBase.prototype.____constructor(self, game_name)
    self.listeners = {}
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
return ____exports
