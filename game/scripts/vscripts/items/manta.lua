local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 4,["13"] = 3,["14"] = 4,["15"] = 5,["16"] = 6,["17"] = 5,["18"] = 9,["19"] = 10,["20"] = 9,["21"] = 4,["22"] = 4,["23"] = 4,["24"] = 3,["27"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseItem = ____dota_ts_adapter.BaseItem
local registerAbility = ____dota_ts_adapter.registerAbility
____exports.item_manta = __TS__Class()
local item_manta = ____exports.item_manta
item_manta.name = "item_manta"
__TS__ClassExtends(item_manta, BaseItem)
function item_manta.prototype.GetCooldown(self)
    return 0
end
function item_manta.prototype.GetManaCost(self)
    return 0
end
item_manta = __TS__Decorate(
    item_manta,
    item_manta,
    {registerAbility(nil)},
    {kind = "class", name = "item_manta"}
)
____exports.item_manta = item_manta
return ____exports
