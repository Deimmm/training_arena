local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["15"] = 1,["16"] = 1,["17"] = 2,["18"] = 2,["19"] = 3,["20"] = 3,["21"] = 5,["22"] = 5,["23"] = 6,["24"] = 6,["25"] = 7,["26"] = 7,["27"] = 8,["28"] = 8,["29"] = 9,["30"] = 9,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["36"] = 25,["37"] = 26,["38"] = 27,["39"] = 28,["40"] = 31,["41"] = 35,["42"] = 36,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 35,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 35,["54"] = 35,["55"] = 35,["56"] = 60,["57"] = 60,["58"] = 60,["59"] = 60,["60"] = 60,["61"] = 35,["62"] = 66,["63"] = 66,["64"] = 66,["65"] = 66,["66"] = 66,["67"] = 35,["68"] = 72,["69"] = 72,["70"] = 72,["71"] = 72,["72"] = 72,["73"] = 35,["74"] = 35,["75"] = 35,["76"] = 35,["77"] = 35,["78"] = 35,["79"] = 35,["80"] = 35,["81"] = 35,["82"] = 35,["83"] = 123,["84"] = 123,["85"] = 123,["86"] = 123,["87"] = 123,["88"] = 35,["89"] = 130,["90"] = 130,["91"] = 130,["92"] = 130,["93"] = 130,["94"] = 35,["95"] = 35,["96"] = 35,["97"] = 35,["98"] = 35,["99"] = 35,["100"] = 162,["101"] = 162,["102"] = 162,["103"] = 162,["104"] = 162,["105"] = 35,["106"] = 35,["107"] = 35,["108"] = 35,["109"] = 35,["110"] = 35,["111"] = 35,["112"] = 199,["113"] = 199,["114"] = 199,["115"] = 199,["116"] = 199,["117"] = 35,["118"] = 206,["119"] = 206,["120"] = 206,["121"] = 206,["122"] = 206,["123"] = 35,["124"] = 35,["125"] = 213,["126"] = 217,["127"] = 218,["128"] = 219,["129"] = 220,["130"] = 221,["131"] = 221,["132"] = 221,["133"] = 222,["134"] = 222,["135"] = 221,["136"] = 221,["137"] = 224,["138"] = 224,["139"] = 224,["140"] = 224,["141"] = 226,["142"] = 228,["143"] = 230,["144"] = 230,["145"] = 231,["146"] = 231,["147"] = 232,["148"] = 233,["149"] = 234,["150"] = 234,["151"] = 234,["152"] = 234,["153"] = 235,["154"] = 235,["155"] = 235,["156"] = 236,["157"] = 237,["158"] = 238,["160"] = 235,["161"] = 235,["164"] = 231,["165"] = 231,["166"] = 246,["167"] = 246,["168"] = 247,["169"] = 247,["170"] = 248,["171"] = 249,["172"] = 250,["174"] = 247,["175"] = 247,["176"] = 255,["177"] = 255,["178"] = 256,["179"] = 258,["180"] = 259,["181"] = 260,["182"] = 261,["183"] = 261,["184"] = 261,["185"] = 261,["186"] = 262,["187"] = 262,["188"] = 262,["189"] = 262,["191"] = 256,["192"] = 256,["193"] = 256,["194"] = 270,["195"] = 270,["196"] = 271,["197"] = 273,["198"] = 274,["199"] = 275,["200"] = 275,["201"] = 275,["202"] = 275,["203"] = 275,["204"] = 275,["205"] = 275,["206"] = 275,["207"] = 283,["210"] = 286,["211"] = 287,["212"] = 287,["213"] = 287,["214"] = 287,["215"] = 288,["216"] = 288,["217"] = 288,["218"] = 288,["220"] = 271,["221"] = 271,["222"] = 271,["223"] = 297,["224"] = 297,["225"] = 298,["226"] = 300,["227"] = 301,["228"] = 302,["229"] = 303,["230"] = 304,["231"] = 305,["233"] = 298,["234"] = 298,["235"] = 298,["236"] = 217,["237"] = 313,["238"] = 314,["239"] = 315,["240"] = 316,["241"] = 317,["242"] = 317,["243"] = 317,["244"] = 317,["246"] = 321,["247"] = 322,["248"] = 323,["249"] = 323,["250"] = 323,["251"] = 323,["253"] = 326,["254"] = 328,["255"] = 328,["256"] = 328,["257"] = 328,["258"] = 330,["259"] = 330,["260"] = 330,["261"] = 330,["262"] = 335,["263"] = 335,["264"] = 335,["265"] = 337,["266"] = 343,["268"] = 335,["269"] = 335,["270"] = 346,["271"] = 347,["272"] = 348,["273"] = 313,["274"] = 351,["275"] = 352,["276"] = 353,["277"] = 351,["278"] = 356,["279"] = 357,["280"] = 357,["281"] = 357,["282"] = 358,["283"] = 358,["284"] = 358,["285"] = 359,["286"] = 360,["287"] = 358,["288"] = 358,["289"] = 357,["290"] = 357,["291"] = 356,["292"] = 369,["293"] = 370,["294"] = 371,["295"] = 369,["296"] = 373,["297"] = 374,["300"] = 377,["301"] = 377,["302"] = 377,["303"] = 377,["304"] = 377,["305"] = 377,["306"] = 377,["307"] = 377,["308"] = 385,["309"] = 386,["310"] = 387,["311"] = 388,["312"] = 389,["313"] = 390,["314"] = 391,["315"] = 391,["316"] = 391,["317"] = 391,["318"] = 391,["319"] = 392,["320"] = 393,["321"] = 394,["322"] = 395,["325"] = 398,["326"] = 398,["327"] = 398,["328"] = 399,["329"] = 401,["330"] = 402,["331"] = 402,["332"] = 402,["333"] = 404,["334"] = 405,["335"] = 405,["336"] = 405,["337"] = 407,["338"] = 408,["339"] = 408,["340"] = 408,["341"] = 410,["342"] = 411,["343"] = 412,["344"] = 414,["345"] = 414,["346"] = 414,["347"] = 414,["348"] = 414,["349"] = 414,["352"] = 422,["353"] = 441,["354"] = 423,["356"] = 424,["357"] = 424,["358"] = 424,["359"] = 424,["360"] = 424,["361"] = 424,["364"] = 431,["366"] = 432,["367"] = 432,["368"] = 432,["369"] = 432,["370"] = 432,["371"] = 432,["372"] = 432,["375"] = 440,["377"] = 441,["378"] = 442,["379"] = 443,["382"] = 446,["383"] = 446,["384"] = 446,["385"] = 446,["386"] = 446,["387"] = 446,["388"] = 446,["389"] = 453,["390"] = 454,["391"] = 442,["398"] = 398,["399"] = 398,["400"] = 373,["401"] = 468,["402"] = 469,["403"] = 470,["404"] = 471,["405"] = 472,["406"] = 472,["407"] = 472,["408"] = 472,["409"] = 468,["410"] = 475,["411"] = 476,["412"] = 477,["413"] = 477,["414"] = 477,["415"] = 478,["416"] = 478,["417"] = 478,["418"] = 478,["419"] = 478,["420"] = 478,["421"] = 478,["422"] = 480,["423"] = 481,["424"] = 482,["425"] = 486,["426"] = 487,["427"] = 488,["428"] = 494,["429"] = 475,["430"] = 497,["431"] = 498,["432"] = 499,["433"] = 500,["434"] = 501,["435"] = 502,["436"] = 503,["437"] = 497,["438"] = 506,["439"] = 507,["440"] = 508,["441"] = 509,["444"] = 512,["445"] = 513,["446"] = 514,["447"] = 514,["448"] = 514,["449"] = 514,["450"] = 506,["451"] = 517,["452"] = 518,["453"] = 519,["454"] = 520,["455"] = 517,["456"] = 527,["457"] = 532,["458"] = 532,["459"] = 532,["460"] = 533,["461"] = 541,["462"] = 542,["463"] = 542,["464"] = 542,["465"] = 542,["466"] = 542,["467"] = 547,["468"] = 532,["469"] = 532,["470"] = 527,["471"] = 565,["472"] = 570,["473"] = 570,["474"] = 570,["475"] = 570,["476"] = 570,["477"] = 570,["478"] = 576,["479"] = 576,["480"] = 576,["481"] = 576,["482"] = 576,["483"] = 576,["484"] = 565,["485"] = 584,["486"] = 589,["487"] = 590,["488"] = 591,["489"] = 591,["490"] = 591,["491"] = 592,["492"] = 592,["493"] = 592,["494"] = 592,["495"] = 592,["496"] = 592,["497"] = 591,["498"] = 591,["499"] = 584,["500"] = 601,["501"] = 607,["502"] = 608,["503"] = 609,["504"] = 611,["505"] = 611,["506"] = 611,["507"] = 612,["508"] = 613,["509"] = 614,["510"] = 614,["511"] = 614,["512"] = 614,["513"] = 618,["514"] = 618,["515"] = 618,["516"] = 618,["517"] = 618,["518"] = 618,["520"] = 626,["521"] = 626,["522"] = 626,["523"] = 626,["524"] = 626,["525"] = 626,["526"] = 611,["527"] = 611,["528"] = 601,["529"] = 635,["530"] = 640,["531"] = 641,["532"] = 641,["533"] = 641,["534"] = 642,["535"] = 643,["536"] = 644,["537"] = 644,["538"] = 644,["539"] = 644,["540"] = 644,["541"] = 649,["542"] = 650,["543"] = 651,["546"] = 654,["547"] = 654,["548"] = 654,["549"] = 654,["550"] = 654,["551"] = 654,["552"] = 654,["553"] = 661,["554"] = 662,["555"] = 650,["556"] = 641,["557"] = 641,["558"] = 635,["559"] = 667,["560"] = 672,["561"] = 674,["562"] = 674,["563"] = 674,["564"] = 675,["565"] = 676,["566"] = 677,["567"] = 677,["568"] = 677,["569"] = 677,["570"] = 681,["571"] = 681,["572"] = 681,["573"] = 681,["574"] = 681,["575"] = 681,["577"] = 689,["578"] = 689,["579"] = 689,["580"] = 689,["581"] = 689,["582"] = 689,["583"] = 689,["584"] = 697,["585"] = 697,["586"] = 697,["587"] = 697,["588"] = 697,["589"] = 697,["590"] = 674,["591"] = 674,["592"] = 667,["593"] = 706,["594"] = 711,["595"] = 711,["596"] = 711,["597"] = 711,["598"] = 711,["599"] = 711,["600"] = 717,["601"] = 718,["602"] = 718,["603"] = 718,["604"] = 719,["605"] = 720,["606"] = 723,["607"] = 724,["610"] = 727,["611"] = 727,["612"] = 727,["613"] = 727,["614"] = 727,["615"] = 727,["616"] = 727,["617"] = 734,["618"] = 735,["619"] = 723,["620"] = 718,["621"] = 718,["622"] = 706,["623"] = 739,["624"] = 744,["625"] = 745,["626"] = 745,["627"] = 745,["628"] = 746,["629"] = 746,["630"] = 746,["631"] = 746,["632"] = 746,["633"] = 746,["634"] = 745,["635"] = 745,["636"] = 739,["637"] = 755,["638"] = 755,["639"] = 763,["640"] = 784,["641"] = 784,["642"] = 784,["643"] = 784,["644"] = 784,["645"] = 784,["646"] = 763});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____empty_debuff = require("modifiers.empty_debuff")
local empty_debuff_applier = ____empty_debuff.empty_debuff_applier
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
    self.pid = math.floor(math.random() * 10000)
    self.unsubs = {}
    self.isRunning = false
    self.heroPreviousState = {attack_capability = nil}
    self.spells = {
        {
            hero = "npc_dota_neutral_centaur_khan",
            ability_name = "centaur_khan_war_stomp",
            useBlink = false,
            processor = function(____, caster, ability, config) return self:creepCentStun(caster, ability, config) end
        },
        {
            hero = "npc_dota_hero_pangolier",
            ability_name = "pangolier_shield_crash",
            useBlink = false,
            processor = function(____, caster, ability, config) return self:pangoShieldCrush(caster, ability, config) end
        },
        {hero = "npc_dota_hero_windrunner", ability_name = "windrunner_powershot", useBlink = false},
        {hero = "npc_dota_hero_dark_willow", ability_name = "dark_willow_terrorize", useBlink = false},
        {
            hero = "npc_dota_hero_phoenix",
            ability_name = "phoenix_supernova",
            useBlink = false,
            processor = function(____, caster, ability) return self:phoneixSuperNova(caster, ability) end
        },
        {
            hero = "npc_dota_hero_zuus",
            ability_name = "zuus_thundergods_wrath",
            useBlink = false,
            processor = function(____, caster, ability) return self:zeusThundergods(caster, ability) end
        },
        {
            hero = "npc_dota_hero_witch_doctor",
            ability_name = "witch_doctor_maledict",
            useBlink = false,
            processor = function(____, caster, ability) return self:witchDoctorMaledict(caster, ability) end
        },
        {hero = "npc_dota_hero_witch_doctor", ability_name = "witch_doctor_paralyzing_cask", useBlink = false},
        {hero = "npc_dota_hero_warlock", ability_name = "warlock_rain_of_chaos", useBlink = false},
        {hero = "npc_dota_hero_techies", ability_name = "techies_suicide", useBlink = false},
        {hero = "npc_dota_hero_sven", ability_name = "sven_storm_bolt", useBlink = false},
        {hero = "npc_dota_hero_slardar", ability_name = "slardar_slithereen_crush", useBlink = true},
        {hero = "npc_dota_hero_ringmaster", ability_name = "ringmaster_tame_the_beasts", useBlink = false},
        {hero = "npc_dota_hero_rattletrap", ability_name = "rattletrap_hookshot", useBlink = false},
        {hero = "npc_dota_hero_primal_beast", ability_name = "primal_beast_rock_throw", useBlink = false},
        {hero = "npc_dota_hero_obsidian_destroyer", ability_name = "obsidian_destroyer_sanity_eclipse", useBlink = false},
        {
            hero = "npc_dota_hero_nevermore",
            ability_name = "nevermore_shadowraze3",
            useBlink = false,
            processor = function(____, caster, ability, config) return self:nevermoreRaze(caster, ability, config) end
        },
        {
            hero = "npc_dota_hero_nevermore",
            ability_name = "nevermore_requiem",
            useBlink = true,
            processor = function(____, caster, ability, config) return self:nevermoreRequiem(caster, ability, config) end
        },
        {hero = "npc_dota_hero_monkey_king", ability_name = "monkey_king_boundless_strike", useBlink = false},
        {hero = "npc_dota_hero_lion", ability_name = "lion_impale", useBlink = false},
        {hero = "npc_dota_hero_lich", ability_name = "lich_chain_frost", useBlink = false},
        {hero = "npc_dota_hero_leshrac", ability_name = "leshrac_split_earth", useBlink = false},
        {hero = "npc_dota_hero_huskar", ability_name = "huskar_life_break", useBlink = false},
        {
            hero = "npc_dota_hero_dragon_knight",
            ability_name = "dragon_knight_dragon_tail",
            useBlink = false,
            processor = function(____, caster, ability, config) return self:dragonKnightStun(caster, ability, config) end
        },
        {hero = "npc_dota_hero_disruptor", ability_name = "disruptor_glimpse", useBlink = false},
        {hero = "npc_dota_hero_chaos_knight", ability_name = "chaos_knight_chaos_bolt", useBlink = false},
        {hero = "npc_dota_hero_centaur", ability_name = "centaur_hoof_stomp", useBlink = true},
        {hero = "npc_dota_hero_lina", ability_name = "lina_light_strike_array", useBlink = false},
        {hero = "npc_dota_hero_lina", ability_name = "lina_laguna_blade", useBlink = false},
        {hero = "npc_dota_hero_magnataur", ability_name = "magnataur_reverse_polarity", useBlink = true},
        {
            hero = "npc_dota_hero_axe",
            ability_name = "axe_berserkers_call",
            useBlink = true,
            processor = function(____, caster, ability, config) return self:axeCall(caster, ability, config) end
        },
        {
            hero = "npc_dota_hero_alchemist",
            ability_name = "alchemist_unstable_concoction",
            useBlink = false,
            processor = function(____, caster, ability) return self:alchConcotions(caster, ability) end
        }
    }
