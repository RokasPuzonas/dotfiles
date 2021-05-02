local path = ...

return {
	layout = require(path .. ".layout"),
	launcher = require(path .. ".launcher"),
	system = require(path .. ".system"),
	screen = require(path .. ".screen"),
	client = require(path .. ".client"),
	tag = require(path .. ".tag"),
	hotkeys = require(path .. ".hotkeys"),
	widgets = require(path .. ".widgets"),
}
