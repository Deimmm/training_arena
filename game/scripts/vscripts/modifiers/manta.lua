local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 8,["19"] = 9,["20"] = 8,["21"] = 4,["22"] = 4,["23"] = 4,["24"] = 3,["27"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.manta_modifier = __TS__Class()
local manta_modifier = ____exports.manta_modifier
manta_modifier.name = "manta_modifier"
__TS__ClassExtends(manta_modifier, BaseModifier)
function manta_modifier.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_STATUS_RESISTANCE}
end
function manta_modifier.prototype.GetModifierStatusResistance(self)
    return 90
end
manta_modifier = __TS__Decorate(
    manta_modifier,
    manta_modifier,
    {registerModifier(nil)},
    {kind = "class", name = "manta_modifier"}
)
____exports.manta_modifier = manta_modifier
return ____exports
