--[[

     Lain
     Layouts, widgets and utilities for Awesome WM

     Layouts section

     Licensed under GNU General Public License v2
      * (c) 2013,      Luca CPZ
      * (c) 2010-2012, Peter Hofmann

--]]
local path = ... -- Should be libs.lain.layout
local root_path = path:match("^.*[%./\\]lain")
local wrequire     = require(root_path..".helpers").wrequire
local setmetatable = setmetatable

local layout       = { _NAME = path }

return setmetatable(layout, { __index = wrequire })
