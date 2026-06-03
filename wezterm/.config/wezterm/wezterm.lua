local wezterm = require("wezterm")

local config = {}

config.color_scheme = "Tokyo Night"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.9
config.win32_system_backdrop = "Acrylic"
config.enable_tab_bar = false

config.default_domain = "WSL:archlinux"

wezterm.on("gui-startup", function()
  local mux = wezterm.mux
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

return config
