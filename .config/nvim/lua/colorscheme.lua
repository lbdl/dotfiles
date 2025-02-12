-- ~/.config/nvim/lua/colorscheme.lua

-- Define the color scheme based on Monokai
local colors = {
    -- Base colors
    background = "#272822",
    foreground = "#F8F8F2",
    selection = "#49483E",
    comments = "#75715E",
    
    -- Primary colors
    yellow = "#E6DB74",
    orange = "#FD971F",
    red = "#F92672",
    magenta = "#FD5FF0",
    violet = "#AE81FF",
    blue = "#66D9EF",
    cyan = "#A1EFE4",
    green = "#A6E22E",

    -- UI elements
    lineNumber = "#90908A",
    selectedLine = "#3E3D32",
    statusLine = "#414339",
    statusLineNC = "#32322C",
    pmenu = "#3E3D32",
    pmenuSel = "#414339",

    -- Git colors
    gitAddedGreen = "#A6E22E",
    gitModifiedBlue = "#66D9EF",
    gitDeletedRed = "#F92672",

    -- Diagnostics
    errorRed = "#F92672",
    warningOrange = "#FD971F",
    infoBlue = "#66D9EF",
    hintGreen = "#A6E22E",

    -- Special highlights
    findHighlight = "#FFE792",
    findHighlightForeground = "#000000",
    
    -- Specific mappings for notify
    samuraiRed = "#F92672",      -- Using Monokai red
    roninYellow = "#FD971F",     -- Using Monokai orange
    springGreen = "#A6E22E",     -- Using Monokai green
    fujiGray = "#75715E",        -- Using Monokai comments color
    sumiInk1 = "#272822",        -- Using Monokai background
}

return colors
