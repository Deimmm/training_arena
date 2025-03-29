local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 8,["20"] = 5,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 20,["25"] = 21,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 29,["34"] = 29,["35"] = 29,["36"] = 29,["37"] = 29,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 34,["45"] = 41,["46"] = 41,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 17,["53"] = 49,["54"] = 50,["55"] = 51,["56"] = 52,["59"] = 55,["60"] = 56,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 57,["65"] = 49,["66"] = 59,["67"] = 60,["68"] = 61,["71"] = 64,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 65,["80"] = 73,["81"] = 59});
local ____exports = {}
local ____Sniper = require("ai.Sniper")
local Sniper = ____Sniper.Sniper
local ____creeps = require("units.creeps")
local CreepSpawn = ____creeps.CreepSpawn
____exports.Lasthit1V1 = __TS__Class()
local Lasthit1V1 = ____exports.Lasthit1V1
Lasthit1V1.name = "Lasthit1V1"
function Lasthit1V1.prototype.____constructor(self)
end
function Lasthit1V1.launch(self, controller)
    self:createSniper()
    self:moveHero(controller)
    self:initCreepSpawns()
end
function Lasthit1V1.initCreepSpawns(self)
    local padawan_spawn = Entities:FindByName(nil, "radiant_creep_spawn")
    local sniper_spawn = Entities:FindByName(nil, "dire_creep_spawn")
    if not padawan_spawn or not sniper_spawn then
        print("WARNING: ", "Cant find spawns")
        return
    end
    print(
        "PADAWAN:",
        padawan_spawn:GetAbsOrigin().x,
        padawan_spawn:GetAbsOrigin().y
    )
    print(
        "SNIPER:",
        sniper_spawn:GetAbsOrigin().x,
        sniper_spawn:GetAbsOrigin().y
    )
    CreepSpawn:createSpawn(
        padawan_spawn:GetAbsOrigin(),
        sniper_spawn:GetAbsOrigin(),
        {melee = 3, range = 1, business = 0},
        30,
        DOTA_TEAM_GOODGUYS
    )
    CreepSpawn:createSpawn(
        sniper_spawn:GetAbsOrigin(),
        padawan_spawn:GetAbsOrigin(),
        {melee = 3, range = 1, business = 0},
        30,
        DOTA_TEAM_BADGUYS
    )
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
