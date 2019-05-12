--[[ global ]] FreeMyInventory = FreeMyInventory or {}

local addOnName = FreeMyInventory.addOnName

-- Variables
local Debugger = {
    queue = {}
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

function Debugger.new(init)
    -- Begin boilerplate class code
    local self = setmetatable({}, Debugger)
    self.value = init
    -- End boilerplate class code

    return self
end

-- Private static functions
-- Based on Matt's example at https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console.
local indentLevel = 0
local indentString = "...."
local function dump(o)
    if type(o) ~= "table" then
        return tostring(o)
    end

    local s = "{\n"
    indentLevel = indentLevel + 1
    for k, v in pairs(o) do
        if type(k) ~= "number" then
            k = '"' .. k .. '"'
        end
        s = s .. string.rep(indentString, indentLevel) .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    indentLevel = indentLevel - 1
    s = s .. "\n" .. string.rep(indentString, indentLevel) .. "}"
    return s
end

local function prettyPrint(content)
    local prefix = "|c2080D0" .. addOnName .. " debug :: |r "
    if type(content) == "table" then
        prefix = prefix .. "\n"
    end
    d(prefix .. dump(content))
end

-- Public static functions
Debugger.print = function(content)
    if (not FreeMyInventory.addOnLoaded) then
        table.insert(Debugger.queue, content)
        return
    end
    prettyPrint(content)
end

Debugger.printPending = function()
    for index, content in ipairs(Debugger.queue) do
        prettyPrint(content)
    end
end

FreeMyInventory.Debugger = Debugger
