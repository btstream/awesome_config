local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local beautiful = require("beautiful")

local button_font = "CaskaydiaCove Nerd Font Mono 14"

client.connect_signal(
    "request::titlebars",
    function(c)
        -- buttons for the titlebar
        local buttons ={
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
        }

        -- create a close button
        local close_button =
            wibox.widget {
            text = "",
            font = button_font,
            buttons = gears.table.join(
                awful.button(
                    {},
                    1,
                    nil,
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
            font = button_font,
            buttons = gears.table.join(
                awful.button(
                    {},
                    1,
                    nil,
                    function()
                        c.minimized = true
                    end
                )
            ),
            widget = wibox.widget.textbox
        }

        -- create a maximized button
        local max_button =
            wibox.widget {
            text = "",
            font = button_font,
            buttons = gears.table.join(
                awful.button(
                    {},
                    1,
                    nil,
                    function()
                        c.maximized = not c.maximized
                        c:raise()
                    end
                )
            ),
            widget = wibox.widget.textbox
        }

        awful.titlebar(c, {size = dpi(22)}):setup {
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
                    {
                        -- Title
                        align = "center",
                        widget = awful.titlebar.widget.titlewidget(c)
                    },
                    bottom = dpi(2),
                    widget = wibox.container.margin
                },
                buttons = buttons,
                layout = wibox.layout.flex.horizontal
            },
            nil,
            layout = wibox.layout.align.horizontal
        }
    end
)
