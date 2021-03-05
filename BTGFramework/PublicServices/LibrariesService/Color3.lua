--//Module Essentials
local Color3Module = {}

--//Variables
local BlankColor3 = Color3.new()

--//Public Functions
Color3Module.New = Color3.new
Color3Module.FromRGB = Color3.fromRGB
Color3Module.FromHSV = Color3.fromHSV
Color3Module.ToHSV = Color3.toHSV
Color3Module.Lerp = BlankColor3.Lerp

Color3Module.ToRGB = function(Input)
    assert(typeof(Input) == "Color3", string.format("BTGFramework.LibrariesService.Color3.ToRGB function error: Argument 1 expected Color3; got %s.", typeof(Input)))
    return math.floor(Input.R * 255), math.floor(Input.G * 255), math.floor(Input.B * 255)
end

Color3Module.FromHEX = function(Input)
    Input = (type(Input) == "string" and Input) or "#000000"
    local Red, Green, Blue = string.match(Input, "%s*#?(%x%x)(%x%x)(%x%x)%s*")
    return Color3.fromRGB(tonumber("0x" .. Red), tonumber("0x" .. Green), tonumber("0x" .. Blue))
end

Color3Module.FromHSL = function(Hue, Saturation, Lightness)
    Hue = (type(Hue) == "number" and Hue % 360) or 0
    Saturation = (type(Saturation) == "number" and math.clamp(Saturation, 0, 1)) or 0
    Lightness = (type(Lightness) == "number" and math.clamp(Lightness, 0, 1)) or 0
    local C = (1 - math.abs(2 * Lightness - 1)) * Saturation
    local X = C * (1 - math.abs((Hue / 60) % 2 - 1))
    local M = Lightness - C / 2
    local Red, Green, Blue = 0, 0, 0
    if Hue <= 0 and Hue < 60 then 
        Red, Green, Blue = C, X, 0
    elseif Hue <= 60 and Hue < 120 then
        Red, Green, Blue = X, C, 0
    elseif Hue <= 120 and Hue < 180 then
        Red, Green, Blue = 0, C, X
    elseif Hue <= 180 and Hue < 240 then
        Red, Green, Blue = 0, X, C
    elseif Hue <= 240 and Hue < 300 then
        Red, Green, Blue = X, 0, C
    elseif Hue <= 300 and Hue < 360 then
        Red, Green, Blue = C, 0, X
    end
    return Color3.fromRGB((Red + M) * 255, (Green + M) * 255, (Blue + M) * 255)
end

Color3Module.ToHSL = function(Input)
    assert(typeof(Input) == "Color3", string.format("BTGFramework.LibrariesService.Color3.ToHSL function error: Argument 1 expected Color3; got %s.", typeof(Input)))
    local Red, Green, Blue = Color3Module.ToRGB(Input)
    Red, Green, Blue = Red / 255, Green / 255, Blue / 255
    local CMax = math.max(Red, Green, Blue)
    local CMin = math.min(Red, Green, Blue)
    local Delta = CMax- CMin
    local Hue, Saturation, Lightness = 0, 0, (CMax + CMin) / 2
    if Delta == 0 then 
        Hue = 0
        Saturation = 0
    elseif CMax == Red then
        Hue = 60 * (((Green - Blue) / Delta) % 6)
        Saturation = (Delta / (1 - math.abs(2 * Lightness - 1)))
    elseif CMax == Green then
        Hue = 60 * (((Blue - Red) / Delta) + 2)
        Saturation = (Delta / (1 - math.abs(2 * Lightness - 1)))
    elseif CMax == Blue then
        Hue = 60 * (((Red - Green) / Delta) + 4)
        Saturation = (Delta / (1 - math.abs(2 * Lightness - 1)))
    end
    return Hue, Saturation, Lightness
end

Color3Module.FromCMYK = function(Cyan, Magenta, Yellow, Black)
    Cyan = (type(Cyan) == "number" and math.clamp(Cyan, 0, 1)) or 0
    Magenta = (type(Magenta) == "number" and math.clamp(Magenta, 0, 1)) or 0
    Yellow = (type(Yellow) == "number" and math.clamp(Yellow, 0, 1)) or 0
    Black = (type(Black) == "number" and math.clamp(Black, 0, 1)) or 0
    return Color3.fromRGB(255 * (1 - Cyan) * (1 - Black), 255 * (1 - Magenta) * (1 - Black), 255 * (1 - Yellow) * (1 - Black))
end

Color3Module.ToCMYK = function(Input)
    assert(typeof(Input) == "Color3", string.format("BTGFramework.LibrariesService.Color3.ToCMYK function error: Argument 1 expected Color3; got %s.", typeof(Input)))
    local Red, Green, Blue = Color3Module.ToRGB(Input)
    Red, Green, Blue = Red / 255, Green / 255, Blue / 255
    local Black = 1 - math.max(Red, Green, Blue)
    return (1 - Red - Black) / (1 - Black), (1 - Green - Black) / (1 - Black), (1 - Blue - Black) / (1 - Black), Black
end

return Color3Module