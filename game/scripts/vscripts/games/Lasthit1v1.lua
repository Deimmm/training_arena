local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 4,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 17,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 22,["28"] = 22,["29"] = 22,["30"] = 14,["31"] = 24,["32"] = 25,["33"] = 26,["36"] = 29,["37"] = 30,["38"] = 30,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 38,["46"] = 24});
local ____exports = {}
local ____Sniper = require("ai.Sniper")
local Sniper = ____Sniper.Sniper
____exports.Lasthit1V1 = __TS__Class()
local Lasthit1V1 = ____exports.Lasthit1V1
Lasthit1V1.name = "Lasthit1V1"
function Lasthit1V1.prototype.____constructor(self)
end
function Lasthit1V1.launch(self, controller)
    self:createSniper()
    self:moveHero(controller)
end
function Lasthit1V1.moveHero(self, controller)
    local hero = controller:GetAssignedHero()
    local padawan_spawn = Entities:FindByName(nil, "padawan_spawn")
    if not padawan_spawn then
        return
    end
    local vector = padawan_spawn:GetAbsOrigin()
    hero:SetAbsOrigin(vector)
    CenterCameraOnUnit(
        controller:GetPlayerID(),
        hero
    )
end
function Lasthit1V1.createSniper(self)
    local sniper_spawn = Entities:FindByName(nil, "sniper_spawn")
    if not sniper_spawn then
        return
    end
    local spawn_vector = sniper_spawn:GetAbsOrigin()
    local sniper_hero = CreateUnitByName(
        "npc_dota_hero_sniper",
        spawn_vector,
        true,
        nil,
        nil,
        DOTA_TEAM_BADGUYS
    )
    local sniper = __TS__New(Sniper)
end
return ____exports
