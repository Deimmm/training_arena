local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 11,["15"] = 12,["16"] = 11,["18"] = 29,["19"] = 30,["20"] = 28,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 17,["26"] = 13,["27"] = 24,["28"] = 25,["29"] = 24,["30"] = 32,["31"] = 33,["32"] = 33,["33"] = 35,["34"] = 36,["35"] = 37,["36"] = 33,["37"] = 33,["38"] = 33,["39"] = 41,["40"] = 41,["41"] = 43,["42"] = 44,["43"] = 41,["44"] = 41,["45"] = 41,["46"] = 51,["47"] = 51,["48"] = 53,["49"] = 54,["50"] = 55,["51"] = 56,["53"] = 51,["54"] = 51,["55"] = 51,["56"] = 61,["57"] = 61,["58"] = 61,["59"] = 61,["60"] = 61,["61"] = 67,["62"] = 68,["63"] = 32,["64"] = 71,["65"] = 72,["66"] = 73,["67"] = 74,["69"] = 71,["70"] = 78,["71"] = 79,["72"] = 80,["73"] = 81,["74"] = 82,["75"] = 83,["76"] = 84,["77"] = 85,["78"] = 86,["79"] = 87,["80"] = 88,["81"] = 89,["82"] = 89,["83"] = 89,["84"] = 89,["85"] = 90,["86"] = 78,["87"] = 11,["88"] = 12});
local ____exports = {}
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
