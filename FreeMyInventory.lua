FreeMyInventory = FreeMyInventory or {}

-- Load configuration
local configuration = FreeMyInventory.configuration
for key, value in pairs(configuration) do
    FreeMyInventory[key] = value
end

-- Load constants
local addOnName = FreeMyInventory.name

-- Register handlers
local eventsAndhandlers = {
    [EVENT_ADD_ON_LOADED] = "onAddOnLoaded",
    [EVENT_CLOSE_TRADING_HOUSE] = "onCloseTradingHouse",
    -- TODO The following two handlers do the same thing. Make them call a function of a common class.
    [EVENT_GUILD_SELF_JOINED_GUILD] = "onGuildSelfJoinedGuild",
    [EVENT_GUILD_SELF_LEFT_GUILD] = "onGuildSelfJoinedGuild",
    [EVENT_OPEN_TRADING_HOUSE] = "onOpenTradingHouse",
    [EVENT_PLAYER_ACTIVATED] = "onPlayerActivated",
    [EVENT_SCREEN_RESIZED] = "onScreenResized",
    [EVENT_TRADING_HOUSE_STATUS_RECEIVED] = "onTradingHouseStatusReceived"
}
for event, handlerName in pairs(eventsAndhandlers) do
    EVENT_MANAGER:RegisterForEvent(addOnName, event, FreeMyInventory[handlerName])
end

-- TODO Refactor from here down

-- -------------------------------Output --------------------
-- function FMI.message(text)
--     d(text)
-- end

-- function FMI.debug(text)
--     if FMI.data.showdebug ~= nil then
--         if FMI.data.showdebug == true then
--             FMI.message("|c2080D0FMI debug :: |r" .. text)
--         end
--     end
-- end
-- ------------------------------ Initialize------------------------------------
-- function FMI.ClearSessionData()
--     ---Reset Session data
--     for id, data in pairs(FMI.data.itemData) do
--         for gname, value in pairs(FMI.data.itemData[id].session) do
--             FMI.data.itemData[id].session[gname] = nil
--         end
--     end

--     -- clean up  save search data
--     for n = 1, #FMI.data.search_results, 1 do
--         FMI.data.search_results[n][10] = -1 --- set page ref to -1
--     end
-- end

-- ------------------------------ Functions------------------------------------
-- local function shortguild(guildName)
--     spos = string.find(guildName, " ")
--     if (spos ~= nil and spos < 18) then
--         guildName = string.sub(guildName, 1, spos + 1)
--     end

--     if string.len(guildName) > 18 then
--         guildName = string.sub(guildName, 1, 15) .. "..."
--     end

--     return guildName
-- end

-- local function truncGuildName(guildName)
--     guildName = guildName .. " "

--     local ga, gb = guildName:match("([a-z,A-Z].*) ([a-z,A-Z].*) ")

--     if ga == nil then
--         ga = guildName
--     end

--     local gName = ""

--     if ga ~= nil then
--         gName = gName .. ga:sub(1, 4)
--     end
--     if gb ~= nil then
--         gName = gName .. "'" .. gb:sub(1, 4)
--     end

--     return gName
-- end

-- function FMI.ClearResultLine(index)
--     if index < 1 or index > 10 then
--         return
--     end

--     local resultControl = FMI.ResultControls[index]
--     resultControl:SetText("")
--     resultControl:GetNamedChild("Price"):SetText("")
--     resultControl:GetNamedChild("UnitPrice"):SetText("")
--     resultControl:GetNamedChild("BuyButton"):SetText("")
-- end

-- function FMI.SetState(newState)
--     FMI.State = newState
-- end

-- function FMI.ClearResultLines()
--     for i = 1, 10 do
--         FMI.ClearResultLine(i)
--     end
-- end

-- function FMI.ClearResults()
--     --  FMI.data.search_results = {}
--     FMI.SearchMatches = {}
--     --  FreeMyInventoryFindMatchesButton:SetHidden(true)
--     FreeMyInventoryMatchCounter:SetText("")
--     FMI.ClearResultLines()
-- end

-- function FMI.Reset()
--     if FMI.Terms ~= nil then
--         FreeMyInventoryTerms:SetText("")
--     end
--     FreeMyInventoryCounter:SetText("")
--     FMI.ResultsSlider:SetMinMax(1, 1)
--     FMI.ResultsSlider:SetValue(1)
--     FMI.ResultsSlider:SetHidden(true)
--     FMI.ClearResults()
--     FMI.SetState("NONE")

--     --- Rebuild list
--     FMI.dropDownInit = false
--     FMI.PopulateGuildList()
--     FMI.SetCanContinueSearch()
-- end

-- function FMI.SetResultLine(index, name, count, price, unitPrice, guildId, pageNumber, icon, quality, gName)
--     if index < 1 or index > 10 then
--         return
--     end

--     local resultControl = FMI.ResultControls[index]

--     name = string.gsub(name, "(^.*)", "") -- Clean up link

--     resultControl:SetText(
--         string.format(FMI.lang.gui.res_label, icon, gName, FMI.utils.GetQualityColor(quality), name, count)
--     )
--     resultControl:GetNamedChild("Price"):SetText(string.format(FMI.lang.gui.res_price, price))
--     resultControl:GetNamedChild("UnitPrice"):SetText(
--         string.format(FMI.lang.gui.res_unitprice, string.format("%.2f", unitPrice))
--     )

--     if (pageNumber > -1) then
--         resultControl:GetNamedChild("BuyButton"):SetText(FMI.lang.gui.res_buy)
--     else
--         resultControl:GetNamedChild("BuyButton"):SetText(FMI.lang.gui.res_buy_off)
--     end
-- end

-- function FMI.DisplayMatches()
--     local startIndex = FMI.ResultsSlider:GetValue()

--     -- Don't scroll down lower than the last result
--     if startIndex + #FMI.ResultControls - 1 > #FMI.SearchMatches then
--         startIndex = #FMI.SearchMatches - #FMI.ResultControls + 1
--     end

--     -- Don't scroll up higher than the first result
--     if startIndex < 1 then
--         startIndex = 1
--     end

