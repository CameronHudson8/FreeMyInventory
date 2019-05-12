--[[ global ]] FreeMyInventory = FreeMyInventory or {}

local upgradeSavedData = {
    showdebug = false,
    tooltips = {
        session = true,
        history = true,
        recommend = true
    },
    search_results = {},
    last_search = "",
    language = "Auto"
}

FreeMyInventory.upgradeSavedData = upgradeSavedData
