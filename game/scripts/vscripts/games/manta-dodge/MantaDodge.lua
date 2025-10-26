local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 9,["25"] = 9,["26"] = 19,["27"] = 19,["28"] = 19,["29"] = 19,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 24,["35"] = 28,["36"] = 38,["37"] = 39,["38"] = 40,["39"] = 41,["40"] = 43,["41"] = 57,["42"] = 57,["43"] = 57,["44"] = 57,["45"] = 59,["46"] = 61,["47"] = 63,["48"] = 63,["49"] = 63,["50"] = 64,["51"] = 65,["52"] = 66,["53"] = 66,["54"] = 66,["55"] = 66,["56"] = 67,["57"] = 67,["58"] = 67,["59"] = 68,["60"] = 69,["61"] = 70,["63"] = 67,["64"] = 67,["67"] = 63,["68"] = 63,["69"] = 77,["70"] = 77,["71"] = 77,["72"] = 78,["73"] = 79,["74"] = 80,["76"] = 77,["77"] = 77,["78"] = 83,["79"] = 83,["80"] = 85,["81"] = 86,["82"] = 87,["85"] = 90,["86"] = 91,["87"] = 91,["88"] = 91,["89"] = 91,["90"] = 92,["91"] = 92,["92"] = 92,["93"] = 92,["95"] = 83,["96"] = 83,["97"] = 83,["98"] = 38,["99"] = 101,["100"] = 102,["101"] = 103,["102"] = 104,["103"] = 105,["104"] = 105,["105"] = 105,["106"] = 105,["108"] = 109,["109"] = 111,["110"] = 111,["111"] = 111,["112"] = 111,["113"] = 113,["114"] = 114,["115"] = 115,["116"] = 101,["117"] = 118,["118"] = 118,["119"] = 120,["120"] = 121,["121"] = 121,["122"] = 121,["123"] = 122,["124"] = 122,["125"] = 122,["126"] = 123,["127"] = 124,["128"] = 122,["129"] = 122,["130"] = 121,["131"] = 121,["132"] = 120,["133"] = 133,["134"] = 134,["135"] = 135,["136"] = 133,["137"] = 137,["138"] = 138,["139"] = 138,["140"] = 138,["141"] = 138,["142"] = 138,["143"] = 138,["144"] = 138,["145"] = 138,["146"] = 146,["147"] = 147,["148"] = 148,["149"] = 149,["150"] = 150,["151"] = 152,["152"] = 152,["153"] = 152,["154"] = 152,["155"] = 152,["156"] = 154,["157"] = 155,["158"] = 156,["159"] = 156,["160"] = 156,["161"] = 157,["162"] = 159,["163"] = 159,["164"] = 159,["165"] = 159,["166"] = 163,["167"] = 164,["168"] = 164,["169"] = 164,["171"] = 166,["172"] = 190,["173"] = 167,["175"] = 168,["176"] = 168,["177"] = 168,["178"] = 168,["179"] = 168,["180"] = 168,["181"] = 168,["182"] = 176,["183"] = 176,["184"] = 176,["185"] = 176,["186"] = 176,["187"] = 176,["190"] = 183,["192"] = 184,["193"] = 184,["194"] = 184,["195"] = 184,["196"] = 184,["197"] = 184,["198"] = 190,["199"] = 191,["200"] = 192,["201"] = 192,["202"] = 192,["203"] = 193,["204"] = 196,["205"] = 197,["206"] = 197,["207"] = 197,["208"] = 197,["209"] = 197,["210"] = 197,["211"] = 197,["212"] = 192,["213"] = 192,["217"] = 207,["221"] = 156,["222"] = 156,["223"] = 137,["224"] = 217,["225"] = 218,["226"] = 219,["227"] = 220,["228"] = 221,["229"] = 221,["230"] = 221,["231"] = 221,["232"] = 217,["233"] = 224,["234"] = 225,["235"] = 226,["236"] = 226,["237"] = 226,["238"] = 227,["239"] = 227,["240"] = 227,["241"] = 227,["242"] = 227,["243"] = 227,["244"] = 227,["245"] = 229,["246"] = 230,["247"] = 231,["248"] = 235,["249"] = 236,["250"] = 237,["251"] = 243,["252"] = 224,["253"] = 246,["254"] = 247,["255"] = 248,["256"] = 249,["257"] = 250,["258"] = 251,["259"] = 246,["260"] = 254,["261"] = 255,["262"] = 256,["263"] = 257,["266"] = 260,["267"] = 261,["268"] = 262,["269"] = 262,["270"] = 262,["271"] = 262,["272"] = 254});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____manta = require("modifiers.manta")
local manta_modifier = ____manta.manta_modifier
local ____soft_2Dwall = require("modifiers.soft-wall")
local soft_wall = ____soft_2Dwall.soft_wall
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
    local spells = {{hero = "npc_dota_hero_magnataur", ability_name = "magnataur_reverse_polarity"}, {hero = "npc_dota_hero_axe", ability_name = "axe_berserkers_call"}, {hero = "npc_dota_hero_alchemist", ability_name = "alchemist_unstable_concoction"}}
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
        "dota_non_player_used_ability",
        function(____, event)
            local ent = EntIndexToHScript(event.caster_entindex)
            if event.abilityname == "alchemist_unstable_concoction" then
                return
            end
            if ent then
                Timers:CreateTimer(
                    0.5,
                    function() return ent:Destroy() end
                )
                Timers:CreateTimer(
                    1,
                    function() return eventBus:emit("manta_dodge.cast_spell_finish", nil) end
                )
            end
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
    hero:SetBaseMoveSpeed(400)
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
            local hero_pos = self.controller:GetAssignedHero():GetAbsOrigin()
            local cast_range = ability:GetEffectiveCastRange(
                hero:GetAbsOrigin(),
                self.controller:GetAssignedHero()
            )
            local isNoTarget = bit.band(
                ability:GetBehavior(),
                DOTA_ABILITY_BEHAVIOR_NO_TARGET
            ) ~= 0
            repeat
                local ____switch29 = true
                local randomThrowTime
                local ____cond29 = ____switch29 == (isNoTarget and cast_range == 0)
                if ____cond29 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_MOVE_TO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
                        Position = hero_pos,
                        Queue = true
                    })
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Queue = true
                    })
                    break
                end
                ____cond29 = ____cond29 or ____switch29 == (config.ability_name == "alchemist_unstable_concoction")
                if ____cond29 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Queue = true
                    })
                    randomThrowTime = (math.floor(math.random() * 9) + 2) * 0.5
                    print("RANDOM TIME: ", randomThrowTime)
                    Timers:CreateTimer(
                        randomThrowTime,
                        function()
                            local throw_abilitiy = hero:FindAbilityByName("alchemist_unstable_concoction_throw")
                            print(throw_abilitiy:GetName())
                            ExecuteOrderFromTable({
                                OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
                                UnitIndex = hero:GetEntityIndex(),
                                TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
                                AbilityIndex = throw_abilitiy:GetEntityIndex(),
                                Queue = true
                            })
                        end
                    )
                    break
                end
                do
                    hero:CastAbilityOnPosition(hero_pos, ability, 0)
                    break
                end
            until true
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
    local ____TS__New_result_0 = __TS__New(Geometry)
    self.heroBox = ____TS__New_result_0
    local box = ____TS__New_result_0
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
    hero:AddNewModifier(nil, nil, soft_wall.name, {minX = box.boxPoints[1].x, maxX = box.boxPoints[3].x, minY = box.boxPoints[1].y, maxY = box.boxPoints[3].y})
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
