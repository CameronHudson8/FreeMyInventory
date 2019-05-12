--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local AbstractHandler = FreeMyInventory.AbstractHandler

-- Static and instance variables
local OnCloseTradingHouseHandler = {
    event = EVENT_CLOSE_TRADING_HOUSE
}

-- Begin boilerplate class code
setmetatable(OnCloseTradingHouseHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods
function OnCloseTradingHouseHandler.handler()
    d("Closed trading house.")
    -- if FreeMyInventory:IsHidden() == false then
    --     FreeMyInventory:ToggleHidden()
    -- end
end

FreeMyInventory.OnCloseTradingHouseHandler = OnCloseTradingHouseHandler
