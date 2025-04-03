local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 7,["18"] = 8,["19"] = 5,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 21,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 29,["33"] = 29,["34"] = 29,["35"] = 29,["36"] = 29,["37"] = 34,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 17,["52"] = 49,["53"] = 50,["54"] = 51,["55"] = 52,["58"] = 55,["59"] = 56,["60"] = 57,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 49,["65"] = 59,["66"] = 60,["67"] = 61,["70"] = 64,["71"] = 65,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 73,["80"] = 73,["81"] = 75,["82"] = 76,["83"] = 77,["84"] = 78,["85"] = 79,["86"] = 80,["87"] = 85,["89"] = 87,["90"] = 87,["91"] = 87,["92"] = 87,["93"] = 87,["94"] = 87,["95"] = 87,["97"] = 73,["98"] = 73,["99"] = 73,["100"] = 98,["101"] = 59});
local ____exports = {}
local ____Sniper = require("ai.Sniper")
local sniper_ai = ____Sniper.sniper_ai
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
    local eventId = ListenToGameEvent(
        "entity_killed",
        function(____, event)
            if event.entindex_attacker == sniper_hero:GetEntityIndex() then
                local entity = EntIndexToHScript(event.entindex_killed)
                if entity then
                    local position = entity:GetAbsOrigin()
                    local particle = ParticleManager:CreateParticle("particles/msg_fx/msg_death.vpcf", 8, nil)
                    ParticleManager:SetParticleControl(particle, 0, position)
                end
                print(
                    "entity_killed ",
                    "KILLED BY: ",
                    event.entindex_attacker,
                    "SNIPERID",
                    sniper_hero:GetEntityIndex()
                )
            end
        end,
        {}
    )
    sniper_hero:AddNewModifier(nil, nil, sniper_ai.name, {damage = 65, base_attack_time = 1})
end
return ____exports
