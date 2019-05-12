--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local AbstractHandler = FreeMyInventory.AbstractHandler
local addOnName = FreeMyInventory.addOnName
local Debugger = FreeMyInventory.Debugger

-- Static and instance variables
local OnPlayerActivatedHandler = {
    event = EVENT_PLAYER_ACTIVATED
}

-- Begin boilerplate class code
setmetatable(OnPlayerActivatedHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods
function OnPlayerActivatedHandler.handler()
    assert(FreeMyInventory.addOnLoaded, "AddOnLoaded event handler did not run.")
    EVENT_MANAGER:UnregisterForEvent(addOnName, EVENT_PLAYER_ACTIVATED)
    Debugger.printPending()
end

FreeMyInventory.OnPlayerActivatedHandler = OnPlayerActivatedHandler
