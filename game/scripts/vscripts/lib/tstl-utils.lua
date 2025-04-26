local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 4,["8"] = 5,["10"] = 8,["11"] = 12,["12"] = 14,["13"] = 15,["15"] = 18,["16"] = 19,["18"] = 22,["19"] = 23,["20"] = 8});
local ____exports = {}
local global = _G
if global.reloadCache == nil then
    global.reloadCache = {}
end
function ____exports.reloadable(self, constructor, context)
    local className = context.name
    if className == nil then
        error("Cannot reload classes without names!", 0)
    end
    if global.reloadCache[className] == nil then
        global.reloadCache[className] = constructor
    end
    __TS__ObjectAssign(global.reloadCache[className].prototype, constructor.prototype)
    return global.reloadCache[className]
end
return ____exports
