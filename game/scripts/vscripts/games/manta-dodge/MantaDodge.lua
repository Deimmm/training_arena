local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 8,["25"] = 8,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["31"] = 18,["32"] = 19,["33"] = 20,["34"] = 23,["35"] = 27,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 42,["41"] = 48,["42"] = 48,["43"] = 48,["44"] = 48,["45"] = 50,["46"] = 52,["47"] = 54,["48"] = 54,["49"] = 54,["50"] = 55,["51"] = 56,["52"] = 57,["53"] = 57,["54"] = 57,["55"] = 57,["56"] = 58,["57"] = 58,["58"] = 58,["59"] = 59,["60"] = 60,["61"] = 61,["63"] = 58,["64"] = 58,["67"] = 54,["68"] = 54,["69"] = 68,["70"] = 68,["71"] = 68,["72"] = 69,["73"] = 70,["74"] = 71,["76"] = 68,["77"] = 68,["78"] = 74,["79"] = 74,["80"] = 76,["81"] = 77,["82"] = 78,["83"] = 79,["84"] = 74,["85"] = 74,["86"] = 74,["87"] = 37,["88"] = 85,["89"] = 86,["90"] = 87,["91"] = 88,["92"] = 89,["93"] = 89,["94"] = 89,["95"] = 89,["97"] = 93,["98"] = 95,["99"] = 95,["100"] = 95,["101"] = 95,["102"] = 97,["103"] = 98,["104"] = 99,["105"] = 85,["106"] = 102,["107"] = 102,["108"] = 104,["109"] = 105,["110"] = 105,["111"] = 105,["112"] = 106,["113"] = 106,["114"] = 106,["115"] = 107,["116"] = 108,["117"] = 106,["118"] = 106,["119"] = 105,["120"] = 105,["121"] = 104,["122"] = 117,["124"] = 117,["125"] = 122,["126"] = 123,["127"] = 123,["128"] = 123,["129"] = 123,["130"] = 123,["131"] = 123,["132"] = 123,["133"] = 123,["134"] = 131,["135"] = 132,["136"] = 133,["137"] = 134,["138"] = 136,["139"] = 136,["140"] = 136,["141"] = 136,["142"] = 136,["143"] = 138,["144"] = 139,["145"] = 141,["146"] = 141,["147"] = 141,["148"] = 142,["149"] = 142,["150"] = 142,["151"] = 142,["152"] = 142,["153"] = 148,["154"] = 148,["155"] = 148,["156"] = 149,["157"] = 150,["158"] = 151,["159"] = 151,["160"] = 151,["161"] = 152,["162"] = 153,["163"] = 151,["164"] = 151,["165"] = 148,["166"] = 148,["167"] = 141,["168"] = 141,["169"] = 122,["170"] = 163,["171"] = 164,["172"] = 165,["173"] = 166,["174"] = 167,["175"] = 167,["176"] = 167,["177"] = 167,["178"] = 163,["179"] = 170,["180"] = 171,["181"] = 172,["182"] = 173,["183"] = 173,["184"] = 173,["185"] = 173,["186"] = 173,["187"] = 173,["188"] = 173,["189"] = 174,["190"] = 176,["191"] = 177,["192"] = 178,["193"] = 182,["194"] = 183,["195"] = 184,["196"] = 170,["197"] = 187,["198"] = 188,["199"] = 189,["200"] = 190,["201"] = 191,["202"] = 192,["203"] = 187,["204"] = 195,["205"] = 196,["206"] = 197,["207"] = 198,["210"] = 201,["211"] = 202,["212"] = 203,["213"] = 203,["214"] = 203,["215"] = 203,["216"] = 195});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____manta = require("modifiers.manta")
local manta_modifier = ____manta.manta_modifier
local ____Invisible = require("units.Invisible")
local InvisibileWall = ____Invisible.InvisibileWall
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
    InvisibileWall:wrapBox(self.heroBox)
    local hero = self.controller:GetAssignedHero()
    HeroInventory:reset(hero)
    self.heroPreviousState = {attack_capability = hero:GetAttackCapability()}
    hero:SetAttackCapability(0)
    hero:AddNewModifier(nil, nil, manta_modifier.name, {})
    hero:AddItemByName("item_custom_manta")
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
