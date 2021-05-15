local awful = require("awful")
local beautiful = require("beautiful")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function wrap(func, a, b, c, d, e, f)
	return function()
		func(a, b, c, d, e, f)
	end
end

local function toggleQuakeTerminal()
	awful.screen.focused().quake:toggle()
end

local function runProgramLauncher()
	os.execute(("dmenu_run -i -fn 'Terminus-10' -nb '%s' -nf '%s' -sb '%s' -sf '%s'"):format(
	beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
end

local terminal = "st"
local gui_editor = os.getenv("GUI_EDITOR") or "code"
local browser = os.getenv("BROWSER") or "brave"

return {
	--[[
	{
		button = "z", mod = {modkey},
		press = toggleQuakeTerminal,
		description = "dropdown application"
	},
	]]--
	{
		button = "Return", mod = {modkey},
		press = wrap(awful.spawn, terminal),
		description = "launch terminal"
	},
	{
		button = "x", mod = {modkey},
		press = wrap(awful.spawn, "rofi -show run"),
		description = "launch dmenu"
	},
	{
		button = "q", mod = {modkey},
		press = wrap(awful.spawn, browser),
		description = "launch browser"
	},
	{
		button = "a", mod = {modkey},
		press = wrap(awful.spawn, gui_editor),
		description = "launch gui editor"
	},
	--{
	--	button = "s", mod = {modkey},
	--	press = wrap(awful.spawn, "spotify"),
	--	description = "launch spotify"
	--}
}
