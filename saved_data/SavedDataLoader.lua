--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static functions and variables
local SavedDataLoader = {
    DEFAULT_SAVED_DATA = FreeMyInventory.defaultSavedData,
    DISPLAY_NAME = nil,
    NAMESPACE = nil,
    PROFILE = nil,
    SAVED_VARIABLE_TABLE = "FreeMyInventory_data",
    UPGRADE_SAVED_DATA = FreeMyInventory.upgradeSavedData,
    VERSION = 1
}

-- Begin boilerplate class code
SavedDataLoader.__index = SavedDataLoader
setmetatable(
    SavedDataLoader,
    {
        __call = function(cls, ...)
            return cls.new(...)
        end
    }
)
-- End boilerplate class code

function SavedDataLoader:new()
    -- Begin boilerplate class code
    local self = setmetatable({}, SavedDataLoader)
    -- End boilerplate class code

    return self
end

function SavedDataLoader.load()
    return ZO_SavedVars:NewAccountWide(
        SavedDataLoader.SAVED_VARIABLE_TABLE,
        SavedDataLoader.VERSION,
        SavedDataLoader.NAMESPACE,
        SavedDataLoader.DEFAULT_SAVED_DATA,
        SavedDataLoader.PROFILE,
        SavedDataLoader.DISPLAY_NAME
    )
end

function SavedDataLoader.upgrade()
    for key, value in pairs(SavedDataLoader.UPGRADE_SAVED_DATA) do
        if FreeMyInventory.data[key] == nil then
            FreeMyInventory.data[key] = value
        end
    end
end

FreeMyInventory.SavedDataLoader = SavedDataLoader
