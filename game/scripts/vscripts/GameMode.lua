local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 12,["17"] = 13,["18"] = 12,["20"] = 30,["21"] = 31,["22"] = 29,["23"] = 14,["24"] = 15,["25"] = 16,["26"] = 17,["27"] = 18,["28"] = 14,["29"] = 25,["30"] = 26,["31"] = 25,["32"] = 33,["33"] = 34,["34"] = 34,["35"] = 36,["36"] = 37,["37"] = 38,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 42,["42"] = 42,["43"] = 44,["44"] = 45,["45"] = 42,["46"] = 42,["47"] = 42,["48"] = 52,["49"] = 52,["50"] = 54,["51"] = 55,["52"] = 56,["53"] = 57,["55"] = 52,["56"] = 52,["57"] = 52,["58"] = 62,["59"] = 62,["60"] = 62,["61"] = 62,["62"] = 62,["63"] = 68,["64"] = 69,["65"] = 70,["66"] = 33,["67"] = 73,["68"] = 74,["69"] = 75,["70"] = 76,["72"] = 73,["73"] = 80,["74"] = 81,["75"] = 82,["76"] = 83,["77"] = 84,["78"] = 85,["79"] = 86,["80"] = 87,["81"] = 88,["82"] = 89,["83"] = 90,["84"] = 91,["85"] = 91,["86"] = 91,["87"] = 91,["88"] = 92,["89"] = 80,["90"] = 12,["91"] = 13});
local ____exports = {}
local ____Api = require("core.api.Api")
local API = ____Api.API
local ____AimCommon = require("games.AimCommon")
local AimCommon = ____AimCommon.AimCommon
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
    PrecacheResource("soundfile", "soundevents/sounds.vsndevts", context)
    PrecacheResource("particle", "particles/msg_fx/msg_death.vpcf", context)
    PrecacheResource("particle", "particles/custom/range_display_line_red.vpcf", context)
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
    __TS__New(API):listenEvents()
    __TS__New(Lasthit1V1):listenEvents()
    __TS__New(AimCommon):listenEvents()
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
