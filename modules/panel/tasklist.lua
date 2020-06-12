local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local tasklist = {}

local function update_indicator(self, c, index, objects)
    if c.active then
        self:get_children_by_id("indicator_left")[1].bg = beautiful.tasklist_bg_indicator_focus
        self:get_children_by_id("indicator_right")[1].bg = beautiful.tasklist_bg_indicator_focus
    elseif c.urgent then
        self:get_children_by_id("indicator_left")[1].bg = beautiful.tasklist_bg_indicator_urgent
        self:get_children_by_id("indicator_right")[1].bg = beautiful.tasklist_bg_indicator_urgent
    else
        self:get_children_by_id("indicator_left")[1].bg = beautiful.tasklist_bg_indicator
        self:get_children_by_id("indicator_right")[1].bg = beautiful.tasklist_bg_indicator
    end
end

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
        layout = {
            spacing = dpi(2),
            -- max_widget_size = dpi(240),
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            wibox.widget.base.make_widget(),
                            forced_width = dpi(4),
                            id = 'indicator_left',
                            widget = wibox.container.background,
                        },
                        -- top = dpi(1),
                        -- bottom = dpi(1),
                        widget = wibox.container.margin
                    },
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
                        right = dpi(5),
                        widget = wibox.container.margin
                    },
                    {
                        {
                            wibox.widget.base.make_widget(),
                            forced_width = dpi(4),
                            id = 'indicator_right',
                            widget = wibox.container.background,
                        },
                        -- top = dpi(1),
                        -- bottom = dpi(1),
                        widget = wibox.container.margin
                    },
                    layout = wibox.layout.align.horizontal
                },
                -- left = dpi(0),
                -- right = dpi(8),
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background,
            create_callback = update_indicator,
            update_callback = update_indicator
        }
    }

    return wibox.widget {
        mytasklist,
        left = dpi(8),
        right = dpi(8),
        bottom = dpi(2),
        top = dpi(2),
        widget = wibox.container.margin
    }
end

return tasklist
