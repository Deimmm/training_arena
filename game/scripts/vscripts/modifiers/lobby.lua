local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 9,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 14,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 18,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 3,["36"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.lobby_modifier = __TS__Class()
local lobby_modifier = ____exports.lobby_modifier
lobby_modifier.name = "lobby_modifier"
__TS__ClassExtends(lobby_modifier, BaseModifier)
function lobby_modifier.prototype.DeclareFunctions(self)
    return {MODIFIER_PROPERTY_BONUS_DAY_VISION}
end
function lobby_modifier.prototype.GetBonusDayVision(self)
    print("GETING VISION")
    return 100000
end
function lobby_modifier.prototype.GetModifierGetBonusDayVision(self)
    print("GETING VISION")
    return 100000
end
function lobby_modifier.prototype.GetModifierBonusDayVision(self)
    print("GETING VISION")
    return 100000
end
lobby_modifier = __TS__Decorate(
    lobby_modifier,
    lobby_modifier,
    {registerModifier(nil)},
    {kind = "class", name = "lobby_modifier"}
)
____exports.lobby_modifier = lobby_modifier
return ____exports
