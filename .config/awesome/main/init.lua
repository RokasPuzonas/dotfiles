local path = ...
local main = {}

local awful = require("awful")

main.errorHandler = require(path..".error-handler")
main.signals = require(path..".signals")
main.layouts = require(path..".layouts")

-- This function implements the XDG autostart specification
function main.XDGAutoStart()
	awful.spawn.with_shell(
		"if (xrdb -query | grep -q \"^awesome\\.started:\\s*true$\"); then exit; fi;" ..
		"xrdb -merge <<< \"awesome.started:true\";" .. -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
		"dex --environment Awesome --autostart --search-paths \"$HOME/.config/autostart\"" -- https://github.com/jceb/dex
	)
end

return main