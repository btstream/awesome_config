local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local start_button = {}

function start_button.setup(screen)
    local menu_button = wibox.widget {
        markup = "<span font='CaskaydiaCove Nerd Font Mono 18'></span>",
        widget = wibox.widget.textbox
    }

    menu_button:buttons(
        gears.table.join(
            awful.button(
                {},
                1,
                function()
                    awful.spawn("/usr/bin/rofi -show")
                end
            )
        )
    )

    return wibox.widget {
            widget = wibox.container.margin,
            left = dpi(8),
            right = dpi(2),
            bottom = dpi(2),
            menu_button
        }
end

return start_button