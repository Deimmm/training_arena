local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 9,["12"] = 9,["13"] = 9,["14"] = 13,["15"] = 14,["16"] = 13,["17"] = 16,["18"] = 17,["19"] = 17,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 19,["24"] = 19,["25"] = 19,["26"] = 19,["27"] = 19,["28"] = 19,["29"] = 19,["30"] = 27,["31"] = 28,["32"] = 29,["33"] = 30,["34"] = 31,["35"] = 33,["36"] = 34,["39"] = 37,["40"] = 38,["41"] = 39,["43"] = 33,["44"] = 43,["45"] = 44,["46"] = 45,["47"] = 46,["48"] = 47,["49"] = 48,["52"] = 51,["53"] = 52,["55"] = 43,["56"] = 16,["57"] = 58,["58"] = 58,["59"] = 58,["61"] = 59,["62"] = 60,["63"] = 62,["64"] = 58,["65"] = 64,["66"] = 65,["67"] = 66,["68"] = 68,["69"] = 69,["70"] = 70,["71"] = 71,["74"] = 74,["77"] = 77,["78"] = 78,["79"] = 79,["81"] = 81,["82"] = 85,["83"] = 87,["84"] = 88,["85"] = 89,["86"] = 89,["87"] = 90,["88"] = 68,["89"] = 64,["90"] = 94,["91"] = 95,["92"] = 94});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Box = require("utils.Box")
local Box = ____Box.Box
____exports.VectorGroup = __TS__Class()
local VectorGroup = ____exports.VectorGroup
VectorGroup.name = "VectorGroup"
function VectorGroup.prototype.____constructor(self, options)
    self.options = options
end
function VectorGroup.prototype.spawn(self)
    local ____self_options_0 = self.options
    local start = ____self_options_0.start
    local ____end = ____self_options_0["end"]
    local tree = CreateTempTree(start, 2)
    local dummy = CreateUnitByName(
        "npc_dota_rattletrap_cog",
        ____end,
        true,
        nil,
        nil,
        DOTA_TEAM_NOTEAM
    )
    self.index = dummy:GetEntityIndex()
    dummy:SetDeathXP(0)
    dummy:SetMaximumGoldBounty(0)
    dummy:SetMinimumGoldBounty(0)
    dummy:SetHealth(200)
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
                dummy:Kill(nil, nil)
                eventBus:emit("vectorgroup.expire", {})
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
function VectorGroupSpawn.prototype.____constructor(self)
    self.isSpawning = true
    self.isFirstLaunch = true
    self.entities = {}
end
function VectorGroupSpawn.prototype.spawn(self, outerBox, innerBox, config)
    local interval = 2.5
    local entsCount = config.entities_count
    Timers:CreateTimer(function()
        local count = #self.entities
        if count == entsCount then
            eventBus:emit("vectorgroup.finish", {})
            return
        end
        if not self.isSpawning then
            return
        end
        if self.isFirstLaunch then
            self.isFirstLaunch = false
            return 3
        end
        local start = Box:twoBoxRandomPoint(outerBox.boxPoints, innerBox.boxPoints)
        local ____end = Box:twoBoxRandomPoint(outerBox.boxPoints, innerBox.boxPoints)
        local ents = __TS__New(____exports.VectorGroup, {start = start, ["end"] = ____end})
        ents:spawn()
        local ____self_entities_1 = self.entities
        ____self_entities_1[#____self_entities_1 + 1] = ents
        return interval
    end)
end
function VectorGroupSpawn.prototype.kill(self)
    self.isSpawning = false
end
return ____exports
