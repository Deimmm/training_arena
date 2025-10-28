local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 8,["25"] = 8,["26"] = 19,["27"] = 19,["28"] = 19,["29"] = 19,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 24,["35"] = 28,["36"] = 38,["37"] = 39,["38"] = 40,["39"] = 41,["40"] = 43,["41"] = 200,["42"] = 201,["43"] = 201,["44"] = 201,["45"] = 201,["46"] = 203,["47"] = 205,["48"] = 207,["49"] = 207,["50"] = 207,["51"] = 208,["52"] = 209,["53"] = 210,["54"] = 210,["55"] = 210,["56"] = 210,["57"] = 211,["58"] = 211,["59"] = 211,["60"] = 212,["61"] = 213,["62"] = 214,["64"] = 211,["65"] = 211,["68"] = 207,["69"] = 207,["70"] = 221,["71"] = 221,["72"] = 221,["73"] = 222,["74"] = 223,["76"] = 221,["77"] = 221,["78"] = 226,["79"] = 226,["80"] = 228,["81"] = 229,["82"] = 230,["83"] = 234,["86"] = 237,["87"] = 238,["88"] = 238,["89"] = 238,["90"] = 238,["91"] = 239,["92"] = 239,["93"] = 239,["94"] = 239,["96"] = 226,["97"] = 226,["98"] = 226,["99"] = 38,["100"] = 248,["101"] = 249,["102"] = 250,["103"] = 251,["104"] = 252,["105"] = 252,["106"] = 252,["107"] = 252,["109"] = 257,["110"] = 259,["111"] = 259,["112"] = 259,["113"] = 259,["114"] = 261,["115"] = 262,["116"] = 263,["117"] = 248,["118"] = 266,["119"] = 266,["120"] = 268,["121"] = 269,["122"] = 269,["123"] = 269,["124"] = 270,["125"] = 270,["126"] = 270,["127"] = 271,["128"] = 272,["129"] = 270,["130"] = 270,["131"] = 269,["132"] = 269,["133"] = 268,["134"] = 281,["135"] = 282,["136"] = 283,["137"] = 281,["138"] = 285,["139"] = 286,["140"] = 286,["141"] = 286,["142"] = 286,["143"] = 286,["144"] = 286,["145"] = 286,["146"] = 286,["147"] = 294,["148"] = 295,["149"] = 296,["150"] = 297,["151"] = 298,["152"] = 299,["153"] = 301,["154"] = 301,["155"] = 301,["156"] = 301,["157"] = 301,["158"] = 303,["159"] = 304,["160"] = 305,["161"] = 305,["162"] = 305,["163"] = 306,["164"] = 308,["165"] = 308,["166"] = 308,["167"] = 308,["168"] = 313,["169"] = 314,["170"] = 314,["171"] = 314,["172"] = 316,["173"] = 317,["174"] = 317,["175"] = 317,["176"] = 319,["177"] = 320,["178"] = 320,["179"] = 320,["180"] = 321,["181"] = 322,["182"] = 323,["183"] = 323,["184"] = 323,["185"] = 323,["186"] = 327,["187"] = 327,["188"] = 327,["189"] = 327,["190"] = 327,["191"] = 327,["194"] = 335,["195"] = 359,["196"] = 336,["198"] = 337,["199"] = 337,["200"] = 337,["201"] = 337,["202"] = 337,["203"] = 337,["204"] = 337,["205"] = 345,["206"] = 345,["207"] = 345,["208"] = 345,["209"] = 345,["210"] = 345,["213"] = 352,["215"] = 353,["216"] = 353,["217"] = 353,["218"] = 353,["219"] = 353,["220"] = 353,["221"] = 359,["222"] = 360,["223"] = 360,["224"] = 360,["225"] = 361,["226"] = 364,["227"] = 364,["228"] = 364,["229"] = 364,["230"] = 364,["231"] = 364,["232"] = 364,["233"] = 360,["234"] = 360,["237"] = 373,["239"] = 374,["240"] = 374,["241"] = 374,["242"] = 374,["243"] = 374,["244"] = 374,["247"] = 381,["249"] = 382,["250"] = 382,["251"] = 382,["252"] = 382,["253"] = 382,["254"] = 382,["255"] = 382,["258"] = 390,["260"] = 391,["261"] = 392,["262"] = 393,["265"] = 396,["266"] = 396,["267"] = 396,["268"] = 396,["269"] = 396,["270"] = 396,["271"] = 396,["272"] = 403,["273"] = 404,["274"] = 392,["281"] = 305,["282"] = 305,["283"] = 285,["284"] = 418,["285"] = 419,["286"] = 420,["287"] = 421,["288"] = 422,["289"] = 422,["290"] = 422,["291"] = 422,["292"] = 418,["293"] = 425,["294"] = 426,["295"] = 427,["296"] = 427,["297"] = 427,["298"] = 428,["299"] = 428,["300"] = 428,["301"] = 428,["302"] = 428,["303"] = 428,["304"] = 428,["305"] = 430,["306"] = 431,["307"] = 432,["308"] = 436,["309"] = 437,["310"] = 438,["311"] = 444,["312"] = 425,["313"] = 447,["314"] = 448,["315"] = 449,["316"] = 450,["317"] = 451,["318"] = 452,["319"] = 453,["320"] = 447,["321"] = 456,["322"] = 457,["323"] = 458,["324"] = 459,["327"] = 462,["328"] = 463,["329"] = 464,["330"] = 464,["331"] = 464,["332"] = 464,["333"] = 456,["334"] = 467,["335"] = 468,["336"] = 469,["337"] = 470,["338"] = 467});
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
    local spells = {}
    self.controller:GetAssignedHero():SetDayTimeVisionRange(500)
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
            if self.isRunning then
                self:trigerrSpellCast(spells)
            end
        end
    )
    ListenToGameEvent(
        "dota_non_player_used_ability",
        function(____, event)
            local ent = EntIndexToHScript(event.caster_entindex)
            local ability_blacklist = {"alchemist_unstable_concoction", "item_blink"}
            if __TS__ArrayIncludes(ability_blacklist, event.abilityname) then
                return
            end
            if ent then
                Timers:CreateTimer(
                    1,
                    function() return ent:Destroy() end
                )
                Timers:CreateTimer(
                    1.5,
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
    hero:SetBaseMoveSpeed(500)
    hero:AddItemByName("item_aghanims_shard")
    local spawn_name = "main_training_spawn"
    Utils:moveEntityToEntity(
        hero,
        spawn_name,
        Vector(0, 500)
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
            local isPoint = bit.band(
                ability:GetBehavior(),
                DOTA_ABILITY_BEHAVIOR_POINT
            ) ~= 0
            local isTarget = bit.band(
                ability:GetBehavior(),
                DOTA_ABILITY_BEHAVIOR_UNIT_TARGET
            ) ~= 0
            if config.useBlink then
                local blink = hero:AddItemByName("item_blink")
                local blink_position = self:pickRandomPositionInRadius(
                    self.controller:GetAssignedHero():GetAbsOrigin(),
                    150
                )
                ExecuteOrderFromTable({
                    OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                    UnitIndex = hero:GetEntityIndex(),
                    AbilityIndex = blink:GetEntityIndex(),
                    Position = blink_position
                })
            end
            repeat
                local ____switch30 = true
                local randomThrowTime, tryCount
                local ____cond30 = ____switch30 == (isNoTarget and cast_range == 0)
                if ____cond30 then
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
                ____cond30 = ____cond30 or ____switch30 == (config.ability_name == "alchemist_unstable_concoction")
                if ____cond30 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Queue = true
                    })
                    randomThrowTime = (math.floor(math.random() * 9) + 2) * 0.5
                    Timers:CreateTimer(
                        randomThrowTime,
                        function()
                            local throw_abilitiy = hero:FindAbilityByName("alchemist_unstable_concoction_throw")
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
                ____cond30 = ____cond30 or ____switch30 == isNoTarget
                if ____cond30 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Queue = true
                    })
                    break
                end
                ____cond30 = ____cond30 or ____switch30 == isPoint
                if ____cond30 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Position = self.controller:GetAssignedHero():GetAbsOrigin(),
                        Queue = true
                    })
                    break
                end
                ____cond30 = ____cond30 or ____switch30 == isTarget
                if ____cond30 then
                    tryCount = 0
                    Timers:CreateTimer(function()
                        if tryCount == 3 then
                            return
                        end
                        ExecuteOrderFromTable({
                            OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
                            UnitIndex = hero:GetEntityIndex(),
                            AbilityIndex = ability:GetEntityIndex(),
                            TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
                            Queue = true
                        })
                        tryCount = tryCount + 1
                        return 0.5
                    end)
                    break
                end
                do
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
    hero:RemoveModifierByName(soft_wall.name)
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
function MantaDodge.prototype.pickRandomPositionInRadius(self, origin, radius)
    local r = radius * math.sqrt(RandomFloat(0, 1))
    local offset = RandomVector(r)
    return Vector(origin.x + offset.x, origin.y + offset.y, 0)
end
return ____exports
