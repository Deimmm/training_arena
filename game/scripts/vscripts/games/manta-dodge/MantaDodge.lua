local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 8,["25"] = 8,["26"] = 24,["27"] = 24,["28"] = 24,["29"] = 24,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 29,["35"] = 33,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 42,["41"] = 43,["42"] = 43,["43"] = 43,["44"] = 43,["45"] = 42,["46"] = 216,["47"] = 217,["48"] = 217,["49"] = 217,["50"] = 217,["51"] = 219,["52"] = 221,["53"] = 223,["54"] = 223,["55"] = 223,["56"] = 224,["57"] = 225,["58"] = 226,["59"] = 226,["60"] = 226,["61"] = 226,["62"] = 227,["63"] = 227,["64"] = 227,["65"] = 228,["66"] = 229,["67"] = 230,["69"] = 227,["70"] = 227,["73"] = 223,["74"] = 223,["75"] = 237,["76"] = 237,["77"] = 237,["78"] = 238,["79"] = 239,["81"] = 237,["82"] = 237,["83"] = 242,["84"] = 242,["85"] = 244,["86"] = 245,["87"] = 246,["88"] = 247,["89"] = 248,["90"] = 248,["91"] = 248,["92"] = 248,["93"] = 249,["94"] = 249,["95"] = 249,["96"] = 249,["98"] = 242,["99"] = 242,["100"] = 242,["101"] = 256,["102"] = 256,["103"] = 258,["104"] = 259,["105"] = 260,["106"] = 261,["107"] = 261,["108"] = 261,["109"] = 261,["110"] = 261,["111"] = 261,["112"] = 261,["113"] = 261,["114"] = 269,["117"] = 272,["118"] = 273,["119"] = 273,["120"] = 273,["121"] = 273,["122"] = 274,["123"] = 274,["124"] = 274,["125"] = 274,["127"] = 256,["128"] = 256,["129"] = 256,["130"] = 281,["131"] = 281,["132"] = 283,["133"] = 284,["134"] = 285,["135"] = 286,["136"] = 287,["137"] = 288,["139"] = 281,["140"] = 281,["141"] = 281,["142"] = 37,["143"] = 295,["144"] = 296,["145"] = 297,["146"] = 298,["147"] = 299,["148"] = 299,["149"] = 299,["150"] = 299,["152"] = 304,["153"] = 306,["154"] = 306,["155"] = 306,["156"] = 306,["157"] = 308,["158"] = 309,["159"] = 310,["160"] = 295,["161"] = 313,["162"] = 313,["163"] = 315,["164"] = 316,["165"] = 316,["166"] = 316,["167"] = 317,["168"] = 317,["169"] = 317,["170"] = 318,["171"] = 319,["172"] = 317,["173"] = 317,["174"] = 316,["175"] = 316,["176"] = 315,["177"] = 328,["178"] = 329,["179"] = 330,["180"] = 328,["181"] = 332,["182"] = 333,["183"] = 333,["184"] = 333,["185"] = 333,["186"] = 333,["187"] = 333,["188"] = 333,["189"] = 333,["190"] = 341,["191"] = 342,["192"] = 343,["193"] = 344,["194"] = 345,["195"] = 346,["196"] = 347,["197"] = 347,["198"] = 347,["199"] = 347,["200"] = 347,["201"] = 348,["202"] = 349,["203"] = 351,["204"] = 352,["207"] = 355,["208"] = 355,["209"] = 355,["210"] = 356,["211"] = 358,["212"] = 359,["213"] = 359,["214"] = 359,["215"] = 361,["216"] = 362,["217"] = 362,["218"] = 362,["219"] = 364,["220"] = 365,["221"] = 365,["222"] = 365,["223"] = 367,["224"] = 368,["225"] = 369,["226"] = 371,["227"] = 371,["228"] = 371,["229"] = 371,["230"] = 371,["231"] = 371,["234"] = 379,["235"] = 398,["236"] = 380,["238"] = 381,["239"] = 381,["240"] = 381,["241"] = 381,["242"] = 381,["243"] = 381,["246"] = 388,["248"] = 389,["249"] = 389,["250"] = 389,["251"] = 389,["252"] = 389,["253"] = 389,["254"] = 389,["257"] = 397,["259"] = 398,["260"] = 399,["261"] = 400,["264"] = 403,["265"] = 403,["266"] = 403,["267"] = 403,["268"] = 403,["269"] = 403,["270"] = 403,["271"] = 410,["272"] = 411,["273"] = 399,["280"] = 355,["281"] = 355,["282"] = 332,["283"] = 425,["284"] = 426,["285"] = 427,["286"] = 428,["287"] = 429,["288"] = 429,["289"] = 429,["290"] = 429,["291"] = 425,["292"] = 432,["293"] = 433,["294"] = 434,["295"] = 434,["296"] = 434,["297"] = 435,["298"] = 435,["299"] = 435,["300"] = 435,["301"] = 435,["302"] = 435,["303"] = 435,["304"] = 437,["305"] = 438,["306"] = 439,["307"] = 443,["308"] = 444,["309"] = 445,["310"] = 451,["311"] = 432,["312"] = 454,["313"] = 455,["314"] = 456,["315"] = 457,["316"] = 458,["317"] = 459,["318"] = 460,["319"] = 454,["320"] = 463,["321"] = 464,["322"] = 465,["323"] = 466,["326"] = 469,["327"] = 470,["328"] = 471,["329"] = 471,["330"] = 471,["331"] = 471,["332"] = 463,["333"] = 474,["334"] = 475,["335"] = 476,["336"] = 477,["337"] = 474,["338"] = 483,["339"] = 488,["340"] = 488,["341"] = 488,["342"] = 488,["343"] = 488,["344"] = 488,["345"] = 494,["346"] = 494,["347"] = 494,["348"] = 494,["349"] = 494,["350"] = 494,["351"] = 483,["352"] = 502,["353"] = 507,["354"] = 508,["355"] = 509,["356"] = 509,["357"] = 509,["358"] = 510,["359"] = 510,["360"] = 510,["361"] = 510,["362"] = 510,["363"] = 510,["364"] = 509,["365"] = 509,["366"] = 502,["367"] = 519,["368"] = 525,["369"] = 526,["370"] = 527,["371"] = 529,["372"] = 529,["373"] = 529,["374"] = 530,["375"] = 531,["376"] = 532,["377"] = 532,["378"] = 532,["379"] = 532,["380"] = 536,["381"] = 536,["382"] = 536,["383"] = 536,["384"] = 536,["385"] = 536,["387"] = 544,["388"] = 544,["389"] = 544,["390"] = 544,["391"] = 544,["392"] = 544,["393"] = 529,["394"] = 529,["395"] = 519,["396"] = 553,["397"] = 558,["398"] = 559,["399"] = 559,["400"] = 559,["401"] = 560,["402"] = 561,["403"] = 562,["404"] = 562,["405"] = 562,["406"] = 562,["407"] = 562,["408"] = 567,["409"] = 568,["410"] = 569,["413"] = 572,["414"] = 572,["415"] = 572,["416"] = 572,["417"] = 572,["418"] = 572,["419"] = 572,["420"] = 579,["421"] = 580,["422"] = 568,["423"] = 559,["424"] = 559,["425"] = 553,["426"] = 585,["427"] = 590,["428"] = 592,["429"] = 592,["430"] = 592,["431"] = 593,["432"] = 594,["433"] = 595,["434"] = 595,["435"] = 595,["436"] = 595,["437"] = 599,["438"] = 599,["439"] = 599,["440"] = 599,["441"] = 599,["442"] = 599,["444"] = 607,["445"] = 607,["446"] = 607,["447"] = 607,["448"] = 607,["449"] = 607,["450"] = 607,["451"] = 615,["452"] = 615,["453"] = 615,["454"] = 615,["455"] = 615,["456"] = 615,["457"] = 592,["458"] = 592,["459"] = 585,["460"] = 624,["461"] = 629,["462"] = 629,["463"] = 629,["464"] = 629,["465"] = 629,["466"] = 629,["467"] = 635,["468"] = 636,["469"] = 636,["470"] = 636,["471"] = 637,["472"] = 640,["473"] = 640,["474"] = 640,["475"] = 640,["476"] = 640,["477"] = 640,["478"] = 640,["479"] = 636,["480"] = 636,["481"] = 624,["482"] = 649,["483"] = 654,["484"] = 655,["485"] = 655,["486"] = 655,["487"] = 656,["488"] = 656,["489"] = 656,["490"] = 656,["491"] = 656,["492"] = 656,["493"] = 655,["494"] = 655,["495"] = 649,["496"] = 665,["497"] = 665,["498"] = 673,["499"] = 694,["500"] = 694,["501"] = 694,["502"] = 694,["503"] = 694,["504"] = 694,["505"] = 673});
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
    local spells = {{
        hero = "npc_dota_hero_pangolier",
        ability_name = "pangolier_shield_crash",
        useBlink = false,
        processor = function(____, caster, ability, config) return self:pangoShieldCrush(caster, ability, config) end
    }}
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
        "dota_ability_channel_finished",
        function(____, event)
            DeepPrintTable(event)
            local ent = EntIndexToHScript(event.caster_entindex)
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
    ListenToGameEvent(
        "dota_non_player_used_ability",
        function(____, event)
            DeepPrintTable(event)
            local ent = EntIndexToHScript(event.caster_entindex)
            local ability_blacklist = {
                "alchemist_unstable_concoction",
                "item_blink",
                "phoenix_supernova",
                "ringmaster_tame_the_beasts",
                "dragon_knight_elder_dragon_form",
                "windrunner_powershot"
            }
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
    ListenToGameEvent(
        "npc_spawned",
        function(____, event)
            local entity = EntIndexToHScript(event.entindex)
            local entityName = entity:GetName()
            local destory_entities = {"npc_dota_warlock_golem"}
            if __TS__ArrayIncludes(destory_entities, entityName) then
                entity:Destroy()
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
    if config.processor then
        config:processor(hero, ability, config)
        return
    end
    Timers:CreateTimer(
        1,
        function()
            local hero_pos = self.controller:GetAssignedHero():GetAbsOrigin()
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
                local blink_position = self:pickRandomPositionInRadius(hero_pos, 150)
                ExecuteOrderFromTable({
                    OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                    UnitIndex = hero:GetEntityIndex(),
                    AbilityIndex = blink:GetEntityIndex(),
                    Position = blink_position
                })
            end
            repeat
                local ____switch38 = true
                local tryCount
                local ____cond38 = ____switch38 == isNoTarget
                if ____cond38 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Queue = true
                    })
                    break
                end
                ____cond38 = ____cond38 or ____switch38 == isPoint
                if ____cond38 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Position = hero_pos,
                        Queue = true
                    })
                    break
                end
                ____cond38 = ____cond38 or ____switch38 == isTarget
                if ____cond38 then
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
function MantaDodge.prototype.pangoShieldCrush(self, caster, ability, config)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_MOVE_TO_TARGET,
        UnitIndex = caster:GetEntityIndex(),
        TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
        Queue = true
    })
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
        UnitIndex = caster:GetEntityIndex(),
        AbilityIndex = ability:GetEntityIndex(),
        Queue = true
    })
