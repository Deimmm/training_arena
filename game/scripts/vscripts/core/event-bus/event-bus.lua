local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["11"] = 4,["12"] = 3,["13"] = 6,["14"] = 7,["15"] = 8,["17"] = 10,["18"] = 10,["19"] = 11,["20"] = 6,["21"] = 14,["22"] = 15,["23"] = 16,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 14,["31"] = 21,["32"] = 22,["33"] = 23,["36"] = 25,["37"] = 26,["39"] = 21,["40"] = 30,["41"] = 31,["42"] = 30,["43"] = 35});
local ____exports = {}
local EventBus = __TS__Class()
EventBus.name = "EventBus"
function EventBus.prototype.____constructor(self)
    self.listeners = {}
end
function EventBus.prototype.on(self, eventName, callback)
    if not self.listeners[eventName] then
        self.listeners[eventName] = {}
    end
    local ____self_listeners_eventName_0 = self.listeners[eventName]
    ____self_listeners_eventName_0[#____self_listeners_eventName_0 + 1] = callback
    return function() return self:off(eventName, callback) end
end
function EventBus.prototype.off(self, eventName, callback)
    local callbacks = self.listeners[eventName]
    if not callbacks then
        return
    end
    self.listeners[eventName] = __TS__ArrayFilter(
        callbacks,
        function(____, cb) return cb ~= callback end
    )
end
function EventBus.prototype.emit(self, eventName, payload)
    local callbacks = self.listeners[eventName]
    if not callbacks then
        return
    end
    for ____, cb in ipairs(callbacks) do
        cb(nil, payload)
    end
end
function EventBus.prototype.clear(self)
    self.listeners = {}
end
____exports.eventBus = __TS__New(EventBus)
return ____exports
