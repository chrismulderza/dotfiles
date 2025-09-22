-- pull in wezterm API
local wezterm = require("wezterm")

-- this will hold the configuration
local config = wezterm.config_builder()

local nord = {
	nord0 = "#2E3440",
	nord1 = "#3B4252",
	nord2 = "#434C5E",
	nord3 = "#4C566A",
	nord4 = "#D8DEE9",
	nord5 = "#E5E9F0",
	nord6 = "#ECEFF4",
	nord7 = "#8FBCBB",
	nord8 = "#88C0D0",
	nord9 = "#81A1C1",
	nord10 = "#5E81AC",
	nord11 = "#BF616A",
	nord12 = "#D08770",
	nord13 = "#EBCB8B",
	nord14 = "#A3BE8C",
	nord15 = "#B48EAD",
}

local colorscheme = {
	-- The default text color
	foreground = nord.nord4,
	-- The default background color
	background = nord.nord0,

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = nord.nord9,
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = nord.nord4,
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = nord.nord8,

	-- the foreground color of selected text
	selection_fg = nord.nord1,
	-- the background color of selected text
	selection_bg = nord.nord14,

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = nord.nord3,

	-- The color of the split lines between panes
	split = nord.nord3,

	ansi = {
		nord.nord0, -- black
		nord.nord11, -- red
		nord.nord14, -- green
		nord.nord13, -- yellow
		nord.nord9, -- blue
		nord.nord15, -- magenta
		nord.nord8, -- cyan
		nord.nord4, -- white/gray
	},
	brights = {
		nord.nord3, -- black/dark gray
		nord.nord11, -- red
		nord.nord14, -- green
		nord.nord13, -- yellow
		nord.nord9, -- blue
		nord.nord15, -- magenta
		nord.nord7, -- cyan
		nord.nord6, -- white
	},

	-- When the IME, a dead key or a leader key are being processed and are effectively
	-- holding input pending the result of input composition, change the cursor
	-- to this color to give a visual cue about the compose state.
	compose_cursor = nord.nord12,
}

-- set the configuration options

-- config.font = wezterm.font("Hack Nerd Font Mono", { weight = "Medium" })
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

config.colors = colorscheme

return config
