--[[ global ]] FreeMyInventory = FreeMyInventory or {}

local AbstractHandler = FreeMyInventory.AbstractHandler

local OnAddOnLoadedHandler = {
    inheritanceTest = "concrete success!"
}
-- Begin boilerplate class code
setmetatable(OnAddOnLoadedHandler, {__index = AbstractHandler})
-- OnAddOnLoadedHandler.__index = OnAddOnLoadedHandler
-- End boilerplate class code

function OnAddOnLoadedHandler.new()
    -- Begin boilerplate class code
    local self = setmetatable({}, {__index = OnAddOnLoadedHandler})
    -- self.__index = OnAddOnLoadedHandler
    -- End boilerplate class code
    return self
end

-- Static methods
function OnAddOnLoadedHandler.staticMethod()
end

-- Instance methods
-- the : syntax here causes a "self" arg to be implicitly added before any other args
function OnAddOnLoadedHandler:setValue(newval)
    self.value = newval
end

function OnAddOnLoadedHandler:getValue()
    return self.value
end

-- function OnAddOnLoadedHandler:setInheritanceTest(value)
--     self.inheritanceTest = value
-- end

-- function OnAddOnLoadedHandler:getInheritanceTest()
--     return self.inheritanceTest
-- end

FreeMyInventory.OnAddOnLoadedHandler = OnAddOnLoadedHandler
