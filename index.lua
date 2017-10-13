local __exports = LibStub:NewLibrary("tslib", 10000)
if not __exports then return end
local _G = _G
local setmetatable = setmetatable
__exports.newClass = function(base, prototype)
    local c = prototype
    if base then
        if  not base.constructor then
            base.constructor = function()
            end
        end
    else
        if  not c.constructor then
            c.constructor = function()
            end
        end
    end
    c.__index = c
    setmetatable(c, {
        __call = function(cls, args)
            local self = setmetatable({}, cls)
            self:constructor(args)
            return self
        end,
        __index = base
    })
    return c
end
