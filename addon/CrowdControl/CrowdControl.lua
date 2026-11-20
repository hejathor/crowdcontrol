local ADDON_NAME = "CrowdControl"

local CITY_ZONES = {
    "Stormwind City", "Orgrimmar", "Ironforge", "Darnassus",
    "Undercity", "Thunder Bluff", "The Exodar",
    "Silvermoon City", "Shattrath City", "Dalaran",
    "Shrine of Two Moons", "Shrine of Seven Stars",
    "Warspear", "Stormshield", "Boralus", "Dazar'alor",
    "Oribos", "Valdrakken", "Dornogal"
}

local CITY_ZONE_SET = {}

for _, zone in ipairs(CITY_ZONES) do
    CITY_ZONE_SET[zone] = true
end

local PRESETS = {
    [1] = {
        graphicsQuality = 0, graphicsShadowQuality = 0,
        graphicsLiquidDetail = 0, graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1, graphicsSSAO = 0,
        graphicsDepthEffects = 0, graphicsComputeEffects = 0,
        graphicsTextureResolution = 0, graphicsSpellDensity = 0,
        graphicsProjectedTextures = 0, graphicsLightMode = 0,
        graphicsViewDistance = 0, graphicsEnvironmentDetail = 0,
        graphicsGroundClutter = 0,
    },
    [2] = {
        graphicsQuality = 1, graphicsShadowQuality = 0,
        graphicsLiquidDetail = 0, graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1, graphicsSSAO = 0,
        graphicsDepthEffects = 0, graphicsComputeEffects = 0,
        graphicsTextureResolution = 1, graphicsSpellDensity = 0,
        graphicsProjectedTextures = 1, graphicsLightMode = 0,
        graphicsViewDistance = 1, graphicsEnvironmentDetail = 1,
        graphicsGroundClutter = 1,
    },
    [3] = {
        graphicsQuality = 2, graphicsShadowQuality = 0,
        graphicsLiquidDetail = 1, graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1, graphicsSSAO = 0,
        graphicsDepthEffects = 0, graphicsComputeEffects = 1,
        graphicsTextureResolution = 1, graphicsSpellDensity = 0,
        graphicsProjectedTextures = 1, graphicsLightMode = 0,
        graphicsViewDistance = 2, graphicsEnvironmentDetail = 2,
        graphicsGroundClutter = 2,
    },
    [4] = {
        graphicsQuality = 3, graphicsShadowQuality = 1,
        graphicsLiquidDetail = 1, graphicsPBRLiquidDetail = 0,
        graphicsParticleDensity = 1, graphicsSSAO = 1,
        graphicsDepthEffects = 1, graphicsComputeEffects = 1,
        graphicsTextureResolution = 1, graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1, graphicsLightMode = 1,
        graphicsViewDistance = 3, graphicsEnvironmentDetail = 3,
        graphicsGroundClutter = 3,
    },
    [5] = {
        graphicsQuality = 4, graphicsShadowQuality = 2,
        graphicsLiquidDetail = 2, graphicsPBRLiquidDetail = 1,
        graphicsParticleDensity = 2, graphicsSSAO = 2,
        graphicsDepthEffects = 2, graphicsComputeEffects = 2,
        graphicsTextureResolution = 2, graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1, graphicsLightMode = 1,
        graphicsViewDistance = 4, graphicsEnvironmentDetail = 4,
        graphicsGroundClutter = 4,
    },
    [6] = {
        graphicsQuality = 5, graphicsShadowQuality = 3,
        graphicsLiquidDetail = 2, graphicsPBRLiquidDetail = 1,
        graphicsParticleDensity = 3, graphicsSSAO = 3,
        graphicsDepthEffects = 3, graphicsComputeEffects = 2,
        graphicsTextureResolution = 2, graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1, graphicsLightMode = 2,
        graphicsViewDistance = 5, graphicsEnvironmentDetail = 5,
        graphicsGroundClutter = 5,
    },
    [7] = {
        graphicsQuality = 6, graphicsShadowQuality = 4,
        graphicsLiquidDetail = 2, graphicsPBRLiquidDetail = 1,
        graphicsParticleDensity = 3, graphicsSSAO = 3,
        graphicsDepthEffects = 3, graphicsComputeEffects = 3,
        graphicsTextureResolution = 2, graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1, graphicsLightMode = 2,
        graphicsViewDistance = 6, graphicsEnvironmentDetail = 6,
        graphicsGroundClutter = 6,
    },
    [8] = {
        graphicsQuality = 7, graphicsShadowQuality = 4,
        graphicsLiquidDetail = 2, graphicsPBRLiquidDetail = 2,
        graphicsParticleDensity = 4, graphicsSSAO = 4,
        graphicsDepthEffects = 3, graphicsComputeEffects = 3,
        graphicsTextureResolution = 2, graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1, graphicsLightMode = 2,
        graphicsViewDistance = 7, graphicsEnvironmentDetail = 7,
        graphicsGroundClutter = 7,
    },
    [9] = {
        graphicsQuality = 8, graphicsShadowQuality = 5,
        graphicsLiquidDetail = 2, graphicsPBRLiquidDetail = 2,
        graphicsParticleDensity = 4, graphicsSSAO = 4,
        graphicsDepthEffects = 3, graphicsComputeEffects = 4,
        graphicsTextureResolution = 2, graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1, graphicsLightMode = 3,
        graphicsViewDistance = 8, graphicsEnvironmentDetail = 8,
        graphicsGroundClutter = 8,
    },
    [10] = {
        graphicsQuality = 9, graphicsShadowQuality = 5,
        graphicsLiquidDetail = 3, graphicsPBRLiquidDetail = 2,
        graphicsParticleDensity = 4, graphicsSSAO = 4,
        graphicsDepthEffects = 3, graphicsComputeEffects = 4,
        graphicsTextureResolution = 2, graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1, graphicsLightMode = 3,
        graphicsViewDistance = 9, graphicsEnvironmentDetail = 9,
        graphicsGroundClutter = 9,
    },
}

