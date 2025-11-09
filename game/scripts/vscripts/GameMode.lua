local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 7,["20"] = 7,["21"] = 15,["22"] = 16,["23"] = 15,["25"] = 17,["26"] = 40,["27"] = 41,["28"] = 39,["29"] = 18,["30"] = 19,["31"] = 20,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 28,["36"] = 18,["37"] = 35,["38"] = 36,["39"] = 35,["40"] = 43,["41"] = 44,["42"] = 44,["43"] = 46,["44"] = 47,["45"] = 51,["46"] = 44,["47"] = 44,["48"] = 44,["49"] = 56,["50"] = 56,["51"] = 56,["52"] = 56,["53"] = 56,["54"] = 62,["55"] = 63,["56"] = 63,["57"] = 63,["58"] = 63,["59"] = 63,["60"] = 63,["61"] = 69,["62"] = 69,["63"] = 69,["64"] = 69,["65"] = 71,["66"] = 71,["67"] = 71,["68"] = 72,["69"] = 73,["70"] = 73,["71"] = 73,["72"] = 73,["73"] = 74,["74"] = 71,["75"] = 71,["76"] = 43,["77"] = 78,["78"] = 79,["79"] = 80,["80"] = 82,["81"] = 87,["84"] = 78,["85"] = 91,["86"] = 92,["87"] = 93,["88"] = 94,["89"] = 95,["90"] = 96,["91"] = 97,["92"] = 98,["93"] = 99,["94"] = 100,["95"] = 102,["96"] = 103,["97"] = 105,["98"] = 105,["99"] = 105,["100"] = 105,["101"] = 91,["102"] = 108,["103"] = 108,["104"] = 15,["105"] = 16});
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
    __TS__New(API):listenEvents()
    local games = {
        __TS__New(Lasthit1V1),
        __TS__New(AimCommon),
        __TS__New(AimVector),
        __TS__New(MantaDodge)
    }
    __TS__ArrayForEach(
        games,
        function(____, game) return game:listenEvents() end
    )
    CustomGameEventManager:RegisterListener(
        "heroes.restart",
        function()
            print("[SERVER] heroes.restart")
            __TS__ArrayForEach(
                games,
                function(____, game) return game:finish() end
            )
            GameRules:ResetToHeroSelection()
        end
    )
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
