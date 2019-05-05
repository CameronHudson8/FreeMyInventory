FreeMyInventory = FreeMyInventory or {}

local onTradingHouseSearchResultsReceived = function(eventId, guildId, numItemsOnPage, currentPage, hasMorePages)
    -- FMI.debug("Results (" .. FMI.State .. ")")
    -- FreeMyInventoryStatus:SetText("")
    -- FMI.data.lastSearchRequest.guildId = guildId
    -- FMI.data.lastSearchRequest.currentPage = currentPage
    -- if FMI.State == "AWAITING_RESULTS" then
    --     FMI.CollateResults(guildId, numItemsOnPage, currentPage, hasMorePages)
    --     if (hasMorePages) then
    --         FMI.queueTradingHouseSearch(currentPage + 1, TRADING_HOUSE_SORT_SALE_PRICE, true)
    --         FreeMyInventoryCounter:SetText(string.format(FMI.lang.gui.search, guildId, currentPage + 1))
    --     else
    --         local resultCount = table.getn(FMI.data.search_results)
    --         FreeMyInventoryMatchCounter:SetText(FMI.lang.gui.searchready)
    --         FreeMyInventoryCounter:SetText(string.format(FMI.lang.gui.found, FMI.last_search_count, guildId))
    --         FMI.ConcludeSearch()
    --     end
    -- elseif FMI.State == "AWAITING_RESULTS_ALL" then
    --     FMI.debug("Results for all [" .. guildId .. "]")
    --     FMI.CollateResults(guildId, numItemsOnPage, currentPage, hasMorePages)
    --     if (hasMorePages) then
    --         FMI.debug("Next Page...")
    --         FMI.queueTradingHouseSearch(currentPage + 1, TRADING_HOUSE_SORT_SALE_PRICE, true)
    --         FreeMyInventoryCounter:SetText(string.format(FMI.lang.gui.retrv, guildId, currentPage + 1))
    --     elseif guildId ~= FMI.Guilds[#FMI.Guilds].Id then
    --         local canBuyFrom = true
    --         local nextTradingGuild = FMI.nextTradingHouse(guildId)
    --         FMI.debug("Next Guild is " .. nextTradingGuild .. "...")
    --         if nextTradingGuild == -1 or guildId == 0 then
    --             local resultCount = table.getn(FMI.data.search_results)
    --             FreeMyInventoryMatchCounter:SetText(FMI.lang.gui.searchready)
    --             FreeMyInventoryCounter:SetText(string.format(FMI.lang.gui.foundall, FMI.last_search_count))
    --             --  FreeMyInventoryFindMatchesButton:SetHidden(false)
    --             FMI.SetState("NONE")
    --         else
    --             FMI.SaveSwitchTradingHouseGuild("", guildId + 1)
    --         end
    --     else
    --         local resultCount = table.getn(FMI.data.search_results)
    --         FreeMyInventoryCounter:SetText(string.format(FMI.lang.gui.foundall, FMI.last_search_count))
    --         FMI.ConcludeSearch()
    --     end
    -- end
end

FreeMyInventory.onTradingHouseSearchResultsReceived = onTradingHouseSearchResultsReceived