--     for i = 1, #FMI.ResultControls do
--         local resultIndex = i + startIndex - 1
--         if resultIndex > #FMI.SearchMatches then
--             FMI.ClearResultLine(i)
--         else
--             local r = FMI.SearchMatches[resultIndex]
--             FMI.SetResultLine(i, r[2], r[4], r[7], r[8], r[9], r[10], r[1], r[3], r[11])
--         end
--     end
-- end

-- function FMI.OnSliderMouseWheel(self, delta)
--     if #FMI.SearchMatches <= #FMI.ResultControls then
--         return
--     end

--     local oldSliderLevel = FMI.ResultsSlider:GetValue()
--     local newSliderLevel = oldSliderLevel - delta

--     -- local scrollUp = delta > 0
--     -- local scrollDown = delta < 0

--     FMI.ResultsSlider:SetValue(newSliderLevel)
-- end

-- function FMI.OnSliderMoved(self, sliderLevel, eventReason)
--     FMI.DisplayMatches()
-- end

-- function FMI.CreateSlider(name, parent)
--     local slider = CreateControl(name, parent, CT_SLIDER)

--     slider.texture = "/esoui/art/miscellaneous/scrollbox_elevator.dds"
--     slider.offset = 0

--     local tex = slider.texture

--     slider:SetDimensions(30, 300)
--     slider:SetMouseEnabled(true)
--     slider:SetThumbTexture(tex, tex, tex, 30, 50, 0, 0, 1, 1)
--     slider:SetMinMax(0, 100)
--     slider:SetValue(0)
--     slider:SetValueStep(1)
--     slider:SetAnchor(TOPRIGHT, parent, TOPRIGHT, 0, 0)

--     return slider
-- end

-- function FMI.Command(options)
--     if options == nil or options == "" then
--         ---- command instr
--         for i = 1, #FMI.lang.core.cmdHelp, 1 do
--             FMI.message(FMI.lang.core.cmdHelp[i])
--         end
--         return
--     end

--     cmd = string.lower(options)

--     FMI.debug("Command line -> [" .. cmd .. "]")

--     if cmd == "show" or cmd == "on" then
--         FMI.showWindow()
--     elseif omd == "hide" or cmd == "off" then
--         FMI.hideWindow()
--     end
-- end

-- function FMI.showWindow()
--     --- Rebuild list
--     FMI.PopulateGuildList()

--     FreeMyInventory:SetHidden(false)
-- end

-- function FMI.hideWindow()
--     FreeMyInventory:SetHidden(true)
-- end

-- function FMI.GuildStoreSearchToggle()
--     if FreeMyInventory:IsHidden() then
--         FMI.showWindow()
--     else
--         FMI.hideWindow()
--     end
-- end

-- ----- Function Added by LintyDruid
-- function FMI.GetCurrentSellName()
--     FreeMyInventoryTerms:SetText('"' .. ZO_TradingHouseLeftPanePostItemFormInfoName:GetText() .. '"')
-- end
-- ----- End Function Added by LintyDruid

-- function FMI.CollateResults(guildId, numItemsOnPage, currentPage, hasMorePages)
--     for i = 1, numItemsOnPage do
--         FMI.last_search_count = FMI.last_search_count + 1

--         local icon, name, quality, stackCount, seller, timeRemaining, price = GetTradingHouseSearchResultItemInfo(i)

--         if (not (tonumber(stackCount) == nil) and not (tonumber(timeRemaining) == nil) and not (tonumber(price) == nil)) then
--             local currentResult = {
--                 icon, --[1]
--                 name, --[2]
--                 quality, --[3]
--                 tonumber(stackCount), --[4]	stackCount
--                 seller, --[5]
--                 tonumber(timeRemaining), --[6]
--                 tonumber(price), --[7]	price
--                 tonumber(price) / tonumber(stackCount), --[8]	itmCost
--                 guildId, --[9]
--                 currentPage, --[10]
--                 truncGuildName(GetGuildName(guildId)), --[11]
--                 GetTimeStamp(), --[12]	currentTimestamp
--                 FMI.utils:NameCleanupLower(name) .. "::" .. quality,
--                 --[13]	itmIndex
--                 GetGuildName(guildId) --[14]	gname
--             }

--             table.insert(FMI.data.search_results, currentResult)

--             --Build Item History

--             local itmIndex = FMI.utils:NameCleanupLower(name) .. "::" .. quality
--             local gname = GetGuildName(guildId)
--             local itmCost = tonumber(price) / tonumber(stackCount)
--             local currentTimestamp = GetTimeStamp()

--             if FMI.data.itemData[itmIndex] == nil then
--                 FMI.data.itemData[itmIndex] = {session = {}, history = {}}
--             end

--             ---- Session
--             if FMI.data.itemData[itmIndex].session[gname] == nil then
--                 FMI.data.itemData[itmIndex].session[gname] = {min = -1, max = -1, seen = 0, sum = 0, avg = 0, stdev = 0}
--             end

--             if FMI.data.itemData[itmIndex].session[gname].min > itmCost then
--                 FMI.data.itemData[itmIndex].session[gname].min = itmCost
--             end

--             if FMI.data.itemData[itmIndex].session[gname].max < itmCost then
--                 FMI.data.itemData[itmIndex].session[gname].max = itmCost
--             end

--             FMI.data.itemData[itmIndex].session[gname].lastUpdatedTimestamp = currentTimestamp

--             FMI.data.itemData[itmIndex].session[gname].seen =
--                 FMI.data.itemData[itmIndex].session[gname].seen + stackCount

--             FMI.data.itemData[itmIndex].session[gname].sum = FMI.data.itemData[itmIndex].session[gname].sum + price

--             FMI.data.itemData[itmIndex].session[gname].avg =
--                 FMI.data.itemData[itmIndex].session[gname].sum / FMI.data.itemData[itmIndex].session[gname].seen

--             -- history
--             if FMI.data.itemData[itmIndex].history[gname] == nil then
--                 FMI.data.itemData[itmIndex].history[gname] = {min = -1, max = -1, seen = 0, sum = 0, avg = 0}
--             end

