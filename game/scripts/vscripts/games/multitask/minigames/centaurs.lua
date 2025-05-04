local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 7,["12"] = 8,["13"] = 9,["14"] = 7,["15"] = 12,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 22,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 23,["33"] = 13,["34"] = 13,["36"] = 12,["37"] = 33,["38"] = 33});
local ____exports = {}
____exports.CentaurMinigame = __TS__Class()
local CentaurMinigame = ____exports.CentaurMinigame
CentaurMinigame.name = "CentaurMinigame"
function CentaurMinigame.prototype.____constructor(self, box, controller)
    self.box = box
    self.player = controller
end
function CentaurMinigame.prototype.start(self)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        PrecacheUnitByNameAsync(
            "npc_dota_hero_phantom_assassin",
            function()
                local hero = CreateUnitByName(
                    "npc_dota_hero_phantom_assassin",
                    self.box.boxPoints[1],
                    true,
                    self.player,
                    self.player,
                    DOTA_TEAM_GOODGUYS
                )
                hero:SetControllableByPlayer(
                    self.player:GetPlayerID(),
                    true
                )
                hero:SetMoveCapability(1)
            end
        )
    end)
end
function CentaurMinigame.prototype.finish(self)
end
return ____exports