end
function MantaDodge.prototype.nevermoreRaze(self, caster, ability, config)
    local randomTime = Utils:randomInt(0.25, 0.5, 0.25)
    caster:FaceTowards(self.controller:GetAssignedHero():GetAbsOrigin())
    Timers:CreateTimer(
        randomTime,
        function()
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ability:GetEntityIndex(),
                Queue = true
            })
        end
    )
end
function MantaDodge.prototype.nevermoreRequiem(self, caster, ability, config)
    print(caster:FindAllModifiers()[1]:GetName())
    caster:SetModifierStackCount("modifier_nevermore_necromastery", caster, 20)
    local randomTime = Utils:randomInt(0.5, 1, 0.25)
    Timers:CreateTimer(
        randomTime,
        function()
            if config.useBlink then
                local blink = caster:AddItemByName("item_blink")
                local blink_position = self:pickRandomPositionInRadius(
                    self.controller:GetAssignedHero():GetAbsOrigin(),
                    0
                )
                ExecuteOrderFromTable({
                    OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                    UnitIndex = caster:GetEntityIndex(),
                    AbilityIndex = blink:GetEntityIndex(),
                    Position = blink_position
                })
            end
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ability:GetEntityIndex(),
                Queue = true
            })
        end
    )
end
function MantaDodge.prototype.dragonKnightStun(self, caster, ability, config)
    local randomTime = Utils:randomInt(0.5, 1.25, 0.25)
    Timers:CreateTimer(
        randomTime,
        function()
            local ult = caster:FindAbilityByName("dragon_knight_elder_dragon_form")
            ult:SetLevel(1)
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ult:GetEntityIndex()
            })
            local tryCount = 0
            Timers:CreateTimer(function()
                if tryCount == 3 then
                    return
                end
                ExecuteOrderFromTable({
                    OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
                    UnitIndex = caster:GetEntityIndex(),
                    AbilityIndex = ability:GetEntityIndex(),
                    TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
                    Queue = true
                })
                tryCount = tryCount + 1
                return 0.5
            end)
        end
    )
