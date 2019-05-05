FreeMyInventory = FreeMyInventory or {}

local MyClass = {
    myStaticVariable = "Hello World"
}
MyClass.__index = MyClass

setmetatable(
    MyClass,
    {
        __call = function(cls, ...)
            return cls.new(...)
        end
    }
)

function MyClass.new(init)
    local self = setmetatable({}, MyClass)
    self.value = init
    return self
end

-- the : syntax here causes a "self" arg to be implicitly added before any other args
function MyClass:set_value(newval)
    self.value = newval
end

function MyClass:get_value()
    return self.value
end

FreeMyInventory.MyClass = MyClass
