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
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["14"] = 1,["15"] = 1,["16"] = 1,["18"] = 2,["19"] = 3,["20"] = 1,["21"] = 5,["22"] = 11,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 13,["27"] = 14,["28"] = 15,["29"] = 16,["30"] = 17,["31"] = 18,["32"] = 20,["33"] = 21,["34"] = 21,["35"] = 21,["36"] = 21,["37"] = 21,["38"] = 21,["39"] = 27,["40"] = 28,["41"] = 29,["42"] = 5,["43"] = 35,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 37,["48"] = 38,["49"] = 36,["50"] = 36,["51"] = 35,["52"] = 41,["53"] = 42,["54"] = 43,["55"] = 48,["56"] = 49,["57"] = 50,["58"] = 41,["59"] = 53,["60"] = 54,["62"] = 55,["66"] = 57,["67"] = 58,["68"] = 59,["69"] = 60,["70"] = 61,["71"] = 63,["72"] = 64,["73"] = 65,["74"] = 66,["75"] = 67,["76"] = 69,["77"] = 70,["78"] = 71,["80"] = 79,["81"] = 80,["83"] = 88,["84"] = 89,["86"] = 97,["87"] = 98,["89"] = 105,["90"] = 107,["91"] = 108,["92"] = 110,["93"] = 110,["94"] = 110,["95"] = 113,["96"] = 113,["97"] = 113,["98"] = 110,["99"] = 110,["100"] = 53});
local ____exports = {}
____exports.Box = __TS__Class()
local Box = ____exports.Box
Box.name = "Box"
function Box.prototype.____constructor(self)
    self.boxParticles = {}
    self.boxPoints = {}
end
function Box.prototype.createBox(self, center, size, offsetY, isParticle)
    local z = 128
    local ____center_0 = center
    local x = ____center_0.x
    local y = ____center_0.y
    local width = size * 1.3
    local height = size * 0.9
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
function Box.prototype.destroyBox(self)
    __TS__ArrayForEach(
        self.boxParticles,
        function(____, particle)
            ParticleManager:DestroyParticle(particle, true)
            ParticleManager:ReleaseParticleIndex(particle)
        end
    )
end
function Box.prototype.createParticleLine(self, start, ____end)
    local particleName = "particles/custom/range_display_line_red.vpcf"
    local pid = ParticleManager:CreateParticle(particleName, PATTACH_WORLDORIGIN, nil)
    ParticleManager:SetParticleControl(pid, 0, start)
    ParticleManager:SetParticleControl(pid, 1, ____end)
    return pid
end
function Box.twoBoxRandomPoint(self, outer, inner)
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
