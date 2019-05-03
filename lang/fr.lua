function FMI.lang.sets.fr()
	FMI.lang.core.icon_gold=string.format(FMI.lang.core.icon_template,"EsoUI/Art/currency/currency_gold.dds")
	FMI.lang.core.icon_gstorecoins=string.format(FMI.lang.core.icon_template,"/esoui/art/guild/guild_tradinghouseaccess.dds")
	

	--- General Strings

	FMI.lang.core.addonName="Free My Inventory";
    FMI.lang.core.coloredAddonName="|c2080D0Free My Inventory|r";

	
	----Config------
	
	FMI.lang.config_filt_markdown_lbl="Articles en promotion(%)"
	FMI.lang.config_filt_markdown_tip="Les prix conseillés seront reduits par ce pourcentage fixe."
	
	--- GUI -----------------
	
	FMI.lang.gui.reset_btn=string.format(FMI.lang.core.icon_template1,"/esoui/art/inventory/inventory_tabicon_junk_up.dds").."Reinitialiser"
	FMI.lang.gui.rtrv_btn=string.format(FMI.lang.core.icon_template1,"/esoui/art/hud/radialicon_trade_up.dds").."Scanner"
	FMI.lang.gui.find_btn=string.format(FMI.lang.core.icon_template1,"/esoui/art/lfg/lfg_tabicon_grouptools_up.dds").."Rechercher"
	FMI.lang.gui.close_btn=string.format(FMI.lang.core.icon_template1,"/esoui/art/hud/radialicon_cancel_up.dds").."Fermer"
	FMI.lang.gui.searchfor_lbl="Mot clef:"
	FMI.lang.gui.guild_lbl="Guilde:"
	FMI.lang.gui.col_price_hdr="Total"
	FMI.lang.gui.col_unit_hdr="Unique"
	
	FMI.lang.gui.main_cmd=string.format(FMI.lang.core.icon_template1,"/esoui/art/lfg/lfg_tabicon_grouptools_up.dds").."Guild Store Search"
	--- Dynamics
	
	FMI.lang.gui.res_label=FMI.lang.core.icon_template.." |cE0FFE0%s|r [|c%s%s|r]|cffff00 x %s|r" -- icon, guild no., color, name label, count
	FMI.lang.gui.res_price="%s"..FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_unitprice="%s"..FMI.lang.core.icon_gold -- money
	FMI.lang.gui.res_buy=FMI.lang.core.icon_gstorecoins.."Afficher"
	
	local working=string.format(FMI.lang.core.icon_template1,"/esoui/art/ava/ava_resourcestatus_tabicon_production.dds")
	local complete=string.format(FMI.lang.core.icon_template1,"/esoui/art/characterwindow/sigil_stamina.dds")
	
	FMI.lang.gui.searchpause="Page suivante dans %s secondes..."
	FMI.lang.gui.searchproc="Traitement..."
	FMI.lang.gui.searchready="|c00ff00Pret pour recherche.|r"
	
	FMI.lang.gui.search=working.."Recherche Guilde |c00ffff%s|r, page |c00ffff%s|r" -- guild, page
	FMI.lang.gui.found=complete.."Résultat: |c00ffff%s|r objets de la Guilde |c00ffff%s|r" -- items, guild
	FMI.lang.gui.retrv=working.."Scan de la Guilde |c00ffff%s|r, page |c00ffff%s|r" -- guild, page
	FMI.lang.gui.foundall=complete.."Resultat: |c00ffff%s|r objets |c00ffffau total|r " -- items
	FMI.lang.gui.searchStarte=working.."Debut de la recherche..."
	FMI.lang.gui.searchBusy=working.."|cff0000Guild Store Search Ex est occupé, attendez"
	
	
	FMI.lang.gui.noTradingGuilds="|cff0000Il n'y a pas de boutique de guilde!|r"
	FMI.lang.gui.notATradingGuild="|cff0000Guilde %s n'a pas de boutique.|r"
	
	FMI.lang.gui.guild_all="|c00cc00All"
	FMI.lang.gui.guild_templ="G%s: %s%s" --Guild Num, color, Guild Name
	
	FMI.lang.gui.search_summ= "%s résultat. prix unique (Max/Min/Moy/Réduit):|cff0000%s|r/|cff8000%s|r/|cfff000%s|r/|c00ff00%s|r%s" -- Max, Min, Avg, Undercut, Sell for price
	
	
	FMI.lang.gui.search_summsell=". Sell |cff00ff%s|r @ |cffc000%sg.|r"
	
	
	FMI.lang.config.gen_dbg_lbl="Debug Mode?"
	FMI.lang.config.gen_dbg_tip="Afficher les messages de débogage?"
	FMI.lang.config.gen_dbg_warn="Cela va afficher beaucoup de texte dans votre fenêtre de chat!"	
end
