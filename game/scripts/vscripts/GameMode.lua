local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 10,["13"] = 11,["14"] = 10,["16"] = 21,["17"] = 22,["18"] = 20,["19"] = 12,["20"] = 13,["21"] = 12,["22"] = 16,["23"] = 17,["24"] = 16,["25"] = 24,["26"] = 25,["27"] = 25,["28"] = 27,["29"] = 28,["30"] = 29,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 33,["35"] = 33,["36"] = 35,["37"] = 36,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 43,["42"] = 43,["43"] = 45,["44"] = 46,["45"] = 47,["46"] = 48,["47"] = 49,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 54,["53"] = 54,["54"] = 56,["55"] = 57,["56"] = 58,["57"] = 59,["58"] = 60,["59"] = 61,["61"] = 54,["62"] = 54,["63"] = 24,["64"] = 71,["65"] = 72,["66"] = 74,["67"] = 75,["68"] = 76,["69"] = 77,["70"] = 78,["71"] = 79,["72"] = 81,["73"] = 71,["74"] = 10,["75"] = 11});
local ____exports = {}
local ____Lasthit1v1 = require("games.Lasthit1v1")
local Lasthit1V1 = ____Lasthit1v1.Lasthit1V1
local ____tstl_2Dutils = require("lib.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
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
    GameRules:SetTimeOfDay(0)
    print("CONFIGUYRE END")
end
GameMode = __TS__Decorate(GameMode, GameMode, {reloadable}, {kind = "class", name = "GameMode"})
____exports.GameMode = GameMode
return ____exports
