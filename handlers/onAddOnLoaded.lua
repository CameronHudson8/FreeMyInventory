FreeMyInventory = FreeMyInventory or {}

local configuration = FreeMyInventory.configuration

-- No d() statements will appear if they are called in this function.
-- To show d() statements on startup, put them in the confirmStartup function.
local onAddOnLoaded = function(event, addonName)
    if addonName == FreeMyInventory.name then
        EVENT_MANAGER:UnregisterForEvent(FMI.name, EVENT_ADD_ON_LOADED)

        -- Load configuration
        for key, value in pairs(configuration) do
            FreeMyInventory[key] = value
        end
    end
end

FreeMyInventory.onAddOnLoaded = onAddOnLoaded
