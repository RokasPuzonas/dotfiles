local awful = require("awful")
local lain = require("libs.lain")
local config = require("config")

local modkey = config.modkey
local altkey = config.altkey

local function wrap(func, a, b, c, d, e, f)
	return function()
		func(a, b, c, d, e, f)
	end
end


local keys = {
	{
		button = "Left", mod = {modkey},
		press = awful.tag.viewprev,
		description = "view previous"
	},
	{
		button = "Right", mod = {modkey},
		press = awful.tag.viewnext,
		description = "view next"
	},
	{
		button = "Escape", mod = {modkey},
		press = awful.tag.history.restore,
		description = "go back"
	},
	{
		button = "+", mod = {altkey, "Control"},
		press = wrap(lain.util.useless_gaps_resize, 1),
		description = "increment useless gaps"
	},
	{
		button = "-", mod = {altkey, "Control"},
		press = wrap(lain.util.useless_gaps_resize, -1),
		description = "decrement useless gaps"
	},
	{
		button = "n", mod = {modkey, "Shift"},
		press = wrap(lain.util.add_tag),
		description = "add new tag"
	},
	{
		button = "r", mod = {modkey, "Shift"},
		press = wrap(lain.util.rename_tag),
		description = "rename tag"
	},
	{
		button = "Left", mod = {modkey, "Shift"},
		press = wrap(lain.util.move_tag, -1),
		description = "move tag to the left"
	},
	{
		button = "Right", mod = {modkey, "Shift"},
		press = wrap(lain.util.move_tag, 1),
		description = "move tag to the right"
	},
	{
		button = "d", mod = {modkey, "Shift"},
		press = wrap(lain.util.delete_tag),
		description = "delete tag"
	}
}

local function newViewTagOnly(i)
	return function()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then tag:view_only() end
	end
end

local function newToggleTagDisplay(i)
	return function()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then awful.tag.viewtoggle(tag) end
	end
end

local function newMoveClientToTag(i)
	return function()
		if not client.focus then return end
		local tag = client.focus.screen.tags[i]
		if not tag then return end
		client.focus:move_to_tag(tag)
	end
end

local function newToggleClientTag(i)
	return function()
		if not client.focus then return end
		local tag = client.focus.screen.tags[i]
		if not tag then return end
		client.focus:toggle_tag(tag)
	end
end

local view_description = "view tag #"
local toggle_description = "toggle tag #"
local move_description = "move focused client to tag #"
local toggle_focus_description = "toggle focused client on tag #"
for i = 1, 9 do
	local button = ("#%s"):format(i + 9)
	local has_description = i == 1 or i == 9

	table.insert(keys, {
		button = button,
		press = newViewTagOnly(i),
		mod = {modkey},
		description = has_description and view_description
	})

	table.insert(keys, {
		button = button,
		press = newToggleTagDisplay(i),
		mod = {modkey, "Control"},
		description = has_description and toggle_description
	})

	table.insert(keys, {
		button = button,
		press = newMoveClientToTag(i),
		mod = {modkey, "Shift"},
		description = has_description and move_description
	})

	table.insert(keys, {
		button = button,
		press = newToggleClientTag(i),
		mod = {modkey, "Control", "Shift"},
		description = has_description and toggle_focus_description
	})
end

return keys