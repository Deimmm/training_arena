local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["9"] = 2,["10"] = 8,["11"] = 9,["12"] = 10,["13"] = 8,["14"] = 7,["19"] = 5});
Timer = __TS__Class()
Timer.name = "Timer"
function Timer.prototype.____constructor(self)
    self.time = 0
    Timers:CreateTimer(function()
        self.time = self.time + 1
        return 0.001
    end)
end
__TS__SetDescriptor(
    Timer.prototype,
    "now",
    {get = function(self)
        return self.time
    end},
    true
)
