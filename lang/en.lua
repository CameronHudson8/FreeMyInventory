function FMI.lang.sets.en()
	---Icon Strings
	FMI.lang.core.icon_template = "|t16:16:%s|t" --- icon path
	FMI.lang.core.icon_template1 = "|t32:32:%s|t" --- icon path
	FMI.lang.core.icon_template2 = "|t8:8:%s|t" --- icon path

	FMI.lang.core.icon_gold = string.format(FMI.lang.core.icon_template, "EsoUI/Art/currency/currency_gold.dds")
	FMI.lang.core.icon_gstorecoins =
		string.format(FMI.lang.core.icon_template, "/esoui/art/guild/guild_tradinghouseaccess.dds")
	FMI.lang.core.icon_gstoreold = string.format(FMI.lang.core.icon_template, "/esoui/art/buttons/edit_cancel_down.dds")

	--- General Strings

	FMI.lang.core.addonName = "Free My Inventory"
	FMI.lang.core.coloredAddonName = "|c2080D0Free My Inventory|r" --added 0.11

	----Config------

	FMI.lang.config_filt_markdown_lbl = "Discount items by (%)"
	FMI.lang.config_filt_markdown_tip = "The recommended undercut price will be reduced by the percentage set here."

	--- GUI -----------------

	FMI.lang.gui.reset_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/inventory/inventory_tabicon_junk_up.dds") .. "Reset"
	FMI.lang.gui.rtrv_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_trade_up.dds") .. "Retrieve"
	FMI.lang.gui.ctnu_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_trade_up.dds") .. "Continue last search"
	FMI.lang.gui.find_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/lfg/lfg_tabicon_grouptools_up.dds") .. "Find Match"
	FMI.lang.gui.close_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_cancel_up.dds") .. "Close"
	FMI.lang.gui.searchfor_lbl = "Search For:"
	FMI.lang.gui.guild_lbl = "From Guild:"
	FMI.lang.gui.col_price_hdr = "Total"
	FMI.lang.gui.col_unit_hdr = "Each"

	FMI.lang.gui.main_cmd =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/lfg/lfg_tabicon_grouptools_up.dds") .. "Guild Store Search"
	--- Dynamics

	FMI.lang.gui.res_label = FMI.lang.core.icon_template .. " |cE0FFE0%s|r [|c%s%s|r]|cffff00 x %s|r" -- icon, guild no., color, name label, count
	FMI.lang.gui.res_price = "%s" .. FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_unitprice = "%s" .. FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_buy = FMI.lang.core.icon_gstorecoins .. "Show"
	FMI.lang.gui.res_buy_off = FMI.lang.core.icon_gstoreold .. "|ccc0000Old|r" --added 0.06

	local working = string.format(FMI.lang.core.icon_template1, "/esoui/art/ava/ava_resourcestatus_tabicon_production.dds")
	local complete = string.format(FMI.lang.core.icon_template1, "/esoui/art/characterwindow/sigil_stamina.dds")

	FMI.lang.gui.searchpause = "Getting next page in %s seconds..."
	FMI.lang.gui.searchproc = "Processing page..."
	FMI.lang.gui.searchready = "|c00ff00Ready to search.|r"

	FMI.lang.gui.search = working .. "Searching Guild |c00ffff%s|r, page |c00ffff%s|r" -- guild, page
	FMI.lang.gui.found = complete .. "Found |c00ffff%s|r items from Guild |c00ffff%s|r" -- items, guild
	FMI.lang.gui.retrv = working .. "Retrieving from Guild |c00ffff%s|r, page |c00ffff%s|r" -- guild, page
	FMI.lang.gui.foundall = complete .. "Found |c00ffff%s|r items from all |c00ffffguilds|r " -- items
	FMI.lang.gui.searchStarte = working .. "Starting Search..."
	FMI.lang.gui.searchBusy = working .. "|cff0000Guild Store Search Ex is busy searching, please wait."
	FMI.lang.gui.searchNoGS = FMI.lang.core.icon_gstoreold .. "|cff0000Guild Store must be open to retrieve results."

	FMI.lang.gui.noTradingGuilds = "|cff0000There are no guild stores!|r"
	FMI.lang.gui.notATradingGuild = "|cff0000Guild %s does not have a guild store!|r"

	FMI.lang.gui.guild_all = "|c00cc00All"
	FMI.lang.gui.guild_templ = "G%s: %s%s" --Guild Num, color, Guild Name

	FMI.lang.gui.search_summ =
		"%s matches. Unit Price (Max/Min/Avg/Undercut):|cff0000%s|r/|cff8000%s|r/|cfff000%s|r/|c00ff00%s|r%s" -- Max, Min, Avg, Undercut, Sell for price

	FMI.lang.gui.search_summsell = ". Sell |cff00ff%s|r @ |cffc000%sg.|r"

	-- Config
	FMI.lang.config.gen_hdr = "General settings" --added 0.11
	FMI.lang.config.gen_dbg_lbl = "Debug Mode?"
	FMI.lang.config.gen_dbg_tip = "Display debug messages?"
	FMI.lang.config.gen_dbg_warn = "This will place lots of text in your chat window!"

	FMI.lang.config.tooltip_hdr = "Tooltips" --added 0.06
	FMI.lang.config.tooltip_desc = "These setting configure what data is shown in item tooltips." --added 0.06
	FMI.lang.config.tooltip_session_lbl = "Show session summary?" --added 0.06
	FMI.lang.config.tooltip_session_tip =
		"If on, this will show a summary of the item sale data found for the item in the current session.  This data is broken down by guild." --added 0.06
	FMI.lang.config.tooltip_history_lbl = "Show history summary?" --added 0.06
	FMI.lang.config.tooltip_history_tip =
		"If on, this will show a summary of the item sale data found for the item across all sessions/characters.  This data is broken down by guild." --added 0.06
	FMI.lang.config.tooltip_recom_lbl = "Show recommendations?" --added 0.06
	FMI.lang.config.tooltip_recom_tip = "If on, a recommendation of where and how much to sell and buy and item for." --added 0.06

	FMI.lang.config.lang_lbl = "Language" --added 0.09
	FMI.lang.config.lang_tip = "Select the language to be used. 'Auto' will use the language detected in the game." --added 0.09
	FMI.lang.config.lang_warn = "You must logout or reload the UI (/reloadui) for this setting to be applied." --added 0.09

	--- Tooltips

	FMI.lang.gui.tt_line =
		"%s: |cff0000%s" ..
		FMI.lang.core.icon_gold ..
			"|r/|cff8000%s" ..
				FMI.lang.core.icon_gold ..
					"|r/|cfff000%s" .. FMI.lang.core.icon_gold .. "|r/|c00ff00%s" .. FMI.lang.core.icon_gold .. "|r" -- guild, Max, Min, Avg, Undercut -added 0.06
	FMI.lang.gui.tt_key = "Key: |cff0000Min|r/|cff8000Max|r/|cfff000Avg|r/|c00ff00Undercut|r" --added 0.06
	FMI.lang.gui.tt_all = "All" --added 0.06
	FMI.lang.gui.tt_NoHistory = "No history found." --added 0.06
	FMI.lang.gui.tt_Sell =
		"|c00FFFFSell|r in |c008000%s|r for |c00ff00%s|r" .. FMI.lang.core.icon_gold .. " [|cFF80FF%s|r] (|c00FFFF%s|r)"
	--added 0.06 - guild, price, qty, source
	FMI.lang.gui.tt_Buy =
		"|c00FFFFBuy|r from |c008000%s|r for |c00ff00%s|r" .. FMI.lang.core.icon_gold .. " [|cFF80FF%s|r] (|c00FFFF%s|r)"
	--added 0.06 - guild, price, qty, source
	FMI.lang.gui.tt_sesstlt = "|c00FFFFThis Session" --added 0.06
	FMI.lang.gui.tt_histtlt = "|c00FFFFHistorical" --added 0.06
	FMI.lang.gui.tt_histshort = "hist" --added 0.06
	FMI.lang.gui.tt_sessshort = "sess" --added 0.06
	FMI.lang.gui.tt_eachshort = "ea." --added 0.06

	FMI.lang.core.cmdHelp = {}
	FMI.lang.core.cmdHelp[1] = "FMI command lines:" --added 0.06
	FMI.lang.core.cmdHelp[2] = "  - /FMI show || /FMI on - show the FMI window." --added 0.06
	FMI.lang.core.cmdHelp[3] = "  - /FMI hide || /FMI off  - hide the FMI window." --added 0.06
end

ZO_CreateStringId("SI_BINDING_NAME_FMI_TOGGLE", "Show/Hide GSEE")
