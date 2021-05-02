local awful = require("awful")
local dpi           = require("beautiful.xresources").apply_dpi

local function minimizeAndMaximize(c)
	if c == client.focus then
		c.minimized = true
	else
		--client:emit_signal("request::activate", "tasklist", {raise = true})
		-- Without this, the following
		-- :isvisible() makes no sense
		c.minimized = false
		if not c:isvisible() and c.first_tag then
			c.first_tag:view_only()
		end
		-- This will also un-minimize
		-- the client, if needed
		client.focus = c
		c:raise()
	end
end

local function showClientList()
	local instance = nil
	return function ()
		if instance and instance.wibox.visible then
			instance:hide()
			instance = nil
		else
			instance = awful.menu.clients({theme = {width = dpi(250)}})
		end
	end
end

local function killClient(client)
	client:kill()
end

local function nextClient()
	awful.client.focus.byidx(1)
end

local function prevClient()
	awful.client.focus.byidx(-1)
end

return {
	{ button = 1, press = minimizeAndMaximize },
	{ button = 2, press = killClient },
	{ button = 3, press = showClientList },
	{ button = 4, press = nextClient },
	{ button = 5, press = prevClient },
}