--             if
--                 FMI.data.itemData[itmIndex].history[gname].min == -1 or
--                     FMI.data.itemData[itmIndex].history[gname].min > itmCost
--              then
--                 FMI.data.itemData[itmIndex].history[gname].min = itmCost
--             end

--             if
--                 FMI.data.itemData[itmIndex].history[gname].max == -1 or
--                     FMI.data.itemData[itmIndex].history[gname].max < itmCost
--              then
--                 FMI.data.itemData[itmIndex].history[gname].max = itmCost
--             end

--             FMI.data.itemData[itmIndex].history[gname].lastUpdatedTimestamp = currentTimestamp

--             FMI.data.itemData[itmIndex].history[gname].seen =
--                 FMI.data.itemData[itmIndex].history[gname].seen + stackCount

--             FMI.data.itemData[itmIndex].history[gname].sum = FMI.data.itemData[itmIndex].history[gname].sum + price

--             FMI.data.itemData[itmIndex].history[gname].avg =
--                 FMI.data.itemData[itmIndex].history[gname].sum / FMI.data.itemData[itmIndex].history[gname].seen
--         else
--             FMI.debug("--------------------------------------")
--             FMI.debug("ERROR: Tonumber conversion failed.")
--             FMI.debug("stackCount: " .. stackCount)
--             FMI.debug("timeRemaining: " .. timeRemaining)
--             FMI.debug("price: " .. price)
--             FMI.debug("--------------------------------------")
--         end
--     end
-- end

-- function FMI.ComputeSessionStandardDeviations()
--     --d("Entered standard deviation function!")
--     --Set all of the session standard deviations back to 0,
--     --including those for which we may not have new search result data.
--     for itmIndex in pairs(FMI.data.itemData) do
--         for gname in pairs(FMI.data.itemData[itmIndex].session) do
--             FMI.data.itemData[itmIndex].session[gname].stdev = 0
--         end
--     end

--     --Run through the array of results, adding up the deviations.
--     local itmIndex, gname, itmCost, stackCount, avg, seen
--     for i1, v in ipairs(FMI.data.search_results) do
--         itmIndex = v[13]
--         gname = v[14]
--         itmCost = v[8]
--         stackCount = v[4]
--         avg = FMI.data.itemData[itmIndex].session[gname].avg

--         seen = FMI.data.itemData[itmIndex].session[gname].seen
--         if FMI.data.itemData[itmIndex].session[gname].stdev == nil then
--             FMI.data.itemData[itmIndex].session[gname].stdev = 0
--         end
--         FMI.data.itemData[itmIndex].session[gname].stdev =
--             FMI.data.itemData[itmIndex].session[gname].stdev + (itmCost - avg) ^ 2 * stackCount
--     end

--     --Go through all of the session data and compute the standard deviations.
--     local seen, sum, stdev
--     for itmIndex in pairs(FMI.data.itemData) do
--         for gname in pairs(FMI.data.itemData[itmIndex].session) do
--             seen = FMI.data.itemData[itmIndex].session[gname].seen

--             if seen > 0 then
--                 stdev = FMI.data.itemData[itmIndex].session[gname].stdev
--                 stdev = math.pow(stdev / seen, 0.5)
--             else
--                 stdev = 0
--             end
--         end
--     end
-- end

-- function FMI.StrictCompareByUnitPrice(a, b)
--     return a[8] < b[8]
-- end

-- function FMI.ConcludeSearch()
--     --FreeMyInventoryFindMatchesButton:SetHidden(false)
--     FMI.SetState("NONE")
--     FMI.data.lastSearchRequest = {}
--     FMI.ComputeSessionStandardDeviations()
--     FMI.SetCanContinueSearch()
-- end

-- function FMI.SaveSwitchTradingHouseGuild(name, guildId)
--     local delay = GetTradingHouseCooldownRemaining()

--     if delay > 0 then
--         --        delay = delay + 1000  --- why add 1 second when the delay is only 3 seconds? dOpiate
--         local delayInSeconds = math.ceil(delay / 1000)
--         FMI.debug("waiting " .. delay .. "ms before switching to " .. guildId)
--         FreeMyInventoryStatus:SetText(string.format(FMI.lang.gui.searchpause, delayInSeconds))
--         ld_timer.addWithData("FMI_Search", delay, FMI.SaveSwitchTradingHouseGuild, 1, guildId)
--     else
--         FMI.debug("executing switching to " .. guildId)
--         SelectTradingHouseGuildId(guildId)
--         FMI.queueTradingHouseSearch(0, TRADING_HOUSE_SORT_SALE_PRICE, true)
--     end
-- end

-- --Read the contents of the player's bag (either backpack or bank) and store it in table bag_data.
-- function FMI.ScanBag(bagId)
--     --d("Reading bag " .. bagId .. " inventory...")
--     local bag_size = GetBagSize(bagId)
--     local bag_data = {}
--     local true_count = 0
--     local slot_id, item_name, item_quantity, item_link

--     --bag_data format: {true_count : {slot_id, item_name, item_quantity, itemlink} }
--     for i = 0, bag_size - 1 do
--         slot_id = i
--         item_name = GetItemName(bagId, slot_id)
--         if item_name == "" then
--             --do nothing
--         else
--             true_count = true_count + 1
--             item_quantity, _ = GetSlotStackSize(bagId, slot_id)
--             item_link = GetItemLink(bagId, slot_id, LINK_STYLE_DEFAULT)
--             --d(string.format("Item link of %s is %s.", item_name, item_link))
--             bag_data[true_count] = {slot_id, item_name, item_quantity, item_link}
--         end
--     end

--     return bag_data
-- end

-- function FMI.CondenseInv()
--     --d("Comparing backpack and bank inventories...")

--     local backpack_data = FMI.ScanBag(BAG_BACKPACK)

--     local bank_data = FMI.ScanBag(BAG_BANK)
--     local total_inv_counts = {}
--     local total_inv_links = {}

