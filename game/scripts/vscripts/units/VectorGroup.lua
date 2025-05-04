local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__New = ____lualib.__TS__New
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 10,["16"] = 10,["17"] = 10,["18"] = 15,["19"] = 14,["20"] = 16,["21"] = 15,["22"] = 19,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 22,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 32,["36"] = 33,["37"] = 36,["38"] = 37,["39"] = 38,["40"] = 39,["41"] = 40,["42"] = 41,["43"] = 43,["44"] = 44,["45"] = 45,["48"] = 48,["49"] = 49,["50"] = 50,["52"] = 44,["53"] = 54,["54"] = 55,["55"] = 56,["56"] = 57,["57"] = 58,["58"] = 59,["61"] = 62,["62"] = 63,["64"] = 54,["65"] = 19,["66"] = 69,["67"] = 69,["68"] = 69,["69"] = 77,["70"] = 70,["71"] = 71,["72"] = 73,["73"] = 74,["74"] = 76,["75"] = 78,["76"] = 77,["77"] = 81,["78"] = 86,["79"] = 87,["80"] = 88,["81"] = 88,["82"] = 88,["83"] = 89,["84"] = 90,["85"] = 91,["86"] = 91,["87"] = 91,["88"] = 91,["90"] = 88,["91"] = 88,["92"] = 96,["93"] = 96,["94"] = 96,["95"] = 97,["96"] = 98,["97"] = 99,["98"] = 99,["99"] = 99,["100"] = 99,["102"] = 96,["103"] = 96,["104"] = 105,["105"] = 106,["106"] = 107,["107"] = 108,["110"] = 111,["113"] = 114,["114"] = 115,["115"] = 116,["118"] = 119,["119"] = 120,["121"] = 121,["124"] = 123,["126"] = 124,["129"] = 126,["131"] = 127,["135"] = 131,["136"] = 131,["137"] = 131,["138"] = 137,["139"] = 138,["140"] = 139,["141"] = 139,["142"] = 144,["143"] = 144,["144"] = 145,["145"] = 105,["146"] = 81,["147"] = 149,["148"] = 154,["149"] = 155,["150"] = 156,["151"] = 158,["152"] = 159,["153"] = 163,["154"] = 164,["155"] = 165,["156"] = 166,["157"] = 166,["158"] = 166,["159"] = 167,["160"] = 167,["161"] = 167,["162"] = 168,["163"] = 169,["164"] = 170,["165"] = 171,["166"] = 172,["167"] = 166,["168"] = 166,["170"] = 175,["173"] = 178,["174"] = 149,["175"] = 181,["176"] = 182,["177"] = 181});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____sniper_vector = require("modifiers.sniper_vector")
local sniper_vector = ____sniper_vector.sniper_vector
local ____Box = require("utils.Box")
local Geometry = ____Box.Geometry
____exports.VectorGroup = __TS__Class()
local VectorGroup = ____exports.VectorGroup
VectorGroup.name = "VectorGroup"
function VectorGroup.prototype.____constructor(self, options)
    self.context = {}
    self.options = options
end
function VectorGroup.prototype.spawn(self)
    local ____self_options_0 = self.options
    local start = ____self_options_0.start
    local ____end = ____self_options_0["end"]
    CreateTempTree(start, 3)
    local dummy = CreateUnitByName(
        "npc_dummy_sniper",
        ____end,
        true,
        nil,
        nil,
        DOTA_TEAM_NOTEAM
    )
    self.index = dummy:GetEntityIndex()
    dummy:AddNewModifier(nil, nil, sniper_vector.name, {index = self.index})
    dummy:SetUnitCanRespawn(false)
    dummy:SetDeathXP(0)
    dummy:SetMaximumGoldBounty(0)
    dummy:SetMinimumGoldBounty(0)
    dummy:SetMaxHealth(300)
    dummy:SetHealth(300)
    self.ttl = 3000
    Timers:CreateTimer(function()
        if self.ttl == 0 then
            return
        end
        if dummy:IsAlive() then
            self.ttl = self.ttl - 1
            return 0.001
        end
    end)
    Timers:CreateTimer(function()
        local health = dummy:GetHealth()
        if dummy:IsAlive() then
            if health - 10 <= 0 then
                dummy:ForceKill(false)
                eventBus:emit("vector_dummy.expire", {index = self.index})
                return
            end
            dummy:ModifyHealth(health - 10, nil, false, 0)
            return 0.1
        end
    end)
