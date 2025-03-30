local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 3,["16"] = 4,["17"] = 3,["18"] = 4,["20"] = 4,["21"] = 5,["22"] = 3,["23"] = 8,["24"] = 9,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 11,["29"] = 11,["30"] = 15,["32"] = 17,["33"] = 17,["34"] = 17,["35"] = 17,["36"] = 8,["37"] = 19,["38"] = 20,["39"] = 21,["42"] = 25,["43"] = 25,["44"] = 25,["45"] = 25,["46"] = 25,["47"] = 25,["48"] = 25,["49"] = 28,["50"] = 28,["51"] = 28,["52"] = 28,["53"] = 34,["55"] = 35,["56"] = 36,["58"] = 37,["59"] = 37,["60"] = 37,["61"] = 37,["64"] = 41,["66"] = 42,["70"] = 45,["73"] = 48,["74"] = 49,["75"] = 49,["76"] = 49,["77"] = 49,["78"] = 50,["79"] = 50,["80"] = 50,["81"] = 50,["82"] = 50,["84"] = 19,["85"] = 58,["86"] = 59,["87"] = 60,["90"] = 63,["91"] = 65,["92"] = 65,["93"] = 65,["94"] = 65,["95"] = 65,["96"] = 65,["97"] = 65,["98"] = 68,["99"] = 68,["100"] = 68,["101"] = 68,["102"] = 68,["103"] = 68,["104"] = 68,["105"] = 74,["106"] = 76,["107"] = 78,["108"] = 82,["109"] = 83,["110"] = 83,["111"] = 83,["112"] = 83,["113"] = 83,["115"] = 58,["116"] = 91,["117"] = 92,["118"] = 92,["119"] = 92,["120"] = 92,["121"] = 92,["122"] = 92,["123"] = 92,["124"] = 92,["125"] = 92,["126"] = 92,["127"] = 92,["128"] = 92,["129"] = 103,["130"] = 104,["131"] = 104,["132"] = 92,["133"] = 92,["134"] = 91,["135"] = 108,["136"] = 109,["137"] = 110,["138"] = 110,["139"] = 110,["140"] = 111,["141"] = 112,["142"] = 113,["143"] = 110,["144"] = 110,["145"] = 110,["146"] = 108,["147"] = 117,["148"] = 118,["149"] = 119,["150"] = 120,["151"] = 121,["152"] = 122,["153"] = 123,["155"] = 125,["156"] = 126,["158"] = 128,["159"] = 129,["161"] = 131,["162"] = 117,["163"] = 133,["164"] = 134,["165"] = 134,["166"] = 135,["167"] = 136,["168"] = 133,["169"] = 4,["170"] = 4,["171"] = 4,["172"] = 3,["175"] = 4});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseModifier = ____dota_ts_adapter.BaseModifier
local registerModifier = ____dota_ts_adapter.registerModifier
____exports.sniper_ai = __TS__Class()
local sniper_ai = ____exports.sniper_ai
sniper_ai.name = "sniper_ai"
__TS__ClassExtends(sniper_ai, BaseModifier)
function sniper_ai.prototype.____constructor(self, ...)
    BaseModifier.prototype.____constructor(self, ...)
    self.optimal_attack_range = 500
end
function sniper_ai.prototype.OnCreated(self, params)
    if IsServer() then
        self.self = self:GetParent()
        ExecuteOrderFromTable({
            UnitIndex = self.self:GetEntityIndex(),
            OrderType = DOTA_UNIT_ORDER_HOLD_POSITION
        })
        self:StartIntervalThink(0.1)
    end
    local ____print_4 = print
    local ____opt_2 = self
    local ____opt_0 = ____opt_2 and ____exports.sniper_ai.self
    ____print_4(____opt_0 and ____opt_0:GetSecondsPerAttack(false))