--     local count = 0
--     for i1, v1 in pairs(bank_data) do
--         count = count + 1
--         if total_inv_counts[v1[2]] == nil then
--             --d("(In bank:) Adding " .. v1[3] .. " " .. v1[2] .. " to total inventory list.")
--             total_inv_counts[v1[2]] = v1[3]
--             total_inv_links[v1[2]] = v1[4]
--         else
--             --d("(In bank:) Adding " .. v1[3] .. " more " .. v1[2] .. " to total inventory list.")
--             total_inv_counts[v1[2]] = total_inv_counts[v1[2]] + v1[3]
--             count = count - 1
--         end
--     end
--     --d("Bank unique item count = " .. count)

--     count = 0
--     for i1, v1 in pairs(backpack_data) do
--         count = count + 1
--         if total_inv_counts[v1[2]] == nil then
--             --d("(In backpack:) Adding " .. v1[3] .. " " .. v1[2] .. " to total inventory list.")
--             total_inv_counts[v1[2]] = v1[3]
--             total_inv_links[v1[2]] = v1[4]
--         else
--             --d("(In backpack:) Adding " .. v1[3] .. " more " .. v1[2] .. " to total inventory list.")
--             total_inv_counts[v1[2]] = total_inv_counts[v1[2]] + v1[3]
--             count = count - 1
--         end
--     end
--     --d("Backpack unique item count = " .. count)

--     --d("Printing total inventory list!")
--     count = 0
--     for i, v in pairs(total_inv_counts) do
--         count = count + 1
--         --d("Item " .. count .. ": You have " .. v .. " " .. i .. ".")
--     end
--     --d("Total unique item count = " .. count)

--     return total_inv_counts, total_inv_links
-- end

-- function FMI.GetItemIDandIndex(itemLink, clickable)
--     local itemID = tonumber(string.match(itemLink, "|H.-:item:(.-):"))
--     local itemIndex = MasterMerchant.makeIndexFromLink(itemLink)
--     return itemID, itemIndex
-- end

-- function FMI.GetItemStatistics(itemID, itemIndex, skipDots, goBack, clickable)
--     --d("Computing standard deviation...")
--     local returnData = {["avgPrice"] = nil, ["numSales"] = nil, ["numDays"] = 10000, ["numItems"] = nil}

--     local standardDeviation = 0
--     local samples = 0
--     ---- make sure we have a list of sales to work with
--     if
--         MasterMerchant.salesData[itemID] and MasterMerchant.salesData[itemID][itemIndex] and
--             MasterMerchant.salesData[itemID][itemIndex]["sales"] and
--             #MasterMerchant.salesData[itemID][itemIndex]["sales"] > 0
--      then
--         --d("Passed initial checks...")
--         local list = MasterMerchant.salesData[itemID][itemIndex]["sales"]
--         local lowerBlacklist =
--             MasterMerchant:ActiveSettings().blacklist and MasterMerchant:ActiveSettings().blacklist:lower() or ""
--         local timeCheck, daysRange = MasterMerchant:TimeCheck()

--         --d("Performing timecheck...")
--         if timeCheck == -1 then
--             return 0, 0
--         end

--         -- setup some initial values
--         ----d("Initializing variables...")
--         local initMean = 0
--         local initCount = 0
--         for _, item in ipairs(list) do
--             if
--                 (item.timestamp > timeCheck) and (not zo_plainstrfind(lowerBlacklist, item.buyer:lower())) and
--                     (not zo_plainstrfind(lowerBlacklist, item.seller:lower())) and
--                     (not zo_plainstrfind(lowerBlacklist, item.guild:lower()))
--              then
--                 if oldestTime == nil or oldestTime > item.timestamp then
--                     oldestTime = item.timestamp
--                 end
--                 if newestTime == nil or newestTime < item.timestamp then
--                     newestTime = item.timestamp
--                 end
--                 samples = samples + 1
--                 initMean = initMean + item.price
--                 initCount = initCount + item.quant
--             end
--         end

--         --d("Computing mean...")
--         if (initCount == 0 and goBack) then
--             initMean = 0
--             initCount = 0
--             for _, item in ipairs(list) do
--                 if
--                     (not zo_plainstrfind(lowerBlacklist, item.buyer:lower())) and
--                         (not zo_plainstrfind(lowerBlacklist, item.seller:lower())) and
--                         (not zo_plainstrfind(lowerBlacklist, item.guild:lower()))
--                  then
--                     initMean = initMean + item.price
--                     initCount = initCount + item.quant
--                 end
--             end
--         end

--         --d("Checking count...")
--         if initCount == 0 then
--             --d("Found 0 sales! Stopping...")
--             returnData = {["avgPrice"] = nil, ["numSales"] = nil, ["numDays"] = daysRange, ["numItems"] = nil}
--             return 0, 0
--         end

--         initMean = initMean / initCount

--         -- calc standard deviation
--         --d("Computing standard deviation...")
--         local sampleCount = 0
--         for _, item in ipairs(list) do
--             if
--                 (item.timestamp > timeCheck) and (not zo_plainstrfind(lowerBlacklist, item.buyer:lower())) and
--                     (not zo_plainstrfind(lowerBlacklist, item.seller:lower())) and
--                     (not zo_plainstrfind(lowerBlacklist, item.guild:lower()))
--              then
--                 sampleCount = sampleCount + item.quant
--                 standardDeviation = standardDeviation + ((((item.price / item.quant) - initMean) ^ 2) * item.quant)
--             end
--         end

--         standardDeviation = math.sqrt(standardDeviation / sampleCount)
--     end
--     --d("Std dev = " .. tostring(standardDeviation))

--     return samples, standardDeviation
-- end

-- function FMI.GammaFunc(n)
--     n = n - 1
--     local gamma = 1
--     while n > 1 do
--         gamma = gamma * n
--         n = n - 1
--     end
--     return gamma
-- end

