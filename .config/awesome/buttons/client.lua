local awful = require("awful")
local config = require("config")

local modkey = config.modkey

local function focusClient(c)
	c:emit_signal("request::activate", "mouse_click", {raise = true})
end

local function moveClient(c)
	c:emit_signal("request::activate", "mouse_click", {raise = true})
	awful.mouse.client.move(c)
end

local function resizeClient(c)
	c:emit_signal("request::activate", "mouse_click", {raise = true})
	awful.mouse.client.resize(c)
end

return {
	{ button = 1, press = focusClient },
	{ button = 1, press = moveClient, mod = {modkey} },
	{ button = 3, press = resizeClient, mod = {modkey} },
}