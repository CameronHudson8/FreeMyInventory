--[[ global ]] FreeMyInventory = FreeMyInventory or {}

local AbstractClass = FreeMyInventory.AbstractClass

-- Static and instance variables
local ConcreteClass = {
    inheritanceTest = "Hello World"
}

-- Begin boilerplate class code
setmetatable(ConcreteClass, {__index = AbstractClass})
-- End boilerplate class code

function ConcreteClass.new()
    -- Begin boilerplate class code
    local self = setmetatable({}, {__index = ConcreteClass})
    -- End boilerplate class code

    return self
end

-- Static methods
function ConcreteClass.staticMethod()
end

FreeMyInventory.ConcreteClass = ConcreteClass
