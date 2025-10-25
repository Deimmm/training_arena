local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 17,["29"] = 17,["30"] = 18,["31"] = 19,["32"] = 22,["33"] = 26,["34"] = 36,["35"] = 37,["36"] = 38,["37"] = 39,["38"] = 41,["39"] = 47,["40"] = 47,["41"] = 47,["42"] = 47,["43"] = 49,["44"] = 51,["45"] = 53,["46"] = 53,["47"] = 53,["48"] = 54,["49"] = 55,["50"] = 56,["51"] = 56,["52"] = 56,["53"] = 56,["54"] = 57,["55"] = 57,["56"] = 57,["57"] = 58,["58"] = 59,["59"] = 60,["61"] = 57,["62"] = 57,["65"] = 53,["66"] = 53,["67"] = 67,["68"] = 67,["69"] = 67,["70"] = 68,["71"] = 69,["72"] = 70,["74"] = 67,["75"] = 67,["76"] = 73,["77"] = 73,["78"] = 75,["79"] = 76,["80"] = 77,["81"] = 78,["82"] = 73,["83"] = 73,["84"] = 73,["85"] = 36,["86"] = 84,["87"] = 85,["88"] = 86,["89"] = 87,["90"] = 88,["91"] = 88,["92"] = 88,["93"] = 88,["95"] = 92,["96"] = 94,["97"] = 94,["98"] = 94,["99"] = 94,["100"] = 96,["101"] = 97,["102"] = 98,["103"] = 84,["104"] = 101,["105"] = 101,["106"] = 103,["107"] = 104,["108"] = 104,["109"] = 104,["110"] = 105,["111"] = 105,["112"] = 105,["113"] = 106,["114"] = 107,["115"] = 105,["116"] = 105,["117"] = 104,["118"] = 104,["119"] = 103,["120"] = 116,["122"] = 116,["123"] = 121,["124"] = 122,["125"] = 122,["126"] = 122,["127"] = 122,["128"] = 122,["129"] = 122,["130"] = 122,["131"] = 122,["132"] = 130,["133"] = 131,["134"] = 132,["135"] = 133,["136"] = 135,["137"] = 135,["138"] = 135,["139"] = 135,["140"] = 135,["141"] = 137,["142"] = 138,["143"] = 140,["144"] = 140,["145"] = 140,["146"] = 141,["147"] = 141,["148"] = 141,["149"] = 141,["150"] = 141,["151"] = 147,["152"] = 147,["153"] = 147,["154"] = 148,["155"] = 149,["156"] = 150,["157"] = 150,["158"] = 150,["159"] = 151,["160"] = 152,["161"] = 150,["162"] = 150,["163"] = 147,["164"] = 147,["165"] = 140,["166"] = 140,["167"] = 121,["168"] = 162,["169"] = 163,["170"] = 164,["171"] = 165,["172"] = 166,["173"] = 166,["174"] = 166,["175"] = 166,["176"] = 162,["177"] = 169,["178"] = 170,["179"] = 171,["180"] = 172,["181"] = 172,["182"] = 172,["183"] = 172,["184"] = 172,["185"] = 172,["186"] = 172,["187"] = 174,["188"] = 175,["189"] = 176,["190"] = 180,["191"] = 181,["192"] = 182,["193"] = 183,["194"] = 184,["195"] = 185,["196"] = 186,["197"] = 169,["198"] = 189,["199"] = 190,["200"] = 191,["201"] = 192,["202"] = 193,["203"] = 194,["204"] = 189,["205"] = 197,["206"] = 198,["207"] = 199,["208"] = 200,["211"] = 203,["212"] = 204,["213"] = 205,["214"] = 205,["215"] = 205,["216"] = 205,["217"] = 197});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____manta = require("modifiers.manta")
local manta_modifier = ____manta.manta_modifier
local ____Box = require("utils.Box")
local Geometry = ____Box.Geometry
local ____HeroInventory = require("utils.HeroInventory")
local HeroInventory = ____HeroInventory.HeroInventory
local ____Utils = require("utils.Utils")
local Utils = ____Utils.Utils
____exports.MantaDodge = __TS__Class()
local MantaDodge = ____exports.MantaDodge
MantaDodge.name = "MantaDodge"
__TS__ClassExtends(MantaDodge, GameBase)
function MantaDodge.prototype.____constructor(self)
    GameBase.prototype.____constructor(self, "manta_dodge")
    self.unsubs = {}
    self.isRunning = false
    self.heroPreviousState = {attack_capability = nil}
