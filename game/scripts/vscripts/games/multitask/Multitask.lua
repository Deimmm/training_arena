local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["20"] = 5,["21"] = 7,["22"] = 8,["23"] = 16,["24"] = 20,["25"] = 21,["26"] = 20,["27"] = 24,["28"] = 25,["29"] = 26,["30"] = 27,["31"] = 28,["32"] = 24,["33"] = 31,["34"] = 32,["35"] = 33,["36"] = 31,["37"] = 36,["38"] = 37,["39"] = 37,["40"] = 38,["41"] = 39,["42"] = 44,["43"] = 44,["44"] = 44,["45"] = 44,["46"] = 44,["47"] = 44,["48"] = 44,["49"] = 44,["50"] = 52,["51"] = 54,["52"] = 54,["53"] = 54,["54"] = 55,["55"] = 56,["57"] = 58,["58"] = 63,["59"] = 64,["60"] = 65,["61"] = 65,["62"] = 65,["63"] = 65,["64"] = 65,["65"] = 65,["66"] = 65,["67"] = 66,["68"] = 54,["69"] = 54,["70"] = 68,["71"] = 36,["72"] = 71,["73"] = 72,["74"] = 73,["75"] = 74,["76"] = 76,["77"] = 78,["78"] = 71,["79"] = 84,["80"] = 85,["81"] = 85,["82"] = 85,["83"] = 87,["84"] = 88,["85"] = 89,["86"] = 84,["87"] = 6});
local ____exports = {}
local ____Game = require("games.Game")
local GameBase = ____Game.GameBase
local ____Box = require("utils.Box")
local Geometry = ____Box.Geometry
local ____centaurs = require("games.multitask.minigames.centaurs")
local CentaurMinigame = ____centaurs.CentaurMinigame
____exports.Multitask = __TS__Class()
local Multitask = ____exports.Multitask
Multitask.name = "Multitask"
__TS__ClassExtends(Multitask, GameBase)
function Multitask.prototype.____constructor(self)
    GameBase.prototype.____constructor(self, ____exports.Multitask._game_name)
    self.boxes = {}
    self.heroPreviousState = {attack_capability = nil, return_ability_name = nil}
end
function Multitask.prototype.finish(self)
    self:resetHero()
end
function Multitask.prototype.launch(self, options)
    GameBase:moveHero(self.controller, "main_training_spawn")
    self:setupHero()
    self:setupGameArea({size = 400})
    __TS__New(CentaurMinigame, self.boxes[2], self.controller):start()
end
function Multitask.prototype.relaunch(self, options)
    self:finish()
    self:launch(options)
end
function Multitask.prototype.setupGameArea(self, options)
    local ____options_0 = options
    local size = ____options_0.size
    local step_size = size * 2
    local spawnPoint = Entities:FindByName(nil, "main_training_spawn"):GetAbsOrigin()
    local points = {
        {x = 0, y = 0},
        {x = step_size, y = 0},
        {x = 0, y = step_size},
        {x = -step_size, y = 0},
        {x = -step_size, y = 0},
        {x = 0, y = -step_size}
    }
    local previousPoint
    local boxes = __TS__ArrayMap(
        points,
        function(____, elem)
            if not previousPoint then
                previousPoint = spawnPoint
            end
            local center = Vector(previousPoint.x + elem.x, previousPoint.y + elem.y, 0)
            previousPoint = center
            local box = __TS__New(Geometry)
            box:createBox(
                center,
                size,
                0,
                true,
                {}
            )
            return box
        end
    )
    self.boxes = boxes
end
function Multitask.prototype.setupHero(self)
    print("SETTING UP HERO")
    local hero = self.controller:GetAssignedHero()
    hero:SetAttackCapability(0)
    local heroAttackCapability = hero:GetAttackCapability()
    self.heroPreviousState = {attack_capability = heroAttackCapability, return_ability_name = nil}
end
function Multitask.prototype.resetHero(self)
    local ____self_heroPreviousState_1 = self.heroPreviousState
    local attack_capability = ____self_heroPreviousState_1.attack_capability
    local return_ability_name = ____self_heroPreviousState_1.return_ability_name
    local hero = self.controller:GetAssignedHero()
    hero:SetMoveCapability(1)
    hero:SetAttackCapability(attack_capability)
end
Multitask._game_name = "multitask"
return ____exports
