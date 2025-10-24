local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["20"] = 8,["21"] = 9,["22"] = 11,["23"] = 15,["24"] = 28,["25"] = 29,["26"] = 30,["27"] = 32,["28"] = 39,["29"] = 39,["30"] = 39,["31"] = 39,["32"] = 40,["33"] = 40,["34"] = 40,["35"] = 41,["36"] = 40,["37"] = 40,["38"] = 28,["39"] = 45,["40"] = 46,["41"] = 47,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 48,["47"] = 52,["48"] = 54,["49"] = 54,["50"] = 54,["51"] = 54,["52"] = 56,["53"] = 57,["54"] = 58,["55"] = 45,["56"] = 61,["57"] = 61,["58"] = 63,["59"] = 64,["60"] = 64,["61"] = 64,["62"] = 65,["63"] = 65,["64"] = 65,["65"] = 66,["66"] = 65,["67"] = 65,["68"] = 64,["69"] = 64,["70"] = 63,["71"] = 75,["72"] = 75,["73"] = 76,["74"] = 77,["75"] = 77,["76"] = 77,["77"] = 77,["78"] = 77,["79"] = 77,["80"] = 77,["81"] = 77,["82"] = 85,["83"] = 86,["84"] = 87,["85"] = 89,["86"] = 90,["89"] = 93,["90"] = 94,["91"] = 95,["92"] = 96,["93"] = 97,["94"] = 98,["95"] = 99,["96"] = 99,["97"] = 99,["98"] = 100,["99"] = 100,["100"] = 100,["101"] = 100,["102"] = 100,["103"] = 99,["104"] = 99,["105"] = 76,["106"] = 111,["107"] = 112,["108"] = 113,["109"] = 115,["110"] = 116,["113"] = 119,["114"] = 120,["115"] = 121,["116"] = 121,["117"] = 121,["118"] = 121,["119"] = 111,["120"] = 124,["121"] = 125,["122"] = 126,["123"] = 127,["124"] = 130,["125"] = 131,["126"] = 132,["127"] = 133,["128"] = 124,["129"] = 136,["130"] = 137,["131"] = 138,["132"] = 139,["133"] = 140,["134"] = 141,["135"] = 136,["136"] = 144,["137"] = 145,["138"] = 146,["139"] = 147,["142"] = 150,["143"] = 151,["144"] = 152,["145"] = 152,["146"] = 152,["147"] = 152,["148"] = 144});
local ____exports = {}
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____manta = require("modifiers.manta")
local manta_modifier = ____manta.manta_modifier
local ____HeroInventory = require("utils.HeroInventory")
local HeroInventory = ____HeroInventory.HeroInventory
____exports.MantaDodge = __TS__Class()
local MantaDodge = ____exports.MantaDodge
MantaDodge.name = "MantaDodge"
__TS__ClassExtends(MantaDodge, GameBase)
function MantaDodge.prototype.____constructor(self)
    GameBase.prototype.____constructor(self, "manta_dodge")
    self.unsubs = {}
    self.heroPreviousState = {attack_capability = nil}
end
function MantaDodge.prototype.launch(self, options)
    self:moveHero(self.controller)
    self:setupHero()
    local spells = {{hero = "npc_dota_hero_magnataur", ability_name = "magnataur_reverse_polarity"}}
    self:preCacheHeroes(__TS__ArrayMap(
        spells,
        function(____, e) return e.hero end
    ))
    Timers:CreateTimer(
        3,
        function()
            self:castSpell(spells[1])
        end
    )
end
function MantaDodge.prototype.finish(self)
    local listeners = self.listeners
    if #listeners > 0 then
        __TS__ArrayForEach(
            listeners,
            function(____, listener) return CustomGameEventManager:UnregisterListener(listener) end
        )
    end
    StopListeningToAllGameEvents(self.context)
    __TS__ArrayMap(
        self.unsubs,
        function(____, e) return e(nil) end
    )
    self:resetHero()
    self:returnHero()
    self:listenEvents()
end
function MantaDodge.prototype.relaunch(self)
end
function MantaDodge.prototype.preCacheHeroes(self, heroes)
    __TS__ArrayForEach(
        heroes,
        function(____, hero)
            PrecacheUnitByNameAsync(
                hero,
                function()
                    print("PRECACHE FINISH ", hero)
                end
            )
        end
    )
end
function MantaDodge.prototype.setupSkills(self)
end
function MantaDodge.prototype.castSpell(self, config)
    local hero = CreateUnitByName(
        config.hero,
        Vector(),
        false,
        nil,
        nil,
        DOTA_TEAM_BADGUYS
    )
    hero:SetAttackCapability(0)
    hero:SetMoveCapability(1)
    local spawn_name = "main_training_spawn"
    local padawan_spawn = Entities:FindByName(nil, spawn_name)
    if not padawan_spawn then
        return
    end
    local vector = padawan_spawn:GetAbsOrigin()
    hero:SetAbsOrigin(vector:__add(Vector(100, 0, 0)))
    local ability = hero:FindAbilityByName(config.ability_name)
    ability:SetLevel(1)
    print(ability:GetName())
    DeepPrintTable(self.controller:GetAssignedHero())
    Timers:CreateTimer(
        1,
        function()
            hero:CastAbilityOnPosition(
                self.controller:GetAssignedHero():GetAbsOrigin(),
                ability,
                0
            )
        end
    )
end
function MantaDodge.prototype.moveHero(self, controller)
    local hero = controller:GetAssignedHero()
    local spawn_name = "main_training_spawn"
    local padawan_spawn = Entities:FindByName(nil, spawn_name)
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
function MantaDodge.prototype.setupHero(self)
    local hero = self.controller:GetAssignedHero()
    HeroInventory:reset(hero)
    self.heroPreviousState = {attack_capability = hero:GetAttackCapability()}
    hero:SetMoveCapability(0)
    hero:SetAttackCapability(0)
    hero:AddNewModifier(nil, nil, manta_modifier.name, {})
    hero:AddItemByName("item_manta")
end
function MantaDodge.prototype.resetHero(self)
    local hero = self.controller:GetAssignedHero()
    hero:SetMoveCapability(1)
    hero:SetAttackCapability(self.heroPreviousState.attack_capability)
    hero:RemoveModifierByName(manta_modifier.name)
    HeroInventory:reset(hero)
end
function MantaDodge.prototype.returnHero(self)
    local hero = self.controller:GetAssignedHero()
    local game_start = Entities:FindByName(nil, "start")
    if not game_start then
        return
    end
    local vector = game_start:GetAbsOrigin()
    hero:SetAbsOrigin(vector)
    CenterCameraOnUnit(
        self.controller:GetPlayerID(),
        hero
    )
end
return ____exports
