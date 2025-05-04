local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 2,["13"] = 4,["14"] = 5,["15"] = 4,["16"] = 5,["18"] = 5,["19"] = 7,["20"] = 4,["21"] = 8,["22"] = 9,["23"] = 8,["24"] = 11,["25"] = 12,["26"] = 11,["27"] = 15,["28"] = 16,["29"] = 17,["30"] = 20,["32"] = 15,["33"] = 5,["34"] = 5,["35"] = 5,["36"] = 4,["39"] = 5});
local ____exports = {}
local ____event_2Dbus = require("core.event-bus.event-bus")
local eventBus = ____event_2Dbus.eventBus
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.sniper_vector = __TS__Class()
local sniper_vector = ____exports.sniper_vector
sniper_vector.name = "sniper_vector"
__TS__ClassExtends(sniper_vector, BaseModifier)
function sniper_vector.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.isDead = false
end
function sniper_vector.prototype.OnCreated(self, params)
    self.index = params.index
end
function sniper_vector.prototype.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_DEATH}
end
function sniper_vector.prototype.OnDeath(self, event)
    if event.unit:GetEntityIndex() == self.index and not self.isDead then
        eventBus:emit("vector_dummy.killed", {index = self.index})
        self.isDead = true
    end
end
sniper_vector = __TS__Decorate(
    sniper_vector,
    sniper_vector,
    {registerModifier(nil)},
    {kind = "class", name = "sniper_vector"}
)
____exports.sniper_vector = sniper_vector
return ____exports
