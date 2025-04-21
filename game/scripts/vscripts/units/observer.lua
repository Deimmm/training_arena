local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 7,["9"] = 7,["10"] = 7,["11"] = 11,["12"] = 12,["13"] = 11,["14"] = 15,["15"] = 16,["16"] = 16,["17"] = 16,["18"] = 16,["19"] = 16,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 27,["28"] = 27,["29"] = 27,["30"] = 27,["31"] = 27,["32"] = 27,["33"] = 27,["34"] = 35,["35"] = 36,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 41,["41"] = 42,["42"] = 43,["45"] = 46,["46"] = 47,["47"] = 48,["49"] = 42,["50"] = 52,["51"] = 53,["52"] = 55,["53"] = 56,["54"] = 57,["55"] = 58,["58"] = 61,["59"] = 62,["61"] = 52,["62"] = 15});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
____exports.ObserverWard = __TS__Class()
local ObserverWard = ____exports.ObserverWard
ObserverWard.name = "ObserverWard"
function ObserverWard.prototype.____constructor(self, options)
    self.options = options
end
function ObserverWard.prototype.spawn(self)
    local sizes = {
        {8, 0.6},
        {10, 0.7},
        {12, 0.8},
        {12, 0.8},
        {12, 0.8},
        {14, 1},
        {14, 1}
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
return ____exports
