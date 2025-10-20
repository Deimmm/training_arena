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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["16"] = 1,["17"] = 1,["18"] = 1,["19"] = 4,["20"] = 18,["21"] = 18,["22"] = 18,["23"] = 19,["24"] = 19,["25"] = 19,["26"] = 18,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 18,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 18,["35"] = 22,["36"] = 22,["37"] = 22,["38"] = 18,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 18,["43"] = 24,["44"] = 24,["45"] = 24,["46"] = 18,["47"] = 18,["48"] = 18,["49"] = 10,["50"] = 10,["51"] = 10,["52"] = 10,["53"] = 10,["54"] = 11,["55"] = 12,["56"] = 13,["57"] = 14,["60"] = 4,["61"] = 27,["62"] = 28,["63"] = 28,["64"] = 28,["65"] = 28,["66"] = 28,["67"] = 28,["68"] = 27,["69"] = 36,["70"] = 41,["71"] = 42,["72"] = 43,["74"] = 44,["78"] = 46,["79"] = 46,["80"] = 46,["81"] = 46,["82"] = 46,["83"] = 46,["84"] = 46,["85"] = 46,["86"] = 55,["87"] = 56,["88"] = 36,["89"] = 60,["90"] = 60,["91"] = 60,["93"] = 61,["94"] = 62,["95"] = 64,["97"] = 75,["98"] = 75,["99"] = 75,["100"] = 75,["101"] = 76,["102"] = 78,["103"] = 80,["105"] = 81,["106"] = 81,["107"] = 82,["108"] = 81,["112"] = 89,["113"] = 89,["114"] = 90,["115"] = 89,["119"] = 97,["120"] = 97,["121"] = 98,["122"] = 97,["125"] = 105,["127"] = 78,["129"] = 64,["130"] = 110,["131"] = 111,["132"] = 110});
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
    local waypoints = ____config_0.waypoints
    self.self = self:spawn(____type, position, team)
    if waypoints and #waypoints > 0 then
        for ____, waypoint in ipairs(waypoints) do
            self:move(waypoint)
        end
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
function CreepSpawn.prototype.startSpawn(self, position, movePositions, creeps, interval, team)
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
                        __TS__New(____exports.LaneCreep, {type = "melee", position = position, team = team, waypoints = movePositions})
                        i = i + 1
                    end
                end
                do
                    local i = 0
                    while i < range do
                        __TS__New(____exports.LaneCreep, {type = "range", position = position, team = team, waypoints = movePositions})
                        i = i + 1
                    end
                end
                do
                    local i = 0
                    while i < business do
                        __TS__New(____exports.LaneCreep, {type = "business", position = position, team = team, waypoints = movePositions})
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
