--[[ global ]] FreeMyInventory = FreeMyInventory or {}

local onOpenTradingHouse = function(event)
    d("Guild store opened!")
    d("Taking no action...")

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

FreeMyInventory.onOpenTradingHouse = onOpenTradingHouse