end
function MantaDodge.prototype.launch(self, options)
    self.isRunning = true
    self:moveHero(self.controller)
    self:setupHero()
    local spells = {{hero = "npc_dota_hero_magnataur", ability_name = "magnataur_reverse_polarity"}}
    local heroes = __TS__ArrayMap(
        spells,
        function(____, e) return e.hero end
    )
    self:preCacheHeroes(heroes)
    local cache = {}
    eventBus:on(
        "manta_dodge.cache_finish",
        function(____, data)
            if data.hero then
                cache[#cache + 1] = data.hero
                if __TS__ArrayEvery(
                    heroes,
                    function(____, hero) return __TS__ArrayIncludes(cache, hero) end
                ) then
                    Timers:CreateTimer(
                        1,
                        function()
                            print("MANTA DODGE CACHE FINISH!!!")
                            if self.isRunning then
                                self:trigerrSpellCast(spells)
                            end
                        end
                    )
                end
            end
        end
    )
    eventBus:on(
        "manta_dodge.cast_spell_finish",
        function()
            print("manta_dodge.cast_spell_finish")
            if self.isRunning then
                self:trigerrSpellCast(spells)
            end
        end
    )
    ListenToGameEvent(
        "dota_illusions_created",
        function(____, event)
            DeepPrintTable(event)
            GetTreeIdForEntityIndex(event.original_entindex)
            local ____ = Entities.FindByTarget
        end,
        self.context
    )
end
function MantaDodge.prototype.finish(self)
    self.isRunning = false
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
                    eventBus:emit("manta_dodge.cache_finish", {hero = hero})
                    print("PRECACHE FINISH ", hero)
                end
            )
        end
    )
end
function MantaDodge.prototype.trigerrSpellCast(self, spells)
    return
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
    hero:SetUnitCanRespawn(false)
    hero:SetAttackCapability(0)
    hero:SetMoveCapability(1)
    local spawn_name = "main_training_spawn"
    Utils:moveEntityToEntity(
        hero,
        spawn_name,
        Vector(200, 200)
    )
    local ability = hero:FindAbilityByName(config.ability_name)
    ability:SetLevel(1)
    Timers:CreateTimer(
        1,
        function()
            hero:CastAbilityOnPosition(
                self.controller:GetAssignedHero():GetAbsOrigin(),
                ability,
                0
            )
            Timers:CreateTimer(
                0.5,
                function()
                    hero:ForceKill(false)
                    print("KILLING manta_dodge.cast_spell_finish")
                    Timers:CreateTimer(
                        1,
                        function()
                            print("EMITING manta_dodge.cast_spell_finish")
                            eventBus:emit("manta_dodge.cast_spell_finish", nil)
                        end
                    )
                end
            )
        end
    )
end
function MantaDodge.prototype.moveHero(self, controller)
    local hero = controller:GetAssignedHero()
    local spawn_name = "main_training_spawn"
    Utils:moveEntityToEntity(hero, spawn_name)
    CenterCameraOnUnit(
        controller:GetPlayerID(),
        hero
    )
end
function MantaDodge.prototype.setupHero(self)
    local startPosition = Entities:FindByName(nil, "main_training_spawn")
    self.heroBox = __TS__New(Geometry)
    self.heroBox:createBox(
        startPosition:GetAbsOrigin(),
        375,
        100,
        true,
        {}
    )
    local hero = self.controller:GetAssignedHero()
    HeroInventory:reset(hero)
    self.heroPreviousState = {attack_capability = hero:GetAttackCapability()}
    hero:SetAttackCapability(0)
    hero:AddNewModifier(nil, nil, manta_modifier.name, {})
    local item = hero:AddItemByName("item_custom_manta")
    local mod = hero:FindModifierByName(item:GetIntrinsicModifierName())
    DeepPrintTable(mod)
    print(item:GetModifierValue())
    print(item:GetIntrinsicModifierName())
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
