-- {{{ taglist config
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local keybindings = require("config.keybindings")

local taglist = {}

for i = 1, 9 do
    awful.keyboard.append_global_keybindings({
        -- globalkeys,
        -- View tag only.
        awful.key(
            {modkey},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #" .. i, group = "tag"}
        ),
        -- Toggle tag display.
        awful.key(
            {modkey, "Control"},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}
        ),
        -- Move client to tag.
        awful.key(
            {modkey, "Shift"},
            "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #" .. i, group = "tag"}
        ),
        -- Toggle tag on focused client.
        awful.key(
            {modkey, "Control", "Shift"},
            "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"}
        )
    })
end

function taglist.setup(screen)
    awful.tag(
        {"1", "2", "3", "4", "5", "6", "7", "8", "9"},
        screen,
        awful.layout.layouts[1]
    )

    -- define button action
    local taglist_buttons = gears.table.join(
        awful.button(
            {},
            1,
            function(t)
                t:view_only()
            end
        ),
        awful.button(
            {modkey},
            1,
            function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end
        ),
        awful.button({}, 3, awful.tag.viewtoggle),
        awful.button(
            {modkey},
            3,
            function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end
        ),
        awful.button(
            {},
            4,
            function(t)
                awful.tag.viewnext(t.screen)
            end
        ),
        awful.button(
            {},
            5,
            function(t)
                awful.tag.viewprev(t.screen)
            end
        )
    )

    -- create tag indicator widget. can not using declearative widget of wibox.widget with awful.widget directly
    local tag_indicators = awful.widget.taglist {
        screen = screen,
        filter = awful.widget.taglist.filter.all,
        -- define tag indicators shape, using circle
        style = {
            shape = gears.shape.circle,
            shape_border_width = dpi(1),
            shape_border_color = "#777777",
            font = beautiful.taglist_fonts
        },
        -- spacing between indicators
        layout = {
            spacing = dpi(2),
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    id = "text_role",
                    widget = wibox.widget.textbox
                },
                margins = dpi(5),
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background
        },
        buttons = taglist_buttons
    }

    -- wrap taglist in wibox widget by margin and backgrounds
    -- backgrounds for a circle
    return wibox.widget {
        {
            {
                tag_indicators,
                left = dpi(6),
                right = dpi(6),
                widget = wibox.container.margin
            },
            shape_border_width = dpi(1),
            shape_border_color = "#777777",
            bg = beautiful.bg_normal,
            shape = gears.shape.rounded_bar,
            widget = wibox.container.background
        },
        right = dpi(4),
        left = dpi(4),
        top = dpi(1),
        bottom = dpi(1),
        widget = wibox.container.margin
    }
end

return taglist
-- }}}