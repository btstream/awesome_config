local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi


local textclock = {}

function textclock.setup()
    local clock = wibox.widget{
        widget = wibox.container.margin,
        bottom = dpi(2),
        {
            format = "<span font='".. beautiful.textclock_font .."'>".. beautiful.textclock_format .."</span>",
            widget = wibox.widget.textclock,
        }
    }

    local month_calendar = awful.widget.calendar_popup.month({
        margin = dpi(10),
        spacing = dpi(-1),
        start_sunday = false,
        opacity = 0.8,
        font = beautiful.calendar_font,
        style_normal = {
            border_width = dpi(1),
            border_color = beautiful.taglist_shape_border_color,
            padding = dpi(10)
        },
        style_month = {
            border_width = 0,
            padding = dpi(10),
        },
        style_header = {
            border_width = 0
        },
        style_weekday = {
            border_width = dpi(1),
            border_color = beautiful.taglist_shape_border_color,
        },
        style_focus = {
            fg_color = beautiful.bg_normal,
            bg_color = beautiful.taglist_shape_border_color,
            border_width = dpi(1),
            border_color = beautiful.taglist_shape_border_color
        }
    })
    month_calendar:attach(clock, "tr")

    return clock
end

return textclock
