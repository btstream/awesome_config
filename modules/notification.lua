-- {{{ naughty configurations
local naughty = require("naughty")
local menubar = require("menubar")
local dpi = require("beautiful.xresources").apply_dpi

naughty.config.spacing = dpi(5)
naughty.config.icon_dirs = {
    "/usr/share/pixmaps",
    "/usr/share/icons/Papirus-Dark/48x48/apps",
    "/usr/share/icons/Papirus-Dark/48x48/status",
    "/usr/share/icons/Papirus-Dark/48x48/devices",
    "/usr/share/icons/Papirus/48x48/apps",
    "/usr/share/icons/Papirus/48x48/status",
    "/usr/share/icons/Papirus/48x48/devices",
    "/usr/share/icons/gnome/scalable/apps",
    "/usr/share/icons/breeze/apps"
}
naughty.config.icon_formats = {
    'svg',
    'png'
}

naughty.connect_signal("request::icon", function(n, context, hints)
    if context ~= "app_icon" then return end

    local path = menubar.utils.lookup_icon(hints.app_icon) or
        menubar.utils.lookup_icon(hints.app_icon:lower())

    if path then
        n.icon = path
    end
end)
-- }}}