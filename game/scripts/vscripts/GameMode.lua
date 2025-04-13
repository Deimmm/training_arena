local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 10,["13"] = 11,["14"] = 10,["16"] = 23,["17"] = 24,["18"] = 22,["19"] = 12,["20"] = 13,["21"] = 15,["22"] = 12,["23"] = 18,["24"] = 19,["25"] = 18,["26"] = 26,["27"] = 27,["28"] = 27,["29"] = 29,["30"] = 30,["31"] = 31,["32"] = 27,["33"] = 27,["34"] = 27,["35"] = 35,["36"] = 35,["37"] = 37,["38"] = 38,["39"] = 35,["40"] = 35,["41"] = 35,["42"] = 45,["43"] = 45,["44"] = 47,["45"] = 48,["46"] = 49,["47"] = 50,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 55,["53"] = 55,["54"] = 55,["55"] = 55,["56"] = 55,["57"] = 61,["58"] = 26,["59"] = 64,["60"] = 65,["61"] = 66,["62"] = 67,["64"] = 64,["65"] = 71,["66"] = 72,["67"] = 73,["68"] = 74,["69"] = 75,["70"] = 76,["71"] = 77,["72"] = 78,["73"] = 79,["74"] = 80,["75"] = 81,["76"] = 82,["77"] = 82,["78"] = 82,["79"] = 82,["80"] = 83,["81"] = 71,["82"] = 10,["83"] = 11});
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
            local state = GameRules:State_Get()
            if state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                local ____ = PlayerResource.GetPlayer
            end
        end,
        nil
    )
    ListenToGameEvent(
        "npc_spawned",
        function(event) return self:onNPCSpawned(event) end,
        nil
    )
    __TS__New(Lasthit1V1):listenEvents()
end
function GameMode.prototype.onNPCSpawned(self, event)
    local npc = EntIndexToHScript(event.entindex)
    if npc and npc:IsRealHero() and not npc:HasModifier("modifier_global_shop") then
        npc:SetGold(999999, true)
    end
end
function GameMode.prototype.gameRules(self)
    print("CONFIGURE STARTS")
    GameRules:SetCustomGameSetupTimeout(0)
    GameRules:SetHeroSelectionTime(9999)
    GameRules:SetStrategyTime(9999)
    GameRules:SetShowcaseTime(0)
    GameRules:SetPreGameTime(0)
    GameRules:SetTimeOfDay(0)
    GameRules:SetUseUniversalShopMode(true)
    local gameMode = GameRules:GetGameModeEntity()
    gameMode:SetFogOfWarDisabled(true)
    SpawnDOTAShopTriggerRadiusApproximate(
        Vector(),
        999999
    )
    print("CONFIGUYRE END")
end
GameMode = __TS__Decorate(GameMode, GameMode, {reloadable}, {kind = "class", name = "GameMode"})
____exports.GameMode = GameMode
return ____exports
