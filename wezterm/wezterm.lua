local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- tmux draws the tab bar at the top, so hide WezTerm's own unless you open a second WezTerm tab
config.hide_tab_bar_if_only_one_tab = true

-- Launch straight into tmux: attach to "main", or build it with the Claude / shell / shell layout (see ~/.local/bin/tmux-main)
config.default_prog = { os.getenv("HOME") .. "/.local/bin/tmux-main" }

-- ---- Liquid glass look ----
-- Tokyo Night palette (matches nvim + tmux), with a translucent, tinted "glass" background.
config.color_scheme = "Tokyo Night"

-- A soft, cool gradient at partial opacity: the desktop shows through with a frosted tint.
-- Lower the opacity for more see-through; raise it if text gets hard to read over busy wallpapers.
config.background = {
  {
    source = {
      Gradient = {
        orientation = { Linear = { angle = -45.0 } },
        colors = { "#1a1d33", "#1f1b33", "#152634" },
        interpolation = "CatmullRom",
        blend = "Oklab",
      },
    },
    width = "100%",
    height = "100%",
    opacity = 0.92,
  },
}
-- Cells that apps paint with their own background (selections, popups, tmux bar) stay a bit see-through too
config.text_background_opacity = 0.95

-- Background blur (Wayland compositors that support it, e.g. KDE); on GNOME use the "Blur my Shell" extension
config.wayland_window_background_blur = true

-- Airy padding, like content floating inside a glass pane
config.window_padding = { left = 10, right = 10, top = 6, bottom = 4 }

-- Dim and desaturate inactive panes slightly so the focused one "lifts"
config.inactive_pane_hsb = { saturation = 0.85, brightness = 0.75 }

-- Smooth, eased cursor blink
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 700
config.cursor_blink_ease_in = "EaseOut"
config.cursor_blink_ease_out = "EaseOut"
config.animation_fps = 60
config.colors = {
  cursor_bg = "#a9c7ff",
  cursor_border = "#a9c7ff",
  cursor_fg = "#1a1d33",
  selection_bg = "#33467c",
  selection_fg = "#e6ecff",
  split = "#5a6aa0",
  -- Only visible when WezTerm's own tab bar shows (2+ WezTerm tabs)
  tab_bar = {
    background = "rgba(26, 29, 51, 0.6)",
    active_tab = { bg_color = "rgba(122, 162, 247, 0.35)", fg_color = "#e6ecff" },
    inactive_tab = { bg_color = "rgba(26, 29, 51, 0.4)", fg_color = "#8b8fa8" },
    inactive_tab_hover = { bg_color = "rgba(122, 162, 247, 0.2)", fg_color = "#c0caf5" },
    new_tab = { bg_color = "rgba(26, 29, 51, 0.4)", fg_color = "#8b8fa8" },
    new_tab_hover = { bg_color = "rgba(122, 162, 247, 0.2)", fg_color = "#c0caf5" },
  },
}
config.use_fancy_tab_bar = false

return config
