-- local gears = require("gears")
-- local awful = require("awful")
local wibox = require("wibox")
-- local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local systray = {}

function systray.setup()
    local tray = wibox.widget.systray()
    tray:set_base_size(dpi(22))
    -- s.systray = wibox.container.margin(s.tray, 2, 2, 2, 4)
    return wibox.widget {
        tray,
        bottom = dpi(2),
        top = dpi(2),
        right = dpi(8),
        left = dpi(8),
        widget = wibox.container.margin
    }
end

return systray