FreeMyInventory = FreeMyInventory or {}

-- Load classes
local MyClass = FreeMyInventory.MyClass

local onPlayerActivated = function()
    assert(FreeMyInventory.addOnLoaded, "AddOnLoaded event was not triggered.")

    EVENT_MANAGER:UnregisterForEvent(FreeMyInventory.name, EVENT_PLAYER_ACTIVATED)

    local i = MyClass.new(5)
    -- tbl:name(arg) is a shortcut for tbl.name(tbl, arg), except tbl is evaluated only once
    -- d(i:get_value()) --> 5
    -- i:set_value(6)
    -- d(i:get_value()) --> 6
end

FreeMyInventory.onPlayerActivated = onPlayerActivated
