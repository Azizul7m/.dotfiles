-- Lua
require('onedark').setup {
     style = 'dark',
     transparent = false,  -- Show/hide background
     code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'bolditalic',
        strings = 'italic',
        variables = 'none'
     },
      -- Lualine options --
    lualine = {
        transparent = true, -- lualine center bar transparency
    },
    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
require('onedark').load()
