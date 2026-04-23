--=====================================================================================
-- PLU | Pokemon Level Up! - locales.lua
-- Version: 2.0.3
-- Author: DonnieDice
-- Description: Localization system for Pokemon Level Up!
--=====================================================================================

PLU = PLU or {}
PLU.L = PLU.L or {}

local locale = GetLocale()

local L = {
    ["ADDON_ENABLED"] = "Addon |cff00ff00enabled|r",
    ["ADDON_DISABLED"] = "Addon |cffff0000disabled|r",
    ["PLAYING_TEST"] = "Playing test sound...",
    ["SOUND_VARIANT_SET"] = "Sound variant set to: |cffffffff%s|r",
    ["WELCOME_MESSAGE"] = "Welcome to PLU! Type |cffffffff/plu help|r for commands",
    ["WELCOME_TOGGLE_ON"] = "Login message |cff00ff00enabled|r",
    ["WELCOME_TOGGLE_OFF"] = "Login message |cffff0000disabled|r",

    ["ERROR_PREFIX"] = "|cffff0000PLU Error:|r",
    ["ERROR_UNKNOWN_COMMAND"] = "Unknown command. Type |cffffffff/plu help|r for available commands",

    ["HELP_HEADER"] = "|cffff0000=== PLU Commands ===|r",
    ["HELP_TEST"] = "|cffffffff/plu test|r - Play test sound",
    ["HELP_ENABLE"] = "|cffffffff/plu enable|r - Enable addon",
    ["HELP_DISABLE"] = "|cffffffff/plu disable|r - Disable addon",
    ["HELP_WELCOME"] = "|cffffffff/plu welcome|r - Toggle login message",

    ["ENABLED_STATUS"] = "|cff00ff00Enabled|r",
    ["DISABLED_STATUS"] = "|cffff0000Disabled|r",
    ["TYPE_HELP"] = "Type |cffffffff/plu help|r for commands",

    ["COMMUNITY_MESSAGE"] = "Pokemon Level Up! is ready. Catch every level with a classic Pokemon victory jingle."
}

if locale == "deDE" then
    L["ADDON_ENABLED"] = "Addon |cff00ff00aktiviert|r"
    L["ADDON_DISABLED"] = "Addon |cffff0000deaktiviert|r"
    L["PLAYING_TEST"] = "Testsound wird abgespielt..."
    L["SOUND_VARIANT_SET"] = "Sound-Variante gesetzt auf: |cffffffff%s|r"
    L["WELCOME_MESSAGE"] = "Willkommen bei PLU! Tippe |cffffffff/plu help|r fur Befehle"
    L["WELCOME_TOGGLE_ON"] = "Login-Nachricht |cff00ff00aktiviert|r"
    L["WELCOME_TOGGLE_OFF"] = "Login-Nachricht |cffff0000deaktiviert|r"
    L["ERROR_PREFIX"] = "|cffff0000PLU Fehler:|r"
    L["ERROR_UNKNOWN_COMMAND"] = "Unbekannter Befehl. Tippe |cffffffff/plu help|r fur verfugbare Befehle"
    L["HELP_HEADER"] = "|cffff0000=== PLU Befehle ===|r"
    L["HELP_TEST"] = "|cffffffff/plu test|r - Testsound abspielen"
    L["HELP_ENABLE"] = "|cffffffff/plu enable|r - Addon aktivieren"
    L["HELP_DISABLE"] = "|cffffffff/plu disable|r - Addon deaktivieren"
    L["HELP_WELCOME"] = "|cffffffff/plu welcome|r - Login-Nachricht umschalten"
    L["ENABLED_STATUS"] = "|cff00ff00Aktiviert|r"
    L["DISABLED_STATUS"] = "|cffff0000Deaktiviert|r"
    L["TYPE_HELP"] = "Tippe |cffffffff/plu help|r fur Befehle"
    L["COMMUNITY_MESSAGE"] = "Pokemon Level Up! ist bereit. Fang jedes Level mit einem klassischen Pokemon-Jingle."