end
function sniper_ai.prototype.OnIntervalThink(self)
    local ai = self.self
    if not ai then
        return
    end
    local creeps = __TS__ArraySort(
        __TS__ArrayFilter(
            Entities:FindAllByClassname("npc_dota_creep_lane"),
            function(____, creep) return creep:IsAlive() end
        ),
        function(____, a, b) return a:GetHealth() - b:GetHealth() end
    )
    local lasthitableCreeps = __TS__ArrayFilter(
        creeps,
        function(____, creep) return creep:GetHealth() <= ai:GetAverageTrueAttackDamage(creep) end
    )
    local mvp = nil
    repeat
        local ____switch9 = true
        local ____cond9 = ____switch9 == (#lasthitableCreeps > 1)
        if ____cond9 then
            mvp = __TS__ArraySort(
                lasthitableCreeps,
                function(____, a, b) return self:getCreepCost(b) - self:getCreepCost(a) end
            )[1]
            break
        end
        ____cond9 = ____cond9 or ____switch9 == (#lasthitableCreeps == 1)
        if ____cond9 then
            mvp = lasthitableCreeps[1]
            break
        end
        do
            self:prepareAttack()
        end
    until true
    if mvp then
        print(
            "MVP: ",
            mvp:GetName()
        )
        ExecuteOrderFromTable({
            UnitIndex = ai:GetEntityIndex(),
            OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
            TargetIndex = mvp:GetEntityIndex()
        })
    end
end
function sniper_ai.prototype.prepareAttack(self)
    local ai = self.self
    if not ai then
        return
    end
    local healthStep = ai:GetAverageTrueAttackDamage(nil)
    local creeps = __TS__ArraySort(
        __TS__ArrayFilter(
            Entities:FindAllByClassname("npc_dota_creep_lane"),
            function(____, creep) return creep:IsAlive() end
        ),
        function(____, a, b) return a:GetHealth() - b:GetHealth() end
    )
    local creepsByHP = __TS__ArraySort(
        __TS__ArrayFilter(
            creeps,
            function(____, creep) return creeps[1]:GetHealth() + healthStep <= creep:GetHealth() end
        ),
        function(____, a, b) return self:getCreepCost(b) - self:getCreepCost(a) end
    )
    local mvp = creepsByHP[1]
    local distance_between = self:calculateDistance(mvp)
    if distance_between and (distance_between > self.optimal_attack_range + 50 or distance_between < self.optimal_attack_range - 50) then
        local moveVector = Vector()
        ExecuteOrderFromTable({
            UnitIndex = ai:GetEntityIndex(),
            OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
            Position = moveVector
        })
    end
end
function sniper_ai.prototype.getAttackingCreeps(self, creep)
    return __TS__ArrayFilter(
        FindUnitsInRadius(
            creep:GetTeam(),
            creep:GetAbsOrigin(),
            nil,
            500,
            2,
            2,
            0,
            0,
            false
        ),
        function(____, enemy)
            local ____opt_5 = enemy:GetAttackTarget()
            return (____opt_5 and ____opt_5:GetEntityIndex()) == creep:GetEntityIndex()
        end
    )
end
function sniper_ai.prototype.creepIncomingDPS(self, creep)
    local enemies = self:getAttackingCreeps(creep)
    return __TS__ArrayReduce(
        enemies,
        function(____, acc, enemy)
            local damage = enemy:GetAverageTrueAttackDamage(creep)
            acc = acc + damage
            return acc
        end,
        0
    )
end
function sniper_ai.prototype.getCreepCost(self, creep)
    local name = creep:GetName()
    local team = creep:GetTeam()
    print(name, team)
    local cost = 0
    if __TS__StringIncludes(name, "goodguys") then
        cost = cost + 1
    end
    if __TS__StringIncludes(name, "ranged") then
        cost = cost + 1
    end
    if __TS__StringIncludes(name, "flagbearer") then
        cost = cost + 2
    end
    return cost
end
function sniper_ai.prototype.calculateDistance(self, target)
    local ____opt_7 = self.self
    local position = ____opt_7 and ____opt_7:GetAbsOrigin()
    local target_position = target:GetAbsOrigin()
    return position and position:__sub(target_position):Length2D()
end
sniper_ai = __TS__Decorate(
    sniper_ai,
    sniper_ai,
    {registerModifier(nil)},
    {kind = "class", name = "sniper_ai"}
)
____exports.sniper_ai = sniper_ai
return ____exports
