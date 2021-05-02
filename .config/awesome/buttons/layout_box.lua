local awful = require("awful")

local function increment()
	awful.layout.inc(1)
end

local function decrement()
	awful.layout.inc(-1)
end

return {
	{button = 1, press = increment},
	{button = 3, press = decrement},
	{button = 4, press = increment},
	{button = 5, press = decrement}
}
