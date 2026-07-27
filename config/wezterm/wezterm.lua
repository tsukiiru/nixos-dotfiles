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
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_and_split_indices_are_zero_based = false
config.default_cursor_style = "BlinkingBar"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 4000 }
config.keys = {
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.SplitPane({
			direction = "Right",
		}),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitPane({
			direction = "Down",
		}),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "k", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "q",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "q",
		mods = "ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "t",
		mods = "ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.PaneSelect({
			alphabet = "1234567890",
		}),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

function tab_title(tab_info)
	local title = tab_info.tab_title
	if not title or #title == 0 then
		title = tab_info.active_pane.title
	end

	local t = {}
	for item in string.gmatch(title, "([^" .. " " .. "]+)") do
		table.insert(t, item)
	end

	local app = "fish"
	local icon = "󰄛"

	if #t > 1 then
		app = t[1]
	end

	if app == "nvim" then
		icon = ""
	elseif app == "fish" then
		icon = ""
	elseif app == "btop" then
		icon = "󰞱"
	elseif app == "bat" or app == "cat" then
		icon = ""
	elseif app == "sleep" then
		icon = "󰒲"
	elseif app == "nix" then
		icon = "󱄅"
	elseif app == "git" then
		icon = ""
	end

	title = tab_info.tab_index + 1 .. ":" .. app .. " " .. icon
	title = " " .. title .. " "

	return title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#d1cfc5"
	local foreground = "#8e8a80"

	local title = tab_title(tab)

	if tab.is_active then
		foreground = "#84a098"
	end

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

-- Center tab bar
wezterm.on("update-status", function(gui_window, pane)
	local tabs = gui_window:mux_window():tabs()
	local mid_width = 0
	for idx, tab in ipairs(tabs) do
		local title = tab:get_title()
		mid_width = mid_width + math.floor(math.log(idx, 10)) + 1
		mid_width = mid_width + 8 + #title
	end
	local tab_width = gui_window:active_tab():get_size().cols
	local max_left = tab_width / 2 - mid_width / 2

	gui_window:set_left_status(wezterm.pad_left(" ", max_left))
	gui_window:set_right_status("")
end)

return config
