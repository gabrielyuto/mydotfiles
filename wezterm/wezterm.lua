local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Configurações de janela
config.initial_cols = 150
config.initial_rows = 40
config.window_background_opacity = 0.95
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}

-- Configurações de fonte
config.font = wezterm.font("JetBrains Mono", { 
    weight = "Regular", 
    italic = true  -- Mudei para false porque muitas fontes não suportam itálico bem
})
config.font_size = 15.0
config.freetype_load_flags = "NO_HINTING"  -- Melhora a renderização da fonte

-- Esquema de cores
config.color_scheme = "Dracula"
config.colors = {
    cursor_bg = "#FFFFFF",
    cursor_fg = "#000000",
}

-- Configurações de teclado (exemplo)
config.keys = {
    {
        key = "t",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
}

return config