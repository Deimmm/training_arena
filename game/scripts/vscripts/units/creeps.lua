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
local __TS__Promise = ____lualib.__TS__Promise
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 4,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 16,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 16,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 16,["36"] = 20,["37"] = 20,["38"] = 20,["39"] = 16,["40"] = 21,["41"] = 21,["42"] = 21,["43"] = 16,["44"] = 22,["45"] = 22,["46"] = 22,["47"] = 16,["48"] = 16,["49"] = 16,["50"] = 10,["51"] = 10,["52"] = 10,["53"] = 10,["54"] = 10,["55"] = 11,["56"] = 12,["57"] = 13,["59"] = 4,["60"] = 25,["61"] = 26,["62"] = 26,["63"] = 26,["64"] = 26,["65"] = 26,["66"] = 26,["67"] = 25,["68"] = 34,["69"] = 39,["70"] = 40,["71"] = 41,["73"] = 42,["77"] = 44,["78"] = 44,["79"] = 44,["80"] = 44,["81"] = 44,["82"] = 44,["83"] = 44,["84"] = 44,["85"] = 53,["86"] = 54,["87"] = 34,["88"] = 58,["89"] = 58,["90"] = 58,["92"] = 59,["93"] = 60,["94"] = 62,["96"] = 73,["97"] = 73,["98"] = 73,["99"] = 73,["100"] = 74,["101"] = 76,["102"] = 78,["104"] = 79,["105"] = 79,["106"] = 80,["107"] = 79,["111"] = 87,["112"] = 87,["113"] = 88,["114"] = 87,["118"] = 95,["119"] = 95,["120"] = 96,["121"] = 95,["124"] = 103,["126"] = 76,["128"] = 62,["129"] = 108,["130"] = 109,["131"] = 108,["132"] = 111,["133"] = 112,["134"] = 112,["135"] = 112,["136"] = 113,["137"] = 113,["138"] = 114,["139"] = 113,["140"] = 113,["141"] = 113,["142"] = 112,["143"] = 112,["144"] = 111});
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
function CreepSpawn.prototype.sleep(self, time)
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            Timers:CreateTimer(
                function()
                    resolve(nil, true)
                end,
                time
            )
        end
    )
end
return ____exports
