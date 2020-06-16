local gears = require("gears")
local beautiful = require("beautiful")
local bingwallpaper = require("modules.wallpaper.bingwallpaper")
local naughty = require("naughty")

use_bing_wallpapper = true

local set_wallpaper = function(s)
    if not use_bing_wallpapper then
        if beautiful.wallpaper then
            local wallpaper = beautiful.wallpaper
            if type(wallpaper) == "function" then
                wallpaper = wallpaper(s)
            end
            gears.wallpaper.maximized(wallpaper, s, true)
        end
    else
        gears.wallpaper.maximized(bingwallpaper.wallpaper, s, true)
    end
end

screen.connect_signal("request::wallpaper", set_wallpaper)
screen.connect_signal("request::desktop_decoration", function(s)
    set_wallpaper(s)
end)

if use_bing_wallpapper then
    local function update_wallpaper()
            local g = screen[1].geometry
            if bingwallpaper.update("" .. g.width .. "x" .. g.height) then
                for s in screen do
                    s:emit_signal("request::wallpaper")
                end
            end
        end

    gears.timer {
        timeout = 10,
        autostart = true,
        single_shot = true,
        callback = update_wallpaper
    }

    gears.timer {
        timeout = 21600,
        autostart = true,
        callback = update_wallpaper
    } 
end
