local wibox = require("wibox")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local beautiful = require("beautiful")


local function worker(args)
	local args = args or {}
	args.interval = args.interval or 3
	args.chip_name = args.chip_name or "coretemp-isa-0000"
	if args.avg == nil then
		args.avg = false
	end

	local get_sensors_command = ("sensors %s"):format(args.chip_name)
	local text_markup = ("<span foreground=\"%s\">%%s</span>"):format(beautiful.bg_urgent)
	local widget = wibox.widget {
		markup = "###°C",
    align  = 'center',
    valign = 'center',
		widget = wibox.widget.textbox,
	}

	local update_widget = function(widget, stdout)
		local current_temp, high_temp, crit_temp = 0, 0, 0
		local iterator = stdout:gmatch("%+(%d?%d?%d%.%d)°C%s+%(high = %+(%d?%d?%d%.%d)°C, crit = %+(%d?%d?%d%.%d)°C%)")
		if args.avg then
			local n = 0
			for current, high, crit in iterator do
				current_temp = current_temp + tonumber(current)
				high_temp = high_temp + tonumber(high)
				crit_temp = crit_temp + tonumber(crit)
				n = n + 1
			end
			current_temp = current_temp / n
			high_temp = high_temp / n
			crit_temp = crit_temp / n
		else
			for current, high, crit in iterator do
				current_temp = math.max(current_temp, tonumber(current))
				high_temp = math.max(high_temp, tonumber(high))
				crit_temp = math.max(crit_temp, tonumber(crit))
			end
		end

		if args.show_extra then
			widget.markup = ("%.1f°C (%.1f°C, %.1f°C)"):format(current_temp, high_temp, crit_temp)
		else
			widget.markup = ("%.1f°C"):format(current_temp)
		end

		local warning_temp = args.warning_temp or crit_temp - 10
		if args.warning_notification and current_temp >= warning_temp then
			naughty.notify{
				title = "Warning! High Temprature!",
				text = ("%.1f°C"):format(current_temp),
				position = "top_middle",
				bg = beautiful.bg_urgent,
				fg = beautiful.fg_urgent,
				timeout = args.interval
			}
		end

		if current_temp >= high_temp then
			widget.markup = ("<span foreground=\"%s\">%s</span>"):format(beautiful.bg_urgent, widget.markup)
		end
	end

	
	watch(get_sensors_command, args.interval, update_widget, widget)

	return widget
end

return setmetatable({}, { __call = function(_, ...)
	return worker(...)
end })