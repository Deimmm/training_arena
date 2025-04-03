local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 10,["13"] = 11,["14"] = 10,["16"] = 23,["17"] = 24,["18"] = 22,["19"] = 12,["20"] = 13,["21"] = 15,["22"] = 12,["23"] = 18,["24"] = 19,["25"] = 18,["26"] = 26,["27"] = 27,["28"] = 27,["29"] = 29,["30"] = 30,["31"] = 31,["32"] = 27,["33"] = 27,["34"] = 27,["35"] = 35,["36"] = 35,["37"] = 37,["38"] = 38,["39"] = 35,["40"] = 35,["41"] = 35,["42"] = 45,["43"] = 45,["44"] = 47,["45"] = 48,["46"] = 49,["47"] = 50,["48"] = 51,["50"] = 45,["51"] = 45,["52"] = 45,["53"] = 56,["54"] = 56,["55"] = 58,["56"] = 59,["57"] = 60,["58"] = 61,["59"] = 62,["60"] = 63,["62"] = 56,["63"] = 56,["64"] = 26,["65"] = 73,["66"] = 74,["67"] = 76,["68"] = 77,["69"] = 78,["70"] = 79,["71"] = 80,["72"] = 81,["73"] = 83,["74"] = 73,["75"] = 10,["76"] = 11});
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
    PrecacheResource("particle", "particles/msg_fx/msg_death.vpcf", context)
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
