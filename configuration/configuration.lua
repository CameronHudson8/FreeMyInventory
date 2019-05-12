--[[ global ]] FreeMyInventory = FreeMyInventory or {}

----- Declare Core Data/Objects

local configuration = {
    Author = "Kronn8",
    CurrentGuildIndex = 1,
    data = {
        window = {x = 0, y = 0},
        undercutPerc = 5, -- Undercut Percentage
        itemData = {
            [1] = {
                session = {}
            }
        },
        tooltips = {session = true, history = true, recommend = true},
        search_results = {},
        last_search = "",
        language = "Auto",
        lastSearchRequest = {}
    },
    dropDownInit = false,
    Guilds = {},
    -- Declare Locale Control
    lang = {
        sets = {},
        core = {},
        gui = {},
        config = {}
    },
    language_options = {"Auto", "English", "Deutsch", "Français", "Russian"},
    last_search_count = 0,
    addOnName = "FreeMyInventory",
    ResultControls = {},
    ResultsSlider = nil,
    SearchMatches = {},
    State = "NONE",
    StoreItems = {},
    Terms = nil,
    utils = {},
    Version = "0.15b"
}

for key, value in pairs(configuration) do
    assert(FreeMyInventory[key] == nil, "A value for FreeMyInventory." .. key .. " already exists")
    FreeMyInventory[key] = value
end
