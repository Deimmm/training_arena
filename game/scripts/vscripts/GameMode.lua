local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 10,["10"] = 10,["11"] = 10,["13"] = 20,["14"] = 21,["15"] = 19,["16"] = 11,["17"] = 12,["18"] = 11,["19"] = 15,["20"] = 16,["21"] = 15,["22"] = 23,["23"] = 24,["24"] = 24,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 32,["32"] = 32,["33"] = 34,["34"] = 35,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 42,["39"] = 42,["40"] = 44,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 48,["46"] = 42,["47"] = 42,["48"] = 42,["49"] = 53,["50"] = 53,["51"] = 55,["52"] = 56,["53"] = 57,["54"] = 58,["55"] = 59,["56"] = 60,["58"] = 53,["59"] = 53,["60"] = 23,["61"] = 70,["62"] = 71,["63"] = 73,["64"] = 74,["65"] = 75,["66"] = 76,["67"] = 77,["68"] = 79,["69"] = 70});
local ____exports = {}
local ____Lasthit1v1 = require("games.Lasthit1v1")
local Lasthit1V1 = ____Lasthit1v1.Lasthit1V1
____exports.GameMode = __TS__Class()
local GameMode = ____exports.GameMode
GameMode.name = "GameMode"
function GameMode.prototype.____constructor(self)
    self:eventHandling()
    self:gameRules()
end
function GameMode.Precache(context)
    PrecacheUnitByNameSync("npc_dota_hero_sniper", context)
end
function GameMode.Activate()
    GameRules.Addon = __TS__New(____exports.GameMode)
end
function GameMode.prototype.eventHandling(self)
    ListenToGameEvent(
        "player_chat",
        function(event)
            print("received message")
            print(event.text)
        end,
        nil
    )
    ListenToGameEvent(
        "player_connect_full",
        function(event)
            PlayerResource:SetCustomTeamAssignment(event.PlayerID, DOTA_TEAM_GOODGUYS)
        end,
        nil
    )
    ListenToGameEvent(
        "game_rules_state_change",
        function(event)
            print("game_rules_state_change: ", event)
            local state = GameRules:State_Get()
            print("GAME STATE CHANGE TO: ", state)
            if state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
            end
        end,
        nil
    )
    CustomGameEventManager:RegisterListener(
        "game_launch.1v1",
        function(userId, event)
            print("game_launch.1v1 EVENT AAA", event)
            local playerController = PlayerResource:GetPlayer(event.playerId)
            if playerController then
                Lasthit1V1:launch(playerController)
                CustomGameEventManager:Send_ServerToPlayer(playerController, "game_launch.1v1.success", {data = nil})
            end
        end
    )
end
function GameMode.prototype.gameRules(self)
    print("CONFIGURE STARTS")
    GameRules:SetCustomGameSetupTimeout(0)
    GameRules:SetHeroSelectionTime(9999)
    GameRules:SetStrategyTime(9999)
    GameRules:SetShowcaseTime(0)
    GameRules:SetPreGameTime(0)
    print("CONFIGUYRE END")
end
return ____exports
