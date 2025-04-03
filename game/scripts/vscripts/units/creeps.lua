local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 4,["18"] = 16,["19"] = 16,["20"] = 16,["21"] = 17,["22"] = 17,["23"] = 17,["24"] = 16,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 16,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 16,["33"] = 20,["34"] = 20,["35"] = 20,["36"] = 16,["37"] = 21,["38"] = 21,["39"] = 21,["40"] = 16,["41"] = 22,["42"] = 22,["43"] = 22,["44"] = 16,["45"] = 16,["46"] = 16,["47"] = 10,["48"] = 10,["49"] = 10,["50"] = 10,["51"] = 10,["52"] = 11,["53"] = 12,["54"] = 13,["56"] = 4,["57"] = 25,["58"] = 26,["59"] = 26,["60"] = 26,["61"] = 26,["62"] = 26,["63"] = 26,["64"] = 25,["65"] = 34,["66"] = 39,["67"] = 40,["68"] = 41,["70"] = 42,["74"] = 44,["75"] = 44,["76"] = 44,["77"] = 44,["78"] = 44,["79"] = 44,["80"] = 44,["81"] = 44,["82"] = 53,["83"] = 54,["84"] = 34,["85"] = 58,["86"] = 58,["87"] = 58,["89"] = 59,["90"] = 60,["91"] = 71,["92"] = 71,["93"] = 71,["94"] = 71,["95"] = 72,["97"] = 74,["98"] = 74,["99"] = 75,["100"] = 74,["104"] = 82,["105"] = 82,["106"] = 83,["107"] = 82,["111"] = 90,["112"] = 90,["113"] = 91,["114"] = 90,["117"] = 98,["118"] = 72,["119"] = 60});
local ____exports = {}
____exports.LaneCreep = __TS__Class()
local LaneCreep = ____exports.LaneCreep
LaneCreep.name = "LaneCreep"
function LaneCreep.prototype.____constructor(self, config)
    self.typeMap = __TS__New(
        Map,
        {
            {
                "melee_" .. tostring(DOTA_TEAM_BADGUYS),
                "npc_dota_creep_badguys_melee"
            },
            {
                "range_" .. tostring(DOTA_TEAM_BADGUYS),
                "npc_dota_creep_badguys_ranged"
            },
            {
                "business_" .. tostring(DOTA_TEAM_BADGUYS),
                "npc_dota_creep_badguys_flagbearer"
            },
            {
                "melee_" .. tostring(DOTA_TEAM_GOODGUYS),
                "npc_dota_creep_goodguys_melee"
            },
            {
                "range_" .. tostring(DOTA_TEAM_GOODGUYS),
                "npc_dota_creep_goodguys_ranged"
            },
            {
                "business_" .. tostring(DOTA_TEAM_GOODGUYS),
                "npc_dota_creep_goodguys_flagbearer"
            }
        }
    )
    local ____config_0 = config
    local ____type = ____config_0.type
    local position = ____config_0.position
    local team = ____config_0.team
    local waypoint = ____config_0.waypoint
    self.self = self:spawn(____type, position, team)
    if waypoint then
        self:move(waypoint)
    end
end
function LaneCreep.prototype.move(self, postion)
    ExecuteOrderFromTable({
        UnitIndex = self.self:GetEntityIndex(),
        OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
        Position = postion,
        Queue = true
    })
end
function LaneCreep.prototype.spawn(self, ____type, position, team)
    local unitKey = (____type .. "_") .. tostring(team)
    local unitName = self.typeMap:get(unitKey)
    if not unitName then
        error(
            __TS__New(Error, "Cannot find Creep"),
            0
        )
    end
    local creep = CreateUnitByName(
        unitName,
        position,
        true,
        nil,
        nil,
        team
    )
    creep:SetDeathXP(0)
    return creep
end
____exports.CreepSpawn = __TS__Class()
local CreepSpawn = ____exports.CreepSpawn
CreepSpawn.name = "CreepSpawn"
function CreepSpawn.prototype.____constructor(self)
end
function CreepSpawn.createSpawn(self, position, movePosition, creeps, interval, team)
    local ____creeps_1 = creeps
    local melee = ____creeps_1.melee
    local range = ____creeps_1.range
    local business = ____creeps_1.business
    Timers:CreateTimer({callback = function()
        do
            local i = 0
            while i < melee do
                __TS__New(____exports.LaneCreep, {type = "melee", position = position, team = team, waypoint = movePosition})
                i = i + 1
            end
        end
        do
            local i = 0
            while i < range do
                __TS__New(____exports.LaneCreep, {type = "range", position = position, team = team, waypoint = movePosition})
                i = i + 1
            end
        end
        do
            local i = 0
            while i < business do
                __TS__New(____exports.LaneCreep, {type = "business", position = position, team = team, waypoint = movePosition})
                i = i + 1
            end
        end
        return interval
    end})
end
return ____exports
