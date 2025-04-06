local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayFlat = ____lualib.__TS__ArrayFlat
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 3,["17"] = 4,["18"] = 3,["19"] = 4,["21"] = 4,["22"] = 5,["23"] = 3,["24"] = 8,["25"] = 9,["26"] = 10,["27"] = 11,["28"] = 12,["29"] = 13,["30"] = 14,["31"] = 15,["32"] = 17,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 22,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 8,["44"] = 26,["45"] = 27,["46"] = 28,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 32,["53"] = 32,["54"] = 32,["55"] = 32,["56"] = 35,["57"] = 35,["58"] = 35,["59"] = 35,["60"] = 41,["62"] = 42,["63"] = 43,["65"] = 44,["66"] = 44,["67"] = 44,["68"] = 44,["71"] = 48,["73"] = 49,["77"] = 52,["78"] = 52,["79"] = 52,["80"] = 52,["81"] = 56,["84"] = 59,["85"] = 60,["86"] = 60,["87"] = 60,["88"] = 60,["89"] = 61,["90"] = 61,["91"] = 61,["92"] = 61,["93"] = 61,["95"] = 26,["96"] = 69,["97"] = 70,["98"] = 71,["101"] = 74,["102"] = 76,["103"] = 76,["104"] = 76,["105"] = 76,["106"] = 79,["107"] = 79,["108"] = 79,["109"] = 79,["110"] = 82,["111"] = 83,["112"] = 83,["113"] = 83,["114"] = 83,["115"] = 87,["116"] = 88,["117"] = 89,["119"] = 91,["120"] = 93,["121"] = 92,["123"] = 93,["124"] = 94,["125"] = 95,["126"] = 96,["127"] = 97,["131"] = 102,["133"] = 103,["134"] = 104,["135"] = 104,["136"] = 104,["137"] = 105,["138"] = 106,["139"] = 107,["140"] = 104,["141"] = 104,["142"] = 109,["143"] = 111,["144"] = 112,["152"] = 119,["153"] = 120,["154"] = 121,["155"] = 121,["156"] = 121,["157"] = 124,["158"] = 124,["159"] = 124,["160"] = 121,["161"] = 121,["165"] = 132,["166"] = 132,["167"] = 132,["168"] = 132,["169"] = 132,["170"] = 69,["171"] = 138,["172"] = 139,["173"] = 140,["174"] = 141,["177"] = 144,["178"] = 146,["179"] = 147,["180"] = 148,["181"] = 149,["182"] = 150,["183"] = 152,["184"] = 154,["185"] = 157,["186"] = 161,["188"] = 164,["189"] = 138,["190"] = 167,["191"] = 168,["192"] = 168,["193"] = 168,["194"] = 169,["195"] = 170,["196"] = 171,["197"] = 167,["198"] = 173,["199"] = 174,["200"] = 175,["201"] = 176,["202"] = 173,["203"] = 179,["204"] = 180,["205"] = 180,["206"] = 180,["207"] = 180,["208"] = 180,["209"] = 180,["210"] = 180,["211"] = 180,["212"] = 180,["213"] = 180,["214"] = 180,["215"] = 191,["216"] = 191,["217"] = 191,["218"] = 191,["219"] = 191,["220"] = 191,["221"] = 191,["222"] = 191,["223"] = 191,["224"] = 191,["225"] = 191,["226"] = 203,["227"] = 203,["228"] = 206,["229"] = 207,["230"] = 207,["231"] = 203,["232"] = 203,["233"] = 179,["234"] = 211,["235"] = 212,["236"] = 213,["237"] = 213,["238"] = 213,["239"] = 214,["240"] = 215,["241"] = 216,["242"] = 213,["243"] = 213,["244"] = 213,["245"] = 211,["246"] = 220,["247"] = 221,["248"] = 222,["249"] = 223,["250"] = 224,["251"] = 225,["253"] = 227,["254"] = 228,["256"] = 230,["257"] = 231,["259"] = 233,["260"] = 220,["261"] = 235,["262"] = 236,["263"] = 236,["264"] = 237,["265"] = 238,["266"] = 235,["267"] = 4,["268"] = 4,["269"] = 4,["270"] = 3,["273"] = 4});
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
        local ai = self:GetParent()
        ai:SetPhysicalArmorBaseValue(99999)
        ai:SetBaseHealthRegen(99999)
        ai:SetBaseDamageMax(params.damage - 27)
        ai:SetBaseDamageMin(params.damage - 27)
        ai:SetAttackCapability(params.base_attack_time + 0.3)
        self.self = ai
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
            ExecuteOrderFromTable({
                UnitIndex = ai:GetEntityIndex(),
                OrderType = DOTA_UNIT_ORDER_HOLD_POSITION
            })
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
    local attackInterval = ai:GetSecondsPerAttack(false)
    local creeps = __TS__ArrayFilter(
        Entities:FindAllByClassname("npc_dota_creep_lane"),
        function(____, creep) return creep:IsAlive() end
    )
    local nextMVPS = __TS__ArraySort(
        creeps,
        function(____, a, b) return self:calculateTimeToMVP(a) - self:calculateTimeToMVP(b) end
    )
    local treshold = self:calculateTimeToMVP(nextMVPS[1]) + attackInterval
    local mvps = __TS__ArrayFilter(
        nextMVPS,
        function(____, creep) return self:calculateTimeToMVP(creep) < treshold end
    )
    local movePostion = nil
    local BVector
    local AVector = ai:GetAbsOrigin()
    repeat
        local ____switch17 = true
        local creep, vector
        local ____cond17 = ____switch17 == (#mvps >= 1)
        if ____cond17 then
            creep = mvps[1]
            BVector = creep:GetAbsOrigin()
            vector = self:keepDistanceToCreepVector(creep)
            if vector then
                movePostion = vector
            end
            break
        end
        ____cond17 = ____cond17 or ____switch17 == (#mvps == 0)
        if ____cond17 then
            if #creeps > 0 then
                local closestCreep = __TS__ArraySort(
                    creeps,
                    function(____, a, b)
                        local aLength = AVector - a:GetAbsOrigin()
                        local bLength = AVector - b:GetAbsOrigin()
                        return aLength:Length2D() - bLength:Length2D()
                    end
                )
                local vector = self:keepDistanceToCreepVector(closestCreep[1])
                if vector then
                    movePostion = vector
                end
            end
        end
        do
            break
        end
    until true
    if not movePostion then
        if BVector then
            ExecuteOrderFromTable({
                UnitIndex = ai:GetEntityIndex(),
                OrderType = DOTA_UNIT_ORDER_MOVE_RELATIVE,
                Position = self:setVectorLenght(
                    BVector - ai:GetAbsOrigin(),
                    1
                )
            })
        end
        return
    end
    ExecuteOrderFromTable({
        UnitIndex = ai:GetEntityIndex(),
        OrderType = DOTA_UNIT_ORDER_MOVE_RELATIVE,
        Position = movePostion
    })
end
function sniper_ai.prototype.keepDistanceToCreepVector(self, creep)
    local sniper_spawn = Entities:FindByName(nil, "sniper_spawn")
    local ai = self.self
    if not sniper_spawn or not ai then
        return
    end
    local movePosition
    local optimalMax = self.optimal_attack_range + 50
    local optimalMin = self.optimal_attack_range - 50
    local AVector = sniper_spawn:GetAbsOrigin()
    local BVector = creep:GetAbsOrigin()
    local AIVector = BVector - ai:GetAbsOrigin()
    local distance_between = self:calculateDistance(creep)
    if distance_between and distance_between > optimalMax or distance_between < optimalMin then
        movePosition = self:setVectorLenght(BVector - AVector, self.optimal_attack_range)
        movePosition = AIVector - movePosition
    end
    return movePosition
end
function sniper_ai.prototype.setVectorLenght(self, initVector, length)
    local ____initVector_5 = initVector
    local x = ____initVector_5.x
    local y = ____initVector_5.y
    local initLength = initVector:Length2D()
    local normilizedVector = Vector(x / initLength, y / initLength)
    return Vector(normilizedVector.x * length, normilizedVector.y * length)
end
function sniper_ai.prototype.calculateTimeToMVP(self, creep)
    local incDPS = self:creepIncomingDPS(creep)
    local health = creep:GetHealth()
    return health / incDPS
end
function sniper_ai.prototype.getAttackingUnits(self, creep)
    local creeps = FindUnitsInRadius(
        creep:GetTeam(),
        creep:GetAbsOrigin(),
        nil,
        3000,
        DOTA_UNIT_TARGET_TEAM_ENEMY,
        DOTA_UNIT_TARGET_HEROES_AND_CREEPS,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )
    local towers = FindUnitsInRadius(
        creep:GetTeam(),
        creep:GetAbsOrigin(),
        nil,
        3000,
        DOTA_UNIT_TARGET_TEAM_BOTH,
        DOTA_UNIT_TARGET_BUILDING,
        DOTA_UNIT_TARGET_FLAG_NONE,
        FIND_ANY_ORDER,
        false
    )
    return __TS__ArrayFilter(
        __TS__ArrayFlat({creeps, towers}),
        function(____, enemy)
            local ____opt_6 = enemy:GetAttackTarget()
            return (____opt_6 and ____opt_6:GetEntityIndex()) == creep:GetEntityIndex()
        end
    )
end
function sniper_ai.prototype.creepIncomingDPS(self, creep)
    local enemies = self:getAttackingUnits(creep)
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
    local ____opt_8 = self.self
    local position = ____opt_8 and ____opt_8:GetAbsOrigin()
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
