--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local AbstractHandler = FreeMyInventory.AbstractHandler
local GuildUpdater = FreeMyInventory.GuildUpdater

-- Static and instance variables
local OnGuildSelfLeftGuildHandler = {
    event = EVENT_GUILD_SELF_LEFT_GUILD
}

-- Begin boilerplate class code
setmetatable(OnGuildSelfLeftGuildHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods
function OnGuildSelfLeftGuildHandler.handler()
    GuildUpdater.updateGuild()
end

FreeMyInventory.OnGuildSelfLeftGuildHandler = OnGuildSelfLeftGuildHandler
