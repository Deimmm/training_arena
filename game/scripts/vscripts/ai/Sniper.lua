local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__StringIncludes = ____lualib.__TS__StringIncludes
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 3,["16"] = 4,["17"] = 3,["18"] = 4,["20"] = 4,["21"] = 5,["22"] = 3,["23"] = 8,["24"] = 9,["25"] = 10,["26"] = 11,["27"] = 12,["28"] = 13,["29"] = 14,["30"] = 15,["31"] = 17,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 22,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 8,["43"] = 26,["44"] = 27,["45"] = 28,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 32,["53"] = 32,["54"] = 32,["55"] = 35,["56"] = 35,["57"] = 35,["58"] = 35,["59"] = 41,["61"] = 42,["62"] = 43,["64"] = 44,["65"] = 44,["66"] = 44,["67"] = 44,["70"] = 48,["72"] = 49,["76"] = 52,["77"] = 52,["78"] = 52,["79"] = 52,["80"] = 56,["83"] = 59,["84"] = 60,["85"] = 60,["86"] = 60,["87"] = 60,["88"] = 61,["89"] = 61,["90"] = 61,["91"] = 61,["92"] = 61,["94"] = 26,["95"] = 69,["96"] = 70,["97"] = 71,["100"] = 74,["101"] = 76,["102"] = 76,["103"] = 76,["104"] = 76,["105"] = 79,["106"] = 79,["107"] = 79,["108"] = 79,["109"] = 83,["110"] = 86,["111"] = 86,["112"] = 86,["113"] = 86,["114"] = 90,["115"] = 91,["116"] = 92,["117"] = 93,["118"] = 94,["119"] = 95,["121"] = 97,["122"] = 101,["123"] = 98,["125"] = 99,["126"] = 100,["127"] = 101,["128"] = 102,["129"] = 103,["130"] = 104,["132"] = 109,["133"] = 110,["141"] = 125,["142"] = 126,["143"] = 127,["144"] = 127,["145"] = 127,["146"] = 130,["147"] = 130,["148"] = 130,["149"] = 127,["150"] = 127,["154"] = 139,["155"] = 139,["156"] = 139,["157"] = 139,["158"] = 139,["159"] = 69,["160"] = 145,["161"] = 146,["162"] = 146,["163"] = 146,["164"] = 147,["165"] = 148,["166"] = 149,["167"] = 145,["168"] = 151,["169"] = 152,["170"] = 153,["171"] = 154,["172"] = 151,["173"] = 157,["174"] = 158,["175"] = 158,["176"] = 158,["177"] = 158,["178"] = 158,["179"] = 158,["180"] = 158,["181"] = 158,["182"] = 158,["183"] = 158,["184"] = 158,["185"] = 158,["186"] = 169,["187"] = 170,["188"] = 170,["189"] = 158,["190"] = 158,["191"] = 157,["192"] = 174,["193"] = 175,["194"] = 176,["195"] = 176,["196"] = 176,["197"] = 177,["198"] = 178,["199"] = 179,["200"] = 176,["201"] = 176,["202"] = 176,["203"] = 174,["204"] = 183,["205"] = 184,["206"] = 185,["207"] = 186,["208"] = 187,["209"] = 188,["210"] = 189,["212"] = 191,["213"] = 192,["215"] = 194,["216"] = 195,["218"] = 197,["219"] = 183,["220"] = 199,["221"] = 200,["222"] = 200,["223"] = 201,["224"] = 202,["225"] = 199,["226"] = 4,["227"] = 4,["228"] = 4,["229"] = 3,["232"] = 4});
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
    local AVector
    local BVector = nil
    local optimalMax = self.optimal_attack_range + 50
    local optimalMin = self.optimal_attack_range - 50
    print("MVPS: ", #mvps)
    repeat
        local ____switch17 = true
        local distance_between
        local ____cond17 = ____switch17 == (#mvps >= 1)
        if ____cond17 then
            AVector = ai:GetAbsOrigin()
            BVector = mvps[1]:GetAbsOrigin()
            distance_between = self:calculateDistance(mvps[1])
            if distance_between and distance_between > optimalMax then
                local length = distance_between - optimalMax
                movePostion = self:setVectorLenght(BVector - AVector, length)
            end
            if distance_between and distance_between < optimalMin then
                movePostion = self:setVectorLenght(AVector - BVector, self.optimal_attack_range)
            end
            break
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
                    0.5
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
            local ____opt_6 = enemy:GetAttackTarget()
            return (____opt_6 and ____opt_6:GetEntityIndex()) == creep:GetEntityIndex()
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
