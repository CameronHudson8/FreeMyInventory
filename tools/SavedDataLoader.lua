FreeMyInventory = FreeMyInventory or {}

-- Static functions and variables
local SavedDataLoader = {
    SAVED_VARIABLE_TABLE = "FreeMyInventory_data",
    VERSION = 1,
    NAMESPACE = nil,
    DEFAULTS = FreeMyInventory.defaultSavedData,
    PROFILE = nil,
    DISPLAY_NAME = nil,
    load = function()
        return ZO_SavedVars:NewAccountWide(SAVED_VARIABLE_TABLE, VERSION, NAMESPACE, DEFAULTS, PROFILE, DISPLAY_NAME)
    end
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

function SavedDataLoader:new(init)
    -- Begin boilerplate class code
    local self = setmetatable({}, SavedDataLoader)
    self.value = init
    -- End boilerplate class code

    return self
end

function SavedDataLoader.load()
    return ZO_SavedVars:NewAccountWide(
        SavedDataLoader.SAVED_VARIABLE_TABLE,
        SavedDataLoader.VERSION,
        SavedDataLoader.NAMESPACE,
        SavedDataLoader.DEFAULTS,
        SavedDataLoader.PROFILE,
        SavedDataLoader.DISPLAY_NAME
    )
end

FreeMyInventory.SavedDataLoader = SavedDataLoader
