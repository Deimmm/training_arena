local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 7,["19"] = 7,["20"] = 15,["21"] = 16,["22"] = 15,["24"] = 17,["25"] = 45,["26"] = 46,["27"] = 44,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 28,["34"] = 33,["35"] = 18,["36"] = 40,["37"] = 41,["38"] = 40,["39"] = 48,["40"] = 49,["41"] = 49,["42"] = 51,["43"] = 52,["44"] = 56,["45"] = 49,["46"] = 49,["47"] = 49,["48"] = 61,["49"] = 61,["50"] = 61,["51"] = 61,["52"] = 61,["53"] = 67,["54"] = 67,["55"] = 67,["56"] = 68,["57"] = 69,["58"] = 67,["59"] = 67,["60"] = 72,["61"] = 73,["62"] = 74,["63"] = 75,["64"] = 76,["65"] = 48,["66"] = 80,["67"] = 81,["68"] = 82,["69"] = 84,["70"] = 89,["73"] = 80,["74"] = 93,["75"] = 94,["76"] = 95,["77"] = 96,["78"] = 97,["79"] = 98,["80"] = 99,["81"] = 100,["82"] = 101,["83"] = 102,["84"] = 104,["85"] = 105,["86"] = 106,["87"] = 106,["88"] = 106,["89"] = 106,["90"] = 93,["91"] = 109,["92"] = 109,["93"] = 15,["94"] = 16});
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
local ____MantaDodge = require("games.manta-dodge.MantaDodge")
local MantaDodge = ____MantaDodge.MantaDodge
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
            self:debug(event.PlayerID)
        end,
        nil
    )
    ListenToGameEvent(
        "npc_spawned",
        function(____, event) return self:onNPCSpawned(event) end,
        self.context
    )
    CustomGameEventManager:RegisterListener(
        "heroes.restart",
        function()
            print("[SERVER] heroes.restart")
            GameRules:ResetToHeroSelection()
        end
    )
    __TS__New(API):listenEvents()
    __TS__New(Lasthit1V1):listenEvents()
    __TS__New(AimCommon):listenEvents()
    __TS__New(AimVector):listenEvents()
    __TS__New(MantaDodge):listenEvents()
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
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, 0)
    GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, 1)
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
function GameMode.prototype.debug(self, playerId)
end
GameMode = __TS__Decorate(GameMode, GameMode, {reloadable}, {kind = "class", name = "GameMode"})
____exports.GameMode = GameMode
return ____exports
