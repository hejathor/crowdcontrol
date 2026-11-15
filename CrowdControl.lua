
local ADDON_NAME = "CrowdControl"

local CITY_ZONES = {
    ["Stormwind City"] = true,
    ["Orgrimmar"] = true,
    ["Ironforge"] = true,
    ["Darnassus"] = true,
    ["Undercity"] = true,
    ["Thunder Bluff"] = true,
    ["The Exodar"] = true,
    ["Silvermoon City"] = true,
    ["Shattrath City"] = true,
    ["Dalaran"] = true,
}

-- Built-in graphics presets
local PRESETS = {
    [1] = {
        graphicsQuality = 0,
        graphicsShadowQuality = 0,
        graphicsLiquidDetail = 0,
        graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1,
        graphicsSSAO = 0,
        graphicsDepthEffects = 0,
        graphicsComputeEffects = 0,
        graphicsTextureResolution = 0,
        graphicsSpellDensity = 0,
        graphicsProjectedTextures = 0,
        graphicsLightMode = 0,
        graphicsViewDistance = 0,
        graphicsEnvironmentDetail = 0,
        graphicsGroundClutter = 0,
    },

    [2] = {
        graphicsQuality = 1,
        graphicsShadowQuality = 0,
        graphicsLiquidDetail = 0,
        graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1,
        graphicsSSAO = 0,
        graphicsDepthEffects = 0,
        graphicsComputeEffects = 0,
        graphicsTextureResolution = 1,
        graphicsSpellDensity = 0,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 0,
        graphicsViewDistance = 1,
        graphicsEnvironmentDetail = 1,
        graphicsGroundClutter = 1,
    },

    [3] = {
        graphicsQuality = 2,
        graphicsShadowQuality = 0,
        graphicsLiquidDetail = 1,
        graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1,
        graphicsSSAO = 0,
        graphicsDepthEffects = 0,
        graphicsComputeEffects = 1,
        graphicsTextureResolution = 1,
        graphicsSpellDensity = 0,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 0,
        graphicsViewDistance = 2,
        graphicsEnvironmentDetail = 2,
        graphicsGroundClutter = 2,
    },

    [4] = {
        graphicsQuality = 3,
        graphicsShadowQuality = 1,
        graphicsLiquidDetail = 1,
        graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1,
        graphicsSSAO = 1,
        graphicsDepthEffects = 1,
        graphicsComputeEffects = 1,
        graphicsTextureResolution = 1,
        graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 1,
        graphicsViewDistance = 3,
        graphicsEnvironmentDetail = 3,
        graphicsGroundClutter = 3,
    },

    [5] = {
        graphicsQuality = 4,
        graphicsShadowQuality = 2,
        graphicsLiquidDetail = 2,
        graphicsPBRLiquidDetail = 1,
        graphicsParticleDensity = 2,
        graphicsSSAO = 2,
        graphicsDepthEffects = 2,
        graphicsComputeEffects = 2,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 1,
        graphicsViewDistance = 4,
        graphicsEnvironmentDetail = 4,
        graphicsGroundClutter = 4,
    },

    [6] = {
        graphicsQuality = 5,
        graphicsShadowQuality = 3,
        graphicsLiquidDetail = 2,
        graphicsPBRLiquidDetail = 1,
        graphicsParticleDensity = 3,
        graphicsSSAO = 3,
        graphicsDepthEffects = 3,
        graphicsComputeEffects = 2,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 2,
        graphicsViewDistance = 5,
        graphicsEnvironmentDetail = 5,
        graphicsGroundClutter = 5,
    },

    [7] = {
        graphicsQuality = 6,
        graphicsShadowQuality = 4,
        graphicsLiquidDetail = 2,
        graphicsPBRLiquidDetail = 1,
        graphicsParticleDensity = 3,
        graphicsSSAO = 3,
        graphicsDepthEffects = 3,
        graphicsComputeEffects = 3,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 2,
        graphicsViewDistance = 6,
        graphicsEnvironmentDetail = 6,
        graphicsGroundClutter = 6,
    },

    [8] = {
        graphicsQuality = 7,
        graphicsShadowQuality = 4,
        graphicsLiquidDetail = 2,
        graphicsPBRLiquidDetail = 2,
        graphicsParticleDensity = 4,
        graphicsSSAO = 4,
        graphicsDepthEffects = 3,
        graphicsComputeEffects = 3,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 2,
        graphicsViewDistance = 7,
        graphicsEnvironmentDetail = 7,
        graphicsGroundClutter = 7,
    },

    [9] = {
        graphicsQuality = 8,
        graphicsShadowQuality = 5,
        graphicsLiquidDetail = 2,
        graphicsPBRLiquidDetail = 2,
        graphicsParticleDensity = 4,
        graphicsSSAO = 4,
        graphicsDepthEffects = 3,
        graphicsComputeEffects = 4,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 3,
        graphicsViewDistance = 8,
        graphicsEnvironmentDetail = 8,
        graphicsGroundClutter = 8,
    },

    [10] = {
        graphicsQuality = 9,
        graphicsShadowQuality = 5,
        graphicsLiquidDetail = 3,
        graphicsPBRLiquidDetail = 2,
        graphicsParticleDensity = 4,
        graphicsSSAO = 4,
        graphicsDepthEffects = 3,
        graphicsComputeEffects = 4,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1,
        graphicsLightMode = 3,
        graphicsViewDistance = 9,
        graphicsEnvironmentDetail = 9,
        graphicsGroundClutter = 9,
    },
}

local LIGHTING_VALUES = {
    ["Fair"] = 0,
    ["Good"] = 1,
    ["High"] = 2,
    ["Ultra"] = 3,
}

local DEFAULTS = {
    outsideQuality = 10,
    cityQuality = 1,
    secondaryLighting = "",
}