local GRAPHICS_OVERRIDES = {
    {
        cvar = "graphicsShadowQuality",
        label = "Shadow Quality",
        valueLabels = {
            [0] = "Low", [1] = "Fair", [2] = "Good",
            [3] = "High", [4] = "Ultra", [5] = "Ultra High",
        },
    },
    {
        cvar = "graphicsLiquidDetail",
        label = "Liquid Detail",
        valueLabels = {
            [0] = "Low", [1] = "Fair", [2] = "Good", [3] = "High",
        },
    },
    {
        cvar = "graphicsPBRLiquidDetail",
        label = "PBR Liquid Detail",
        valueLabels = {
            [0] = "Low", [1] = "High", [2] = "Ultra",
        },
    },
    {
        cvar = "graphicsParticleDensity",
        label = "Particle Density",
        valueLabels = {
            [0] = "Low", [1] = "Fair", [2] = "Good",
            [3] = "High", [4] = "Ultra",
        },
    },
    {
        cvar = "graphicsSSAO",
        label = "SSAO",
        valueLabels = {
            [0] = "Disabled", [1] = "Low", [2] = "Good",
            [3] = "High", [4] = "Ultra",
        },
    },
    {
        cvar = "graphicsDepthEffects",
        label = "Depth Effects",
        valueLabels = {
            [0] = "Disabled", [1] = "Low", [2] = "Good", [3] = "High",
        },
    },
    {
        cvar = "graphicsComputeEffects",
        label = "Compute Effects",
        valueLabels = {
            [0] = "Low", [1] = "Fair", [2] = "Good",
            [3] = "High", [4] = "Ultra",
        },
    },
    {
        cvar = "graphicsTextureResolution",
        label = "Texture Resolution",
        valueLabels = {
            [0] = "Low", [1] = "Fair", [2] = "High",
        },
    },
    {
        cvar = "graphicsSpellDensity",
        label = "Spell Density",
        valueLabels = {
            [0] = "Essential", [1] = "Reduced", [2] = "Everything",
        },
    },
    {
        cvar = "graphicsProjectedTextures",
        label = "Projected Textures",
        valueLabels = {
            [0] = "Disabled", [1] = "Enabled",
        },
    },
    {
        cvar = "graphicsLightMode",
        label = "Secondary Lighting",
        valueLabels = {
            [0] = "Fair", [1] = "Good", [2] = "High", [3] = "Ultra",
        },
    },
    {
        cvar = "graphicsViewDistance",
        label = "View Distance",
        slider = true,
        displayOffset = 1,
    },
    {
        cvar = "graphicsEnvironmentDetail",
        label = "Environment Detail",
        slider = true,
        displayOffset = 1,
    },
    {
        cvar = "graphicsGroundClutter",
        label = "Ground Clutter",
        slider = true,
        displayOffset = 1,
    },
}

-- Avoid stuttering controls these two dropdowns.
local AVOID_STUTTERING_CVARS = {
    graphicsTextureResolution = true,
    graphicsLightMode = true,
}

-- Avoid environment refresh controls this slider.
local AVOID_ENVIRONMENT_REFRESH_CVARS = {
    graphicsEnvironmentDetail = true,
}

local DEFAULTS = {
    outsideQuality = 10,
    cityQuality = 1,
    outsideRenderScale = 1.0,
    cityRenderScale = 1.0,
    avoidStuttering = false,
    avoidEnvironmentRefresh = false,
    secondaryLighting = "",
    graphicsOverrides = {},
    outsideOverrides = {},
    cityOverrides = {},
    areaToggles = {},
}

local db
local isInCrowdedArea = false
local lastProfile = nil
local category
local sliderCounter = 0

local refreshAllGraphicsSections

local function IsValidQuality(value)
    return type(value) == "number"
        and value >= 1
        and value <= 10
        and value == math.floor(value)
end

local function GetOverrideValues(cvar)
    local values = {}
    local seen = {}

    for quality = 1, 10 do
        local value = PRESETS[quality][cvar]

        if value ~= nil and not seen[value] then
            seen[value] = true
            table.insert(values, value)
        end
    end

    table.sort(values)
    return values
