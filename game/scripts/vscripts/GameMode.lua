local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 14,["19"] = 15,["20"] = 14,["22"] = 16,["23"] = 44,["24"] = 45,["25"] = 43,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 27,["32"] = 32,["33"] = 17,["34"] = 39,["35"] = 40,["36"] = 39,["37"] = 47,["38"] = 48,["39"] = 48,["40"] = 50,["41"] = 51,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 59,["46"] = 59,["47"] = 59,["48"] = 59,["49"] = 59,["50"] = 65,["51"] = 66,["52"] = 67,["53"] = 68,["54"] = 47,["55"] = 72,["56"] = 73,["57"] = 74,["58"] = 76,["59"] = 81,["62"] = 72,["63"] = 85,["64"] = 86,["65"] = 87,["66"] = 88,["67"] = 89,["68"] = 90,["69"] = 91,["70"] = 92,["71"] = 93,["72"] = 94,["73"] = 95,["74"] = 95,["75"] = 95,["76"] = 95,["77"] = 85,["78"] = 14,["79"] = 15});
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
    self.context = {}
    self:eventHandling()
    self:gameRules()
end
function GameMode.Precache(context)
    PrecacheUnitByNameSync("npc_dota_hero_sniper", context)
    PrecacheUnitByNameSync("npc_dummy_sniper", context)
    PrecacheResource("soundfile", "soundevents/sounds.vsndevts", context)
    PrecacheResource("particle", "particles/msg_fx/msg_death.vpcf", context)
    PrecacheResource("particle", "particles/custom/range_display_line_red.vpcf", context)
    PrecacheResource("particle", "particles/units/heroes/hero_muerta/muerta_deadshot.vpcf", context)
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
        function(____, event) return self:onNPCSpawned(event) end,
        self.context
    )
    __TS__New(API):listenEvents()
    __TS__New(Lasthit1V1):listenEvents()
    __TS__New(AimCommon):listenEvents()
    __TS__New(AimVector):listenEvents()
end
function GameMode.prototype.onNPCSpawned(self, event)
    local npc = EntIndexToHScript(event.entindex)
    if npc:GetTeam() then
        if npc and npc:GetTeam() == DOTA_TEAM_GOODGUYS and npc:IsRealHero() and not npc:HasModifier("modifier_global_shop") then
            npc:SetGold(999999, true)
        end
    end
end
function GameMode.prototype.gameRules(self)
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
end
GameMode = __TS__Decorate(GameMode, GameMode, {reloadable}, {kind = "class", name = "GameMode"})
____exports.GameMode = GameMode
return ____exports
