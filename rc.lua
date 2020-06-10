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

-- {{{ load themes
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/material_darker/theme.lua")
-- }}}

-- {{{ global configs
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ setup layouts
require("modules.layout")
-- }}}

-- {{{ default wallpapers
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
screen.connect_signal("property::geometry", set_wallpaper)
-- }}}

-- {{{ setup main screens
local panel = require("modules.panel")
awful.screen.connect_for_each_screen(
    function(s)
        set_wallpaper(s)
        -- set screen paddings
        s.padding = {left = dpi(10), right = dpi(10), top = dpi(10), bottom = dpi(10)}
        -- add default panel
        panel.setup(s)
    end
)
-- setup titlebar
require("modules.titlebar")
-- }}}

-- {{{ setup mouse and keybindings
require("config.mouse")
local keybindings = require("config.keybindings")
-- setup keybindings at last, which may be modified by other modules
keybindings.setup()
-- }}}

require("config.rules")
require("config.signals")

-- {{{ autostartup
awful.spawn.with_shell("~/.config/awesome/scripts/autorun.sh")
-- }}}