-- function FMI.ComputeBestItemsToSell(total_inv_counts, total_inv_links)
--     d("Computing best items to sell...")
--     local item_data = {}
--     --	d("Logging price data!")
--     for i, v in pairs(total_inv_links) do
--         local price_given_sold = {}
--         --MasterMerchant:itemStats(itemLink, clickable)
--         item_data[i] = MasterMerchant:itemStats(total_inv_links[i], false)
--         --returnData = {['avgPrice'] = avgPrice, ['numSales'] = legitSales, ['numDays'] = daysHistory,
--         --				['numItems'] = countSold, ['graphInfo'] = {['oldestTime'] = oldestTime, ['low'] = lowPrice,
--         --				['high'] = highPrice, ['points'] = salesPoints}}

--         local itemID, itemIndex = FMI.GetItemIDandIndex(total_inv_links[i], false)
--         item_data[i]["samples"], item_data[i]["stdDev"] = FMI.GetItemStatistics(itemID, itemIndex, nil, nil, false)
--         --d("samples = " .. item_data[i]['samples'])

--         if item_data[i]["avgPrice"] == nil then
--             item_data[i]["avgPrice"] = 0
--         end
--         if item_data[i]["stdDev"] == nil then
--             item_data[i]["stdDev"] = 0
--         end

--         local x = 0
--         local dx = 0.01
--         local index = 0
--         local y = {[index] = 0}
--         local peak_reached = false
--         item_data[i]["optimalPrice"] = 0

--         local DoF = 1
--         if item_data[i]["samples"] > 0 then -- compute probability density function
--             while peak_reached == false do
--                 x = x + dx
--                 index = index + 1
--                 --d("Index = " .. tostring(index))
--                 if item_data[i]["stdDev"] > 0 then -- use normal distribution
--                     y[index] =
--                         math.pow(2 * math.pi * math.pow(item_data[i]["stdDev"], 2), -0.5) *
--                         math.exp(-math.pow(x - item_data[i]["avgPrice"], 2) / (2 * math.pow(item_data[i]["stdDev"], 2)))
--                 elseif item_data[i]["stdDev"] == 0 then -- use t distribution
--                     local DoF = item_data[i]["samples"] - 1
--                     if DoF == 0 then
--                         DoF = 1
--                     end
--                     y[index] =
--                         FMI.GammaFunc((DoF + 1) / 2) *
--                         math.pow((1 + math.pow(x - item_data[i]["avgPrice"], 2) / DoF), -(DoF + 1) / 2) /
--                         (math.pow(DoF * math.pi, 0.5) * FMI.GammaFunc(DoF / 2))
--                 --d("y[index-1] = " .. tostring(y[index-1]) .. ", index-1 = " .. index-1 .. " and y[index] = " .. tostring(y[index]) .. ", index = " .. index)
--                 end

--                 if (y[index] * x) < (y[index - 1] * (x - dx)) then
--                     peak_reached = true

--                     item_data[i]["optimalPrice"] = x - dx
--                 --d(string.format("Optimal price of %s = %.2f", i, item_data[i]['optimalPrice']))
--                 end
--             end
--         end

--         item_data[i]["totalValue"] = item_data[i]["optimalPrice"] * total_inv_counts[i]

--         --d(i .. ": totalValue = " .. tostring(item_data[i]['totalValue']))
--     end
--     return item_data
-- end