end

local function GetValueLabel(setting, value)
    if setting.valueLabels and setting.valueLabels[value] then
        return setting.valueLabels[value]
    end

    return tostring(value)
end

local function GetProfile(crowded)
    if crowded then
        return {
            qualityKey = "cityQuality",
            renderScaleKey = "cityRenderScale",
            overrides = db.cityOverrides,
        }
    end

    return {
        qualityKey = "outsideQuality",
        renderScaleKey = "outsideRenderScale",
        overrides = db.outsideOverrides,
    }
end

local function GetStandardEffectiveValue(cvar)
    local quality = db.outsideQuality
    local value = PRESETS[quality][cvar]

    if db.outsideOverrides[cvar] ~= nil then
        value = db.outsideOverrides[cvar]
    end

    return value
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

    if type(db.avoidStuttering) ~= "boolean" then
        db.avoidStuttering = DEFAULTS.avoidStuttering
    end

    if type(db.avoidEnvironmentRefresh) ~= "boolean" then
        db.avoidEnvironmentRefresh = DEFAULTS.avoidEnvironmentRefresh
    end

    if not IsValidQuality(db.outsideQuality) then
        db.outsideQuality = DEFAULTS.outsideQuality
    end

    if not IsValidQuality(db.cityQuality) then
        db.cityQuality = DEFAULTS.cityQuality
    end

    if type(db.outsideRenderScale) ~= "number"
        or db.outsideRenderScale < 0.33
        or db.outsideRenderScale > 1.0 then
        db.outsideRenderScale = DEFAULTS.outsideRenderScale
    end

    if type(db.cityRenderScale) ~= "number"
        or db.cityRenderScale < 0.33
        or db.cityRenderScale > 1.0 then
        db.cityRenderScale = DEFAULTS.cityRenderScale
    end

    if type(db.outsideOverrides) ~= "table" then
        db.outsideOverrides = {}
    end

    if type(db.cityOverrides) ~= "table" then
        db.cityOverrides = {}
    end

    if type(db.areaToggles) ~= "table" then
        db.areaToggles = {}
    end

    if type(db.graphicsOverrides) == "table" then
        for cvar, value in pairs(db.graphicsOverrides) do
            if db.outsideOverrides[cvar] == nil then
                db.outsideOverrides[cvar] = value
            end

            if db.cityOverrides[cvar] == nil then
                db.cityOverrides[cvar] = value
            end
        end
    end

    local lightingValues = {
        ["Fair"] = 0,
        ["Good"] = 1,
        ["High"] = 2,
        ["Ultra"] = 3,
    }

    if lightingValues[db.secondaryLighting] ~= nil then
        local value = lightingValues[db.secondaryLighting]

        if db.outsideOverrides.graphicsLightMode == nil then
            db.outsideOverrides.graphicsLightMode = value
        end

        if db.cityOverrides.graphicsLightMode == nil then
            db.cityOverrides.graphicsLightMode = value
        end
    end

    db.secondaryLighting = ""
    db.graphicsOverrides = {}

    for _, overrides in ipairs({
        db.outsideOverrides,
        db.cityOverrides,
    }) do
        for _, setting in ipairs(GRAPHICS_OVERRIDES) do
            local value = overrides[setting.cvar]
            local valid = value == nil

            if not valid then
                for _, allowedValue in ipairs(GetOverrideValues(setting.cvar)) do
                    if value == allowedValue then
                        valid = true
                        break
                    end
                end
            end

            if not valid then
                overrides[setting.cvar] = nil
            end
        end
    end

    local areaDefaults = {
        cities = true,
        dungeons = true,
        raids = true,
        battlegrounds = true,
    }

    for key, value in pairs(areaDefaults) do
        if db.areaToggles[key] == nil then
            db.areaToggles[key] = value
        end
    end
end

local function IsCrowdedArea()
    if not db then
        return false
    end

    local zone = GetRealZoneText()

    if db.areaToggles.cities and CITY_ZONE_SET[zone] then
        return true
    end

    local _, instanceType = GetInstanceInfo()

    if instanceType == "party" and db.areaToggles.dungeons then
        return true
    elseif instanceType == "raid" and db.areaToggles.raids then
        return true
    elseif instanceType == "pvp" and db.areaToggles.battlegrounds then
        return true
    end

    return false
end

local function SetCVarIfDifferent(cvar, value)
    if GetCVar(cvar) == nil then
        return
    end

    local currentValue = GetCVar(cvar)
    local targetValue = tostring(value)

    if currentValue ~= targetValue then
        SetCVar(cvar, value)
    end
end

local function ApplyEffectiveGraphicsSettings(quality, overrides)
    local preset = PRESETS[quality]
    if not preset then
        return
    end

    local finalSettings = {}

    for cvar, value in pairs(preset) do
        if cvar ~= "graphicsQuality" then
            finalSettings[cvar] = value
        end
    end

    if type(overrides) == "table" then
        for cvar, value in pairs(overrides) do
            finalSettings[cvar] = value
        end
    end

    for cvar, value in pairs(finalSettings) do
        SetCVarIfDifferent(cvar, value)
    end
