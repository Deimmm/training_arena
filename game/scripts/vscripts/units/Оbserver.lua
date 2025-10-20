local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 8,["12"] = 8,["13"] = 8,["14"] = 12,["15"] = 13,["16"] = 12,["17"] = 16,["18"] = 17,["19"] = 17,["20"] = 17,["21"] = 17,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 26,["28"] = 27,["29"] = 28,["30"] = 28,["31"] = 28,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 28,["37"] = 36,["38"] = 37,["39"] = 38,["40"] = 39,["41"] = 40,["42"] = 41,["43"] = 42,["44"] = 43,["45"] = 44,["46"] = 45,["49"] = 48,["50"] = 49,["51"] = 50,["53"] = 44,["54"] = 54,["55"] = 55,["56"] = 57,["57"] = 58,["58"] = 59,["59"] = 60,["62"] = 63,["63"] = 64,["65"] = 54,["66"] = 16,["67"] = 70,["68"] = 70,["69"] = 70,["71"] = 71,["72"] = 72,["73"] = 74,["74"] = 70,["75"] = 75,["76"] = 80,["77"] = 81,["78"] = 82,["79"] = 83,["80"] = 84,["81"] = 85,["84"] = 88,["87"] = 91,["88"] = 92,["89"] = 93,["92"] = 96,["93"] = 97,["95"] = 98,["98"] = 100,["100"] = 101,["103"] = 103,["105"] = 104,["108"] = 106,["110"] = 107,["113"] = 109,["115"] = 110,["118"] = 114,["120"] = 115,["124"] = 118,["125"] = 123,["126"] = 124,["127"] = 125,["128"] = 125,["129"] = 126,["130"] = 82,["131"] = 75,["132"] = 130,["133"] = 131,["134"] = 130});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____Box = require("utils.Box")
local Geometry = ____Box.Geometry
____exports.ObserverWard = __TS__Class()
local ObserverWard = ____exports.ObserverWard
ObserverWard.name = "ObserverWard"
function ObserverWard.prototype.____constructor(self, options)
    self.options = options
end
function ObserverWard.prototype.spawn(self)
    local sizes = {
        {9, 0.65},
        {10, 0.7},
        {12, 0.8},
        {12, 0.8},
        {12, 0.8},
        {14, 0.9},
        {14, 0.9}
    }
    local randomIndex = math.random(1, #sizes) - 1
    local hullRadius, modelScale = unpack(sizes[randomIndex + 1])
    local ward = CreateUnitByName(
        "npc_dota_observer_wards",
        self.options.position,
        true,
        nil,
        nil,
        DOTA_TEAM_NOTEAM
    )
    ward:SetRenderColor(7, 110, 245)
    self.index = ward:GetEntityIndex()
    ward:SetDeathXP(0)
    ward:SetMaximumGoldBounty(0)
    ward:SetMinimumGoldBounty(0)
    ward:SetHullRadius(hullRadius)
    ward:SetModelScale(modelScale)
    self.ttl = 1000
    Timers:CreateTimer(function()
        if self.ttl == 0 then
            return
        end
        if ward:IsAlive() then
            self.ttl = self.ttl - 1
            return 0.001
        end
    end)
    Timers:CreateTimer(function()
        local health = ward:GetHealth()
        if ward:IsAlive() then
            if health - 10 <= 0 then
                ward:Kill(nil, nil)
                eventBus:emit("obs.expire", {})
                return
            end
            ward:ModifyHealth(health - 10, nil, false, 0)
            return 0.1
        end
    end)
end
____exports.AIMCOMMON_ObserverWardSpawn = __TS__Class()
local AIMCOMMON_ObserverWardSpawn = ____exports.AIMCOMMON_ObserverWardSpawn
AIMCOMMON_ObserverWardSpawn.name = "AIMCOMMON_ObserverWardSpawn"
function AIMCOMMON_ObserverWardSpawn.prototype.____constructor(self)
    self.isSpawning = true
    self.isFirstLaunch = true
    self.wards = {}
end
function AIMCOMMON_ObserverWardSpawn.prototype.spawn(self, outerGeometry, innerGeometry, config)
    local interval = 2.1
    local wards_count = config.wards_count
    Timers:CreateTimer(function()
        local count = #self.wards
        if count == wards_count then
            eventBus:emit("obsspawn.finish", {})
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
            local ____switch16 = true
            local ____cond16 = ____switch16 == (count >= 4 and count < 8)
            if ____cond16 then
                interval = 1.65
                break
            end
            ____cond16 = ____cond16 or ____switch16 == (count >= 8 and count < 12)
            if ____cond16 then
                interval = 1.35
                break
            end
            ____cond16 = ____cond16 or ____switch16 == (count >= 12 and count < 16)
            if ____cond16 then
                interval = 1.05
                break
            end
            ____cond16 = ____cond16 or ____switch16 == (count >= 16 and count < 22)
            if ____cond16 then
                interval = 0.65
                break
            end
            ____cond16 = ____cond16 or ____switch16 == (count >= 22 and count < 80)
            if ____cond16 then
                interval = 0.45
                break
            end
            ____cond16 = ____cond16 or ____switch16 == (count >= 80)
            if ____cond16 then
                interval = 0.4
                break
            end
        until true
        local spawnPos = Geometry:twoBoxRandomPoint(outerGeometry.boxPoints, innerGeometry.boxPoints)
        local ward = __TS__New(____exports.ObserverWard, {position = spawnPos})
        ward:spawn()
        local ____self_wards_0 = self.wards
        ____self_wards_0[#____self_wards_0 + 1] = ward
        return interval
    end)
end
function AIMCOMMON_ObserverWardSpawn.prototype.kill(self)
    self.isSpawning = false
end
return ____exports
