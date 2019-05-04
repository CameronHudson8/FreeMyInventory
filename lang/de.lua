function FMI.lang.sets.de()
	--- General Strings

	FMI.lang.core.addonName = "Free My Inventory"
	FMI.lang.core.coloredAddonName = "|c2080D0Free My Inventory|r"

	----Config------

	FMI.lang.config_filt_markdown_lbl = "Reduzire preise um (%)"
	FMI.lang.config_filt_markdown_tip =
		"Die Preisempfehlung f\195\188r ein kleineres Gebot wird um den hier konfigurierten Prozentwert reduziert."

	--- GUI -----------------

	FMI.lang.gui.reset_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/inventory/inventory_tabicon_junk_up.dds") ..
		"Zur\195\188cksetzen."
	FMI.lang.gui.rtrv_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_trade_up.dds") .. "Einlesen"
	FMI.lang.gui.ctnu_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_trade_up.dds") .. "Suche fortsetzen"
	FMI.lang.gui.find_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/lfg/lfg_tabicon_grouptools_up.dds") .. "Suchen"
	FMI.lang.gui.close_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_cancel_up.dds") .. "Schlie\195\159en"
	FMI.lang.gui.searchfor_lbl = "Suche nach:"
	FMI.lang.gui.guild_lbl = "In Gilde:"
	FMI.lang.gui.col_price_hdr = "Gesamt"
	FMI.lang.gui.col_unit_hdr = "St\195\188ck"

	FMI.lang.gui.main_cmd =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/lfg/lfg_tabicon_grouptools_up.dds") .. "Guild Store Search"
	--- Dynamics

	FMI.lang.gui.res_label = FMI.lang.core.icon_template .. " |cE0FFE0%s|r [|c%s%s|r]|cffff00 x %s|r" -- icon, guild no., color, name label, count
	FMI.lang.gui.res_price = "%s" .. FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_unitprice = "%s" .. FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_buy = FMI.lang.core.icon_gstorecoins .. "Gehe zu"
	FMI.lang.gui.res_buy_off = FMI.lang.core.icon_gstoreold .. "|ccc0000Alt|r" --added 0.06

	local working = string.format(FMI.lang.core.icon_template1, "/esoui/art/ava/ava_resourcestatus_tabicon_production.dds")
	local complete = string.format(FMI.lang.core.icon_template1, "/esoui/art/characterwindow/sigil_stamina.dds")

	FMI.lang.gui.searchpause = "N\195\164chste Seite in %s Sekunden..."
	FMI.lang.gui.searchproc = "Verarbeite Seite..."
	FMI.lang.gui.searchready = "|c00ff00Bereit zum Suchen.|r"

	FMI.lang.gui.search = working .. "Durchsuche Gilde |c00ffff%s|r, Seite |c00ffff%s|r" -- guild, page
	FMI.lang.gui.found = complete .. "|c00ffff%s|r Gegenst\195\164nde in Gilde |c00ffff%s|r gefunden." -- items, guild
	FMI.lang.gui.retrv = working .. "Lese Gilde |c00ffff%s|r, Seite |c00ffff%s|r ein." -- guild, page
	FMI.lang.gui.foundall = complete .. "|c00ffff%s|r Gegenst\195\164nde in allen |c00ffffGilden|r gefunden." -- items
	FMI.lang.gui.searchStarte = working .. "Beginne Suche..."
	FMI.lang.gui.searchBusy =
		working .. "|cff0000Guild Store Search Ex ist gerade mit einer anderen Suche besch\195\164ftigt, bitte warten."
	FMI.lang.gui.searchNoGS =
		FMI.lang.core.icon_gstoreold .. "|cff0000Der Gildenladen muss geöffnet sein um eingelesen zu werden.."

	FMI.lang.gui.noTradingGuilds = "|cff0000Es gibt keine Gildenl\195\164den!|r"
	FMI.lang.gui.notATradingGuild = "|cff0000Gilde %s besitzt keinen Gildenladen!|r"

	FMI.lang.gui.guild_all = "|c00cc00Alle"
	FMI.lang.gui.guild_templ = "G%s: %s%s" --Guild Num, color, Guild Name

	FMI.lang.gui.search_summ =
		"%s \195\156bereinstimmungen. St\195\188ckpreis (Max/Min/Avg/Unterbieten):|cff0000%s|r/|cff8000%s|r/|cfff000%s|r/|c00ff00%s|r%s" -- Max, Min, Avg, Undercut, Sell for price

	FMI.lang.gui.search_summsell = ". Verkaufe |cff00ff%s|r @ |cffc000%sg.|r"

	-- Config
	FMI.lang.config.gen_dbg_lbl = "Debug Modus?"
	FMI.lang.config.gen_dbg_tip = "Zeige debug Meldungen?"
	FMI.lang.config.gen_dbg_warn = "Hierdurch wird viel Text im Chatfenster ausgegeben!"

	FMI.lang.config.tooltip_hdr = "Tooltips" --added 0.06
	FMI.lang.config.tooltip_desc = "Diese Einstellungen konfigurieren, was in den Tooltips angezeit werden soll." --added 0.06
	FMI.lang.config.tooltip_session_lbl = "Zusammenfassung der Spielsitzung?" --added 0.06
	FMI.lang.config.tooltip_session_tip =
		"Wird diese Einstellung aktiviert, so wird eine Zusammenfassung der Verkaufsdaten der Gegenst\195\164nde aus dieser Spielsitzung angezeigt. Diese Daten werden auf die Gilden heruntergebrochen." --added 0.06
	FMI.lang.config.tooltip_history_lbl = "Zusammenfassung der Historie?" --added 0.06
	FMI.lang.config.tooltip_history_tip =
		"Wird diese Einstellung aktiviert, so wird eine Zusammenfassung der Verkaufsdaten der Gegenst\195\164nde aller Spielsitzungen und Charaktere angezeigt. Diese Daten werden auf die Gilden heruntergebrochen." --added 0.06
	FMI.lang.config.tooltip_recom_lbl = "Empfehlungen?" --added 0.06
	FMI.lang.config.tooltip_recom_tip =
		"Wird diese Einstellung aktiviert, wird eine Empfehlung angezeigt, wo und f\195\188r wie viel ein Gegenstand am besten zu Kaufenw oder Verkaufen w\195\164re." --added 0.06

	--- Tooltips

	FMI.lang.gui.tt_line =
		"%s: |cff0000%s" ..
		FMI.lang.core.icon_gold ..
			"|r/|cff8000%s" ..
				FMI.lang.core.icon_gold ..
					"|r/|cfff000%s" .. FMI.lang.core.icon_gold .. "|r/|c00ff00%s" .. FMI.lang.core.icon_gold .. "|r" -- guild, Max, Min, Avg, Undercut -added 0.06
	FMI.lang.gui.tt_key = "Legende: |cff0000Min|r/|cff8000Max|r/|cfff000Avg|r/|c00ff00Unterbieten|r" --added 0.06
	FMI.lang.gui.tt_all = "Alle" --added 0.06
	FMI.lang.gui.tt_NoHistory = "Keine Historie gefunden." --added 0.06
	FMI.lang.gui.tt_Sell =
		"|c00FFFFVerkaufe|r in |c008000%s|r f\195\188r |c00ff00%s|r" ..
		FMI.lang.core.icon_gold .. " [|cFF80FF%s|r] (|c00FFFF%s|r)"
	--added 0.06 - guild, price, qty, source
	FMI.lang.gui.tt_Buy =
		"|c00FFFFKaufe|r bei |c008000%s|r f\195\188r |c00ff00%s|r" ..
		FMI.lang.core.icon_gold .. " [|cFF80FF%s|r] (|c00FFFF%s|r)"
	--added 0.06 - guild, price, qty, source
	FMI.lang.gui.tt_sesstlt = "|c00FFFFDiese Spielsitzung" --added 0.06
	FMI.lang.gui.tt_histtlt = "|c00FFFFHistorie" --added 0.06
	FMI.lang.gui.tt_histshort = "hist" --added 0.06
	FMI.lang.gui.tt_sessshort = "sitz" --added 0.06
	FMI.lang.gui.tt_eachshort = "st\195\188ck" --added 0.06

	FMI.lang.core.cmdHelp = {}
	FMI.lang.core.cmdHelp[1] = "FMI Kommandozeile:" --added 0.06
	FMI.lang.core.cmdHelp[2] = "  - /FMI show || /FMI on - Zeige das FMI Fenster." --added 0.06
	FMI.lang.core.cmdHelp[3] = "  - /FMI hide || /FMI off  - Verberge das FMI Fenster." --added 0.06
end
