--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static and instance variables
local AbstractHandler = {}

-- Begin boilerplate class code
AbstractHandler.__index = AbstractHandler
-- End boilerplate class code

function AbstractHandler.new()
    -- Begin boilerplate class code
    local self = setmetatable({}, AbstractHandler)
    -- End boilerplate class code

    return self
end

function AbstractHandler:getEvent()
    return self.event
end

function AbstractHandler:getHandler()
    return self.handler
end

FreeMyInventory.AbstractHandler = AbstractHandler
