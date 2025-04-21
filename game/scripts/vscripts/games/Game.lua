local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 12,["8"] = 12,["9"] = 12,["10"] = 18,["11"] = 14,["12"] = 15,["13"] = 19,["14"] = 18,["15"] = 22,["16"] = 23,["17"] = 24,["18"] = 24,["19"] = 26,["20"] = 27,["21"] = 28,["22"] = 29,["23"] = 30,["24"] = 31,["25"] = 31,["26"] = 33,["27"] = 34,["28"] = 35,["29"] = 40,["30"] = 31,["31"] = 31,["32"] = 48,["33"] = 48,["34"] = 50,["35"] = 51,["36"] = 52,["37"] = 48,["38"] = 48,["39"] = 59,["40"] = 60,["42"] = 24,["43"] = 24,["44"] = 68,["45"] = 68,["46"] = 22,["47"] = 70,["48"] = 70,["49"] = 71,["50"] = 71,["51"] = 72,["52"] = 72});
local ____exports = {}
____exports.GameBase = __TS__Class()
local GameBase = ____exports.GameBase
GameBase.name = "GameBase"
function GameBase.prototype.____constructor(self, game_name)
    self.listeners = {}
    self.context = {}
    self.game_name = game_name
end
function GameBase.prototype.listenEvents(self)
    local name = self.game_name
    local id = CustomGameEventManager:RegisterListener(
        "game_launch." .. name,
        function(userId, event)
            local playerController = PlayerResource:GetPlayer(event.PlayerID)
            if playerController then
                self.controller = playerController
                self:launch(event)
                local relaunchId = CustomGameEventManager:RegisterListener(
                    "game_relaunch." .. name,
                    function(userId, event)
                        self:relaunch(event)
                        CustomGameEventManager:Send_ServerToPlayer(playerController, ("game_relaunch." .. name) .. ".success", {data = nil})
                        CustomGameEventManager:Send_ServerToPlayer(playerController, ("game_launch." .. name) .. ".success", {data = nil})
                    end
                )
                local finishId = CustomGameEventManager:RegisterListener(
                    "game_finish." .. name,
                    function(userId, event)
                        self:finish()
                        CustomGameEventManager:Send_ServerToPlayer(playerController, "game_finish.${name}.success", {data = nil})
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
