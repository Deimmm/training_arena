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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["15"] = 1,["16"] = 1,["17"] = 2,["18"] = 2,["19"] = 3,["20"] = 3,["21"] = 5,["22"] = 5,["23"] = 6,["24"] = 6,["25"] = 7,["26"] = 7,["27"] = 8,["28"] = 8,["29"] = 9,["30"] = 9,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["36"] = 25,["37"] = 27,["38"] = 30,["39"] = 34,["40"] = 35,["41"] = 35,["42"] = 35,["43"] = 35,["44"] = 35,["45"] = 34,["46"] = 42,["47"] = 42,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 34,["52"] = 49,["53"] = 49,["54"] = 49,["55"] = 49,["56"] = 49,["57"] = 34,["58"] = 34,["59"] = 60,["60"] = 60,["61"] = 60,["62"] = 60,["63"] = 60,["64"] = 34,["65"] = 66,["66"] = 66,["67"] = 66,["68"] = 66,["69"] = 66,["70"] = 34,["71"] = 72,["72"] = 72,["73"] = 72,["74"] = 72,["75"] = 72,["76"] = 34,["77"] = 34,["78"] = 34,["79"] = 34,["80"] = 34,["81"] = 34,["82"] = 103,["83"] = 103,["84"] = 103,["85"] = 103,["86"] = 103,["87"] = 34,["88"] = 34,["89"] = 114,["90"] = 114,["91"] = 114,["92"] = 114,["93"] = 114,["94"] = 34,["95"] = 34,["96"] = 126,["97"] = 126,["98"] = 126,["99"] = 126,["100"] = 126,["101"] = 34,["102"] = 133,["103"] = 133,["104"] = 133,["105"] = 133,["106"] = 133,["107"] = 34,["108"] = 34,["109"] = 34,["110"] = 34,["111"] = 155,["112"] = 155,["113"] = 155,["114"] = 155,["115"] = 155,["116"] = 34,["117"] = 34,["118"] = 167,["119"] = 167,["120"] = 167,["121"] = 167,["122"] = 167,["123"] = 34,["124"] = 34,["125"] = 34,["126"] = 34,["127"] = 34,["128"] = 34,["129"] = 34,["130"] = 204,["131"] = 204,["132"] = 204,["133"] = 204,["134"] = 204,["135"] = 34,["136"] = 211,["137"] = 211,["138"] = 211,["139"] = 211,["140"] = 211,["141"] = 34,["142"] = 34,["143"] = 218,["144"] = 222,["145"] = 223,["146"] = 224,["147"] = 225,["148"] = 226,["149"] = 227,["150"] = 227,["151"] = 227,["152"] = 228,["153"] = 228,["154"] = 227,["155"] = 227,["156"] = 230,["157"] = 230,["158"] = 230,["159"] = 230,["160"] = 232,["161"] = 234,["162"] = 236,["163"] = 236,["164"] = 237,["165"] = 237,["166"] = 238,["167"] = 239,["168"] = 240,["169"] = 240,["170"] = 240,["171"] = 240,["172"] = 241,["173"] = 241,["174"] = 241,["175"] = 242,["176"] = 243,["177"] = 244,["179"] = 241,["180"] = 241,["183"] = 237,["184"] = 237,["185"] = 252,["186"] = 252,["187"] = 253,["188"] = 253,["189"] = 254,["190"] = 255,["192"] = 253,["193"] = 253,["194"] = 260,["195"] = 260,["196"] = 261,["197"] = 263,["198"] = 264,["199"] = 265,["200"] = 266,["201"] = 266,["202"] = 266,["203"] = 266,["204"] = 267,["205"] = 267,["206"] = 267,["207"] = 267,["209"] = 261,["210"] = 261,["211"] = 261,["212"] = 278,["213"] = 278,["214"] = 279,["215"] = 281,["216"] = 282,["217"] = 283,["218"] = 283,["219"] = 283,["220"] = 283,["221"] = 283,["222"] = 283,["223"] = 283,["224"] = 283,["225"] = 291,["228"] = 294,["229"] = 295,["230"] = 295,["231"] = 295,["232"] = 295,["233"] = 296,["234"] = 296,["235"] = 296,["236"] = 296,["238"] = 279,["239"] = 279,["240"] = 279,["241"] = 308,["242"] = 308,["243"] = 309,["244"] = 311,["245"] = 312,["246"] = 313,["247"] = 314,["248"] = 315,["249"] = 316,["251"] = 309,["252"] = 309,["253"] = 309,["254"] = 222,["255"] = 324,["256"] = 325,["257"] = 326,["258"] = 327,["259"] = 328,["260"] = 328,["261"] = 328,["262"] = 328,["264"] = 332,["265"] = 333,["266"] = 334,["267"] = 334,["268"] = 334,["269"] = 334,["271"] = 337,["272"] = 339,["273"] = 339,["274"] = 339,["275"] = 339,["276"] = 340,["277"] = 341,["278"] = 341,["279"] = 341,["280"] = 341,["281"] = 346,["282"] = 346,["283"] = 346,["284"] = 348,["285"] = 355,["287"] = 346,["288"] = 346,["289"] = 358,["290"] = 359,["291"] = 360,["292"] = 361,["293"] = 324,["294"] = 364,["295"] = 365,["296"] = 366,["297"] = 364,["298"] = 369,["299"] = 370,["300"] = 370,["301"] = 370,["302"] = 371,["303"] = 371,["304"] = 371,["305"] = 372,["306"] = 373,["307"] = 371,["308"] = 371,["309"] = 370,["310"] = 370,["311"] = 369,["312"] = 382,["313"] = 383,["316"] = 386,["317"] = 387,["318"] = 382,["319"] = 389,["320"] = 390,["321"] = 390,["322"] = 390,["323"] = 390,["324"] = 390,["325"] = 390,["326"] = 390,["327"] = 390,["328"] = 398,["329"] = 399,["330"] = 400,["331"] = 401,["332"] = 402,["333"] = 403,["334"] = 404,["335"] = 404,["336"] = 404,["337"] = 404,["338"] = 404,["339"] = 405,["340"] = 406,["341"] = 407,["342"] = 408,["345"] = 411,["346"] = 411,["347"] = 411,["348"] = 412,["349"] = 414,["350"] = 415,["351"] = 415,["352"] = 415,["353"] = 417,["354"] = 418,["355"] = 418,["356"] = 418,["357"] = 420,["358"] = 421,["359"] = 421,["360"] = 421,["361"] = 423,["362"] = 424,["363"] = 425,["364"] = 427,["365"] = 427,["366"] = 427,["367"] = 427,["368"] = 427,["369"] = 427,["372"] = 435,["373"] = 454,["374"] = 436,["376"] = 437,["377"] = 437,["378"] = 437,["379"] = 437,["380"] = 437,["381"] = 437,["384"] = 444,["386"] = 445,["387"] = 445,["388"] = 445,["389"] = 445,["390"] = 445,["391"] = 445,["392"] = 445,["395"] = 453,["397"] = 454,["398"] = 455,["399"] = 456,["402"] = 459,["403"] = 459,["404"] = 459,["405"] = 459,["406"] = 459,["407"] = 459,["408"] = 459,["409"] = 466,["410"] = 467,["411"] = 455,["418"] = 411,["419"] = 411,["420"] = 389,["421"] = 481,["422"] = 482,["423"] = 483,["424"] = 484,["425"] = 485,["426"] = 485,["427"] = 485,["428"] = 485,["429"] = 481,["430"] = 488,["431"] = 489,["432"] = 490,["433"] = 491,["434"] = 491,["435"] = 491,["436"] = 491,["437"] = 491,["438"] = 491,["439"] = 491,["440"] = 492,["441"] = 494,["442"] = 495,["443"] = 496,["444"] = 500,["445"] = 501,["446"] = 502,["447"] = 508,["448"] = 488,["449"] = 511,["450"] = 512,["451"] = 513,["452"] = 514,["453"] = 515,["454"] = 516,["455"] = 517,["456"] = 518,["458"] = 511,["459"] = 522,["460"] = 523,["461"] = 524,["462"] = 525,["463"] = 526,["466"] = 529,["467"] = 530,["468"] = 531,["469"] = 531,["470"] = 531,["471"] = 531,["473"] = 522,["474"] = 535,["475"] = 536,["476"] = 537,["477"] = 538,["478"] = 535,["479"] = 545,["480"] = 550,["481"] = 550,["482"] = 550,["483"] = 551,["484"] = 559,["485"] = 560,["486"] = 560,["487"] = 560,["488"] = 560,["489"] = 560,["490"] = 565,["491"] = 550,["492"] = 550,["493"] = 545,["494"] = 582,["495"] = 583,["496"] = 583,["497"] = 583,["498"] = 583,["499"] = 583,["500"] = 583,["501"] = 583,["502"] = 590,["503"] = 591,["504"] = 592,["505"] = 592,["506"] = 592,["507"] = 593,["508"] = 593,["509"] = 593,["510"] = 593,["511"] = 593,["512"] = 593,["513"] = 592,["514"] = 592,["515"] = 582,["516"] = 601,["517"] = 602,["518"] = 602,["519"] = 602,["520"] = 602,["521"] = 602,["522"] = 602,["523"] = 602,["524"] = 609,["525"] = 610,["526"] = 611,["527"] = 611,["528"] = 611,["529"] = 612,["530"] = 612,["531"] = 612,["532"] = 612,["533"] = 612,["534"] = 612,["535"] = 611,["536"] = 611,["537"] = 601,["538"] = 620,["539"] = 625,["540"] = 627,["541"] = 627,["542"] = 627,["543"] = 627,["544"] = 627,["545"] = 627,["546"] = 627,["547"] = 620,["548"] = 636,["549"] = 641,["550"] = 642,["551"] = 643,["552"] = 643,["553"] = 643,["554"] = 644,["555"] = 644,["556"] = 644,["557"] = 644,["558"] = 644,["559"] = 644,["560"] = 644,["561"] = 643,["562"] = 643,["563"] = 636,["564"] = 653,["565"] = 658,["566"] = 658,["567"] = 658,["568"] = 658,["569"] = 658,["570"] = 658,["571"] = 664,["572"] = 664,["573"] = 664,["574"] = 664,["575"] = 664,["576"] = 664,["577"] = 653,["578"] = 672,["579"] = 677,["580"] = 678,["581"] = 679,["582"] = 679,["583"] = 679,["584"] = 680,["585"] = 680,["586"] = 680,["587"] = 680,["588"] = 680,["589"] = 680,["590"] = 679,["591"] = 679,["592"] = 672,["593"] = 689,["594"] = 695,["595"] = 696,["596"] = 697,["597"] = 699,["598"] = 699,["599"] = 699,["600"] = 700,["601"] = 701,["602"] = 702,["603"] = 702,["604"] = 702,["605"] = 702,["606"] = 706,["607"] = 706,["608"] = 706,["609"] = 706,["610"] = 706,["611"] = 706,["613"] = 714,["614"] = 714,["615"] = 714,["616"] = 714,["617"] = 714,["618"] = 714,["619"] = 699,["620"] = 699,["621"] = 689,["622"] = 723,["623"] = 728,["624"] = 729,["625"] = 729,["626"] = 729,["627"] = 730,["628"] = 731,["629"] = 732,["630"] = 732,["631"] = 732,["632"] = 732,["633"] = 732,["634"] = 737,["635"] = 738,["636"] = 739,["639"] = 742,["640"] = 742,["641"] = 742,["642"] = 742,["643"] = 742,["644"] = 742,["645"] = 742,["646"] = 749,["647"] = 750,["648"] = 738,["649"] = 729,["650"] = 729,["651"] = 723,["652"] = 755,["653"] = 760,["654"] = 762,["655"] = 762,["656"] = 762,["657"] = 763,["658"] = 764,["659"] = 765,["660"] = 765,["661"] = 765,["662"] = 765,["663"] = 769,["664"] = 769,["665"] = 769,["666"] = 769,["667"] = 769,["668"] = 769,["670"] = 777,["671"] = 777,["672"] = 777,["673"] = 777,["674"] = 777,["675"] = 777,["676"] = 777,["677"] = 785,["678"] = 785,["679"] = 785,["680"] = 785,["681"] = 785,["682"] = 785,["683"] = 762,["684"] = 762,["685"] = 755,["686"] = 794,["687"] = 799,["688"] = 799,["689"] = 799,["690"] = 799,["691"] = 799,["692"] = 799,["693"] = 805,["694"] = 806,["695"] = 806,["696"] = 806,["697"] = 807,["698"] = 808,["699"] = 811,["700"] = 812,["703"] = 815,["704"] = 815,["705"] = 815,["706"] = 815,["707"] = 815,["708"] = 815,["709"] = 815,["710"] = 822,["711"] = 823,["712"] = 811,["713"] = 806,["714"] = 806,["715"] = 794,["716"] = 827,["717"] = 832,["718"] = 833,["719"] = 833,["720"] = 833,["721"] = 834,["722"] = 834,["723"] = 834,["724"] = 834,["725"] = 834,["726"] = 834,["727"] = 833,["728"] = 833,["729"] = 827,["730"] = 843,["731"] = 843,["732"] = 851,["733"] = 872,["734"] = 872,["735"] = 872,["736"] = 872,["737"] = 872,["738"] = 872,["739"] = 851});
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
    self.unsubs = {}
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
        {
            hero = "npc_dota_hero_windrunner",
            ability_name = "windrunner_powershot",
            useBlink = false,
            processor = function(____, caster, ability) return self:wrPowershot(caster, ability) end
        },
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
        {
            hero = "npc_dota_hero_ringmaster",
            ability_name = "ringmaster_tame_the_beasts",
            useBlink = false,
            processor = function(____, caster, ability) return self:ringMasterTame(caster, ability) end
        },
        {hero = "npc_dota_hero_rattletrap", ability_name = "rattletrap_hookshot", useBlink = false},
        {
            hero = "npc_dota_hero_primal_beast",
            ability_name = "primal_beast_rock_throw",
            useBlink = false,
            processor = function(____, caster, ability, config) return self:primalRockThrow(caster, ability, config) end
        },
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
        {
            hero = "npc_dota_hero_leshrac",
            ability_name = "leshrac_split_earth",
            useBlink = false,
            processor = function(____, caster, ability, config) return self:leshracStun(caster, ability, config) end
        },
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
    local pid = math.floor(math.random() * 10000)
    self.activePid = pid
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
                            if self.activePid == pid then
                                self:trigerrSpellCast(spells, pid)
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
            if self.activePid == pid then
                self:trigerrSpellCast(spells, pid)
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
                    function() return self.activePid == pid and eventBus:emit("manta_dodge.cast_spell_finish", nil) end
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
                    function() return self.activePid == pid and eventBus:emit("manta_dodge.cast_spell_finish", nil) end
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
    self.activePid = nil
    local listeners = self.listeners
    if listeners and #listeners > 0 then
        __TS__ArrayForEach(
            listeners,
            function(____, listener) return CustomGameEventManager:UnregisterListener(listener) end
        )
    end
    local game_events = self.game_event_listeners
    if game_events and #game_events > 0 then
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
    local spawn_name = "main_training_spawn"
    local entities = Entities:FindAllInSphere(
        Entities:FindByName(nil, spawn_name):GetAbsOrigin(),
        1000
    )
    __TS__ArrayForEach(
        entities,
        function(____, e)
            if self.controller and e:GetEntityIndex() ~= self.controller:GetAssignedHero():GetEntityIndex() and e:IsBaseNPC() and e:IsAlive() and e:IsHero() then
                e:Destroy()
            end
        end
    )
    local ____ = self.heroBox and self.heroBox:destroyBox()
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
                    GameRules:SendCustomMessage(("<i> Loading " .. hero) .. " </i>", 0, 1)
                end
            )
        end
    )
