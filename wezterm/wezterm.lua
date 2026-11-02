local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- tmux draws the tab bar at the top, so hide WezTerm's own unless you open a second WezTerm tab
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 4, right = 4, top = 0, bottom = 0 }

return config
