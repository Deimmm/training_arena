local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 7,["19"] = 7,["20"] = 15,["21"] = 16,["22"] = 15,["24"] = 17,["25"] = 40,["26"] = 41,["27"] = 39,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 28,["35"] = 18,["36"] = 35,["37"] = 36,["38"] = 35,["39"] = 43,["40"] = 44,["41"] = 44,["42"] = 46,["43"] = 47,["44"] = 51,["45"] = 44,["46"] = 44,["47"] = 44,["48"] = 56,["49"] = 56,["50"] = 56,["51"] = 56,["52"] = 56,["53"] = 62,["54"] = 62,["55"] = 62,["56"] = 63,["57"] = 64,["58"] = 62,["59"] = 62,["60"] = 67,["61"] = 68,["62"] = 69,["63"] = 70,["64"] = 71,["65"] = 43,["66"] = 75,["67"] = 76,["68"] = 77,["69"] = 79,["70"] = 84,["73"] = 75,["74"] = 88,["75"] = 89,["76"] = 90,["77"] = 91,["78"] = 92,["79"] = 93,["80"] = 94,["81"] = 95,["82"] = 96,["83"] = 97,["84"] = 99,["85"] = 100,["86"] = 102,["87"] = 102,["88"] = 102,["89"] = 102,["90"] = 88,["91"] = 105,["92"] = 105,["93"] = 15,["94"] = 16});
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
    PrecacheResource("particle", "particles/units/heroes/hero_muerta/muerta_deadshot.vpcf", context)
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
