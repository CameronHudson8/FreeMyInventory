--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local AbstractHandler = FreeMyInventory.AbstractHandler

-- Static and instance variables
local OnOpenTradingHouseHandler = {
    event = EVENT_OPEN_TRADING_HOUSE
}

-- Begin boilerplate class code
setmetatable(OnOpenTradingHouseHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods
function OnOpenTradingHouseHandler.handler(event)
    d("Opened trading house.")

    -- local total_inv_counts, total_inv_links = FMI.CondenseInv()
    -- local item_data = FMI.ComputeBestItemsToSell(total_inv_counts, total_inv_links)
    -- local item_data_keys =
    --     FMI.SortByKeys(
    --     item_data,
    --     function(a, b)
    --         return a < b
    --     end
    -- )

    -- for _, key in ipairs(item_data_keys) do
    --     d(
    --         string.format(
    --             "%d x %s @ %.2f = %d",
    --             total_inv_counts[key],
    --             key,
    --             item_data[key]["optimalPrice"],
    --             item_data[key]["totalValue"]
    --         )
    --     )
    -- end
end

FreeMyInventory.OnOpenTradingHouseHandler = OnOpenTradingHouseHandler
