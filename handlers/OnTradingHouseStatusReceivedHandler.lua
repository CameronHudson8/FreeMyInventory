--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local AbstractHandler = FreeMyInventory.AbstractHandler

-- Static and instance variables
local OnTradingHouseStatusReceivedHandler = {
    event = EVENT_TRADING_HOUSE_STATUS_RECEIVED
}

-- Begin boilerplate class code
setmetatable(OnTradingHouseStatusReceivedHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods
function OnTradingHouseStatusReceivedHandler.handler()
    -- FMI.PopulateGuildList()
end

FreeMyInventory.OnTradingHouseStatusReceivedHandler = OnTradingHouseStatusReceivedHandler
