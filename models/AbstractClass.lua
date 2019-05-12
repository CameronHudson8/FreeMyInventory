--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static and instance variables
local AbstractClass = {}

-- Begin boilerplate class code
AbstractClass.__index = AbstractClass
-- End boilerplate class code

function AbstractClass.new()
    -- Begin boilerplate class code
    local self = setmetatable({}, AbstractClass)
    -- End boilerplate class code

    return self
end

function AbstractClass:getInheritanceTest()
    return self.inheritanceTest
end

function AbstractClass:setInheritanceTest(value)
    self.inheritanceTest = value
end

FreeMyInventory.AbstractClass = AbstractClass
