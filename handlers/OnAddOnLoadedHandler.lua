--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local addOnName = FreeMyInventory.addOnName
local AbstractHandler = FreeMyInventory.AbstractHandler
local SavedDataLoader = FreeMyInventory.SavedDataLoader
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
-- To show d() statements on startup, put them in the confirmStartup function.
function OnAddOnLoadedHandler.handler(event, loadedAddOnName)
    if loadedAddOnName ~= addOnName then
        return
    end
    EVENT_MANAGER:UnregisterForEvent(addOnName, EVENT_ADD_ON_LOADED)

    SavedDataLoader.load()
    SavedDataLoader.upgrade()

    -- TODO Check and refactor from here down

    -- Initialise Locale
    -- TODO This may not be necessary anymore
    -- FreeMyInventory.lang.Set(FreeMyInventory.data.language)

    -- config window
    -- TODO This may not be necessary anymore
    -- FreeMyInventory.config.create()

    -- --Window Co-ord Managment
    -- FreeMyInventory:SetHandler("OnMoveStop", FMI.SetFrameCoords)
    -- FreeMyInventory:SetAnchor(CENTER, GuiRoot, CENTER, FMI.data.window.x, FMI.data.window.y)
    -- FreeMyInventory:SetMovable(true)

    -- --Main Init
    -- if #FMI.ResultControls == 0 then
    --     local resultLineOffsetX = 0
    --     local resultLineOffsetY = 0

    --     for i = 1, 10 do
    --         local control =
    --             CreateControlFromVirtual("FreeMyInventoryResult", FreeMyInventoryResultsBG, "FreeMyInventoryResult", i)
    --         control:SetSimpleAnchorParent(resultLineOffsetX, resultLineOffsetY + ((control:GetHeight() + 2) * (i - 1)))
    --         control:SetText(i .. ":")

    --         FMI.ResultControls[i] = control
    --     end

    --     local bg = CreateControlFromVirtual("FreeMyInventoryEditBg", FreeMyInventory, "ZO_EditBackdrop")
    --     bg:SetParent(FreeMyInventory)
    --     bg:SetDimensions(300, 28)
    --     bg:SetSimpleAnchorParent(FreeMyInventory:GetNamedChild("ForLabel"):GetWidth(), 5)

    --     FreeMyInventoryTerms = CreateControlFromVirtual("FreeMyInventoryTerms", bg, "ZO_DefaultEditForBackdrop")
    --     FreeMyInventoryTerms:SetParent(bg)
    --     FreeMyInventoryTerms:SetDimensions(300, 28)
    --     FreeMyInventoryTerms:SetResizeToFitDescendents(false)
    --     FreeMyInventoryTerms:SetMouseEnabled(true)
    --     FreeMyInventoryTerms:SetText("")
    --     FreeMyInventoryTerms:SetHandler("OnMouseDoubleClick", FMI.GetCurrentSellName) -----  Added by LintyDruid

    --     local gdd = CreateControlFromVirtual("FreeMyInventoryGuildCombo", FreeMyInventory, "FreeMyInventoryDropdown")
    --     gdd:SetDimensions(300, 28)
    --     gdd:SetSimpleAnchorParent(FreeMyInventory:GetNamedChild("GuildLabel"):GetWidth(), bg:GetHeight() + 10)

    --     FreeMyInventoryResultsBG:SetMouseEnabled(true)
    --     FreeMyInventoryResultsBG:SetHandler("OnMouseWheel", FMI.OnSliderMouseWheel)

    --     FMI.ResultsSlider = FMI.CreateSlider("FreeMyInventorySlider", FreeMyInventory)
    --     FMI.ResultsSlider:SetAnchor(LEFT, FreeMyInventoryResultsBG, RIGHT, 0, 0)
    --     FMI.ResultsSlider:SetHandler("OnValueChanged", FMI.OnSliderMoved)

    --     local pane = ZO_TradingHouseMenuBar

    --     local toggleButton = CreateControlFromVirtual("FreeMyInventoryToggleButton", pane, "ZO_DefaultButton")
    --     toggleButton:SetAnchor(BOTTOM, pane, TOPLEFT, left, top)
    --     toggleButton:SetDimensions(195, 31)
    --     toggleButton:SetHidden(false)
    --     toggleButton:SetFont("ZoFontGameBold")
    --     toggleButton:SetText(FMI.lang.gui.main_cmd)
    --     toggleButton:SetHandler(
    --         "OnMouseDown",
    --         function()
    --             FMI.PopulateGuildList()
    --             FMI.GuildStoreSearchToggle()
    --         end
    --     )
    -- end

    -- FMI.Reset()

    -- TODO Determine whether this function is still necessary
    OnAddOnLoadedHandler.clearSessionData(FreeMyInventory.data)

    -- FMI.SetCanContinueSearch()

    -- FreeMyInventoryFindMatchesButton:SetHidden(false)
    FreeMyInventory.addOnLoaded = true
end

-- TODO Determine whether this function is still necessary
function OnAddOnLoadedHandler.clearSessionData(data)
    ---Reset Session data
    for id, itemData in pairs(data.itemData) do
        for gname, value in pairs(data.itemData[id].session) do
            data.itemData[id].session[gname] = nil
        end
    end

    -- clean up save search data
    for index, value in pairs(data.search_results) do
        data.search_results[index][10] = -1 --- set page ref to -1
    end
end

FreeMyInventory.OnAddOnLoadedHandler = OnAddOnLoadedHandler
