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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 3,["17"] = 4,["18"] = 3,["19"] = 4,["21"] = 4,["22"] = 5,["23"] = 3,["24"] = 9,["25"] = 10,["26"] = 11,["27"] = 13,["28"] = 14,["29"] = 15,["31"] = 17,["32"] = 18,["33"] = 19,["34"] = 20,["35"] = 21,["36"] = 23,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 28,["43"] = 30,["44"] = 30,["45"] = 30,["46"] = 30,["47"] = 9,["48"] = 32,["49"] = 33,["50"] = 34,["53"] = 38,["54"] = 38,["55"] = 38,["56"] = 38,["57"] = 38,["58"] = 38,["59"] = 38,["60"] = 41,["61"] = 41,["62"] = 41,["63"] = 41,["64"] = 47,["66"] = 48,["67"] = 49,["69"] = 50,["70"] = 50,["71"] = 50,["72"] = 50,["75"] = 54,["77"] = 55,["81"] = 58,["82"] = 58,["83"] = 58,["84"] = 58,["85"] = 62,["88"] = 65,["89"] = 66,["90"] = 66,["91"] = 66,["92"] = 66,["93"] = 67,["94"] = 67,["95"] = 67,["96"] = 67,["97"] = 67,["99"] = 32,["100"] = 75,["101"] = 76,["102"] = 77,["105"] = 80,["106"] = 82,["107"] = 82,["108"] = 82,["109"] = 82,["110"] = 85,["111"] = 85,["112"] = 85,["113"] = 85,["114"] = 88,["115"] = 89,["116"] = 89,["117"] = 89,["118"] = 89,["119"] = 93,["120"] = 94,["121"] = 95,["123"] = 97,["124"] = 99,["125"] = 98,["127"] = 99,["128"] = 100,["129"] = 101,["130"] = 102,["131"] = 103,["135"] = 108,["137"] = 109,["138"] = 110,["139"] = 110,["140"] = 110,["141"] = 111,["142"] = 112,["143"] = 113,["144"] = 110,["145"] = 110,["146"] = 115,["147"] = 117,["148"] = 118,["156"] = 125,["157"] = 126,["158"] = 127,["159"] = 127,["160"] = 127,["161"] = 130,["162"] = 130,["163"] = 130,["164"] = 127,["165"] = 127,["169"] = 138,["170"] = 138,["171"] = 138,["172"] = 138,["173"] = 138,["174"] = 75,["175"] = 144,["176"] = 145,["177"] = 146,["180"] = 149,["181"] = 151,["182"] = 152,["183"] = 153,["184"] = 154,["185"] = 155,["186"] = 157,["187"] = 159,["188"] = 162,["189"] = 166,["191"] = 169,["192"] = 144,["193"] = 172,["194"] = 173,["195"] = 173,["196"] = 173,["197"] = 174,["198"] = 175,["199"] = 176,["200"] = 172,["201"] = 178,["202"] = 179,["203"] = 180,["204"] = 181,["205"] = 178,["206"] = 184,["207"] = 185,["208"] = 185,["209"] = 185,["210"] = 185,["211"] = 185,["212"] = 185,["213"] = 185,["214"] = 185,["215"] = 185,["216"] = 185,["217"] = 185,["218"] = 196,["219"] = 196,["220"] = 196,["221"] = 196,["222"] = 196,["223"] = 196,["224"] = 196,["225"] = 196,["226"] = 196,["227"] = 196,["228"] = 196,["229"] = 208,["230"] = 208,["231"] = 211,["232"] = 212,["233"] = 212,["234"] = 208,["235"] = 208,["236"] = 184,["237"] = 216,["238"] = 217,["239"] = 218,["240"] = 218,["241"] = 218,["242"] = 219,["243"] = 220,["244"] = 221,["245"] = 218,["246"] = 218,["247"] = 218,["248"] = 216,["249"] = 225,["250"] = 226,["251"] = 227,["252"] = 228,["253"] = 229,["254"] = 230,["256"] = 232,["257"] = 233,["259"] = 235,["260"] = 236,["262"] = 238,["263"] = 225,["264"] = 240,["265"] = 241,["266"] = 241,["267"] = 242,["268"] = 243,["269"] = 240,["270"] = 4,["271"] = 4,["272"] = 4,["273"] = 3,["276"] = 4});
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
        if params.spawn_name then
            local sniper_spawn = Entities:FindByName(nil, params.spawn_name)
            self.spawn_vector = sniper_spawn:GetAbsOrigin()
        end
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
        local ____switch10 = true
        local ____cond10 = ____switch10 == (#lasthitableCreeps > 1)
        if ____cond10 then
            mvp = __TS__ArraySort(
                lasthitableCreeps,
                function(____, a, b) return self:getCreepCost(b) - self:getCreepCost(a) end
            )[1]
            break
        end
        ____cond10 = ____cond10 or ____switch10 == (#lasthitableCreeps == 1)
        if ____cond10 then
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
        local ____switch18 = true
        local creep, vector
        local ____cond18 = ____switch18 == (#mvps >= 1)
        if ____cond18 then
            creep = mvps[1]
            BVector = creep:GetAbsOrigin()
            vector = self:keepDistanceToCreepVector(creep)
            if vector then
                movePostion = vector
            end
            break
        end
        ____cond18 = ____cond18 or ____switch18 == (#mvps == 0)
        if ____cond18 then
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
    local ai = self.self
    if not ai then
        return
    end
    local movePosition
    local optimalMax = self.optimal_attack_range + 50
    local optimalMin = self.optimal_attack_range - 50
    local AVector = self.spawn_vector
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
