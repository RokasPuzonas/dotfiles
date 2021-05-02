local awful = require("awful")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function focusClient(client)
	client:emit_signal("request::activate", "mouse_click", {raise = true})
end

local function moveClient(client)
	client:emit_signal("request::activate", "mouse_click", {raise = true})
	awful.mouse.client.move(client)
end

local function resizeClient(client)
	client:emit_signal("request::activate", "mouse_click", {raise = true})
	awful.mouse.client.resize(client)
end

return {
	{ button = 1, press = focusClient },
	{ button = 1, press = moveClient, mod = {modkey} },
	{ button = 3, press = resizeClient, mod = {modkey} },
}