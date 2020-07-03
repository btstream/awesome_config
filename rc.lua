-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local menubar = require("menubar")
require("awful.hotkeys_popup.keys")
local dpi = require("beautiful.xresources").apply_dpi
require("error_check")
local naughty = require("naughty")

-- {{{ load custom variables and set default if not set
pcall(require, "custom_variables")
terminal = terminal or "urxvtc"
terminal_cmd = terminal_cmd or terminal
editor = editor or (os.getenv("EDITOR") or "nvim")
editor_cmd = editor_cmd or terminal .. "-e" .. editor
use_bing_wallpapper = use_bing_wallpapper or false
use_title_bar = use_title_bar or false
-- }}}

-- {{{ load themes
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/material_darker/theme.lua")
-- }}}

-- {{{ setup layouts
require("modules.layout")
-- }}}

require("modules.wallpaper")

-- {{{ setup main screens
local panel = require("modules.panel")
screen.connect_signal("request::desktop_decoration",
    function(s)
        -- s.padding = {left = dpi(10), right = dpi(10), top = dpi(10), bottom = dpi(10)}
        -- add default panel
        panel.setup(s)
    end
)
-- setup titlebar
if use_title_bar then
    require("modules.titlebar")
end
-- }}}

-- {{{ setup mouse and keybindings
require("config.mouse")
require("config.keybindings")
-- }}}

-- {{{ rules and signals
require("config.rules")
require("config.signals")
-- }}}

-- {{{ autostartup
awful.spawn.with_shell("~/.config/awesome/scripts/autorun.sh")
-- }}}
