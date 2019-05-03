--Author      : LintyDruid
--Localisation Control

-- use English as the base
FMI.lang.sets.en()

function FMI.lang.Set(lang)
    local language ="en"

    if lang==nil or lang=="" or lang=="Auto" then
        language = GetCVar("language.2")
    elseif lang=="English" then
        language = "en"
    elseif lang=="Deutsch" then
        language = "de"
    elseif lang=="Français" then
        language = "fr"
    elseif lang=="Russian" then
        language = "ru"
    end

    if (language== nil or language=="en") then  -- No language or en
        FMI.lang.refresh()
        return;
    end

    if (language=="fr") then  -- fr
        FMI.lang.sets.fr()
        FMI.lang.refresh()
        return;
    end

    if (language=="de") then  -- de
        FMI.lang.sets.de()
        FMI.lang.refresh()
        return;
    end
    
    if (language=="ru") then  -- ru
        FMI.lang.sets.ru()
        FMI.lang.refresh()
        return;
    end

    FMI.lang.refresh()
end

function FMI.lang.refresh()
    FreeMyInventoryResetButton:SetText(FMI.lang.gui.reset_btn)
    FreeMyInventoryRetrieveButton:SetText(FMI.lang.gui.rtrv_btn)
    FreeMyInventoryContinueSearchButton:SetText(FMI.lang.gui.ctnu_btn)
    FreeMyInventoryFindMatchesButton:SetText(FMI.lang.gui.find_btn)
    FreeMyInventoryCloseButton:SetText(FMI.lang.gui.close_btn)
    FreeMyInventoryForLabel:SetText(FMI.lang.gui.searchfor_lbl)
    FreeMyInventoryGuildLabel:SetText(FMI.lang.gui.guild_lbl)
    FreeMyInventoryPriceHeader:SetText(FMI.lang.gui.col_price_hdr)
    FreeMyInventoryUnitPriceHeader:SetText(FMI.lang.gui.col_unit_hdr)
end