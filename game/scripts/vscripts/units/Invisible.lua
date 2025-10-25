local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 3,["14"] = 3,["15"] = 3,["17"] = 3,["18"] = 4,["19"] = 5,["20"] = 6,["21"] = 7,["23"] = 8,["28"] = 10,["29"] = 10,["30"] = 11,["31"] = 12,["32"] = 14,["33"] = 15,["34"] = 16,["35"] = 17,["36"] = 18,["38"] = 20,["39"] = 20,["40"] = 21,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 26,["49"] = 20,["52"] = 10,["55"] = 4});
local ____exports = {}
____exports.InvisibileWall = __TS__Class()
local InvisibileWall = ____exports.InvisibileWall
InvisibileWall.name = "InvisibileWall"
function InvisibileWall.prototype.____constructor(self)
end
function InvisibileWall.wrapBox(self, box)
    local unitSpacing = 64
    local points = box.boxPoints
    if #points ~= 4 then
        error(
            __TS__New(Error, "Box must have 4 points."),
            0
        )
    end
    do
        local i = 0
        while i < 4 do
            local start = points[i + 1]
            local ____end = points[(i + 1) % 4 + 1]
            local dx = ____end.x - start.x
            local dy = ____end.y - start.y
            local length = math.sqrt(dx * dx + dy * dy)
            local steps = math.floor(length / unitSpacing)
            local direction = {x = dx / length, y = dy / length}
            do
                local j = 0
                while j <= steps do
                    local pos = Vector(start.x + direction.x * j * unitSpacing, start.y + direction.y * j * unitSpacing)
                    CreateUnitByName(
                        "npc_dota_invisible_wall",
                        pos,
                        false,
                        nil,
                        nil,
                        DOTA_TEAM_NOTEAM
                    )
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
end
return ____exports