end
____exports.VectorGroupSpawn = __TS__Class()
local VectorGroupSpawn = ____exports.VectorGroupSpawn
VectorGroupSpawn.name = "VectorGroupSpawn"
function VectorGroupSpawn.prototype.____constructor(self, controller)
    self.isSpawning = true
    self.isFirstLaunch = true
    self.entities = {}
    self.blackListSpawns = {}
    self.context = {}
    self.controller = controller
end
function VectorGroupSpawn.prototype.spawn(self, outerBox, innerBox, config)
    local interval = 2.5
    local entsCount = config.entities_count
    eventBus:on(
        "vector_dummy.killed",
        function(____, event)
            local index = event.index
            if index then
                self.blackListSpawns = __TS__ArrayFilter(
                    self.blackListSpawns,
                    function(____, e) return e.index ~= index end
                )
            end
        end
    )
    eventBus:on(
        "vector_dummy.expire",
        function(____, event)
            local index = event.index
            if index then
                self.blackListSpawns = __TS__ArrayFilter(
                    self.blackListSpawns,
                    function(____, e) return e.index ~= index end
                )
            end
        end
    )
    Timers:CreateTimer(function()
        local count = #self.entities
        if count == entsCount then
            eventBus:emit("vector_spawn.finish", {})
            return
        end
        if not self.isSpawning then
            return
        end
        if self.isFirstLaunch then
            self.isFirstLaunch = false
            return 3
        end
        repeat
            local ____switch22 = true
            local ____cond22 = ____switch22 == (count >= 4 and count < 8)
            if ____cond22 then
                interval = 1.75
                break
            end
            ____cond22 = ____cond22 or ____switch22 == (count >= 8 and count < 12)
            if ____cond22 then
                interval = 1.25
                break
            end
            ____cond22 = ____cond22 or ____switch22 == (count >= 12)
            if ____cond22 then
                interval = 1.1
                break
            end
        until true
        local ____temp_1 = self:calcSpawnPosition(outerBox, innerBox, self.blackListSpawns)
        local start = ____temp_1.start
        local ____end = ____temp_1["end"]
        local ents = __TS__New(____exports.VectorGroup, {start = start, ["end"] = ____end})
        ents:spawn()
        local ____self_blackListSpawns_2 = self.blackListSpawns
        ____self_blackListSpawns_2[#____self_blackListSpawns_2 + 1] = {pStart = start, pEnd = ____end, index = ents.index}
        local ____self_entities_3 = self.entities
        ____self_entities_3[#____self_entities_3 + 1] = ents
        return interval
    end)
end
function VectorGroupSpawn.prototype.calcSpawnPosition(self, outerBox, innerBox, previousPoints)
    local start
    local ____end
    local isForbidden = true
    while isForbidden do
        start = Geometry:twoBoxRandomPoint(outerBox.boxPoints, innerBox.boxPoints)
        ____end = Geometry:twoBoxRandomPoint(outerBox.boxPoints, innerBox.boxPoints)
        if #previousPoints > 0 then
            local hero = self.controller:GetAbsOrigin()
            isForbidden = __TS__ArraySome(
                previousPoints,
                function(____, e)
                    local ____e_4 = e
                    local pStart = ____e_4.pStart
                    local pEnd = ____e_4.pEnd
                    local d1 = Geometry:distanceToSegment(____end, hero, pStart)
                    local d2 = Geometry:distanceToSegment(____end, pStart, pEnd)
                    local d3 = Geometry:distanceToSegment(start, hero, pStart)
                    local d4 = Geometry:distanceToSegment(start, pStart, pEnd)
                    return (d1 <= 300 or d2 <= 300) and (d3 <= 300 or d4 <= 300)
                end
            )
        else
            isForbidden = false
        end
    end
    return {start = start, ["end"] = ____end}
end
function VectorGroupSpawn.prototype.kill(self)
    self.isSpawning = false
end
return ____exports
