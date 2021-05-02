local awful = require("awful")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function wrap(func, a, b, c, d, e, f)
	return function()
		func(a, b, c, d, e, f)
	end
end

return {
	{
		button = "j", mod = {modkey, "Control"},
		press = wrap(awful.screen.focus_relative, 1),
		description = "focus the next screen"
	},
	{
		button = "k", mod = {modkey, "Control"},
		press = wrap(awful.screen.focus_relative, -1),
		description = "focus the previous screen"
	}
}