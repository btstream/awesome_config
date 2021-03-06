local gears = require("gears")
local beautiful = require("beautiful")
local bingwallpaper = require("modules.wallpaper.bingwallpaper")
local naughty = require("naughty")
local awful = require("awful")

local set_wallpaper = function(s)
    if use_bing_wallpapper then
        bingwallpaper.set_wallpaper(s)
    else
        if beautiful.wallpaper then
            local wallpaper = beautiful.wallpaper
            if type(wallpaper) == "function" then
                wallpaper = wallpaper(s)
            end
            gears.wallpaper.maximized(wallpaper, s, true)
            awful.spawn.with_shell("betterlockscreen -u " .. wallpaper)
        end
    end
end

screen.connect_signal("request::wallpaper", set_wallpaper)
screen.connect_signal("request::desktop_decoration", function(s)
    set_wallpaper(s)
end)

if use_bing_wallpapper then
    local function update_wallpaper()
            local g = screen[1].geometry
            bingwallpaper.update("" .. g.width .. "x" .. g.height)
        end

    gears.timer {
        timeout = 20,
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
