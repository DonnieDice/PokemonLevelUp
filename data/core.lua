--=====================================================================================
-- PLU | Pokemon Level Up! - core.lua
-- Version: 2.0.3
-- Author: DonnieDice
-- Description: Plays Pokemon-themed level-up sounds and replaces the default WoW sound
--=====================================================================================

PLU = PLU or {}

local ADDON_VERSION = "2.0.3"
local ADDON_NAME = "PokemonLevelUp"
local TITLE = "[|cffff0000P|r|cffffffffokemon |r|cffff0000L|r|cffffffffevel-|r|cffff0000U|r|cffff0000!|r]"
local SOUND_PATHS = {
    high = "Interface\\Addons\\PokemonLevelUp\\sounds\\pokemon_high.ogg",
    medium = "Interface\\Addons\\PokemonLevelUp\\sounds\\pokemon_med.ogg",
    low = "Interface\\Addons\\PokemonLevelUp\\sounds\\pokemon_low.ogg"
}
local DEFAULT_SOUND_ID = 569593
local PREFIX = "|cffff0000PLU|r"

PLU.version = ADDON_VERSION
PLU.addonName = ADDON_NAME
PLU.sounds = SOUND_PATHS
PLU.defaultSoundId = DEFAULT_SOUND_ID

PLU.defaults = {
    enabled = true,
    soundVariant = "medium",
    muteDefault = true,
    showWelcome = true,
    volume = "Master",
    firstRun = true
}

function PLU:InitializeSettings()
    PLUSettings = PLUSettings or {}

    for key, value in pairs(self.defaults) do
        if PLUSettings[key] == nil then
            PLUSettings[key] = value
        end
    end
end

function PLU:GetSetting(key)
    if not key or type(key) ~= "string" then
        return nil
    end

    if not PLUSettings then
        return self.defaults[key]
    end

    local value = PLUSettings[key]
    if value ~= nil then
        return value
    end

    return self.defaults[key]
end

function PLU:SetSetting(key, value)
    if not key or type(key) ~= "string" or self.defaults[key] == nil then
        return false
    end

    if not PLUSettings then
        PLUSettings = {}
    end

    if type(value) ~= type(self.defaults[key]) then
        return false
    end

    PLUSettings[key] = value
    return true
end

function PLU:PlayCustomLevelUpSound()
    if not self:GetSetting("enabled") then
        return
    end

    local soundVariant = self:GetSetting("soundVariant") or "medium"
    local soundPath = SOUND_PATHS[soundVariant]
    if not soundPath then
        print(PREFIX .. " " .. (self.L and self.L["ERROR_PREFIX"] or "|cffff0000PLU Error:|r") .. " Invalid sound variant: " .. tostring(soundVariant))
        return
    end

    local volume = self:GetSetting("volume") or "Master"
    local success = PlaySoundFile(soundPath, volume)
    if not success then
        print(PREFIX .. " " .. (self.L and self.L["ERROR_PREFIX"] or "|cffff0000PLU Error:|r") .. " Failed to play sound file: " .. soundPath)
    end
end

function PLU:MuteDefaultLevelUpSound()
    if self:GetSetting("enabled") and self:GetSetting("muteDefault") then
        MuteSoundFile(DEFAULT_SOUND_ID)
    end
end

function PLU:UnmuteDefaultLevelUpSound()
    UnmuteSoundFile(DEFAULT_SOUND_ID)
end

function PLU:DisplayWelcomeMessage()
    if not self:GetSetting("showWelcome") then
        return
    end

    if not self.L then
        print(PREFIX .. " |cffff0000PLU Error:|r Localization not loaded")
        return
    end

    local version = "|cff8080ff(v" .. ADDON_VERSION .. ")|r"
    local status = self:GetSetting("enabled") and self.L["ENABLED_STATUS"] or self.L["DISABLED_STATUS"]

    print(PREFIX .. " - " .. TITLE .. " " .. status .. " " .. version)

    if self:GetSetting("firstRun") then
        print(PREFIX .. " " .. self.L["COMMUNITY_MESSAGE"])
        self:SetSetting("firstRun", false)
    end

    print(PREFIX .. " " .. self.L["TYPE_HELP"])
