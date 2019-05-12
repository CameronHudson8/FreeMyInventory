--[[ global ]] FreeMyInventory = FreeMyInventory or {}

local defaultSavedData = {
    window = {
        x = 0,
        y = 0
    },
    undercutPerc = 5,
    showdebug = false,
    language = "Auto",
    tooltips = {
        session = true,
        history = true,
        recommend = true
    },
    lastSearchRequest = {}
}

FreeMyInventory.defaultSavedData = defaultSavedData
