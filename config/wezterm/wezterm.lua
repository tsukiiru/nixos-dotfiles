local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

config.font_size = 10
config.font = wezterm.font("Cartograph CF")
config.color_scheme = "kanagawa-paper-canvas"

config.window_frame = {
	font = wezterm.font("Cartograph CF"),
}

config.enable_tab_bar = true
config.tab_max_width = 24
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.show_new_tab_button_in_tab_bar = false
config.default_cursor_style = "BlinkingBar"

config.keys = {
	{
		key = "e",
		mods = "ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
		}),
	},
	{
		key = "o",
		mods = "ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
		}),
	},
	{
		key = "q",
		mods = "ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

return config
