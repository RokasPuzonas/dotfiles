local awful = require("awful")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local cycle_prev   = true -- cycle trough all previous client or just the first -- https://github.com/lcpz/awesome-copycats/issues/274


local function restoreMinimized()
	local c = awful.client.restore()
	if not c then return end
	client.focus = c
	c:raise()
end

local function focusPrevClient()
	awful.client.focus.history.previous()
	if client.focus then client.focus:raise() end
end

local function focus(direction)
	awful.client.focus.global_bydirection(direction)
	if client.focus then client.focus:raise() end
end

local function cycleFocus()
	if cycle_prev then
		awful.client.focus.byidx(1)
		if client.focus then
				client.focus:raise()
		end
	end
end

local function cycleFocusBetweenRecent()
	if cycle_prev then
		awful.client.focus.history.previous()
	else
		awful.client.focus.byidx(-1)
	end
	if client.focus then
		client.focus:raise()
	end
end


local function wrap(func, a, b, c, d, e, f)
	return function()
		func(a, b, c, d, e, f)
	end
end

return {
	{
		button = "j", mod = {altkey},
		press = wrap(awful.client.focus.byidx, 1),
		description = "focus next by index"
	},
	{
		button = "k", mod = {altkey},
		press = wrap(awful.client.focus.byidx, -1),
		description = "focus previous by index"
	},
	{
		button = "j", mod = {modkey, "Shift"},
		press = wrap(awful.client.swap.byidx, 1),
		description = "swap with next client by index"
	},
	{
		button = "k", mod = {modkey, "Shift"},
		press = wrap(awful.client.swap.byidx, -1),
		description = "swap with previous client by index"
	},
	{
		button = "u", mod = {modkey},
		press = awful.client.urgent.jumpto,
		description = "jump to urgent client"
	},
	{
		button = "Tab", mod = {modkey},
		press = focusPrevClient,
		description = "go back"
	},
	{
		button = "n", mod = {modkey, "Control"},
		press = restoreMinimized,
		description = "restore minimized"
	},
	{
		button = "Tab", mod = {modkey},
		press = cycleFocusBetweenRecent,
		description = "cycle with previous/go back"
	},
	{
		button = "Tab", mod = {modkey, "Shift"},
		press = cycleFocus,
		description = "go forth"
	},

	{
		button = "j", mod = {modkey},
		press = wrap(focus, "down"),
		description = "focus down"
	},
	{
		button = "k", mod = {modkey},
		press = wrap(focus, "up"),
		description = "focus up"
	},
	{
		button = "h", mod = {modkey},
		press = wrap(focus, "left"),
		description = "focus left"
	},
	{
		button = "l", mod = {modkey},
		press = wrap(focus, "right"),
		description = "focus right"
	}
}