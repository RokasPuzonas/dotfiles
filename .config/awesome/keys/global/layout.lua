local awful = require("awful")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function wrap(func, a, b, c, d, e, f)
	return function()
		func(a, b, c, d, e, f)
	end
end

local function restoreMinimized()
	local c = awful.client.restore()
	-- Focus restored client
	if c then
		client.focus = c
		c:raise()
	end
end

return {
	{
		button = "l", mod = {altkey, "Shift"},
		press = wrap(awful.tag.incmwfact, 0.05),
		description = "increase master width factor"
	},
	{
		button = "h", mod = {altkey, "Shift"},
		press = wrap(awful.tag.incmwfact, -0.05),
		description = "decrease master width factor"
	},
	{
		button = "l", mod = {modkey, "Shift"},
		press = wrap(awful.tag.incnmaster, -1, nil, true),
		description = "decrease the number of master clients"
	},
	{
		button = "h", mod = {modkey, "Shift"},
		press = wrap(awful.tag.incnmaster, 1, nil, true),
		description = "increase the number of master clients"
	},
	{
		button = "l", mod = {modkey, "Control"},
		press = wrap(awful.tag.incncol, -1, nil, true),
		description = "decrease the number of columns"
	},
	{
		button = "h", mod = {modkey, "Control"},
		press = wrap(awful.tag.incncol, 1, nil, true),
		description = "increase the number of columns"
	},
	{
		button = "space", mod = {modkey},
		press = wrap(awful.layout.inc, 1),
		description = "select next"
	},
	{
		button = "space", mod = {modkey, "Shift"},
		press = wrap(awful.layout.inc, -1),
		description = "select previous"
	}
}