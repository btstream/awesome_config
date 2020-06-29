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
if terminal == nil then
    terminal = "urxvtc"
end
if editor == nil then
    editor = os.getenv("EDITOR") or "nvim"
end
if editor_cmd == nil then
    editor_cmd = terminal .. " -e " .. editor
end
if use_bing_wallpapper == nil then
    use_bing_wallpapper = false
end
if use_title_bar == nil then
    use_title_bar = false
end
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