end

local function ApplyCurrentProfile(force)
    if not db then
        return
    end

    local crowded = IsCrowdedArea()
    local profile = GetProfile(crowded)
    local quality = db[profile.qualityKey]
    local renderScale = db[profile.renderScaleKey]

    local profileKey = (crowded and "crowded-" or "outside-")
        .. quality .. "-" .. renderScale
        .. "-stuttering-" .. tostring(db.avoidStuttering)
        .. "-environment-" .. tostring(db.avoidEnvironmentRefresh)
        .. "-standard-" .. db.outsideQuality

    if not force and profileKey == lastProfile then
        return
    end

    if crowded then
        local effectiveCityOverrides = {}

        for cvar, value in pairs(db.cityOverrides) do
            effectiveCityOverrides[cvar] = value
        end

        if db.avoidStuttering then
            for cvar in pairs(AVOID_STUTTERING_CVARS) do
                effectiveCityOverrides[cvar] =
                    GetStandardEffectiveValue(cvar)
            end
        end

        if db.avoidEnvironmentRefresh then
            for cvar in pairs(AVOID_ENVIRONMENT_REFRESH_CVARS) do
                effectiveCityOverrides[cvar] =
                    GetStandardEffectiveValue(cvar)
            end
        end

        ApplyEffectiveGraphicsSettings(
            quality,
            effectiveCityOverrides
        )
    else
        ApplyEffectiveGraphicsSettings(quality, profile.overrides)
    end

    SetCVarIfDifferent("RenderScale", renderScale)

    lastProfile = profileKey
    isInCrowdedArea = crowded
end

local function CreateSectionTitle(parent, text, yOffset)
    local title = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormalLarge"
    )

    title:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, yOffset)
    title:SetText(text)

    return title
end

local function CreateDivider(parent, yOffset)
    local divider = parent:CreateTexture(nil, "ARTWORK")
    divider:SetColorTexture(1, 1, 1, 0.3)
    divider:SetHeight(1)
    divider:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, yOffset)
    divider:SetPoint("RIGHT", parent, "RIGHT", -8, 0)

    return divider
end

local function CreateGraphicsSliderFrame(parent)
    sliderCounter = sliderCounter + 1

    local sliderName = "CrowdControlSlider" .. sliderCounter

    local slider = CreateFrame(
        "Slider",
        sliderName,
        parent,
        "OptionsSliderTemplate"
    )

    local lowLabel = _G[sliderName .. "Low"]
    local highLabel = _G[sliderName .. "High"]

    if lowLabel then
        lowLabel:Hide()
    end

    if highLabel then
        highLabel:Hide()
    end

    return slider
end

local function CreateGraphicsDropdown(
    parent,
    setting,
    overrides,
    qualityKey,
    yOffset,
    linkToggleKey
)
    local label = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormal"
    )

    label:SetPoint("LEFT", parent, "TOPLEFT", 8, yOffset - 17)
    label:SetWidth(135)
    label:SetJustifyH("LEFT")
    label:SetText(setting.label)

    local dropdown = CreateFrame(
        "Frame",
        nil,
        parent,
        "UIDropDownMenuTemplate"
    )

    dropdown:SetPoint(
        "RIGHT",
        parent,
        "TOPRIGHT",
        0,
        yOffset - 17
    )

    UIDropDownMenu_SetWidth(dropdown, 85)

    local function IsLinked()
        return linkToggleKey ~= nil and db[linkToggleKey]
    end

    local function GetCurrentValue()
        if IsLinked() then
            return GetStandardEffectiveValue(setting.cvar)
        end

        local value = overrides[setting.cvar]

        if value == nil then
            value = PRESETS[db[qualityKey]][setting.cvar]
        end

        return value
    end

    local function Refresh()
        local linked = IsLinked()

        UIDropDownMenu_SetText(
            dropdown,
            GetValueLabel(setting, GetCurrentValue())
        )

        if linked then
            UIDropDownMenu_DisableDropDown(dropdown)
            label:SetTextColor(0.5, 0.5, 0.5)
        else
            UIDropDownMenu_EnableDropDown(dropdown)
            label:SetTextColor(1, 0.82, 0)
        end
    end

    UIDropDownMenu_Initialize(dropdown, function(self, level)
        if IsLinked() then
            return
        end

        local values = GetOverrideValues(setting.cvar)

        for _, value in ipairs(values) do
            local info = UIDropDownMenu_CreateInfo()

            info.text = GetValueLabel(setting, value)
            info.checked = GetCurrentValue() == value

            info.func = function()
                if IsLinked() then
                    return
                end

                overrides[setting.cvar] = value
                Refresh()

                ApplyCurrentProfile(true)

                if refreshAllGraphicsSections then
                    refreshAllGraphicsSections()
                end
            end

            UIDropDownMenu_AddButton(info, level)
        end
    end)

    Refresh()
    return Refresh
