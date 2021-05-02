--[[

     Lain
     Layouts, widgets and utilities for Awesome WM

     Users contributed widgets section

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ

--]]
local path = ...
local root_path = path:match("^.*[%./\\]lain")

local wrequire     = require(root_path..".helpers").wrequire
local setmetatable = setmetatable

local widget = { _NAME = path }

return setmetatable(widget, { __index = wrequire })