elseif locale == "frFR" then
    L["ADDON_ENABLED"] = "Addon |cff00ff00active|r"
    L["ADDON_DISABLED"] = "Addon |cffff0000desactive|r"
    L["PLAYING_TEST"] = "Lecture du son de test..."
    L["SOUND_VARIANT_SET"] = "Variante sonore definie sur : |cffffffff%s|r"
    L["WELCOME_MESSAGE"] = "Bienvenue dans PLU ! Tapez |cffffffff/plu help|r pour les commandes"
    L["WELCOME_TOGGLE_ON"] = "Message de connexion |cff00ff00active|r"
    L["WELCOME_TOGGLE_OFF"] = "Message de connexion |cffff0000desactive|r"
    L["ERROR_PREFIX"] = "|cffff0000Erreur PLU:|r"
    L["ERROR_UNKNOWN_COMMAND"] = "Commande inconnue. Tapez |cffffffff/plu help|r pour les commandes disponibles"
    L["HELP_HEADER"] = "|cffff0000=== Commandes PLU ===|r"
    L["HELP_TEST"] = "|cffffffff/plu test|r - Jouer le son de test"
    L["HELP_ENABLE"] = "|cffffffff/plu enable|r - Activer l'addon"
    L["HELP_DISABLE"] = "|cffffffff/plu disable|r - Desactiver l'addon"
    L["HELP_WELCOME"] = "|cffffffff/plu welcome|r - Basculer le message de connexion"
    L["ENABLED_STATUS"] = "|cff00ff00Active|r"
    L["DISABLED_STATUS"] = "|cffff0000Desactive|r"
    L["TYPE_HELP"] = "Tapez |cffffffff/plu help|r pour les commandes"
    L["COMMUNITY_MESSAGE"] = "Pokemon Level Up! est pret. Attrapez chaque niveau avec un jingle Pokemon classique."
elseif locale == "esES" or locale == "esMX" then
    L["ADDON_ENABLED"] = "Addon |cff00ff00habilitado|r"
    L["ADDON_DISABLED"] = "Addon |cffff0000deshabilitado|r"
    L["PLAYING_TEST"] = "Reproduciendo sonido de prueba..."
    L["SOUND_VARIANT_SET"] = "Variante de sonido establecida en: |cffffffff%s|r"
    L["WELCOME_MESSAGE"] = "Bienvenido a PLU! Escribe |cffffffff/plu help|r para comandos"
    L["WELCOME_TOGGLE_ON"] = "Mensaje de inicio |cff00ff00habilitado|r"
    L["WELCOME_TOGGLE_OFF"] = "Mensaje de inicio |cffff0000deshabilitado|r"
    L["ERROR_PREFIX"] = "|cffff0000Error PLU:|r"
    L["ERROR_UNKNOWN_COMMAND"] = "Comando desconocido. Escribe |cffffffff/plu help|r para comandos disponibles"
    L["HELP_HEADER"] = "|cffff0000=== Comandos PLU ===|r"
    L["HELP_TEST"] = "|cffffffff/plu test|r - Reproducir sonido de prueba"
    L["HELP_ENABLE"] = "|cffffffff/plu enable|r - Habilitar el addon"
    L["HELP_DISABLE"] = "|cffffffff/plu disable|r - Deshabilitar el addon"
    L["HELP_WELCOME"] = "|cffffffff/plu welcome|r - Alternar mensaje de inicio"
    L["ENABLED_STATUS"] = "|cff00ff00Habilitado|r"
    L["DISABLED_STATUS"] = "|cffff0000Deshabilitado|r"
    L["TYPE_HELP"] = "Escribe |cffffffff/plu help|r para comandos"
    L["COMMUNITY_MESSAGE"] = "Pokemon Level Up! esta listo. Celebra cada nivel con un jingle clasico de Pokemon."
elseif locale == "ruRU" then
    L["WELCOME_TOGGLE_ON"] = "Privetstvennoe soobshchenie |cff00ff00vklyucheno|r"
    L["WELCOME_TOGGLE_OFF"] = "Privetstvennoe soobshchenie |cffff0000otklyucheno|r"
    L["HELP_HEADER"] = "|cffff0000=== Komandy PLU ===|r"
    L["HELP_WELCOME"] = "|cffffffff/plu welcome|r - Pereklyuchit soobshchenie pri vhode"
    L["TYPE_HELP"] = "Vvedite |cffffffff/plu help|r dlya komand"
    L["COMMUNITY_MESSAGE"] = "Pokemon Level Up! gotov. Prazdnuyte kazhdyy uroven klassicheskim zvukom Pokemon."
end

PLU.L = L

function PLU:GetLocalizedString(key)
    if self.L and self.L[key] then
        return self.L[key]
    end

    return key
end
