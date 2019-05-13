--[[ global ]] FreeMyInventory = FreeMyInventory or {}

-- Static functions and variables
local SavedDataManager = {
    DEFAULT_SAVED_DATA = FreeMyInventory.defaultSavedData,
    DISPLAY_NAME = nil,
    NAMESPACE = nil,
    PROFILE = nil,
    SAVED_VARIABLE_TABLE = "FreeMyInventory_data",
    UPGRADE_SAVED_DATA = FreeMyInventory.upgradeSavedData,
    VERSION = 1
}

-- Begin boilerplate class code
SavedDataManager.__index = SavedDataManager
setmetatable(
    SavedDataManager,
    {
        __call = function(cls, ...)
            return cls.new(...)
        end
    }
)
-- End boilerplate class code

function SavedDataManager.new()
    -- Begin boilerplate class code
    local self = setmetatable({}, SavedDataManager)
    -- End boilerplate class code

    return self
end

-- Static functions

function SavedDataManager.load()
    return ZO_SavedVars:NewAccountWide(
        SavedDataManager.SAVED_VARIABLE_TABLE,
        SavedDataManager.VERSION,
        SavedDataManager.NAMESPACE,
        SavedDataManager.DEFAULT_SAVED_DATA,
        SavedDataManager.PROFILE,
        SavedDataManager.DISPLAY_NAME
    )
end

function SavedDataManager.upgrade()
    local data = FreeMyInventory.data

    for key, value in pairs(SavedDataManager.UPGRADE_SAVED_DATA) do
        if data[key] == nil then
            data[key] = value
        end
    end
end

-- TODO Determine whether this function is still necessary
function SavedDataManager.clearSession()
    local data = FreeMyInventory.data

    ---Reset Session data
    for id, itemData in pairs(data.itemData) do
        for gname, value in pairs(data.itemData[id].session) do
            data.itemData[id].session[gname] = nil
        end
    end

    -- clean up save search data
    for index, value in pairs(data.search_results) do
        data.search_results[index][10] = -1 --- set page ref to -1
    end
end

FreeMyInventory.SavedDataManager = SavedDataManager
