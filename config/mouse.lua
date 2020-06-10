local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
require("awful.hotkeys_popup.keys")
local dpi = require("beautiful.xresources").apply_dpi
require("modules.notification")
local ruled = require("ruled")

root.buttons(
    gears.table.join(
        awful.button({}, 4, awful.tag.viewnext),
        awful.button({}, 5, awful.tag.viewprev)
    )
)

ruled.client.append_rule {
    rule = {},
    properties = {
        buttons = gears.table.join(
            awful.button(
                {},
                1,
                function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                end
            ),
            awful.button(
                {modkey},
                1,
                function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    awful.mouse.client.move(c)
                end
            ),
            awful.button(
                {modkey},
                3,
                function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    awful.mouse.client.resize(c)
                end
            )
        )
    }
}