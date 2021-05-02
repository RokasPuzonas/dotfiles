local awful = require("awful")
local lain = require("libs.lain")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function toggleFullscreen(client)
	client.fullscreen = not client.fullscreen
	client:raise()
end

local function closeClient(client)
	client:kill()
end

local function moveClientToMaster(client)
	client:swap(awful.client.getmaster())
end

local function moveToScreen(client)
	client:move_to_screen()
end

local function toggleKeepOnTop(client)
	client.ontop = not client.ontop
end

local function minimizeClient(client)
	-- The client currently has the input focus, so it cannot be
	-- minimized, since minimized clients can't have the focus.
	client.minimized = true
end

local function toggleMaximized(client)
	client.maximized = not client.maximized
	client:raise()
end

return {
	client = {
		{
			button = "m", mod = {altkey, "Shift"},
			press = lain.util.magnify_client,
			description = "magnify client"
		},
		{
			button = "f", mod = {modkey},
			press = toggleFullscreen,
			description = "toggle fullscreen"
		},
		{
			button = "c", mod = {modkey, "Shift"},
			press = closeClient,
			description = "close"
		},
		{
			button = "space", mod = {modkey, "Control"},
			press = awful.client.floating.toggle,
			description = "toggle floating"
		},
		{
			button = "Return", mod = {modkey, "Control"},
			press = moveClientToMaster,
			description = "move to master"
		},
		{
			button = "o", mod = {modkey},
			press = moveToScreen,
			description = "move to screen"
		},
		{
			button = "t", mod = {modkey},
			press = toggleKeepOnTop,
			description = "toggle keep on top"
		},
		{
			button = "n", mod = {modkey},
			press = minimizeClient,
			description = "minimize"
		},
		{
			button = "m", mod = {modkey},
			press = toggleMaximized,
			description = "(un)maximize"
		}
	}
}
