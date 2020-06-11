local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local beautiful = require("beautiful")

client.connect_signal(
    "request::titlebars",
    function(c)
        -- buttons for the titlebar
        local buttons =
            gears.table.join(
            awful.button(
                {},
                1,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.move(c)
                end
            ),
            awful.button(
                {},
                3,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.resize(c)
                end
            )
        )

        -- create a close button
        local close_button =
            wibox.widget {
            text = "",
            font = "CaskaydiaCove Nerd Font Mono 15",
            buttons = gears.table.join(
                awful.button(
                    {},
                    1,
                    function()
                        c:kill()
                    end
                )
            ),
            widget = wibox.widget.textbox
        }

        -- create a minimal button
        local min_button =
            wibox.widget {
            text = "",
            font = "CaskaydiaCove Nerd Font Mono 15",
            buttons = gears.table.join(
                awful.button(
                    {},
                    1,
                    function()
                        if c == client.focus then
                            c.minimized = true
                        end
                    end
                )
            ),
            widget = wibox.widget.textbox
        }

        -- create a maximized button
        local max_button =
            wibox.widget {
            text = "",
            font = "CaskaydiaCove Nerd Font Mono 15",
            buttons = gears.table.join(
                awful.button(
                    {},
                    1,
                    function()
                        c.maximized = not c.maximized
                        c:raise()
                    end
                )
            ),
            widget = wibox.widget.textbox
        }

        awful.titlebar(c, {size = dpi(24), font = beautiful.titlebar_font}):setup {
            {
                {
                    close_button,
                    min_button,
                    max_button,
                    layout = wibox.layout.fixed.horizontal(),
                    spacing = dpi(6)
                },
                left = dpi(10),
                bottom = dpi(2),
                widget = wibox.container.margin
            },
            {
                -- Middle
                {
                    -- Title
                    align = "center",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                buttons = buttons,
                layout = wibox.layout.flex.horizontal
            },
            {
                wibox.widget.base.make_widget(),
                forced_width = dpi(60),
                widget = wibox.container.background
            },
            layout = wibox.layout.align.horizontal
        }
    end
)
