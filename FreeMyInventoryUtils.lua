FMI.utils.Behead = function(sentence)
    local result = string.match(sentence, "%S+ *")
    if result ~= nil then
        sentence = string.sub(sentence, string.len(result) + 1)
    else
        result = nil
        sentence = nil
    end
    return result, sentence
end

FMI.utils.SplitString = function(sentence)
    local result = {}
    local i = 0
    while sentence ~= nil do
        i = i + 1
        result[i], sentence = FMI.utils.Behead(sentence)
    end

    return result
end

FMI.utils.Trim = function(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

FMI.utils.FirstChar = function(s)
    return s:sub(1, 1)
end

FMI.utils.GetQualityColor = function(s)
    local colors = GetItemQualityColor(s)

    local colorcode =
        FMI.utils.ToHex(colors.r * 255) .. FMI.utils.ToHex(colors.g * 255) .. FMI.utils.ToHex(colors.b * 255)

    return colorcode
end

FMI.utils.ToHex = function(s)
    local hex = string.format("%x", s)

    if string.len(hex) < 2 then
        hex = "0" .. hex
    end

    return hex
end
