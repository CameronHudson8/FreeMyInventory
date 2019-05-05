FreeMyInventory = FreeMyInventory or {}

----- Declare Core Data/Objects

local configuration = {
    name = "Free My Inventory",
    State = "NONE",
    ResultControls = {},
    ResultsSlider = nil,
    StoreItems = {},
    SearchMatches = {},
    Terms = nil,
    CurrentGuildIndex = 1,
    Guilds = {},
    dropDownInit = false,
    last_search_count = 0,
    language_options = {"Auto", "English", "Deutsch", "Français", "Russian"},
    Version = "0.15b",
    Author = "Kronn8/lintydruid/Sephiroth08/tridman/dOpiate",
    data = {
        window = {x = 0, y = 0},
        undercutPerc = 5, -- Undercut Percentage
        itemData = {},
        tooltips = {session = true, history = true, recommend = true},
        search_results = {},
        last_search = "",
        language = "Auto",
        lastSearchRequest = {}
    },
    utils = {},
    -- Declare Locale Control
    lang = {
        sets = {},
        core = {},
        gui = {},
        config = {}
    },
    defaults = {
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
}

FreeMyInventory.configuration = configuration