end

function PLU:HandleSlashCommand(args)
    if not self.L then
        print(PREFIX .. " |cffff0000PLU Error:|r Localization not loaded")
        return
    end

    local command = string.lower(args or "")

    if command == "" or command == "help" then
        self:ShowHelp()
    elseif command == "test" then
        print(PREFIX .. ": " .. self.L["PLAYING_TEST"])
        self:PlayCustomLevelUpSound()
    elseif command == "enable" then
        self:SetSetting("enabled", true)
        self:MuteDefaultLevelUpSound()
        print(PREFIX .. ": " .. self.L["ADDON_ENABLED"])
    elseif command == "disable" then
        self:SetSetting("enabled", false)
        self:UnmuteDefaultLevelUpSound()
        print(PREFIX .. ": " .. self.L["ADDON_DISABLED"])
    elseif command == "welcome" then
        local newValue = not self:GetSetting("showWelcome")
        self:SetSetting("showWelcome", newValue)
        if newValue then
            print(PREFIX .. ": " .. self.L["WELCOME_TOGGLE_ON"])
        else
            print(PREFIX .. ": " .. self.L["WELCOME_TOGGLE_OFF"])
        end
    elseif command == "high" then
        self:SetSetting("soundVariant", "high")
        print(PREFIX .. ": " .. string.format(self.L["SOUND_VARIANT_SET"], "high"))
    elseif command == "med" or command == "medium" then
        self:SetSetting("soundVariant", "medium")
        print(PREFIX .. ": " .. string.format(self.L["SOUND_VARIANT_SET"], "medium"))
    elseif command == "low" then
        self:SetSetting("soundVariant", "low")
        print(PREFIX .. ": " .. string.format(self.L["SOUND_VARIANT_SET"], "low"))
    else
        print(PREFIX .. " " .. self.L["ERROR_PREFIX"] .. " " .. self.L["ERROR_UNKNOWN_COMMAND"])
    end
end

function PLU:ShowHelp()
    if not self.L then
        print(PREFIX .. " |cffff0000PLU Error:|r Localization not loaded")
        return
    end

    print(PREFIX .. " " .. self.L["HELP_HEADER"])
    print(PREFIX .. " " .. self.L["HELP_TEST"])
    print(PREFIX .. " " .. self.L["HELP_ENABLE"])
    print(PREFIX .. " " .. self.L["HELP_DISABLE"])
    print(PREFIX .. " " .. self.L["HELP_WELCOME"])
    print(PREFIX .. " |cffffffff/plu high|r - Use high quality sound")
    print(PREFIX .. " |cffffffff/plu med|r - Use medium quality sound")
    print(PREFIX .. " |cffffffff/plu low|r - Use low quality sound")
end

PLU.initialized = false

function PLU:OnEvent(event, ...)
    if event == "PLAYER_LEVEL_UP" then
        if self.initialized then
            self:PlayCustomLevelUpSound()
        end
        return
    end

    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == ADDON_NAME then
            self:InitializeSettings()
            self:MuteDefaultLevelUpSound()
            self.initialized = true
        end
        return
    end

    if event == "PLAYER_LOGIN" then
        if not self.initialized then
            self:InitializeSettings()
            self:MuteDefaultLevelUpSound()
            self.initialized = true
        end
        self:DisplayWelcomeMessage()
        return
    end

    if event == "PLAYER_LOGOUT" then
        self:UnmuteDefaultLevelUpSound()
    end
end

SLASH_PLU1 = "/plu"
SlashCmdList["PLU"] = function(args)
    local success, errorMsg = pcall(PLU.HandleSlashCommand, PLU, args)
    if not success then
        print(PREFIX .. " |cffff0000PLU Error:|r " .. tostring(errorMsg))
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("PLAYER_LOGOUT")
eventFrame:SetScript("OnEvent", function(_, event, ...)
    local success, errorMsg = pcall(PLU.OnEvent, PLU, event, ...)
    if not success then
        print(PREFIX .. " |cffff0000PLU Error:|r Event handler failed: " .. tostring(errorMsg))
    end
end)
