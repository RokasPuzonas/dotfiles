--[[

     Awesome-Freedesktop
     Freedesktop.org compliant desktop entries and menu

     Licensed under GNU General Public License v2
      * (c) 2016,      Luke Bonham
      * (c) 2009-2015, Antonio Terceiro

--]]
local path = ...
return {
    desktop  = require(path .. ".desktop"),
    menu     = require(path .. ".menu")
}
