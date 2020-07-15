local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
require("awful.hotkeys_popup.keys")
local dpi = require("beautiful.xresources").apply_dpi
local ruled = require("ruled")

ruled.client.append_rules({
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            size_hints_honor = false
        }
    },
    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry"
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
                "Pavucontrol",
                "netease-cloud-music",
                "dolphin"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester" -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
                "TfrmFileOp", -- doublecmd
                "TfrmOptions" -- doublecmd
            },
            instance = {
                "Msgcompose" -- Thunderbird's compositing
            }
        },
        properties = {floating = true}
    },
    -- Add titlebars to normal clients and dialogs

    {
        rule_any = {
            type = {"normal", "dialog"}
        },
        properties = {titlebars_enabled = true}
    },
    {
        rule_any = {
            class = {
                "Wine",
                "Wps",
                "Wpp",
                "Et",
                "netease-cloud-music"
            }
        },
        properties = {titlebars_enabled = false}
    },
    {
        rule_any = {},
        callback = function(c)
            c.maximized, c.maximized_vertical, c.maximized_horizontal = false, false, false
            awful.client.setslave(c)
        end
    },

    -- Firefox and chrome all in workspace 2
    {
        rule_any = {
            class = {
                "firefox",
                "Chromium"
            },
        },
        properties = { screen = 1, tag = "2" }
    },
    -- all development tools in workspace3
    {
        rule_any = {
            class = {
                "jetbrains-idea",
                "DBeaver",
                "Code - Insiders",
                "nvim-qt"
            },
        },
        properties = { screen = 1, tag = "3" }
    },

    -- double cmd in workspace4
    {
        rule_any = {
            class = {
                "Doublecmd",
                "pcmanfm-qt"
            },
            name = {
                "ranger"
            }
        },
        properties = { screen = 1, tag = "4", switch_to_tags = true }
    },

    -- all document processors to workspace5
    {
        rule_any = {
            class = {
                "Soffice",
                "Wps",
                "Wpp",
                "Et",
                "Joplin",
                "okular"
            },
            instance = {
                "libreoffice"
            }
        },
        properties = { screen = 1, tag = "5" }
    },

    {
        rule_any = {
            class = {
                "vlc",
                "netease-cloud-music",
                "Netease-cloud-music-gtk"
            },
        },
        properties = { screen = 1, tag = "6" }
    },

    {
        rule_any = {
            class = {
                "Thunderbird"
            },
        },
        properties = { screen = 1, tag = "8" }
    },

    {
        rule_any = {
            instance = {
                "wechat.exe"
            },
        },
        properties = { screen = 1, tag = "9", floating = true, border_width = 0, placement = awful.placement.centered }
    },
})
-- }}}
