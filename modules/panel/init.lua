local wibox = require("wibox")
local awful = require("awful")
local dpi = require("beautiful.xresources").apply_dpi

local start_button = require("modules.panel.start_button")
local taglist = require("modules.panel.taglist")
local tasklist = require("modules.panel.tasklist")
local systray = require("modules.panel.systray")
local textclock = require("modules.panel.textclock")
local layoutbox = require("modules.panel.layoutbox")

local panel = {}

function panel.setup(s)
    local mypanel = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(28)
    })

    mypanel:setup {
        layout = wibox.layout.align.horizontal,
        {   -- left widgets
            layout = wibox.layout.fixed.horizontal,
            start_button.setup(s),
            taglist.setup(s),
            awful.widget.prompt()
        },
        tasklist.setup(s),
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            systray.setup(),
            textclock.setup(),
            layoutbox.setup(s)
        }
    }
end

return panel