end

local function CreateGraphicsSlider(
    parent,
    setting,
    overrides,
    qualityKey,
    yOffset,
    linkToggleKey
)
    local values = GetOverrideValues(setting.cvar)
    local minValue = values[1]
    local maxValue = values[#values]

    local label = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormal"
    )

    label:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, yOffset)
    label:SetText(setting.label)

    local slider = CreateGraphicsSliderFrame(parent)

    slider:SetPoint(
        "TOPLEFT",
        label,
        "BOTTOMLEFT",
        0,
        -12
    )

    slider:SetPoint(
        "RIGHT",
        parent,
        "TOPRIGHT",
        -43,
        yOffset - 32
    )

    slider:SetHeight(16)
    slider:SetMinMaxValues(minValue, maxValue)
    slider:SetValueStep(1)

    if slider.SetObeyStepOnDrag then
        slider:SetObeyStepOnDrag(true)
    end

    local valueText = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontHighlightSmall"
    )

    valueText:SetPoint("LEFT", slider, "RIGHT", 7, 0)
    valueText:SetJustifyH("LEFT")

    local updating = false

    local function IsLinked()
        return linkToggleKey ~= nil and db[linkToggleKey]
    end

    local function GetCurrentValue()
        if IsLinked() then
            return GetStandardEffectiveValue(setting.cvar)
        end

        local value = overrides[setting.cvar]

        if value == nil then
            value = PRESETS[db[qualityKey]][setting.cvar]
        end

        return value
    end

    local function Refresh()
        updating = true

        local value = GetCurrentValue()
        local linked = IsLinked()

        slider:SetValue(value)

        valueText:SetText(
            tostring(value + (setting.displayOffset or 0))
        )

        if linked then
            slider:Disable()
            label:SetTextColor(0.5, 0.5, 0.5)
            valueText:SetTextColor(0.5, 0.5, 0.5)
        else
            slider:Enable()
            label:SetTextColor(1, 0.82, 0)
            valueText:SetTextColor(1, 1, 1)
        end

        updating = false
    end

    slider:SetScript("OnValueChanged", function(self, value)
        if updating then
            return
        end

        if IsLinked() then
            return
        end

        value = math.floor(value + 0.5)
        overrides[setting.cvar] = value

        valueText:SetText(
            tostring(value + (setting.displayOffset or 0))
        )

        ApplyCurrentProfile(true)

        if refreshAllGraphicsSections then
            refreshAllGraphicsSections()
        end
    end)

    Refresh()
    return Refresh
end

