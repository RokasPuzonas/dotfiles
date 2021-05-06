local handler = {}

local naughty = require("naughty")

local in_error = false
function handler.handleRuntimeError(err)
	if in_error then return end
	in_error = true

	naughty.notify{
		preset = naughty.config.presets.critical,
		title = "Oops, an error happened!",
		text = tostring(err)
	}

	in_error = false
end

function handler.handleStartupError(err)
	naughty.notify{
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = err
	}
end

return handler

