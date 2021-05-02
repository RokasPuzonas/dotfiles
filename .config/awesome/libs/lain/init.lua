--[[

     Lain
     Layouts, widgets and utilities for Awesome WM

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ

--]]
local path = ...
return {
    layout = require(path .. ".layout"),
    util   = require(path .. ".util"),
    widget = require(path .. ".widget")
}
