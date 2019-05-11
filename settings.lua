FreeMyInventory = FreeMyInventory or {}

-- Import other stuff (from configuration\configuration.lua)
local lang = FreeMyInventory.lang
local author = FreeMyInventory.Author
local version = FreeMyInventory.Version
local config = FreeMyInventory.config
local defaultSavedData = FreeMyInventory.defaultSavedData
local language_options = FreeMyInventory.language_options
local data = FreeMyInventory.data

-- Be careful: There is another file (and associated property) called "configuration".
local config = {
    create = function()
        local lam2 = LibStub:GetLibrary("LibAddonMenu-2.0")

        local panelIdentifier = "FMIpanel"

        local settingsPanel = {
            type = "panel",
            name = lang.core.addonName,
            displayName = lang.core.coloredAddonName,
            author = author,
            version = version,
            registerForRefresh = true,
            registerForDefaults = true
        }

        local settingsMenu = {
            [1] = {
                type = "header",
                name = lang.config.gen_hdr,
                width = "full"
            },
            [2] = {
                type = "checkbox",
                name = lang.config.gen_dbg_lbl,
                tooltip = lang.config.gen_dbg_tip,
                getFunc = config.getDebug,
                setFunc = config.setDebug,
                width = "full",
                warning = lang.config.gen_dbg_warn,
                default = defaults.showdebug
            },
            [3] = {
                type = "slider",
                name = lang.config_filt_markdown_lbl,
                tooltip = lang.config_filt_markdown_tip,
                min = 0,
                max = 99,
                step = 1,
                getFunc = config.getMarkdown,
                setFunc = config.setMarkdown,
                default = defaults.undercutPerc
            },
            [4] = {
                type = "dropdown",
                name = lang.config.lang_lbl,
                tooltip = lang.config.lang_tip,
                choices = language_options,
                getFunc = config.getLang,
                setFunc = config.setLang,
                warning = lang.config.lang_warn,
                default = defaults.language
            },
            [5] = {
                type = "header",
                name = lang.config.tooltip_hdr,
                width = "full"
            },
            [6] = {
                type = "description",
                text = lang.config.tooltip_desc,
                width = "full"
            },
            [7] = {
                type = "checkbox",
                name = lang.config.tooltip_session_lbl,
                tooltip = lang.config.tooltip_session_tip,
                getFunc = config.getSess,
                setFunc = config.setSess,
                width = "full",
                default = defaults.tooltips.session
            },
            [8] = {
                type = "checkbox",
                name = lang.config.tooltip_history_lbl,
                tooltip = lang.config.tooltip_history_tip,
                getFunc = config.getHist,
                setFunc = config.setHist,
                width = "full",
                default = defaults.tooltips.history
            },
            [9] = {
                type = "checkbox",
                name = lang.config.tooltip_recom_lbl,
                tooltip = lang.config.tooltip_recom_tip,
                getFunc = config.getRecom,
                setFunc = config.setRecom,
                width = "full",
                default = defaults.tooltips.recommend
            }
        }

        lam2:RegisterAddonPanel(panelIdentifier, settingsPanel)
        lam2:RegisterOptionControls(panelIdentifier, settingsMenu)
    end,
    ----Dummy
    getDummy = function()
    end,
    setDummy = function(value)
    end,
    ---- GS Update lang
    getLang = function()
        return data.language
    end,
    setLang = function(value)
        data.language = value
    end,
    ---- Mark Down
    getMarkdown = function()
        return data.undercutPerc
    end,
    setMarkdown = function(value)
        data.undercutPerc = value
    end,
    ---- Manage debug
    getDebug = function()
        return data.showdebug
    end,
    setDebug = function(value)
        data.showdebug = value
    end,
    ---- Manage Session Tooltip
    getSess = function()
        return data.tooltips.session
    end,
    setSess = function(value)
        data.tooltips.session = value
    end,
    ---- Manage History Tooltip
    getHist = function()
        return data.tooltips.history
    end,
    setHist = function(value)
        data.tooltips.history = value
    end,
    ---- Manage Recommendation Tooltip
    getRecom = function()
        return data.tooltips.recommend
    end,
    setRecom = function(value)
        data.tooltips.recommend = value
    end
}

FreeMyInventory.config = config
