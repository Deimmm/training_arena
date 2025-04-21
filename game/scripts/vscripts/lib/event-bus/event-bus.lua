local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["11"] = 4,["12"] = 3,["13"] = 6,["14"] = 7,["15"] = 8,["17"] = 10,["18"] = 10,["19"] = 6,["20"] = 13,["21"] = 14,["22"] = 15,["25"] = 17,["26"] = 17,["27"] = 17,["28"] = 17,["29"] = 13,["30"] = 20,["31"] = 21,["32"] = 22,["35"] = 24,["36"] = 25,["38"] = 20,["39"] = 29,["40"] = 30,["41"] = 29,["42"] = 34});
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
