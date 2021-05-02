local awful = require("awful")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function viewOnlyTag(tag)
	tag:view_only()
end

local function nextTag(tag)
	awful.tag.viewnext(tag.screen)
end

local function prevTag(tag)
	awful.tag.viewprev(tag.screen)
end

local function toggleTag(tag)
	if not client.focus then return end
	client.focus:toggle_tag(tag)
end

local function moveToTag(tag)
	if not client.focus then return end
	client.focus:move_to_tag(tag)
end

return {
	{ button = 1, press = viewOnlyTag },
	{ button = 1, press = moveToTag, mod = {modkey} },
	{ button = 3, press = awful.tag.viewtoggle },
	{ button = 3, press = toggleTag, mod = {modkey} },
	{ button = 4, press = nextTag },
	{ button = 5, press = prevTag }
}

