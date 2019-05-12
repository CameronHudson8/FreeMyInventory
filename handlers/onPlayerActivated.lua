--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local addOnName = FreeMyInventory.addOnName
local Debugger = FreeMyInventory.Debugger

local onPlayerActivated = function()
    assert(FreeMyInventory.addOnLoaded, "AddOnLoaded event was not triggered.")
    EVENT_MANAGER:UnregisterForEvent(addOnName, EVENT_PLAYER_ACTIVATED)
    Debugger.printPending()
end

FreeMyInventory.onPlayerActivated = onPlayerActivated
