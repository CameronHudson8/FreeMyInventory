--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static and instance variables
local SimpleClass = {
    value = "Hello World"
}

-- Begin boilerplate class code
SimpleClass.__index = SimpleClass
-- End boilerplate class code

function SimpleClass.new()
    -- Begin boilerplate class code
    local self = setmetatable({}, SimpleClass)
    -- End boilerplate class code

    return self
end

-- Static methods
function SimpleClass.staticMethod()
end

-- Instance methods
-- the : syntax here causes a "self" arg to be implicitly added before any other args
function SimpleClass:setValue(value)
    self.value = value
end

function SimpleClass:getValue()
    return self.value
end

FreeMyInventory.SimpleClass = SimpleClass
