local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.automatically_reload_config = true

-- Keybind Settings
config.disable_default_key_bindings = true

config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	-- paste
	{ key = "v", mods = "SUPER", action = act.PasteFrom("PrimarySelection") },
}

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Appearance Settings
config.color_scheme = "zenbones_dark"
config.window_background_opacity = 0.8
config.text_background_opacity = 0.8

config.font = wezterm.font("HackGen35 Console NF")
config.font_size = 14

-- Tab Settings
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

-- IME Settings
config.use_ime = true

return config
