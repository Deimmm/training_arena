local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 5,["17"] = 6,["18"] = 7,["20"] = 3,["23"] = 2});
local ____exports = {}
____exports.HeroInventory = __TS__Class()
local HeroInventory = ____exports.HeroInventory
HeroInventory.name = "HeroInventory"
function HeroInventory.prototype.____constructor(self)
end
function HeroInventory.reset(self, hero)
    do
        local i = 0
        while i < 9 do
            local item = hero:GetItemInSlot(i)
            local ____ = hero.GetNumItemsInStash
            if item then
                hero:RemoveItem(item)
            end
            i = i + 1
        end
    end
end
return ____exports