end
function MantaDodge.prototype.axeCall(self, caster, ability, config)
    local randomTime = Utils:randomInt(0.5, 1.5, 0.25)
    Timers:CreateTimer(
        randomTime,
        function()
            if config.useBlink then
                local blink = caster:AddItemByName("item_blink")
                local blink_position = self:pickRandomPositionInRadius(
                    self.controller:GetAssignedHero():GetAbsOrigin(),
                    150
                )
                ExecuteOrderFromTable({
                    OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                    UnitIndex = caster:GetEntityIndex(),
                    AbilityIndex = blink:GetEntityIndex(),
                    Position = blink_position
                })
            end
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_MOVE_TO_TARGET,
                UnitIndex = caster:GetEntityIndex(),
                TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
                Position = self.controller:GetAssignedHero():GetAbsOrigin(),
                Queue = true
            })
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ability:GetEntityIndex(),
                Queue = true
            })
        end
    )
end
function MantaDodge.prototype.alchConcotions(self, caster, ability, config)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
        UnitIndex = caster:GetEntityIndex(),
        AbilityIndex = ability:GetEntityIndex(),
        Queue = true
    })
    local randomThrowTime = (math.floor(math.random() * 9) + 2) * 0.5
    Timers:CreateTimer(
        randomThrowTime,
        function()
            local throw_abilitiy = caster:FindAbilityByName("alchemist_unstable_concoction_throw")
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
                UnitIndex = caster:GetEntityIndex(),
                TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
                AbilityIndex = throw_abilitiy:GetEntityIndex(),
                Queue = true
            })
        end
    )
end
function MantaDodge.prototype.zeusThundergods(self, caster, ability, config)
    local randomTime = Utils:randomInt(0.75, 1.5, 0.25)
    Timers:CreateTimer(
        randomTime,
        function()
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ability:GetEntityIndex(),
                Queue = true
            })
        end
    )
end
function MantaDodge.prototype.witchDoctorMaledict(self, caster, ability, config)
end
function MantaDodge.prototype.phoneixSuperNova(self, caster, ability, config)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
        UnitIndex = caster:GetEntityIndex(),
        AbilityIndex = ability:GetEntityIndex(),
        Queue = true
    })
end
return ____exports