local function CreateGraphicsSection(
    parent,
    title,
    qualityKey,
    overrides,
    isCrowdedColumn
)
    local refreshFunctions = {}

    CreateSectionTitle(parent, title, -10)

    local renderScaleLabel = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormal"
    )

    renderScaleLabel:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, -48)
    renderScaleLabel:SetText("Render Scale")

    local renderScaleSlider = CreateGraphicsSliderFrame(parent)

    renderScaleSlider:SetPoint(
        "TOPLEFT",
        renderScaleLabel,
        "BOTTOMLEFT",
        0,
        -12
    )

    renderScaleSlider:SetPoint(
        "RIGHT",
        parent,
        "TOPRIGHT",
        -43,
        -80
    )

    renderScaleSlider:SetHeight(16)
    renderScaleSlider:SetMinMaxValues(0.33, 1.0)
    renderScaleSlider:SetValueStep(0.01)

    if renderScaleSlider.SetObeyStepOnDrag then
        renderScaleSlider:SetObeyStepOnDrag(true)
    end

    local renderScaleValueText = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontHighlightSmall"
    )

    renderScaleValueText:SetPoint("LEFT", renderScaleSlider, "RIGHT", 7, 0)
    renderScaleValueText:SetJustifyH("LEFT")

    local updatingRenderScale = false
    local renderScaleKey = qualityKey == "cityQuality"
        and "cityRenderScale"
        or "outsideRenderScale"

    local function RefreshRenderScale()
        updatingRenderScale = true

        local renderScale = db[renderScaleKey]
        renderScaleSlider:SetValue(renderScale)

        renderScaleValueText:SetText(
            string.format("%d%%", math.floor(renderScale * 100 + 0.5))
        )

        updatingRenderScale = false
    end

    renderScaleSlider:SetScript("OnValueChanged", function(self, value)
        if updatingRenderScale then
            return
        end

        value = math.floor(value * 100 + 0.5) / 100
        value = math.max(0.33, math.min(1.0, value))

        db[renderScaleKey] = value

        renderScaleValueText:SetText(
            string.format("%d%%", math.floor(value * 100 + 0.5))
        )

        ApplyCurrentProfile(true)
    end)

    local baseLabel = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormal"
    )

    baseLabel:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, -123)
    baseLabel:SetText("Base Game Quality")

    local baseSlider = CreateGraphicsSliderFrame(parent)

    baseSlider:SetPoint(
        "TOPLEFT",
        baseLabel,
        "BOTTOMLEFT",
        0,
        -12
    )

    baseSlider:SetPoint(
        "RIGHT",
        parent,
        "TOPRIGHT",
        -43,
        -155
    )

    baseSlider:SetHeight(16)
    baseSlider:SetMinMaxValues(1, 10)
    baseSlider:SetValueStep(1)

    if baseSlider.SetObeyStepOnDrag then
        baseSlider:SetObeyStepOnDrag(true)
    end

    local baseValueText = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontHighlightSmall"
    )

    baseValueText:SetPoint("LEFT", baseSlider, "RIGHT", 7, 0)
    baseValueText:SetJustifyH("LEFT")

    local updatingBase = false

    local function RefreshBase()
        updatingBase = true

        local quality = db[qualityKey]

        baseSlider:SetValue(quality)
        baseValueText:SetText(tostring(quality))

        updatingBase = false
    end

    baseSlider:SetScript("OnValueChanged", function(self, value)
        if updatingBase then
            return
        end

        value = math.floor(value + 0.5)
        value = math.max(1, math.min(10, value))

        db[qualityKey] = value

        for _, setting in ipairs(GRAPHICS_OVERRIDES) do
            overrides[setting.cvar] = nil
        end

        baseValueText:SetText(tostring(value))

        for _, refresh in ipairs(refreshFunctions) do
            refresh()
        end

        ApplyCurrentProfile(true)

        if refreshAllGraphicsSections then
            refreshAllGraphicsSections()
        end
    end)

    RefreshBase()
    RefreshRenderScale()

    local currentYOffset = -210
    local firstSlider = true

    for _, setting in ipairs(GRAPHICS_OVERRIDES) do
        local refresh
        local linkToggleKey = nil

        if isCrowdedColumn then
            if AVOID_STUTTERING_CVARS[setting.cvar] then
                linkToggleKey = "avoidStuttering"
            elseif AVOID_ENVIRONMENT_REFRESH_CVARS[setting.cvar] then
                linkToggleKey = "avoidEnvironmentRefresh"
            end
        end

        if setting.slider then
            if firstSlider then
                currentYOffset = currentYOffset - 16
                firstSlider = false
            end

            refresh = CreateGraphicsSlider(
                parent,
                setting,
                overrides,
                qualityKey,
                currentYOffset,
                linkToggleKey
            )

            currentYOffset = currentYOffset - 75
        else
            refresh = CreateGraphicsDropdown(
                parent,
                setting,
                overrides,
                qualityKey,
                currentYOffset,
                linkToggleKey
            )

            currentYOffset = currentYOffset - 38
        end

        table.insert(refreshFunctions, refresh)
    end

    return {
        refresh = function()
            RefreshRenderScale()
            RefreshBase()

            for _, refresh in ipairs(refreshFunctions) do
                refresh()
            end
        end,

        height = math.abs(currentYOffset) + 25,
    }
end

local function CreateAreaCheckbox(parent, text, x, y, checked, onClick)
    local button = CreateFrame(
        "CheckButton",
        nil,
        parent,
        "UICheckButtonTemplate"
    )

    button:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    button:SetSize(24, 24)
    button:SetChecked(checked)
    button:Show()

    local label = parent:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormal"
    )

    label:SetPoint("LEFT", button, "RIGHT", 2, 0)
    label:SetText(text)
    label:Show()

    button:SetScript("OnClick", function(self)
        onClick(self:GetChecked() and true or false)
    end)

    return button
end

