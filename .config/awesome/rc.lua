pcall(require, "luarocks.loader")

local gears = require("gears")

-- If luarocks is not installed, or a certain package is not installed.
-- Use fallback from libs directory
local config_dir = gears.filesystem.get_configuration_dir()
package.path = ("%s;%s/libs/?.lua"):format(package.path, config_dir)
package.path = ("%s;%s/libs/?/init.lua"):format(package.path, config_dir)

local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local lain = require("lain")
local freedesktop = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
local dpi = require("beautiful.xresources").apply_dpi

local main = require("main")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then main.errorHandler.handleStartupError(awesome.startup_errors) end
awesome.connect_signal("debug::error", main.errorHandler.handleRuntimeError)

main.XDGAutoStart()

local themes = {
	"blackburn", -- 1
	"copland", -- 2
	"dremora", -- 3 +
	"holo", -- 4 ++
	"multicolor", -- 5 +
	"powerarrow", -- 6
	"powerarrow-dark", -- 7 ++
	"rainbow", -- 8 +
	"steamburn", -- 9
	"vertex" -- 10 --
}

local config = require("config")

awful.util.screen_locker = config.screen_locker
awful.util.terminal = config.terminal
awful.util.tagnames = {"1", "2", "3", "4", "5"}
awful.layout.layouts = main.layouts

local function joinButtonsList(buttons_list)
	local button_objects = {}
	for i, button in ipairs(buttons_list) do
		button_objects[i] = awful.button(button.mod or {}, button.button, button.press, button.release)
	end
	return gears.table.join(table.unpack(button_objects))
end

local function joinKeysList(keys_list)
	local key_objects = {}

	local function appendKey(key)
		key.mod = key.mod or {}
		if key.release then
			table.insert(key_objects, awful.key(key.mod, key.button, key.press, key.release, key))
		else
			table.insert(key_objects, awful.key(key.mod, key.button, key.press, key))
		end
	end

	for k, v in pairs(keys_list) do
		if tonumber(k) then
			appendKey(v)
		else
			for _, key in ipairs(v) do
				key.group = k
				appendKey(key)
			end
		end
	end

	return gears.table.join(table.unpack(key_objects))
end

awful.util.taglist_buttons = joinButtonsList(require("buttons.taglist"))
awful.util.tasklist_buttons = joinButtonsList(require("buttons.tasklist"))

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = dpi(2)
lain.layout.cascade.tile.offset_y = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

beautiful.init(string.format("%s/themes/%s/theme.lua", config_dir, config.theme))

local mysystemmenu = {
	{
		"Hotkeys",
		function()
			return false, hotkeys_popup.show_help
		end
	},
	{
		"Edit config",
		function()
			awful.spawn.with_shell(("%s %s %s/config.lua"):format(config.terminal,
                       				config.editor, config_dir))
		end
	},
	{"Restart", awesome.restart},
	{
		"Quit",
		function()
			awesome.quit()
		end
	}
}
awful.util.mymainmenu = freedesktop.menu.build({
	icon_size = beautiful.menu_height or dpi(16),
	before = {{"System", mysystemmenu, beautiful.awesome_icon}},
	after = {{"Open terminal", config.terminal}}
})

-- hide menu when mouse leaves it
--awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)

-- Register screen signlas
-- main.signals - an array of tuple
-- main.signals = {
--   { "signal-name", function() print("fired signal") end }
-- }
if type(main.signals) == "table" then
	for _, entry in ipairs(main.signals) do screen.connect_signal(entry[1], entry[2]) end
end
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(beautiful.at_screen_connect)

-- Mouse bindings
root.buttons(joinButtonsList(require("buttons.mouse")))

-- Key bindings
local clientKeys = joinKeysList(require("binding.client-keys"))

local clientbuttons = joinButtonsList(require("buttons.client"))

-- Set keys
root.keys(joinKeysList(require("binding.global-keys")))

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientKeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			size_hints_honor = false
		}
	},

	-- Titlebars
	{rule_any = {type = {"dialog", "normal"}}, properties = {titlebars_enabled = true}},

	-- Set Firefox to always map on the first tag on screen 1.
	{rule = {class = "Firefox"}, properties = {screen = 1, tag = awful.util.tagnames[1]}},

	{rule = {class = "Gimp", role = "gimp-image-window"}, properties = {maximized = true}}
}

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
local function resetWallpaper(s)
	if not beautiful.wallpaper then return end
	local wallpaper = beautiful.wallpaper
	-- If wallpaper is a function, call it with the sreen
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end
	gears.wallpaper.maximized(wallpaper, s, true)
end

-- No borders when rearranging only 1 non-floating or maximized client
local function noBorder(s)
	local only_one = #s.tiled_clients == 1
		for _, c in pairs(s.clients) do
		if only_one and not c.floating or c.maximized then
			c.border_width = 0
		else
			c.border_width = beautiful.border_width
		end
	end
end

-- Add a titlebar if titlebars_enabled is set to true in the rules.
local function attachTitlebar(c)
	-- Custom
	if beautiful.titlebar_fun then
		beautiful.titlebar_fun(c)
		return
	end

	local function moveClient()
		c:emit_signal("request::activate", "titlebar", {raise = true})
		awful.mouse.client.move(c)
	end
	local function resizeClient()
		c:emit_signal("request::activate", "titlebar", {raise = true})
		awful.mouse.client.resize(c)
	end

	-- Default
	-- buttons for the titlebar
	local buttons = gears.table.join(awful.button({}, 1, moveClient), awful.button({}, 3, resizeClient))

	awful.titlebar(c, {size = dpi(16)}):setup{
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c)
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal()
		},
		layout = wibox.layout.align.horizontal
	}
end

-- Enable sloppy focus, so that focus follows mouse.
function sloppyFocus(c)
	c:emit_signal("request::activate", "mouse_enter", {raise = config.vi_focus})
end

function setFocusBorderColor(c)
	c.border_color = beautiful.border_focus
end

function setUnfocusBorderColor(c)
	c.border_color = beautiful.border_normal
end

-- Signal function to execute when a new client appears.
function ensureClientPlacement(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end

screen.connect_signal("property::geometry", resetWallpaper)
screen.connect_signal("arrange", noBorder)
client.connect_signal("request::titlebars", attachTitlebar)

client.connect_signal("manage", ensureClientPlacement)

client.connect_signal("mouse::enter", sloppyFocus)

client.connect_signal("focus", setFocusBorderColor)
client.connect_signal("unfocus", setUnfocusBorderColor)
