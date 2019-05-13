--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local addOnName = FreeMyInventory.addOnName
local AbstractHandler = FreeMyInventory.AbstractHandler
local SavedDataManager = FreeMyInventory.SavedDataManager
local Debugger = FreeMyInventory.Debugger

-- Static and instance variables
local OnAddOnLoadedHandler = {
    event = EVENT_ADD_ON_LOADED
}

-- Begin boilerplate class code
setmetatable(OnAddOnLoadedHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods

-- No d() statements will appear if they are called in this function.
-- Use Debugger.print(), instead. The output will be added to a queue
-- and printed after the PlayerActivated event, when the chat is available.
function OnAddOnLoadedHandler.handler(event, loadedAddOnName)
    if loadedAddOnName ~= addOnName then
        return
    end
    EVENT_MANAGER:UnregisterForEvent(addOnName, EVENT_ADD_ON_LOADED)

    SavedDataManager.load()
    SavedDataManager.upgrade()

    -- TODO Determine whether this function is still necessary
    SavedDataManager.clearSession()

    FreeMyInventory.addOnLoaded = true
end

FreeMyInventory.OnAddOnLoadedHandler = OnAddOnLoadedHandler
