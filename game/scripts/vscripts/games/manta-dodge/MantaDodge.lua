local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 6,["20"] = 6,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 16,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 23,["31"] = 33,["32"] = 34,["33"] = 35,["34"] = 36,["35"] = 38,["36"] = 44,["37"] = 44,["38"] = 44,["39"] = 44,["40"] = 46,["41"] = 48,["42"] = 50,["43"] = 50,["44"] = 50,["45"] = 51,["46"] = 52,["47"] = 53,["48"] = 53,["49"] = 53,["50"] = 53,["51"] = 54,["52"] = 54,["53"] = 54,["54"] = 55,["55"] = 56,["56"] = 57,["58"] = 54,["59"] = 54,["62"] = 50,["63"] = 50,["64"] = 64,["65"] = 64,["66"] = 64,["67"] = 65,["68"] = 66,["69"] = 67,["71"] = 64,["72"] = 64,["73"] = 70,["74"] = 70,["75"] = 72,["76"] = 73,["77"] = 74,["78"] = 75,["79"] = 70,["80"] = 70,["81"] = 70,["82"] = 33,["83"] = 81,["84"] = 82,["85"] = 83,["86"] = 84,["87"] = 85,["88"] = 85,["89"] = 85,["90"] = 85,["92"] = 89,["93"] = 91,["94"] = 91,["95"] = 91,["96"] = 91,["97"] = 93,["98"] = 94,["99"] = 95,["100"] = 81,["101"] = 98,["102"] = 98,["103"] = 100,["104"] = 101,["105"] = 101,["106"] = 101,["107"] = 102,["108"] = 102,["109"] = 102,["110"] = 103,["111"] = 104,["112"] = 102,["113"] = 102,["114"] = 101,["115"] = 101,["116"] = 100,["117"] = 113,["118"] = 114,["119"] = 115,["120"] = 113,["121"] = 117,["122"] = 118,["123"] = 118,["124"] = 118,["125"] = 118,["126"] = 118,["127"] = 118,["128"] = 118,["129"] = 118,["130"] = 126,["131"] = 127,["132"] = 128,["133"] = 129,["134"] = 131,["135"] = 131,["136"] = 131,["137"] = 131,["138"] = 131,["139"] = 133,["140"] = 134,["141"] = 136,["142"] = 136,["143"] = 136,["144"] = 137,["145"] = 137,["146"] = 137,["147"] = 137,["148"] = 137,["149"] = 143,["150"] = 143,["151"] = 143,["152"] = 144,["153"] = 145,["154"] = 146,["155"] = 146,["156"] = 146,["157"] = 147,["158"] = 148,["159"] = 146,["160"] = 146,["161"] = 143,["162"] = 143,["163"] = 136,["164"] = 136,["165"] = 117,["166"] = 158,["167"] = 159,["168"] = 160,["169"] = 161,["170"] = 162,["171"] = 162,["172"] = 162,["173"] = 162,["174"] = 158,["175"] = 165,["176"] = 166,["177"] = 167,["178"] = 168,["179"] = 171,["180"] = 172,["181"] = 173,["182"] = 174,["183"] = 175,["184"] = 176,["185"] = 177,["186"] = 178,["187"] = 165,["188"] = 181,["189"] = 182,["190"] = 183,["191"] = 184,["192"] = 185,["193"] = 186,["194"] = 181,["195"] = 189,["196"] = 190,["197"] = 191,["198"] = 192,["201"] = 195,["202"] = 196,["203"] = 197,["204"] = 197,["205"] = 197,["206"] = 197,["207"] = 189});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____manta = require("modifiers.manta")
local manta_modifier = ____manta.manta_modifier
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
    local index = math.floor(math.random() * #spells)
    self:castSpell(spells[index + 1])
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
    local hero = self.controller:GetAssignedHero()
    HeroInventory:reset(hero)
    self.heroPreviousState = {attack_capability = hero:GetAttackCapability()}
    hero:SetMoveCapability(0)
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
