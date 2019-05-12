--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static and instance variables
local AbstractClass = {
    event = nil,
    onEvent = nil
}

-- Begin boilerplate class code
AbstractClass.__index = AbstractClass
-- End boilerplate class code

function AbstractClass.new(event, onEvent)
    -- Begin boilerplate class code
    local self = setmetatable({}, AbstractClass)
    -- End boilerplate class code
    self.event = event
    self.onEvent = onEvent
    return self
end

function AbstractClass:getInheritanceTest()
    return self.inheritanceTest
end

function AbstractClass:setInheritanceTest(value)
    self.inheritanceTest = value
end

FreeMyInventory.AbstractClass = AbstractClass
