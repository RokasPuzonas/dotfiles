local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local lain = require("lain")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function wrap(func, a, b, c, d, e, f)
	return function()
		func(a, b, c, d, e, f)
	end
end

local function showCalander()
	if beautiful.cal then beautiful.cal.show(7) end
end

local function showWeather()
	if beautiful.weather then beautiful.weather.show(7) end
end

local function mpcCommand(cmd)
	os.execute(("mpc %s"):format(cmd))
	beautiful.mpd.update()
end

local function toggleMPDServer()
	local common = { text = "MPD widget ", position = "top_middle", timeout = 2 }
	if beautiful.mpd.timer.started then
			beautiful.mpd.timer:stop()
			common.text = common.text .. lain.util.markup.bold("OFF")
	else
			beautiful.mpd.timer:start()
			common.text = common.text .. lain.util.markup.bold("ON")
	end
	naughty.notify(common)
end

return {
	{
		button = "c", mod = {altkey},
		press = showCalander,
		description = "show calendar"
	},
	{
		button = "w", mod = {altkey},
		press = showWeather,
		description = "show weather"
	},
	{
		button = "Up", mod = {altkey, "Control"},
		press = wrap(mpcCommand, "toggle"),
		description = "mpc toggle"
	},
	{
		button = "Down", mod = {altkey, "Control"},
		press = wrap(mpcCommand, "stop"),
		description = "mpc stop"
	},
	{
		button = "Left", mod = {altkey, "Control"},
		press = wrap(mpcCommand, "prev"),
		description = "mpc prev"
	},
	{
		button = "Right", mod = {altkey, "Control"},
		press = wrap(mpcCommand, "next"),
		description = "mpc next"
	},
	{
		button = "0", mod = {altkey},
		press = toggleMPDServer,
		description = "mpc on/off"
	}
}