end
function MantaDodge.prototype.launch(self, options)
    self.isRunning = true
    self:moveHero(self.controller)
    self:setupHero()
    local spells = __TS__ArrayFilter(
        self.spells,
        function(____, elem) return __TS__ArrayFind(
            __TS__ObjectEntries(options.spells),
            function(____, e) return e[2] == elem.ability_name end
        ) end
    )
    local heroes = __TS__ArrayMap(
        spells,
        function(____, e) return e.hero end
    )
    self:preCacheHeroes(heroes)
    local cache = {}
    local ____self_unsubs_0 = self.unsubs
    ____self_unsubs_0[#____self_unsubs_0 + 1] = eventBus:on(
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
    local ____self_unsubs_1 = self.unsubs
    ____self_unsubs_1[#____self_unsubs_1 + 1] = eventBus:on(
        "manta_dodge.cast_spell_finish",
        function()
            print(self.pid, "FINISHED SPELL CAST")
            if self.isRunning then
                self:trigerrSpellCast(spells)
            end
        end
    )
    local ____self_game_event_listeners_2 = self.game_event_listeners
    ____self_game_event_listeners_2[#____self_game_event_listeners_2 + 1] = ListenToGameEvent(
        "dota_ability_channel_finished",
        function(____, event)
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
    local ____self_game_event_listeners_3 = self.game_event_listeners
    ____self_game_event_listeners_3[#____self_game_event_listeners_3 + 1] = ListenToGameEvent(
        "dota_non_player_used_ability",
        function(____, event)
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
    local ____self_game_event_listeners_4 = self.game_event_listeners
    ____self_game_event_listeners_4[#____self_game_event_listeners_4 + 1] = ListenToGameEvent(
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
    local game_events = self.game_event_listeners
    if #game_events > 0 then
        __TS__ArrayForEach(
            game_events,
            function(____, listener) return StopListeningToGameEvent(listener) end
        )
    end
    StopListeningToAllGameEvents(self.context)
    __TS__ArrayMap(
        self.unsubs,
        function(____, e) return e(nil) end
    )
    local entities = Entities:FindAllInSphere(
        self.controller:GetAssignedHero():GetAbsOrigin(),
        1000
    )
    __TS__ArrayForEach(
        entities,
        function(____, e)
            if e:GetEntityIndex() ~= self.controller:GetAssignedHero():GetEntityIndex() and e:IsBaseNPC() and e:IsAlive() and e:IsHero() then
                e:Destroy()
            end
        end
    )
    self:resetHero()
    self:returnHero()
    self:listenEvents()
end
function MantaDodge.prototype.relaunch(self, options)
    self:finish()
    self:launch(options)
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
    if not self.isRunning then
        return
    end
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
    hero:AddNewModifier(nil, nil, empty_debuff_applier.name, {})
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
                local ____switch54 = true
                local tryCount
                local ____cond54 = ____switch54 == isNoTarget
                if ____cond54 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Queue = true
                    })
                    break
                end
                ____cond54 = ____cond54 or ____switch54 == isPoint
                if ____cond54 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Position = hero_pos,
                        Queue = true
                    })
                    break
                end
                ____cond54 = ____cond54 or ____switch54 == isTarget
                if ____cond54 then
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
    local ____TS__New_result_5 = __TS__New(Geometry)
    self.heroBox = ____TS__New_result_5
    local box = ____TS__New_result_5
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
function MantaDodge.prototype.creepCentStun(self, caster, ability, config)
    Timers:CreateTimer(
        0.5,
        function()
            print(caster:GetName())
            print(caster:GetEntityIndex())
            caster:CastAbilityOnPosition(
                self.controller:GetAssignedHero():GetAbsOrigin(),
                ability,
                -1
            )
            caster:MoveToPosition(self.controller:GetAssignedHero():GetAbsOrigin())
        end
    )
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
            local tryCount = 0
            local throw_abilitiy = caster:FindAbilityByName("alchemist_unstable_concoction_throw")
            Timers:CreateTimer(function()
                if tryCount == 3 then
                    return
                end
                ExecuteOrderFromTable({
                    OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
                    UnitIndex = caster:GetEntityIndex(),
                    TargetIndex = self.controller:GetAssignedHero():GetEntityIndex(),
                    AbilityIndex = throw_abilitiy:GetEntityIndex(),
                    Queue = true
                })
                tryCount = tryCount + 1
                return 0.5
            end)
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