end
function MantaDodge.prototype.trigerrSpellCast(self, spells, pid)
    if self.activePid ~= pid then
        return
    end
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
                local ____switch58 = true
                local tryCount
                local ____cond58 = ____switch58 == isNoTarget
                if ____cond58 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Queue = true
                    })
                    break
                end
                ____cond58 = ____cond58 or ____switch58 == isPoint
                if ____cond58 then
                    ExecuteOrderFromTable({
                        OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                        UnitIndex = hero:GetEntityIndex(),
                        AbilityIndex = ability:GetEntityIndex(),
                        Position = hero_pos,
                        Queue = true
                    })
                    break
                end
                ____cond58 = ____cond58 or ____switch58 == isTarget
                if ____cond58 then
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
    self.heroBox = __TS__New(Geometry)
    self.heroBox:createBox(
        startPosition:GetAbsOrigin(),
        375,
        100,
        true,
        {}
    )
    local box = self.heroBox
    local hero = self.controller:GetAssignedHero()
    HeroInventory:reset(hero)
    self.heroPreviousState = {attack_capability = hero:GetAttackCapability()}
    hero:SetAttackCapability(0)
    hero:AddNewModifier(nil, nil, manta_modifier.name, {})
    hero:AddNewModifier(nil, nil, soft_wall.name, {minX = box.boxPoints[1].x, maxX = box.boxPoints[3].x, minY = box.boxPoints[1].y, maxY = box.boxPoints[3].y})
    hero:AddItemByName("item_custom_manta")
