--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static and instance variables
local AbstractHandler = {
    event = nil,
    onEvent = nil,
    inheritanceTest = "abstract success!"
}

-- Begin boilerplate class code
AbstractHandler.__index = AbstractHandler
-- End boilerplate class code

function AbstractHandler.new(event, onEvent)
    -- Begin boilerplate class code
    local self = setmetatable({}, AbstractHandler)
    -- End boilerplate class code
    self.event = event
    self.onEvent = onEvent
    return self
end

FreeMyInventory.AbstractHandler = AbstractHandler
