local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
local hotkeys = require("awful.hotkeys_popup.keys")
hotkeys.tmux.add_rules_for_terminal({ rule = { name = { "tmux" }}})
local config = require("config")


local modkey = config.modkey
local altkey = config.altkey

local function showMainMenu()
	awful.util.mymainmenu:show()
end

local function toggleWidgetBox()
	for s in screen do
		s.mywibox.visible = not s.mywibox.visible
		if s.mybottomwibox then
				s.mybottomwibox.visible = not s.mybottomwibox.visible
		end
	end
end

return {
	{
		button = "s", mod = {modkey},
		press = hotkeys_popup.show_help,
		description = "show help"
	},
	{
		button = "r", mod = {modkey, "Control"},
		press = awesome.restart,
		description = "reload awesome"
	},
	{
		button = "Menu", mod = {modkey},
		press = showMainMenu,
		description = "show main menu"
	},
	{
		button = "b", mod = {modkey},
		press = toggleWidgetBox,
		description = "toggle wibox"
	}
}
