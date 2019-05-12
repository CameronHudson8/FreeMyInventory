FreeMyInventory = FreeMyInventory or {}

-- Static functions and variables
local MyClass = {
    myStaticVariable = "Hello World"
}

-- Begin boilerplate class code
MyClass.__index = MyClass
setmetatable(
    MyClass,
    {
        __call = function(cls, ...)
            return cls.new(...)
        end
    }
)
-- End boilerplate class code

function MyClass.new(init)
    -- Begin boilerplate class code
    local self = setmetatable({}, MyClass)
    self.value = init
    -- End boilerplate class code

    return self
end

-- Instance methods
-- the : syntax here causes a "self" arg to be implicitly added before any other args
function MyClass:setValue(newval)
    self.value = newval
end

function MyClass:getValue()
    return self.value
end

FreeMyInventory.MyClass = MyClass
