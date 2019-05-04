function FMI.lang.sets.ru()
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

	FMI.lang.config_filt_markdown_lbl = "Càpocèòö œeîó îa (%)"
	FMI.lang.config_filt_markdown_tip = "Peêoíeîäoáaîîaü œeîa àóäeò cîèæeîa îa ïpoœeîò, óêaçaîîÿé çäecö."

	--- GUI -----------------

	FMI.lang.gui.reset_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/inventory/inventory_tabicon_junk_up.dds") .. "Càpocèòö"
	FMI.lang.gui.rtrv_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_trade_up.dds") .. "Çaïpocèòö"
	FMI.lang.gui.ctnu_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_trade_up.dds") .. "Ïpoäoìæèòö ïocìeäîèé ïoècê"
	FMI.lang.gui.find_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/lfg/lfg_tabicon_grouptools_up.dds") .. "Îaéòè coáïaäeîèü"
	FMI.lang.gui.close_btn =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/hud/radialicon_cancel_up.dds") .. "Çaêpÿòö"
	FMI.lang.gui.searchfor_lbl = "Ècêaòö:"
	FMI.lang.gui.guild_lbl = "Âèìöäèü:"
	FMI.lang.gui.col_price_hdr = "Áceâo"
	FMI.lang.gui.col_unit_hdr = "Êaæäÿé"

	FMI.lang.gui.main_cmd =
		string.format(FMI.lang.core.icon_template1, "/esoui/art/lfg/lfg_tabicon_grouptools_up.dds") .. "Ïoècê ïo íaâaçèîó"
	--- Dynamics

	FMI.lang.gui.res_label = FMI.lang.core.icon_template .. " |cE0FFE0%s|r [|c%s%s|r]|cffff00 x %s|r" -- icon, guild no., color, name label, count
	FMI.lang.gui.res_price = "%s" .. FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_unitprice = "%s" .. FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_buy = FMI.lang.core.icon_gstorecoins .. "Ïoêaçaòö"
	FMI.lang.gui.res_buy_off = FMI.lang.core.icon_gstoreold .. "|ccc0000Old|r" --added 0.06

	local working = string.format(FMI.lang.core.icon_template1, "/esoui/art/ava/ava_resourcestatus_tabicon_production.dds")
	local complete = string.format(FMI.lang.core.icon_template1, "/esoui/art/characterwindow/sigil_stamina.dds")

	FMI.lang.gui.searchpause = "Ïoìóùeîèe cìeäóôûeé còpaîèœÿ ùepeç %s ceê..."
	FMI.lang.gui.searchproc = "Oàpaàoòêa còpaîèœ..."
	FMI.lang.gui.searchready = "|c00ff00Âoòoáo ê ïoècêó.|r"

	FMI.lang.gui.search = working .. "Ïoècê á âèìöäèè |c00ffff%s|r, còpaîèœa |c00ffff%s|r" -- guild, page
	FMI.lang.gui.found = complete .. "Îaéäeîo |c00ffff%s|r ïpeäíeòoá á âèìöäèè |c00ffff%s|r" -- items, guild
	FMI.lang.gui.retrv = working .. "Çaïpoc èç âèìöäèè |c00ffff%s|r, còpaîèœa |c00ffff%s|r" -- guild, page
	FMI.lang.gui.foundall = complete .. "Îaéäeîo |c00ffff%s|r ïpeäíeòoá á âèìöäèüx |c00ffffguilds|r " -- items
	FMI.lang.gui.searchStarte = working .. "Çaïócê ïoècêa..."
	FMI.lang.gui.searchBusy = working .. "|cff0000Guild Store Search Ex çaîüò ïoècêoí, ïoæaìóécòa, ïoäoæäèòe."
	FMI.lang.gui.searchNoGS =
		FMI.lang.core.icon_gstoreold .. "|cff0000Âèìöäeécèêé íaâaçèî äoìæeî àÿòö oòêpÿò äìü çaïpoca peçóìöòaòoá."

	FMI.lang.gui.noTradingGuilds = "|cff0000Îeò âèìöäeécêoâo íaâaçèîa!|r"
	FMI.lang.gui.notATradingGuild = "|cff0000Âèìöäèü %s îe èíeeò íaâaçèîa|r"

	FMI.lang.gui.guild_all = "|c00cc00Áce"
	FMI.lang.gui.guild_templ = "G%s: %s%s" --Guild Num, color, Guild Name

	FMI.lang.gui.search_summ =
		"%s coáïaäeîèé. Œeîa eäèîèœÿ (Íaêc/Íèî/Cpeä/Cêèä):|cff0000%s|r/|cff8000%s|r/|cfff000%s|r/|c00ff00%s|r%s" -- Max, Min, Avg, Undercut, Sell for price

	FMI.lang.gui.search_summsell = ". Sell |cff00ff%s|r @ |cffc000%sg.|r"

	-- Config
	FMI.lang.config.gen_hdr = "Oàûèe îacòpoéêè" --added 0.11
	FMI.lang.config.gen_dbg_lbl = "Debug-peæèí?"
	FMI.lang.config.gen_dbg_tip = "Ïoêaçÿáaòö debug-cooàûeîèü?"
	FMI.lang.config.gen_dbg_warn = "Ëòoò òeêcò çaéíeò íîoâo íecòa á áaúeí ùaòe!"

	FMI.lang.config.tooltip_hdr = "Ïoäcêaçêè" --added 0.06
	FMI.lang.config.tooltip_desc = "Ëòè îacòpoéêè oïpeäeìüôò, êaêaü èîñopíaœèü àóäeò oòoàpaæaòöcü á ïoäcêaçêax." --added 0.06
	FMI.lang.config.tooltip_session_lbl = "Ça ceccèô cóííapîo?" --added 0.06
	FMI.lang.config.tooltip_session_tip =
		"Ecìè áêìôùeîo, àóäeò ïoêaçÿáaòö cóííapîo ïo äaîîÿí ácex ïpoäaæ ïpeäíeòa, îaéäeîîÿí á ïpoäaæax ça òeêóûóô ceccèô.  Ëòè äaîîÿe paçàèáaôòcü ïo âèìöäèüí." --added 0.06
	FMI.lang.config.tooltip_history_lbl = "Ïoêaçÿáaòö ècòopèô cóííapîo?" --added 0.06
	FMI.lang.config.tooltip_history_tip =
		"Ecìè áêìôùeîo, àóäeò ïoêaçÿáaòö cóííapîo ïo äaîîÿí ácex ïpoäaæ ïpeäíeòa, îaéäeîîÿí á ïpoäaæax ça áce ceccèè è äìü ácex ïepcoîaæeé. Ëòè äaîîÿe paçàèáaôòcü ïo âèìöäèüí." --added 0.06
	FMI.lang.config.tooltip_recom_lbl = "Ïoêaçÿáaòö peêoíeîäaœèè?" --added 0.06
	FMI.lang.config.tooltip_recom_tip =
		"Ecìè áêìôùeîo, ïoêaçÿáaeò peêoíeîäaœèè âäe è ça cêoìöêo ìóùúe êóïèòö/ïpoäaòö ïpeäíeò." --added 0.06

	FMI.lang.config.lang_lbl = "Üçÿê" --added 0.09
	FMI.lang.config.lang_tip = "Áÿàepèòe üçÿê. 'Auto' àóäeò ècïoìöçoáaòöcü üçÿê êìèeîòa." --added 0.09
	FMI.lang.config.lang_warn =
		"Áÿ äoìæîÿ áÿéòè èìè ïepeçaâpóçèòö èîòepñeéc (/reloadui), ùòoàÿ ëòè îacòpoéêè àÿìè ïpèíeîeîÿ." --added 0.09

	--- Tooltips

	FMI.lang.gui.tt_line =
		"%s: |cff0000%s" ..
		FMI.lang.core.icon_gold ..
			"|r/|cff8000%s" ..
				FMI.lang.core.icon_gold ..
					"|r/|cfff000%s" .. FMI.lang.core.icon_gold .. "|r/|c00ff00%s" .. FMI.lang.core.icon_gold .. "|r" -- guild, Max, Min, Avg, Undercut -added 0.06
	FMI.lang.gui.tt_key = "Key: |cff0000Íèî|r/|cff8000Íaêc|r/|cfff000Cpeä|r/|c00ff00Peêoí|r" --added 0.06
	FMI.lang.gui.tt_all = "Áce" --added 0.06
	FMI.lang.gui.tt_NoHistory = "Ècòopèü îe îaéäeîa." --added 0.06
	FMI.lang.gui.tt_Sell =
		"|c00FFFFÏpoäaîo:|r in |c008000%s|r ça |c00ff00%s|r" .. FMI.lang.core.icon_gold .. " [|cFF80FF%s|r] (|c00FFFF%s|r)"
	--added 0.06 - guild, price, qty, source
	FMI.lang.gui.tt_Buy =
		"|c00FFFFÊóïìeîo:|r from |c008000%s|r ça |c00ff00%s|r" .. FMI.lang.core.icon_gold .. " [|cFF80FF%s|r] (|c00FFFF%s|r)"
	--added 0.06 - guild, price, qty, source
	FMI.lang.gui.tt_sesstlt = "|c00FFFFËòa ceccèü" --added 0.06
	FMI.lang.gui.tt_histtlt = "|c00FFFFÈcòopèü" --added 0.06
	FMI.lang.gui.tt_histshort = "ècò" --added 0.06
	FMI.lang.gui.tt_sessshort = "cecc" --added 0.06
	FMI.lang.gui.tt_eachshort = "úò." --added 0.06

	FMI.lang.core.cmdHelp = {}
	FMI.lang.core.cmdHelp[1] = "Êoíaîäÿ FMI:" --added 0.06
	FMI.lang.core.cmdHelp[2] = "  - /FMI show || /FMI on - ïoêaçÿáaeò oêîo FMI." --added 0.06
	FMI.lang.core.cmdHelp[3] = "  - /FMI hide || /FMI off  - cêpÿáaeò oêîo FMI." --added 0.06
end
ZO_CreateStringId("SI_BINDING_NAME_FMI_TOGGLE", "Show/Hide GSEE")