-- function FMI.SortByKeys(tbl, sortFunction)
--     --d("Running sort function...")
--     local keys = {}
--     for key, value in pairs(tbl) do
--         table.insert(keys, key)
--     end
--     --d("Key list generated. " .. tostring(#keys) .. " keys written.")
--     --d("Sorting keys by totalValue...")
--     table.sort(
--         keys,
--         function(a, b)
--             return sortFunction(tbl[a]["totalValue"], tbl[b]["totalValue"])
--         end
--     )

--     return keys
-- end

-- function FMI.GetGuildIdFromDropdown()
--     local dropdown = ZO_ComboBox_ObjectFromContainer(FreeMyInventory:GetNamedChild("GuildCombo"))
--     local guildId = dropdown:GetSelectedItem()

--     if guildId ~= FMI.lang.gui.guild_all then
--         guildId = string.sub(guildId, 2, 2)
--     end

--     return guildId
-- end

-- function FMI.SetGuildTextForDropdown(guildId)
--     local dropdown = ZO_ComboBox_ObjectFromContainer(FreeMyInventory:GetNamedChild("GuildCombo"))
--     local items = dropdown:GetItems()

--     if guildId ~= FMI.lang.gui.guild_all then
--         for key, value in pairs(items) do
--             if guildId == string.sub(value.name, 2, 2) then
--                 guildId = value.name
--                 break
--             end
--         end
--     end

--     dropdown:SetSelectedItem(guildId)
-- end

-- function FMI.canUseTradingHouse(guildId)
--     return ((DoesPlayerHaveGuildPermission(guildId, GUILD_PERMISSION_STORE_BUY) or
--         DoesPlayerHaveGuildPermission(guildId, GUILD_PERMISSION_STORE_SELL)) and
--         DoesGuildHavePrivilege(guildId, GUILD_PRIVILEGE_TRADING_HOUSE))
-- end

-- function FMI.nextTradingHouse(guildInd)
--     guildInd = guildInd + 1

--     for i = 1, #FMI.Guilds, 1 do
--         local guildId = FMI.Guilds[i].Id
--         if FMI.canUseTradingHouse(guildId) then
--             return guildId
--         end
--     end

--     return -1 -- no more
-- end

-- function FMI.SetCanContinueSearch()
--     local button = FreeMyInventory:GetNamedChild("ContinueSearchButton")

--     if FMI.data.lastSearchRequest.guildId == nil then
--         button:SetEnabled(false)
--     else
--         button:SetEnabled(true)
--     end
-- end

-- function FMI.ContinueSearch()
--     if ZO_TradingHouse:IsHidden() then
--         FMI.message(FMI.lang.gui.searchNoGS)
--         return
--     end

--     if FMI.State ~= "NONE" then
--         FMI.message(FMI.lang.gui.searchBusy)
--         return
--     end
--     FMI.debug("Retrv...")

--     -- FreeMyInventoryFindMatchesButton:SetHidden(true)

--     FMI.ClearResults()

--     FMI.SetGuildTextForDropdown(FMI.data.lastSearchRequest.SelectedGuild)

--     FreeMyInventoryCounter:SetText(FMI.lang.gui.searchStarte)

--     SelectTradingHouseGuildId(tonumber(FMI.data.lastSearchRequest.guildId))

--     FMI.debug("Searching...")
--     FMI.queueTradingHouseSearch(FMI.data.lastSearchRequest.currentPage, TRADING_HOUSE_SORT_SALE_PRICE, true)

--     if selectedText == FMI.lang.gui.guild_all then
--         FMI.SetState("AWAITING_RESULTS_ALL")
--     else
--         FMI.SetState("AWAITING_RESULTS")
--     end
-- end

-- function FMI.Retrieve()
--     if ZO_TradingHouse:IsHidden() then
--         FMI.message(FMI.lang.gui.searchNoGS)
--         return
--     end

--     if FMI.State ~= "NONE" then
--         FMI.message(FMI.lang.gui.searchBusy)
--         return
--     end
--     FMI.debug("Retrv...")

--     -- FreeMyInventoryFindMatchesButton:SetHidden(true)

--     FMI.ClearResults()
--     FMI.ClearSessionData()

--     selectedText = FMI.GetGuildIdFromDropdown()
--     FMI.data.lastSearchRequest.SelectedGuild = selectedText

--     FreeMyInventoryCounter:SetText(FMI.lang.gui.searchStarte)
--     FMI.last_search_count = 0

--     if selectedText == FMI.lang.gui.guild_all then
--         FMI.debug("Finding all...")
--         FMI.data.search_results = {} -- clear all results for a full refresh
--         local firstTradingGuild = FMI.nextTradingHouse(0)

--         if firstTradingGuild == -1 then
--             FreeMyInventoryCounter:SetText(FMI.lang.gui.noTradingGuilds)
--             return
--         end

--         FMI.debug("Selected guild" .. firstTradingGuild .. "...")
--         SelectTradingHouseGuildId(firstTradingGuild)
--     else
--         if FMI.canUseTradingHouse(tonumber(selectedText)) then
--             SelectTradingHouseGuildId(tonumber(selectedText))

--             --   clear results for the selected guild.
--             for n = #FMI.data.search_results, 1, -1 do
--                 if FMI.data.search_results[n][9] == tonumber(selectedText) then --FMI.data.search_results[n][9] contains guild ID from dropdown
--                     table.remove(FMI.data.search_results, n)
--                 end
--             end
--         else
--             FreeMyInventoryCounter:SetText(string.format(FMI.lang.gui.notATradingGuild, (tonumber(selectedText))))
--             return
--         end
--     end

--     FMI.debug("Searching...")
--     FMI.queueTradingHouseSearch(0, TRADING_HOUSE_SORT_SALE_PRICE, true)

--     if selectedText == FMI.lang.gui.guild_all then
--         FMI.SetState("AWAITING_RESULTS_ALL")
--     else
--         FMI.SetState("AWAITING_RESULTS")
--     end
-- end

-- function FMI.queueTradingHouseSearch(a, b, c)
--     --need a message mere
--     FMI.debug("Queuing request for " .. a .. ", " .. b)

--     FMI.SaveQueueTradingHouseSearch("", {a, b, c})
-- end

-- function FMI.SaveQueueTradingHouseSearch(name, params)
--     local delay = GetTradingHouseCooldownRemaining()

--     if delay > 0 then
--         --        delay = delay + 1000        --- dOpiate the delay is 3 seconds, why keep settin it back to 4??
--         local delayInSeconds = math.ceil(delay / 1000)
--         FMI.debug("waiting " .. delay .. "ms before executing search")
--         FreeMyInventoryStatus:SetText(string.format(FMI.lang.gui.searchpause, delayInSeconds))
--         ld_timer.addWithData("FMI_Search", delay, FMI.SaveQueueTradingHouseSearch, 1, params)
--     else
--         FMI.debug("executing search")
--         FMI.doTradingHouseSearch("", params)
--     end
-- end

-- function FMI.doTradingHouseSearch(name, params) -- params == {0,TRADING_HOUSE_SORT_SALE_PRICE, true}
--     --d(params)
--     FreeMyInventoryStatus:SetText(FMI.lang.gui.searchproc)
--     FMI.debug("Asking for for " .. params[1] .. ", " .. params[2] .. " ...")
--     ExecuteTradingHouseSearch(params[1], params[2], params[3])
-- end

-- function FMI.FindMatches()
--     if FMI.data.search_results == nil or table.getn(FMI.data.search_results) < 1 then
--         return
--     end

--     local searchTerms = FMI.utils.Trim(string.lower(FreeMyInventoryTerms:GetText()))
--     if searchTerms == "" then
--         return
--     end

--     FMI.ClearResultLines()

--     local matches = {}
--     local numberOfItems = table.getn(FMI.data.search_results)
--     local exact = searchTerms:sub(1, 1) == '"' and searchTerms:sub(-1, -1) == '"'

--     -----  Added by LintyDruid
--     local unitcost = {max = 0, min = 0, total = 0, avg = 0, undercut = 0}
--     -----  End Added by LintyDruid

--     for i = 1, numberOfItems do
--         local currentResult = FMI.data.search_results[i]
--         -- icon, name, quality, stackCount, seller, timeRemaining,
--         -- price, unitPrice, guildId, resultPage

--         local currentGuild = FMI.GetGuildIdFromDropdown()

--         local name = currentResult[2]
--         local guildId = tostring(currentResult[9])

--         if currentGuild == FMI.lang.gui.guild_all then
--             currentGuild = guildId
--         end

--         if exact then
--             -- Some item names have ^n or ^p at the end.
--             -- Remove them if doing an exact search
--             if name:sub(-2, -2) == "^" then
--                 name = name:sub(1, -3)
--             end

--             -- Remove quotes from search terms
--             local unquotedSearchTerms = searchTerms:sub(2, -2)

--             if string.lower(name) == unquotedSearchTerms and currentGuild == guildId then
--                 table.insert(matches, currentResult)
--             end
--         else
--             findResult = string.lower(name):find(searchTerms)

--             if findResult ~= nil and currentGuild == guildId then
--                 table.insert(matches, currentResult)

--                 -----  Added by LintyDruid
--                 --- Unit price is 8
--                 if unitcost.max < currentResult[8] then
--                     unitcost.max = currentResult[8]
--                 end

--                 if unitcost.min > currentResult[8] or unitcost.min == 0 then
--                     unitcost.min = currentResult[8]
--                 end

--                 unitcost.total = unitcost.total + currentResult[8]

--                 unitcost.avg = unitcost.total / #matches

--                 local undercut = ((100 - FMI.data.undercutPerc) / 100)
--                 unitcost.undercut = unitcost.min * undercut
--             -----  End Added by LintyDruid
--             end
--         end
--     end

--     table.sort(matches, FMI.StrictCompareByUnitPrice)

--     matchCount = table.getn(matches)

--     FMI.SearchMatches = matches
--     -----  Added by LintyDruid

--     local currPostItemBag = ZO_TradingHouseLeftPanePostItemFormInfoItem["bagId"]
--     local currPostItemBIndex = ZO_TradingHouseLeftPanePostItemFormInfoItem["itemIndex"]

--     local sellFor = ""

--     if (currPostItemBag ~= nil and currPostItemBIndex ~= nil) then
--         local numItems = GetItemTotalCount(currPostItemBag, currPostItemBIndex)

--         sellFor = string.format(FMI.lang.gui.search_summsell, numItems, math.floor(numItems * unitcost.undercut))
--     end

--     FreeMyInventoryMatchCounter:SetText(
--         string.format(
--             FMI.lang.gui.search_summ,
--             matchCount,
--             math.floor(unitcost.max),
--             math.floor(unitcost.min),
--             math.floor(unitcost.avg),
--             math.floor(unitcost.undercut),
--             sellFor
--         )
--     )
--     -----  End Added by LintyDruid

--     if #FMI.SearchMatches <= #FMI.ResultControls then
--         FMI.ResultsSlider:SetMinMax(1, 1)
--         FMI.ResultsSlider:SetHidden(true)
--     else
--         FMI.ResultsSlider:SetMinMax(1, #FMI.SearchMatches - #FMI.ResultControls + 1)
--         FMI.ResultsSlider:SetHidden(false)
--     end

--     FMI.ResultsSlider:SetValue(1)

--     FMI.DisplayMatches()
-- end

-- function FMI.ShowItem(itemButton)
--     local start = 23 -- length of "GuildStoreSearchResult" + 1
--     local scrollOffset = FMI.ResultsSlider:GetValue() - 1
--     local displayRow = tonumber(string.sub(itemButton:GetParent():GetName(), 25, -1))
--     local resultIndex = displayRow + scrollOffset

--     local result = FMI.SearchMatches[resultIndex]

--     if result == nil then
--         return
--     end

--     local guildId = result[9]
--     local resultPage = result[10]

--     if resultPage < 0 then
--         return
--     end

--     SelectTradingHouseGuildId(guildId)
--     FMI.queueTradingHouseSearch(resultPage, TRADING_HOUSE_SORT_SALE_PRICE, true)
-- end

-- function FMI.Info(itemButton)
--     local start = 23 -- length of "GuildStoreSearchResult" + 1
--     local scrollOffset = FMI.ResultsSlider:GetValue() - 1
--     local displayRow = tonumber(string.sub(itemButton:GetName(), 25, -1))
--     local resultIndex = displayRow + scrollOffset

--     local result = FMI.SearchMatches[resultIndex]

--     if result == nil then
--         return
--     end

--     FMI.ShowToolTip(result)
-- end

-- function FMI.SetFrameCoords()
--     local x, y = 0, 0
--     local addOnX, addOnY = FreeMyInventory:GetCenter()
--     local guiRootX, guiRootY = GuiRoot:GetCenter()
--     x = addOnX - guiRootX
--     y = addOnY - guiRootY

--     FMI.data.window.x = x
--     FMI.data.window.y = y

--     --self:SetAnchor(CENTER, GuiRoot,CENTER, x, y)
-- end

-- -----------------------------------------Utils-------------------------------------------------------
-- FMI.utils = {}

-- function FMI.utils:NameCleanupLower(StringVar)
--     return string.lower(FMI.utils:NameCleanup(StringVar))
-- end

-- function FMI.utils:NameCleanup(StringVar)
--     local apos = string.find(StringVar, "^", 1, true)
--     if apos == nil or apos < 2 then
--         return StringVar
--     end

--     return string.sub(StringVar, 1, apos - 1)
-- end

-- local function numfmt(num)
--     return math.floor(num)
-- end

-- function FMI.ShowToolTip(result)
--     local name = result[2]
--     local seller = result[5]
--     local remains = result[6]
--     local quality = result[3]
--     local icon = result[1]
--     local guild = GetGuildName(result[9])
--     local qty = result[4]
--     local price = result[7]
--     local color = FMI.utils.GetQualityColor(quality)

--     PopupTooltip:ClearLines()
--     PopupTooltipIcon:SetHidden(false)

--     --PopupTooltipFadeRight:SetText("|cFFF000x"..qty)

--     PopupTooltipIcon:SetHidden(false)

--     PopupTooltipIcon:SetTexture(icon)

--     PopupTooltip:AddVerticalPadding(15)
--     PopupTooltip:AddLine("|cFFF000x " .. qty, "ZoFontAlert", 1, 1, 1, TOPRIGHT, MODIFY_TEXT_TYPE_NONE, RIGHT, false)
--     PopupTooltip:AddLine("|c" .. color .. FMI.utils:NameCleanup(name) .. "|r", "ZoFontAlert")
--     ZO_Tooltip_AddDivider(PopupTooltip)
--     PopupTooltip:AddLine("|c008000" .. guild .. "|r")
--     PopupTooltip:AddLine("|c00FFFF" .. seller .. "|r")
--     PopupTooltip:AddLine(FMI.lang.core.icon_gold .. "|cFFFFFF" .. price .. "|r")

--     --ZO_Tooltip_AddDivider(PopupTooltip);

--     PopupTooltip.lastLink = FMI.CreateLink(color, name, 0, quality, 0, 0)

--     PopupTooltip:SetHidden(false)

--     ld_tooltip.forceupdate(PopupTooltip)
-- end

-- function FMI.CreateLink(itemColor, itemText, itemID, itemQuality, itemLevel, price)
--     local linkTemplate = "|H%s:%s|h%s|h"
--     local dataTemplate = "item:%s:%s:%s:0:0:0:0:0:0:0:0:0:0:0:%s:0:0:0:0:0"

--     return linkTemplate:format(
--         itemColor,
--         dataTemplate:format(itemID, itemQuality, itemLevel, price),
--         "[" .. itemText .. "]"
--     )
-- end

-- -----------------------------------------Tooltip------------------------------------------------------
-- function FMI.SetTooltip(itemData)
--     local itmIndex = FMI.utils:NameCleanupLower(itemData.name) .. "::" .. itemData.quality
--     --d(itmIndex)
--     local mkr = ""
--     if FMI.data.itemData[itmIndex] == nil then --- no initial match
--         for item, data in pairs(FMI.data.itemData) do
--             if (string.find(item, FMI.utils:NameCleanupLower(itemData.name) .. "::") == 1) then
--                 itmIndex = item
--                 mkr = "?"
--                 break
--             end
--         end
--         if FMI.data.itemData[itmIndex] == nil then
--             return {}
--         end
--     end

--     local tt_text = {}

--     local sess_bp = -1
--     local sess_bb = -1
--     local sess_gb = ""
--     local sess_g = ""

--     local hist_bp = -1
--     local hist_bb = -1
--     local hist_g = ""
--     local hist_gb = ""

--     if next(FMI.data.itemData[itmIndex].session) ~= nil then
--         if FMI.data.tooltips.session then -- show session
--             table.insert(tt_text, FMI.lang.gui.tt_sesstlt)
--         end

--         for id, data in pairs(FMI.data.itemData[itmIndex].session) do
--             if FMI.data.tooltips.session then -- show session
--                 table.insert(
--                     tt_text,
--                     string.format(
--                         FMI.lang.gui.tt_line,
--                         shortguild(id),
--                         numfmt(data.min),
--                         numfmt(data.max),
--                         numfmt(data.avg),
--                         numfmt(data.min * ((100 - FMI.data.undercutPerc) / 100))
--                     )
--                 )
--             end

--             if sess_bp == -1 or sess_bp < data.min then
--                 sess_bp = data.min
--                 sess_g = shortguild(id)
--             end

--             if sess_bb == -1 or sess_bb > data.min then
--                 sess_bb = data.min
--                 sess_gb = shortguild(id)
--             end
--         end
--     end

--     if next(FMI.data.itemData[itmIndex].history) ~= nil then
--         if FMI.data.tooltips.history then -- show history
--             table.insert(tt_text, FMI.lang.gui.tt_histtlt)
--         end

--         for id, data in pairs(FMI.data.itemData[itmIndex].history) do
--             if FMI.data.tooltips.history then -- show history
--                 table.insert(
--                     tt_text,
--                     string.format(
--                         FMI.lang.gui.tt_line,
--                         shortguild(id),
--                         numfmt(data.min),
--                         numfmt(data.max),
--                         numfmt(data.avg),
--                         numfmt(data.min * ((100 - FMI.data.undercutPerc) / 100))
--                     )
--                 )
--             end

--             if hist_bp == -1 or hist_bp < data.min then
--                 hist_bp = data.min
--                 hist_g = shortguild(id)
--             end

--             if hist_bb == -1 or hist_bb > data.min then
--                 hist_bb = data.min
--                 hist_gb = shortguild(id)
--             end
--         end
--     end

--     if FMI.data.tooltips.recommend then -- show recommendations
--         if (FMI.data.tooltips.history and hist_bp > -1) or (FMI.data.tooltips.session and sess_bp > -1) then
--             table.insert(tt_text, "-")
--         end

--         local qty = 1
--         local qty_lbl = FMI.lang.gui.tt_eachshort

--         if (itemData.stackCount ~= nil and itemData.stackCount > 1) then
--             qty = itemData.stackCount
--             qty_lbl = "" .. itemData.stackCount
--         end

--         if sess_bp > -1 then
--             table.insert(
--                 tt_text,
--                 string.format(
--                     FMI.lang.gui.tt_Sell,
--                     sess_g,
--                     numfmt(sess_bp * ((100 - FMI.data.undercutPerc) / 100) * qty),
--                     qty_lbl,
--                     FMI.lang.gui.tt_sessshort
--                 )
--             )
--         else
--             table.insert(
--                 tt_text,
--                 string.format(
--                     FMI.lang.gui.tt_Sell,
--                     hist_g,
--                     numfmt(hist_bp * ((100 - FMI.data.undercutPerc) / 100) * qty),
--                     qty_lbl,
--                     FMI.lang.gui.tt_histshort
--                 )
--             )
--         end

--         if sess_bb > -1 then
--             table.insert(
--                 tt_text,
--                 string.format(FMI.lang.gui.tt_Buy, sess_gb, numfmt(sess_bb * qty), qty_lbl, FMI.lang.gui.tt_sessshort)
--             )
--         else
--             table.insert(
--                 tt_text,
--                 string.format(FMI.lang.gui.tt_Buy, hist_gb, numfmt(hist_bb * qty), qty_lbl, FMI.lang.gui.tt_histshort)
--             )
--         end
--     end

--     if (FMI.data.tooltips.history and hist_bp > -1) or (FMI.data.tooltips.session and sess_bp > -1) then
--         --- key needed
--         table.insert(tt_text, "-")
--         table.insert(tt_text, FMI.lang.gui.tt_key)
--     end

--     return tt_text
-- end

-- ---------------------------------------- Event Handling ----------------------------------------------

-- SLASH_COMMANDS["/FMI"] = FMI.Command

-- ld_tooltip.additemtooltip("FMI_main", "|cFFF000Free My Inventory", FMI.SetTooltip)
