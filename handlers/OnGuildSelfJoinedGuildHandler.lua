--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Imports
local AbstractHandler = FreeMyInventory.AbstractHandler
local GuildUpdater = FreeMyInventory.GuildUpdater

-- Static and instance variables
local OnGuildSelfJoinedGuildHandler = {
    event = EVENT_GUILD_SELF_JOINED_GUILD
}

-- Begin boilerplate class code
setmetatable(OnGuildSelfJoinedGuildHandler, {__index = AbstractHandler})
-- End boilerplate class code

-- Static methods
function OnGuildSelfJoinedGuildHandler.handler()
    d("Joined guild.")
    GuildUpdater.updateGuild()
end

FreeMyInventory.OnGuildSelfJoinedGuildHandler = OnGuildSelfJoinedGuildHandler
