--[[ global ]] FreeMyInventory = FreeMyInventory or {}

local Debugger = FreeMyInventory.Debugger

local onGuildSelfJoinedGuild = function()
    -- if FMI.dropDownInit then
    --     return
    -- end
    -- FMI.dropDownInit = true
    -- local dropdown = ZO_ComboBox_ObjectFromContainer(FreeMyInventory:GetNamedChild("GuildCombo"))
    -- FMI.CurrentGuildIndex = 1
    -- FMI.Guilds = {}
    -- dropdown:ClearItems()
    -- local entry =
    --     dropdown:CreateItemEntry(
    --     FMI.lang.gui.guild_all,
    --     function()
    --     end
    -- )
    -- dropdown:AddItem(entry)
    -- local numGuilds = GetNumGuilds()
    -- local currentIndex = 0
    -- while #FMI.Guilds < numGuilds do
    --     local resultId = GetGuildId(currentIndex)
    --     if resultId ~= 0 then
    --         local name = GetGuildName(resultId)
    --         local color = "|cFFFFFF"
    --         if FMI.canUseTradingHouse(resultId) == false then
    --             color = "|cff0000"
    --         else
    --             color = "|cFFFF00"
    --         end
    --         Debugger.print("Dropdown add ::" .. string.format(FMI.lang.gui.guild_templ, resultId, color, name))
    --         local formattedName = string.format(FMI.lang.gui.guild_templ, resultId, color, name)
    --         local entry =
    --             dropdown:CreateItemEntry(
    --             string.format(FMI.lang.gui.guild_templ, resultId, color, name),
    --             function()
    --             end
    --         )
    --         dropdown:AddItem(entry)
    --         table.insert(FMI.Guilds, {Id = resultId, Name = name, FormattedName = formattedName})
    --     end
    --     currentIndex = currentIndex + 1
    -- end
    -- dropdown:SetSelectedItem(FMI.lang.gui.guild_all)
    -- FMI.dropDownInit = false
end

FreeMyInventory.onGuildSelfJoinedGuild = onGuildSelfJoinedGuild
