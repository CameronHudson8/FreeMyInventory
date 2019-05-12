--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static and instance variables
local MyClass = {
    value = "Hello World"
}

-- Begin boilerplate class code
MyClass.__index = MyClass
-- End boilerplate class code

function MyClass.new()
    -- Begin boilerplate class code
    local self = setmetatable({}, MyClass)
    -- End boilerplate class code

    return self
end

-- Static methods
function MyClass.staticMethod()
end

-- Instance methods
-- the : syntax here causes a "self" arg to be implicitly added before any other args
function MyClass:setValue(value)
    self.value = value
end

function MyClass:getValue()
    return self.value
end

FreeMyInventory.MyClass = MyClass
