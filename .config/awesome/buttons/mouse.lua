local awful = require("awful")

local function toggleMainMenu()
	awful.util.mymainmenu:toggle()
end

local function nextTag()
	awful.tag.viewnext(awful.screen.focused())
end

local function prevTag()
	awful.tag.viewprev(awful.screen.focused())
end

return {
	{ button = 3, press = toggleMainMenu },
	--{ button = 4, press = nextTag },
	--{ button = 5, press = prevTag }
}