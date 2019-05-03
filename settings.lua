FMI.config = {}

function FMI.config.create()
    local lam2 = LibStub:GetLibrary("LibAddonMenu-2.0")
    
    local panelIdentifier = "FMIpanel"
    
    local settingsPanel = {
        type = "panel",
        name = FMI.lang.core.addonName,
        displayName = FMI.lang.core.coloredAddonName,
        author = FMI.Author,
        version = FMI.Version,
        registerForRefresh = true,
        registerForDefaults = true,
    }
    
    local settingsMenu = {
        [1] = {
            type = "header",
            name = FMI.lang.config.gen_hdr,
            width = "full"
        },
        [2] = {
            type = "checkbox",
            name = FMI.lang.config.gen_dbg_lbl,
            tooltip = FMI.lang.config.gen_dbg_tip,
            getFunc = FMI.config.getDebug,
            setFunc = FMI.config.setDebug,
            width = "full",
            warning = FMI.lang.config.gen_dbg_warn,
            default = FMI.defaults.showdebug,
        },
        [3] = {
            type = "slider",
            name = FMI.lang.config_filt_markdown_lbl,
            tooltip = FMI.lang.config_filt_markdown_tip,
            min = 0,
            max = 99,
            step = 1,
            getFunc = FMI.config.getMarkdown,
            setFunc = FMI.config.setMarkdown,
            default = FMI.defaults.undercutPerc,
        },
        [4] = {
            type = "dropdown",
            name = FMI.lang.config.lang_lbl,
            tooltip = FMI.lang.config.lang_tip,
            choices = FMI.language_options,
            getFunc = FMI.config.getLang,
            setFunc = FMI.config.setLang,
            warning = FMI.lang.config.lang_warn,
            default = FMI.defaults.language
        },
        [5] = {
            type = "header",
            name = FMI.lang.config.tooltip_hdr,
            width = "full"
        },
        [6] = {
            type = "description",
            text = FMI.lang.config.tooltip_desc,
            width = "full"
        },
        [7] = {
            type = "checkbox",
            name = FMI.lang.config.tooltip_session_lbl,
            tooltip = FMI.lang.config.tooltip_session_tip,
            getFunc = FMI.config.getSess,
            setFunc = FMI.config.setSess,
            width = "full",
            default = FMI.defaults.tooltips.session,
        },
        [8] = {
            type = "checkbox",
            name = FMI.lang.config.tooltip_history_lbl,
            tooltip = FMI.lang.config.tooltip_history_tip,
            getFunc = FMI.config.getHist,
            setFunc = FMI.config.setHist,
            width = "full",
            default = FMI.defaults.tooltips.history,
        },
        [9] = {
            type = "checkbox",
            name = FMI.lang.config.tooltip_recom_lbl,
            tooltip = FMI.lang.config.tooltip_recom_tip,
            getFunc = FMI.config.getRecom,
            setFunc = FMI.config.setRecom,
            width = "full",
            default = FMI.defaults.tooltips.recommend,
        },
    }
    
    lam2:RegisterAddonPanel(panelIdentifier, settingsPanel)
    lam2:RegisterOptionControls(panelIdentifier, settingsMenu)
	
end

----Dummy
function FMI.config.getDummy()
end
function FMI.config.setDummy(value)
end

---- GS Update lang
function  FMI.config.getLang()
    return FMI.data.language
end

function FMI.config.setLang(value)
    FMI.data.language=value
end

---- Mark Down
function  FMI.config.getMarkdown()
    return FMI.data.undercutPerc
end

function FMI.config.setMarkdown(value)
    FMI.data.undercutPerc=value
end

---- Manage debug
function FMI.config.getDebug()
    return FMI.data.showdebug
end

function FMI.config.setDebug(value)
    FMI.data.showdebug=value
end

---- Manage Session Tooltip
function FMI.config.getSess()
    return FMI.data.tooltips.session
end

function FMI.config.setSess(value)
    FMI.data.tooltips.session=value
end

---- Manage History Tooltip
function FMI.config.getHist()
    return FMI.data.tooltips.history
end

function FMI.config.setHist(value)
    FMI.data.tooltips.history=value
end

---- Manage Recommendation Tooltip
function FMI.config.getRecom()
    return FMI.data.tooltips.recommend
end

function FMI.config.setRecom(value)
    FMI.data.tooltips.recommend=value
end
