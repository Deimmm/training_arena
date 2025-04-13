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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 3,["17"] = 4,["18"] = 3,["19"] = 4,["21"] = 4,["22"] = 5,["23"] = 3,["24"] = 9,["25"] = 10,["26"] = 11,["27"] = 13,["28"] = 14,["29"] = 15,["31"] = 17,["32"] = 18,["33"] = 19,["34"] = 20,["35"] = 21,["36"] = 23,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 28,["43"] = 9,["44"] = 31,["45"] = 32,["46"] = 33,["49"] = 37,["50"] = 37,["51"] = 37,["52"] = 37,["53"] = 37,["54"] = 37,["55"] = 37,["56"] = 40,["57"] = 40,["58"] = 40,["59"] = 40,["60"] = 46,["62"] = 47,["63"] = 48,["65"] = 49,["66"] = 49,["67"] = 49,["68"] = 49,["71"] = 53,["73"] = 54,["77"] = 57,["78"] = 57,["79"] = 57,["80"] = 57,["81"] = 61,["84"] = 64,["85"] = 65,["86"] = 65,["87"] = 65,["88"] = 65,["89"] = 65,["91"] = 31,["92"] = 73,["93"] = 74,["94"] = 75,["97"] = 78,["98"] = 80,["99"] = 80,["100"] = 80,["101"] = 80,["102"] = 83,["103"] = 83,["104"] = 83,["105"] = 83,["106"] = 86,["107"] = 87,["108"] = 87,["109"] = 87,["110"] = 87,["111"] = 91,["112"] = 92,["113"] = 93,["115"] = 95,["116"] = 97,["117"] = 96,["119"] = 97,["120"] = 98,["121"] = 99,["122"] = 100,["123"] = 101,["127"] = 106,["129"] = 107,["130"] = 108,["131"] = 108,["132"] = 108,["133"] = 109,["134"] = 110,["135"] = 111,["136"] = 108,["137"] = 108,["138"] = 113,["139"] = 115,["140"] = 116,["148"] = 123,["149"] = 124,["150"] = 125,["151"] = 125,["152"] = 125,["153"] = 128,["154"] = 128,["155"] = 128,["156"] = 125,["157"] = 125,["161"] = 136,["162"] = 136,["163"] = 136,["164"] = 136,["165"] = 136,["166"] = 73,["167"] = 142,["168"] = 143,["169"] = 144,["172"] = 147,["173"] = 149,["174"] = 150,["175"] = 151,["176"] = 152,["177"] = 153,["178"] = 155,["179"] = 157,["180"] = 160,["181"] = 164,["183"] = 167,["184"] = 142,["185"] = 170,["186"] = 171,["187"] = 171,["188"] = 171,["189"] = 172,["190"] = 173,["191"] = 174,["192"] = 170,["193"] = 176,["194"] = 177,["195"] = 178,["196"] = 179,["197"] = 176,["198"] = 182,["199"] = 183,["200"] = 183,["201"] = 183,["202"] = 183,["203"] = 183,["204"] = 183,["205"] = 183,["206"] = 183,["207"] = 183,["208"] = 183,["209"] = 183,["210"] = 194,["211"] = 194,["212"] = 194,["213"] = 194,["214"] = 194,["215"] = 194,["216"] = 194,["217"] = 194,["218"] = 194,["219"] = 194,["220"] = 194,["221"] = 206,["222"] = 206,["223"] = 209,["224"] = 210,["225"] = 210,["226"] = 206,["227"] = 206,["228"] = 182,["229"] = 214,["230"] = 215,["231"] = 216,["232"] = 216,["233"] = 216,["234"] = 217,["235"] = 218,["236"] = 219,["237"] = 216,["238"] = 216,["239"] = 216,["240"] = 214,["241"] = 223,["242"] = 224,["243"] = 225,["244"] = 226,["245"] = 227,["246"] = 228,["248"] = 230,["249"] = 231,["251"] = 233,["252"] = 234,["254"] = 236,["255"] = 223,["256"] = 238,["257"] = 239,["258"] = 239,["259"] = 240,["260"] = 241,["261"] = 238,["262"] = 4,["263"] = 4,["264"] = 4,["265"] = 3,["268"] = 4});
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
        function(____, creep) return creep:GetHealth() + 3 <= ai:GetAverageTrueAttackDamage(creep) end
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
    local ____initVector_0 = initVector
    local x = ____initVector_0.x
    local y = ____initVector_0.y
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
            local ____opt_1 = enemy:GetAttackTarget()
            return (____opt_1 and ____opt_1:GetEntityIndex()) == creep:GetEntityIndex()
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
    local ____opt_3 = self.self
    local position = ____opt_3 and ____opt_3:GetAbsOrigin()
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
