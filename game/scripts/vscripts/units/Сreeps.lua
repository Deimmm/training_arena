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
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["16"] = 1,["17"] = 1,["18"] = 1,["19"] = 4,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 16,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 16,["31"] = 19,["32"] = 19,["33"] = 19,["34"] = 16,["35"] = 20,["36"] = 20,["37"] = 20,["38"] = 16,["39"] = 21,["40"] = 21,["41"] = 21,["42"] = 16,["43"] = 22,["44"] = 22,["45"] = 22,["46"] = 16,["47"] = 16,["48"] = 16,["49"] = 10,["50"] = 10,["51"] = 10,["52"] = 10,["53"] = 10,["54"] = 11,["55"] = 12,["56"] = 13,["58"] = 4,["59"] = 25,["60"] = 26,["61"] = 26,["62"] = 26,["63"] = 26,["64"] = 26,["65"] = 26,["66"] = 25,["67"] = 34,["68"] = 39,["69"] = 40,["70"] = 41,["72"] = 42,["76"] = 44,["77"] = 44,["78"] = 44,["79"] = 44,["80"] = 44,["81"] = 44,["82"] = 44,["83"] = 44,["84"] = 53,["85"] = 54,["86"] = 34,["87"] = 58,["88"] = 58,["89"] = 58,["91"] = 59,["92"] = 60,["93"] = 62,["95"] = 73,["96"] = 73,["97"] = 73,["98"] = 73,["99"] = 74,["100"] = 76,["101"] = 78,["103"] = 79,["104"] = 79,["105"] = 80,["106"] = 79,["110"] = 87,["111"] = 87,["112"] = 88,["113"] = 87,["117"] = 95,["118"] = 95,["119"] = 96,["120"] = 95,["123"] = 103,["125"] = 76,["127"] = 62,["128"] = 108,["129"] = 109,["130"] = 108});
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
    self.isSpawning = false
end
function CreepSpawn.prototype.startSpawn(self, position, movePosition, creeps, interval, team)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local ____creeps_1 = creeps
        local melee = ____creeps_1.melee
        local range = ____creeps_1.range
        local business = ____creeps_1.business
        self.isSpawning = true
        Timers:CreateTimer({callback = function()
            if self.isSpawning then
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
            end
        end})
    end)
end
function CreepSpawn.prototype.stopSpawn(self)
    self.isSpawning = false
end
return ____exports
