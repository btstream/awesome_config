local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

screen.connect_signal("request::wallpaper", set_wallpaper)

screen.connect_signal("request::desktop_decoration", function(s)
    set_wallpaper(s)
end)
 
