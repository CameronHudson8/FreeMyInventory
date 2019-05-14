--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local AbstractHandler = FreeMyInventory.AbstractHandler

-- Static and instance variables
local OnScreenResizedHandler = {
    event = EVENT_SCREEN_RESIZED
}

-- Begin boilerplate class code
setmetatable(OnScreenResizedHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods
function OnScreenResizedHandler.handler(...)
    d("Resized screen.")
end

FreeMyInventory.OnScreenResizedHandler = OnScreenResizedHandler
