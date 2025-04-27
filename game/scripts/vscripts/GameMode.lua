local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 13,["19"] = 14,["20"] = 13,["22"] = 31,["23"] = 32,["24"] = 30,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 15,["31"] = 26,["32"] = 27,["33"] = 26,["34"] = 34,["35"] = 35,["36"] = 35,["37"] = 37,["38"] = 38,["39"] = 35,["40"] = 35,["41"] = 35,["42"] = 46,["43"] = 46,["44"] = 46,["45"] = 46,["46"] = 46,["47"] = 52,["48"] = 53,["49"] = 54,["50"] = 55,["51"] = 34,["52"] = 58,["53"] = 59,["54"] = 60,["55"] = 61,["57"] = 58,["58"] = 65,["59"] = 66,["60"] = 67,["61"] = 68,["62"] = 69,["63"] = 70,["64"] = 71,["65"] = 72,["66"] = 73,["67"] = 74,["68"] = 75,["69"] = 76,["70"] = 76,["71"] = 76,["72"] = 76,["73"] = 77,["74"] = 65,["75"] = 13,["76"] = 14});
local ____exports = {}
local ____Api = require("core.api.Api")
local API = ____Api.API
local ____AimCommon = require("games.AimCommon")
local AimCommon = ____AimCommon.AimCommon
local ____Lasthit1v1 = require("games.Lasthit1v1")
local Lasthit1V1 = ____Lasthit1v1.Lasthit1V1
local ____tstl_2Dutils = require("lib.tstl-utils")
local reloadable = ____tstl_2Dutils.reloadable
local ____AimVector = require("games.AimVector")
local AimVector = ____AimVector.AimVector
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
        "player_connect_full",
        function(event)
            PlayerResource:SetCustomTeamAssignment(event.PlayerID, DOTA_TEAM_GOODGUYS)
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
    __TS__New(AimVector):listenEvents()
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
