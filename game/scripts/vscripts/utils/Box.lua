local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 1,["18"] = 2,["19"] = 3,["20"] = 1,["21"] = 5,["22"] = 6,["23"] = 11,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 23,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 33,["35"] = 5,["36"] = 36,["37"] = 43,["38"] = 43,["39"] = 43,["40"] = 44,["41"] = 45,["42"] = 45,["43"] = 45,["44"] = 46,["45"] = 47,["46"] = 48,["47"] = 49,["48"] = 50,["49"] = 51,["50"] = 53,["51"] = 55,["52"] = 55,["53"] = 55,["54"] = 55,["55"] = 55,["56"] = 55,["57"] = 62,["58"] = 63,["59"] = 64,["60"] = 36,["61"] = 70,["62"] = 71,["63"] = 71,["64"] = 71,["65"] = 72,["66"] = 73,["67"] = 71,["68"] = 71,["69"] = 70,["70"] = 76,["71"] = 77,["72"] = 78,["73"] = 83,["74"] = 84,["75"] = 85,["76"] = 76,["77"] = 88,["78"] = 89,["80"] = 90,["84"] = 92,["85"] = 93,["86"] = 94,["87"] = 95,["88"] = 96,["89"] = 98,["90"] = 99,["91"] = 100,["92"] = 101,["93"] = 102,["94"] = 104,["95"] = 105,["96"] = 106,["98"] = 114,["99"] = 115,["101"] = 123,["102"] = 124,["104"] = 132,["105"] = 133,["107"] = 140,["108"] = 142,["109"] = 143,["110"] = 145,["111"] = 145,["112"] = 145,["113"] = 148,["114"] = 148,["115"] = 148,["116"] = 145,["117"] = 145,["118"] = 88});
local ____exports = {}
____exports.Geometry = __TS__Class()
local Geometry = ____exports.Geometry
Geometry.name = "Geometry"
function Geometry.prototype.____constructor(self)
    self.boxParticles = {}
    self.boxPoints = {}
end
function Geometry.distanceToSegment(self, p, a, b)
    local ab = {x = b.x - a.x, y = b.y - a.y, z = b.z - a.z}
    local ap = {x = p.x - a.x, y = p.y - a.y, z = p.z - a.z}
    local abLengthSq = ab.x ^ 2 + ab.y ^ 2 + ab.z ^ 2
    local apDotAb = ap.x * ab.x + ap.y * ab.y + ap.z * ab.z
    local t = math.max(
        0,
        math.min(1, abLengthSq == 0 and 0 or apDotAb / abLengthSq)
    )
    local closest = {x = a.x + ab.x * t, y = a.y + ab.y * t, z = a.z + ab.z * t}
    local dx = p.x - closest.x
    local dy = p.y - closest.y
    local dz = p.z - closest.z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end
function Geometry.prototype.createBox(self, center, size, offsetY, isParticle, opts)
    local ____opts_0 = opts
    local widthCoef = ____opts_0.widthCoef
    local heightCoef = ____opts_0.heightCoef
    local z = 128
    local ____center_1 = center
    local x = ____center_1.x
    local y = ____center_1.y
    local width = size * (widthCoef or 1)
    local height = size * (heightCoef or 1)
    local p1 = Vector(x - width, y - height + offsetY, z)
    local p2 = Vector(x + width, y - height + offsetY, z)
    local p3 = Vector(x + width, y + height + offsetY, z)
    local p4 = Vector(x - width, y + height + offsetY, z)
    local boxPoints = {p1, p2, p3, p4}
    local boxParticles = isParticle and ({
        self:createParticleLine(p1, p2),
        self:createParticleLine(p2, p3),
        self:createParticleLine(p3, p4),
        self:createParticleLine(p4, p1)
    })
    self.boxParticles = boxParticles or ({})
    self.boxPoints = boxPoints
    return {points = boxPoints, particles = boxParticles}
end
function Geometry.prototype.destroyBox(self)
    __TS__ArrayForEach(
        self.boxParticles,
        function(____, particle)
            ParticleManager:DestroyParticle(particle, true)
            ParticleManager:ReleaseParticleIndex(particle)
        end
    )
end
function Geometry.prototype.createParticleLine(self, start, ____end)
    local particleName = "particles/custom/range_display_line_red.vpcf"
    local pid = ParticleManager:CreateParticle(particleName, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(pid, 0, start)
    ParticleManager:SetParticleControl(pid, 1, ____end)
    return pid
end
function Geometry.twoBoxRandomPoint(self, outer, inner)
    if #outer ~= 4 or #inner ~= 4 then
        error(
            __TS__New(Error, "Wrong incoming params. Outer or Inner not box"),
            0
        )
    end
    local op1, op2, op3, op4 = unpack(outer)
    local minX = math.min(op1.x, op2.x, op3.x, op4.x)
    local maxX = math.max(op1.x, op2.x, op3.x, op4.x)
    local minY = math.min(op1.y, op2.y, op3.y, op4.y)
    local maxY = math.max(op1.y, op2.y, op3.y, op4.y)
    local ip1, ip2, ip3, ip4 = unpack(inner)
    local hMinX = math.min(ip1.x, ip2.x, ip3.x, ip4.x)
    local hMaxX = math.max(ip1.x, ip2.x, ip3.x, ip4.x)
    local hMinY = math.min(ip1.y, ip2.y, ip3.y, ip4.y)
    local hMaxY = math.max(ip1.y, ip2.y, ip3.y, ip4.y)
    local zones = {}
    if hMaxY < maxY then
        zones[#zones + 1] = {minX = minX, maxX = maxX, minY = hMaxY, maxY = maxY}
    end
    if hMinY > minY then
        zones[#zones + 1] = {minX = minX, maxX = maxX, minY = minY, maxY = hMinY}
    end
    if hMinX > minX then
        zones[#zones + 1] = {minX = minX, maxX = hMinX, minY = hMinY, maxY = hMaxY}
    end
    if hMaxX < maxX then
        zones[#zones + 1] = {minX = hMaxX, maxX = maxX, minY = hMinY, maxY = hMaxY}
    end
    local chosenZone = zones[RandomInt(0, #zones - 1) + 1]
    local randX = RandomFloat(chosenZone.minX, chosenZone.maxX)
    local randY = RandomFloat(chosenZone.minY, chosenZone.maxY)
    return Vector(
        randX,
        randY,
        GetGroundHeight(
            Vector(randX, randY, 0),
            nil
        )
    )
end
return ____exports
