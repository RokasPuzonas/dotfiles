local awful = require("awful")
local beautiful = require("beautiful")
local config = require("config")
local naughty = require("naughty")

local modkey = config.modkey
local altkey = config.altkey

local function wrap(func, a, b, c, d, e, f)
	return function()
		func(a, b, c, d, e, f)
	end
end

local function increaseVolume()
	os.execute(("amixer -q set %s 1%%+"):format(beautiful.volume.channel))
	beautiful.volume.update()
end

local function decreaseVolume()
	os.execute(("amixer -q set %s 1%%-"):format(beautiful.volume.channel))
	beautiful.volume.update()
end

local function toggleMute()
	os.execute(("amixer -q set %s toggle"):format(beautiful.volume.togglechannel or beautiful.volume.channel))
	beautiful.volume.update()
end

local function maxVolume()
	os.execute(("amixer -q set %s 100%%"):format(beautiful.volume.channel))
	beautiful.volume.update()
end

local function noVolume()
	os.execute(("amixer -q set %s 0%%"):format(beautiful.volume.channel))
	beautiful.volume.update()
end

local touchpad_id = "AlpsPS/2 ALPS GlidePoint"
local function toggleTouchpad()
	local cmd_handle = io.popen(("xinput list-props '%s'|grep 'Device Enabled'|awk '{print $4}'"):format(touchpad_id))
	local is_enabled = cmd_handle:read("*a")
	cmd_handle:close()

	if is_enabled == "1\n" then
		os.execute(("xinput disable '%s'"):format(touchpad_id))
	else
		os.execute(("xinput enable '%s'"):format(touchpad_id))
	end
end

local keys = {
	{
		button = "p", mod = {altkey},
		press = wrap(os.execute, "maim -s | xclip -selection clipboard -t image/png"),
		description = "take a screenshot"
	},
	{
		button = "XF86MonBrightnessUp",
		press = wrap(os.execute, "xbacklight -inc 10"),
		description = "increase brightness"
	},
	{
		button = "XF86MonBrightnessDown",
		press = wrap(os.execute, "xbacklight -dec 10"),
		description = "decrease brightness"
	},
	{
		button = "XF86AudioRaiseVolume",
		press = increaseVolume,
		description = "volume up"
	},
	{
		button = "XF86AudioLowerVolume",
		press = decreaseVolume,
		description = "volume down"
	},
	{
		button = "XF86AudioMute",
		press = toggleMute,
		description = "toggle mute"
	},
	{
		button = "XF86TouchpadToggle",
		press = toggleTouchpad,
		description = "toggle touchpad"
	}
}

if awful.util.screen_locker then
	table.insert(keys, {
		button = "l", mod = {altkey, "Control"},
		press = wrap(os.execute, awful.util.screen_locker),
		description = "lock screen"
	})
end

return keys