end
function MantaDodge.prototype.resetHero(self)
    if self.controller then
        local hero = self.controller:GetAssignedHero()
        hero:SetMoveCapability(1)
        hero:SetAttackCapability(self.heroPreviousState.attack_capability)
        hero:RemoveModifierByName(manta_modifier.name)
        hero:RemoveModifierByName(soft_wall.name)
        HeroInventory:reset(hero)
    end
end
function MantaDodge.prototype.returnHero(self)
    if self.controller then
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
function MantaDodge.prototype.ringMasterTame(self, caster, ability)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
        UnitIndex = caster:GetEntityIndex(),
        AbilityIndex = ability:GetEntityIndex(),
        Position = self.controller:GetAssignedHero():GetAbsOrigin(),
        Queue = true
    })
    local cast_time = ability:GetChannelTime()
    local randomTime = Utils:randomInt(0.5, 0.5 + cast_time, 0.15)
    Timers:CreateTimer(
        randomTime,
        function()
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_STOP,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ability:GetEntityIndex(),
                Position = self.controller:GetAssignedHero():GetAbsOrigin()
            })
        end
    )
end
function MantaDodge.prototype.wrPowershot(self, caster, ability)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
        UnitIndex = caster:GetEntityIndex(),
        AbilityIndex = ability:GetEntityIndex(),
        Position = self.controller:GetAssignedHero():GetAbsOrigin(),
        Queue = true
    })
    local cast_time = ability:GetChannelTime()
    local randomTime = Utils:randomInt(0.75, 0.75 + cast_time, 0.15)
    Timers:CreateTimer(
        randomTime,
        function()
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_STOP,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ability:GetEntityIndex(),
                Position = self.controller:GetAssignedHero():GetAbsOrigin()
            })
        end
    )
end
function MantaDodge.prototype.leshracStun(self, caster, ability, config)
    ability:SetLevel(4)
    ExecuteOrderFromTable({
        OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
        UnitIndex = caster:GetEntityIndex(),
        AbilityIndex = ability:GetEntityIndex(),
        Position = self.controller:GetAssignedHero():GetAbsOrigin(),
        Queue = true
    })
end
function MantaDodge.prototype.primalRockThrow(self, caster, ability, config)
    caster:AddItemByName("item_aghanims_shard")
    local randomTime = Utils:randomInt(0.5, 1, 0.1)
    Timers:CreateTimer(
        randomTime,
        function()
            ExecuteOrderFromTable({
                OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
                UnitIndex = caster:GetEntityIndex(),
                AbilityIndex = ability:GetEntityIndex(),
                Position = self.controller:GetAssignedHero():GetAbsOrigin(),
                Queue = true
            })
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
