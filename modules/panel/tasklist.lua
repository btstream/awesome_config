local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local tasklist = {}

function tasklist.setup(screen)
    local tasklist_buttons = gears.table.join(
        awful.button(
            {},
            1,
            function(c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal("request::activate", "tasklist", {raise = true})
                end
            end
        ),
        awful.button(
            {},
            3,
            function()
                awful.menu.client_list({theme = {width = 250}})
            end
        ),
        awful.button(
            {},
            4,
            function()
                awful.client.focus.byidx(1)
            end
        ),
        awful.button(
            {},
            5,
            function()
                awful.client.focus.byidx(-1)
            end
        )
    )

    local mytasklist = awful.widget.tasklist {
        screen = screen,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style = {
            shape = function(cr, w, h)
                gears.shape.rounded_rect(cr, w, h, 2)
            end,
            shape_border_width = dpi(1),
        },
        layout = {
            spacing = dpi(1),
            max_widget_size = dpi(240),
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox
                        },
                        margins = dpi(5),
                        widget = wibox.container.margin
                    },
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                left = dpi(8),
                right = dpi(8),
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background
        }
    }

    return wibox.widget {
        mytasklist,
        left = dpi(8),
        right = dpi(8),
        bottom = dpi(1),
        top = dpi(1),
        widget = wibox.container.margin
    }
end

return tasklist