local db
local isInCity = false
local lastProfile = nil
local category

local function IsValidQuality(value)
    return type(value) == "number"
        and value >= 1
        and value <= 10
        and value == math.floor(value)
end

local function InitializeDatabase()
    if type(CrowdControlDB) ~= "table" then
        CrowdControlDB = {}
    end

    db = CrowdControlDB

    for key, value in pairs(DEFAULTS) do
        if db[key] == nil then
            db[key] = value
        end
    end

    if not IsValidQuality(db.outsideQuality) then
        db.outsideQuality = DEFAULTS.outsideQuality
    end

    if not IsValidQuality(db.cityQuality) then
        db.cityQuality = DEFAULTS.cityQuality
    end

    if not LIGHTING_VALUES[db.secondaryLighting]
        and db.secondaryLighting ~= "" then
        db.secondaryLighting = ""
    end
end

local function IsCity()
    local zone = GetRealZoneText()
    return CITY_ZONES[zone] == true
end

local function ApplyPreset(quality)
    local preset = PRESETS[quality]
    if not preset then
        return
    end

    for cvar, value in pairs(preset) do
        if GetCVar(cvar) ~= nil then
            SetCVar(cvar, value)
        end
    end
end

local function ApplyLightingOverride()
    if not db or db.secondaryLighting == "" then
        return
    end

    local value = LIGHTING_VALUES[db.secondaryLighting]

    if value ~= nil then
        SetCVar("graphicsLightMode", value)
    end
end

local function ApplyCurrentProfile(force)
    if not db then
        return
    end

    local city = IsCity()
    local quality = city and db.cityQuality or db.outsideQuality

    local profileKey = (city and "city-" or "outside-") .. quality

    if not force and profileKey == lastProfile then
        return
    end

    ApplyPreset(quality)
    ApplyLightingOverride()

    lastProfile = profileKey
    isInCity = city
end

local function CreateDropdown(parent, label, options, getValue, setValue, yOffset)
    local title = parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOPLEFT", parent, "TOPLEFT", 16, yOffset)
    title:SetText(label)

    local dropdown = CreateFrame(
        "Frame",
        nil,
        parent,
        "UIDropDownMenuTemplate"
    )

    dropdown:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -16, -4)
    UIDropDownMenu_SetWidth(dropdown, 190)

    UIDropDownMenu_Initialize(dropdown, function(self, level)
        for _, option in ipairs(options) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = option
            info.checked = getValue() == option

            info.func = function()
                setValue(option)
                UIDropDownMenu_SetText(dropdown, option)
                ApplyCurrentProfile(true)
            end

            UIDropDownMenu_AddButton(info, level)
        end
    end)

    UIDropDownMenu_SetText(dropdown, getValue())

    return dropdown
end

local function CreateOptionsPanel()
    local panel = CreateFrame("Frame")
    panel.name = "Crowd Control"

    local heading = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    heading:SetPoint("TOPLEFT", 16, -20)
    heading:SetText("Crowd Control")

    local description = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    description:SetPoint("TOPLEFT", heading, "BOTTOMLEFT", 0, -10)
    description:SetText(
        "Automatically swaps between Base Game Quality graphics presets when entering or leaving cities."
    )

    local qualityOptions = {
        "1", "2", "3", "4", "5",
        "6", "7", "8", "9", "10",
    }

    CreateDropdown(
        panel,
        "Base Game Quality: Open world",
        qualityOptions,
        function()
            return tostring(db.outsideQuality)
        end,
        function(value)
            db.outsideQuality = tonumber(value)
        end,
        -105
    )

    CreateDropdown(
        panel,
        "Base Game Quality: Cities",
        qualityOptions,
        function()
            return tostring(db.cityQuality)
        end,
        function(value)
            db.cityQuality = tonumber(value)
        end,
        -185
    )

    CreateDropdown(
        panel,
        "Secondary Lighting",
        { "Match Base Game Quality", "Fair", "Good", "High", "Ultra" },
        function()
            return db.secondaryLighting == "" and "Match Base Game Quality"
                or db.secondaryLighting
        end,
        function(value)
            db.secondaryLighting = value == "Match Base Game Quality" and "" or value
        end,
        -265
    )

    panel:SetScript("OnShow", function()
        ApplyCurrentProfile(true)
    end)

    if Settings and Settings.RegisterCanvasLayoutCategory then
        category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
    else
        InterfaceOptions_AddCategory(panel)
    end
end

local function OpenOptions()
    if Settings and Settings.OpenToCategory and category then
        Settings.OpenToCategory(category:GetID())
    elseif InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory("Crowd Control")
        InterfaceOptionsFrame_OpenToCategory("Crowd Control")
    end
end

SLASH_CROWDCONTROL1 = "/cc"
SLASH_CROWDCONTROL2 = "/crowdcontrol"

SlashCmdList["CROWDCONTROL"] = OpenOptions

local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("ZONE_CHANGED")
eventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

eventFrame:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" then
        if addon ~= ADDON_NAME then
            return
        end

        InitializeDatabase()
        CreateOptionsPanel()

    elseif event == "PLAYER_ENTERING_WORLD"
        or event == "ZONE_CHANGED"
        or event == "ZONE_CHANGED_INDOORS"
        or event == "ZONE_CHANGED_NEW_AREA" then

        if db then
            ApplyCurrentProfile(true)
        end
    end
end)

local elapsed = 0

eventFrame:SetScript("OnUpdate", function(self, delta)
    if not db then
        return
    end

    elapsed = elapsed + delta

    if elapsed >= 2 then
        elapsed = 0

        local city = IsCity()

        if city ~= isInCity then
            ApplyCurrentProfile(true)
        end
    end
end)

