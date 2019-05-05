FreeMyInventory = FreeMyInventory or {}

local configuration = FreeMyInventory.configuration

-- No d() statements will appear if they are called in this function.
-- To show d() statements on startup, put them in the confirmStartup function.
local onAddOnLoaded = function(event, addonName)
    if addonName ~= FreeMyInventory.name then
        return
    end

    EVENT_MANAGER:UnregisterForEvent(FMI.name, EVENT_ADD_ON_LOADED)

    -- --	Load saved vars
    -- FMI.data = ZO_SavedVars:NewAccountWide("FMI_data", 1, nil, FMI.defaults, nil)

    -- -- Data Clean-up/Upgrade
    -- FMI.upgradeData()
    -- FMI.lang.Set(FMI.data.language) --- Initialise Locale
    -- --d(type(FMI))
    -- --d(type(FMI.data))
    -- --d(type(FMI.data.window)) --not nil (table)

    -- FMI.config.create() -- config window
    -- --d(type(FMI))
    -- --d(type(FMI.data))
    -- --d(type(FMI.data.window)) --nil??

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

    -- FMI.ClearSessionData()

    -- FMI.SetCanContinueSearch()

    -- FreeMyInventoryFindMatchesButton:SetHidden(false)
end

FreeMyInventory.onAddOnLoaded = onAddOnLoaded
