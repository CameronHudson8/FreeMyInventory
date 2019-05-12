FreeMyInventory = FreeMyInventory or {}

local addOnName = FreeMyInventory.addOnName

-- Static functions and variables
local Debugger = {
    print = function(content)
        d("|c2080D0" .. addOnName .. " debug :: |r" .. content)
    end
}

-- Begin boilerplate class code
Debugger.__index = Debugger
setmetatable(
    Debugger,
    {
        __call = function(cls, ...)
            return cls.new(...)
        end
    }
)
-- End boilerplate class code

FreeMyInventory.Debugger = Debugger
