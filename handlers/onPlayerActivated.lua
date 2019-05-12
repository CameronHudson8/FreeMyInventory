FreeMyInventory = FreeMyInventory or {}

-- Load constants used in this file
local addOnName = FreeMyInventory.addOnName

local onPlayerActivated = function()
    assert(FreeMyInventory.addOnLoaded, "AddOnLoaded event was not triggered.")
    EVENT_MANAGER:UnregisterForEvent(addOnName, EVENT_PLAYER_ACTIVATED)
end

FreeMyInventory.onPlayerActivated = onPlayerActivated