local function CreateOptionsPanel()
    local panel = CreateFrame("Frame")
    panel.name = "Crowd Control"

    local scrollFrame = CreateFrame(
        "ScrollFrame",
        nil,
        panel,
        "UIPanelScrollFrameTemplate"
    )

    scrollFrame:SetPoint(
        "TOPLEFT",
        panel,
        "TOPLEFT",
        0,
        -15
    )

    scrollFrame:SetPoint(
        "BOTTOMRIGHT",
        panel,
        "BOTTOMRIGHT",
        -30,
        15
    )

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetWidth(760)
    content:SetHeight(1600)

    scrollFrame:SetScrollChild(content)
    scrollFrame:EnableMouseWheel(true)

    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local current = self:GetVerticalScroll()
        local maximum = self:GetVerticalScrollRange()

        self:SetVerticalScroll(
            math.max(
                0,
                math.min(maximum, current - (delta * 40))
            )
        )
    end)

    local areaTitle = CreateSectionTitle(
        content,
        "Crowded Areas",
        -12
    )

    areaTitle:ClearAllPoints()
    areaTitle:SetPoint(
        "TOPLEFT",
        content,
        "TOPLEFT",
        16,
        -12
    )

    local areaDescription = content:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontHighlightSmall"
    )

    areaDescription:ClearAllPoints()
    areaDescription:SetPoint(
        "TOPLEFT",
        areaTitle,
        "BOTTOMLEFT",
        0,
        -6
    )

    areaDescription:SetText(
        "Control where 'Graphics (crowded areas)' should be applied."
    )

    local areaOptionsFrame = CreateFrame("Frame", nil, content)
    areaOptionsFrame:SetPoint(
        "TOPLEFT",
        areaDescription,
        "BOTTOMLEFT",
        0,
        -18
    )
    areaOptionsFrame:SetPoint(
        "RIGHT",
        content,
        "RIGHT",
        0,
        0
    )
    areaOptionsFrame:SetHeight(32)
    areaOptionsFrame:Show()

    local areaOptions = {
        { key = "cities", label = "Cities" },
        { key = "dungeons", label = "Dungeons" },
        { key = "raids", label = "Raids" },
        { key = "battlegrounds", label = "Battlegrounds" },
    }

    local areaCheckboxes = {}

    local function RefreshAreaCheckboxes()
        for _, option in ipairs(areaOptions) do
            local button = areaCheckboxes[option.key]

            if button then
                button:SetChecked(db.areaToggles[option.key])
            end
        end
    end

    local areaPositions = {
        { x = -3 },
        { x = 144 },
        { x = 299 },
        { x = 414 },
    }

    for index, option in ipairs(areaOptions) do
        local position = areaPositions[index]

        local button = CreateAreaCheckbox(
            areaOptionsFrame,
            option.label,
            position.x,
            0,
            db.areaToggles[option.key],
            function(checked)
                db.areaToggles[option.key] = checked
                RefreshAreaCheckboxes()
                ApplyCurrentProfile(true)
            end
        )

        areaCheckboxes[option.key] = button
    end

    local areaDivider = CreateDivider(content, -115)

    -- Smooth Transition heading.
    local smoothTransitionHeading = content:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormalLarge"
    )

    smoothTransitionHeading:SetPoint(
        "TOPLEFT",
        content,
        "TOPLEFT",
        16,
        -145
    )
    smoothTransitionHeading:SetText("Smooth Transitions")

    -- Smooth Transition description.
    local smoothTransitionDescription = content:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontHighlightSmall"
    )

    smoothTransitionDescription:SetPoint(
        "TOPLEFT",
        smoothTransitionHeading,
        "BOTTOMLEFT",
        0,
        -6
    )

    smoothTransitionDescription:SetText(
        "Control how to handle transitions in graphics."
    )

    -- Avoid stuttering toggle.
    local avoidStutteringButton = CreateFrame(
        "CheckButton",
        nil,
        content,
        "UICheckButtonTemplate"
    )

    avoidStutteringButton:SetPoint(
        "TOPLEFT",
        smoothTransitionDescription,
        "BOTTOMLEFT",
        -4,
        -18
    )
    avoidStutteringButton:SetSize(24, 24)
    avoidStutteringButton:SetChecked(db.avoidStuttering)

    local avoidStutteringLabel = content:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormal"
    )

    avoidStutteringLabel:SetPoint(
        "LEFT",
        avoidStutteringButton,
        "RIGHT",
        2,
        0
    )
    avoidStutteringLabel:SetWidth(680)
    avoidStutteringLabel:SetJustifyH("LEFT")
    avoidStutteringLabel:SetWordWrap(true)
    avoidStutteringLabel:SetText(
        "|cffffd100No stutter|r|cffffffff by locking 'Texture Resolution' and 'Secondary Lighting' to '(standard)' values.|r"
    )

    avoidStutteringButton:SetScript("OnClick", function(self)
        db.avoidStuttering = self:GetChecked() and true or false

        ApplyCurrentProfile(true)

        if refreshAllGraphicsSections then
            refreshAllGraphicsSections()
        end
    end)

    -- Avoid environment toggle, stacked underneath.
    local avoidEnvironmentRefreshButton = CreateFrame(
        "CheckButton",
        nil,
        content,
        "UICheckButtonTemplate"
    )

    avoidEnvironmentRefreshButton:SetPoint(
        "TOPLEFT",
        avoidStutteringButton,
        "BOTTOMLEFT",
        0,
        -8
    )
    avoidEnvironmentRefreshButton:SetSize(24, 24)
    avoidEnvironmentRefreshButton:SetChecked(db.avoidEnvironmentRefresh)

    local avoidEnvironmentRefreshLabel = content:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontNormal"
    )

    avoidEnvironmentRefreshLabel:SetPoint(
        "LEFT",
        avoidEnvironmentRefreshButton,
        "RIGHT",
        2,
        0
    )
    avoidEnvironmentRefreshLabel:SetWidth(680)
    avoidEnvironmentRefreshLabel:SetJustifyH("LEFT")
    avoidEnvironmentRefreshLabel:SetWordWrap(true)
    avoidEnvironmentRefreshLabel:SetText(
        "|cffffd100No environment refresh|r|cffffffff by locking 'Environment Detail' to '(standard)' value.|r"
    )

    avoidEnvironmentRefreshButton:SetScript("OnClick", function(self)
        db.avoidEnvironmentRefresh = self:GetChecked() and true or false

        ApplyCurrentProfile(true)

        if refreshAllGraphicsSections then
            refreshAllGraphicsSections()
        end
    end)

    local graphicsTop = -285

    local outsideFrame = CreateFrame("Frame", nil, content)
    local cityFrame = CreateFrame("Frame", nil, content)

    outsideFrame:SetPoint(
        "TOPLEFT",
        content,
        "TOPLEFT",
        5,
        graphicsTop
    )

    cityFrame:SetPoint(
        "TOPLEFT",
        outsideFrame,
        "TOPRIGHT",
        30,
        0
    )

    local outsideSection = CreateGraphicsSection(
        outsideFrame,
        "Graphics (standard)",
        "outsideQuality",
        db.outsideOverrides,
        false
    )

    local citySection = CreateGraphicsSection(
        cityFrame,
        "Graphics (crowded areas)",
        "cityQuality",
        db.cityOverrides,
        true
    )

    refreshAllGraphicsSections = function()
        outsideSection.refresh()
        citySection.refresh()

        avoidStutteringButton:SetChecked(db.avoidStuttering)
        avoidEnvironmentRefreshButton:SetChecked(
            db.avoidEnvironmentRefresh
        )
    end

    local sectionHeight = math.max(
        outsideSection.height,
        citySection.height
    )

    outsideFrame:SetHeight(sectionHeight)
    cityFrame:SetHeight(sectionHeight)

    local graphicsDivider = content:CreateTexture(nil, "ARTWORK")
    graphicsDivider:SetColorTexture(1, 1, 1, 0.25)
    graphicsDivider:SetWidth(1)

    local graphicsBottomDivider = CreateDivider(
        content,
        -(graphicsTop + sectionHeight + 25)
    )

    local credit = content:CreateFontString(
        nil,
        "ARTWORK",
        "GameFontHighlightSmall"
    )

    credit:SetPoint(
        "TOPLEFT",
        graphicsBottomDivider,
        "BOTTOMLEFT",
        0,
        -15
    )
    credit:SetText("github.com/hejathor/crowdcontrol")

    local function UpdateColumnWidths()
        local scrollWidth = scrollFrame:GetWidth()

        if not scrollWidth or scrollWidth <= 100 then
            return
        end

        local contentWidth = scrollWidth - 8

        if contentWidth <= 100 then
            return
        end

        content:SetWidth(contentWidth)
        areaOptionsFrame:SetWidth(contentWidth - 16)

        local outerMargin = 5
        local centerGap = 30

        local columnWidth = (
            contentWidth
            - (outerMargin * 2)
            - centerGap
        ) / 2

        outsideFrame:SetWidth(columnWidth)
        outsideFrame:ClearAllPoints()
        outsideFrame:SetPoint(
            "TOPLEFT",
            content,
            "TOPLEFT",
            outerMargin,
            graphicsTop
        )

        cityFrame:SetWidth(columnWidth)
        cityFrame:ClearAllPoints()
        cityFrame:SetPoint(
            "TOPLEFT",
            outsideFrame,
            "TOPRIGHT",
            centerGap,
            0
        )

        local leftContentInset = 8
        local rightControlInset = 10

        local visualDividerOffset = (
            centerGap + leftContentInset - rightControlInset
        ) / 2

        graphicsDivider:ClearAllPoints()

        graphicsDivider:SetPoint(
            "TOP",
            outsideFrame,
            "TOPRIGHT",
            visualDividerOffset,
            -10
        )

        graphicsDivider:SetPoint(
            "BOTTOM",
            outsideFrame,
            "BOTTOMRIGHT",
            visualDividerOffset,
            5
        )

        graphicsBottomDivider:ClearAllPoints()
        graphicsBottomDivider:SetPoint(
            "TOPLEFT",
            content,
            "TOPLEFT",
            5,
            -(math.abs(graphicsTop) + sectionHeight + 25)
        )
        graphicsBottomDivider:SetPoint(
            "RIGHT",
            content,
            "RIGHT",
            -5,
            0
        )

        credit:ClearAllPoints()
        credit:SetPoint(
            "TOPLEFT",
            graphicsBottomDivider,
            "BOTTOMLEFT",
            8,
            -15
        )

        content:SetHeight(
            math.abs(graphicsTop) + sectionHeight + 100
        )
    end

    scrollFrame:SetScript("OnSizeChanged", UpdateColumnWidths)

    panel:SetScript("OnShow", function()
        UpdateColumnWidths()
        RefreshAreaCheckboxes()

        avoidStutteringButton:SetChecked(db.avoidStuttering)
        avoidEnvironmentRefreshButton:SetChecked(
            db.avoidEnvironmentRefresh
        )

        scrollFrame:SetVerticalScroll(0)

        outsideSection.refresh()
        citySection.refresh()
    end)

    UpdateColumnWidths()

    if Settings and Settings.RegisterCanvasLayoutCategory then
        category = Settings.RegisterCanvasLayoutCategory(
            panel,
            panel.name
        )

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

        local crowded = IsCrowdedArea()

        if crowded ~= isInCrowdedArea then
            ApplyCurrentProfile(true)
        end
    end
end)