local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local config = require("config")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}

theme.dir = gfs.get_configuration_dir() .. "/themes/dieselpunk/"

theme.font = "Hack 9"

theme.bg_normal = "#222222"
theme.bg_focus = "#535d6c"
theme.bg_urgent = "#FF5252"
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(4)
theme.border_width = dpi(1)
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"
theme.border_marked = "#91231c"

theme.titlebar_bg_normal = "#252525"
theme.titlebar_bg_focus = "#424242"

theme.notification_opacity = 0.9

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size,
                              	theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.dir .. "submenu.png"
theme.menu_height = dpi(18)
theme.menu_width = dpi(120)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.dir .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.dir .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = theme.dir .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.dir .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.dir .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.dir .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.dir ..
                                                 	"titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.dir ..
                                                  	"titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir ..
                                                 	"titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "titlebar/maximized_focus_active.png"

theme.wallpaper = theme.dir .. "background.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = theme.dir .. "layouts/fairhw.png"
theme.layout_fairv = theme.dir .. "layouts/fairvw.png"
theme.layout_floating = theme.dir .. "layouts/floatingw.png"
theme.layout_magnifier = theme.dir .. "layouts/magnifierw.png"
theme.layout_max = theme.dir .. "layouts/maxw.png"
theme.layout_fullscreen = theme.dir .. "layouts/fullscreenw.png"
theme.layout_tilebottom = theme.dir .. "layouts/tilebottomw.png"
theme.layout_tileleft = theme.dir .. "layouts/tileleftw.png"
theme.layout_tile = theme.dir .. "layouts/tilew.png"
theme.layout_tiletop = theme.dir .. "layouts/tiletopw.png"
theme.layout_spiral = theme.dir .. "layouts/spiralw.png"
theme.layout_dwindle = theme.dir .. "layouts/dwindlew.png"
theme.layout_cornernw = theme.dir .. "layouts/cornernww.png"
theme.layout_cornerne = theme.dir .. "layouts/cornernew.png"
theme.layout_cornersw = theme.dir .. "layouts/cornersww.png"
theme.layout_cornerse = theme.dir .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme.dir .. "archlinux-icon.png"
-- theme_assets.awesome_icon(
--    theme.menu_height, theme.bg_focus, theme.fg_focus
-- )

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Arc"

local volumearc_widget = require("awm-widgets.volume-widget.volume")
local brightnessarc_widget = require("awm-widgets.brightness-widget.brightness")
local mpdarc_widget = require("awm-widgets.mpdarc-widget.mpdarc")
local temprature_widget = require("widgets.temprature-widget")
local todo_widget = require("awm-widgets.todo-widget.todo")
local seperator = wibox.widget.textbox(" ")

local lain = require("lain")
local weather_widget = lain.widget.weather

function theme.at_screen_connect(s)
	-- If wallpaper is a function, call it with the screen
	local wallpaper = theme.wallpaper
	if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
	gears.wallpaper.maximized(wallpaper, s, true)

	awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(awful.button({}, 1, function()
		awful.layout.inc(1)
	end), awful.button({}, 2, function()
		awful.layout.set(awful.layout.layouts[1])
	end), awful.button({}, 3, function()
		awful.layout.inc(-1)
	end), awful.button({}, 4, function()
		awful.layout.inc(1)
	end), awful.button({}, 5, function()
		awful.layout.inc(-1)
	end)))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags,
               		awful.util.tasklist_buttons)

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(18),
		bg = theme.bg_normal,
		fg = theme.fg_normal,
		opacity = 0.8
	})

	local weather = weather_widget{
		APPID = config.open_weather_api_key,
		city_id = config.open_weather_city_id,
		settings = function()
			local descr = weather_now["weather"][1]["description"]:lower()
			local units = math.floor(weather_now["main"]["temp"])
			widget:set_markup(descr .. " @ " .. units .. "°C ")
		end
	}

	s.mywibox:setup{
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
			seperator
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			seperator,
			awful.widget.keyboardlayout(),
			seperator,
			mpdarc_widget,
			seperator,
			weather.icon,
			weather.widget,
			seperator,
			temprature_widget{
				chip_name = "coretemp-isa-0000",
				warning_temp = 95,
				warning_notification = true,
				interval = 1.5,
				avg = true
			},
			seperator,
			brightnessarc_widget{
				get_brightness_cmd = "xbacklight -get",
				inc_brightness_cmd = "xbacklight -inc 5",
				dec_brightness_cmd = "xbacklight -dec 5"
			},
			seperator,
			volumearc_widget{widget_type = "arc"},
			seperator,
			todo_widget(),
			seperator,
			wibox.widget.textclock("%H:%M %Y-%m-%d"),
			seperator,
			s.mylayoutbox
		}
	}
end

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
