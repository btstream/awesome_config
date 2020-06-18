---------------------------------------
--  "material_darker" awesome theme  --
--       By Zichen Liu (btstream)    --
---------------------------------------
local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "material_darker/background.png"
theme.icon_theme = "Tela-Dark"
-- }}}

-- {{{ font
theme.font = "sans 10"
-- }}}

-- {{{ Colors
theme.fg_normal = "#eeffff"
theme.fg_focus = "#eeffff"
theme.fg_urgent = "#ff5370"
theme.bg_normal = "#212121"
theme.bg_focus = "#2d2d2d"
theme.bg_urgent = theme.bg_normal
-- }}}

-- {{{ Borders for client
theme.useless_gap = dpi(2.5)
theme.gap_single_client = false
theme.border_width = dpi(1)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_urgent
theme.border_marked = theme.bg_urgent
-- }}}

-- {{{ Titlebar
theme.titlebar_font = "sans 9"
theme.titlebar_fg_focus = "#eeffff"
theme.titlebar_bg_focus = "#2d2d2d"
theme.titlebar_fg_normal = "#5F5F5F"
theme.titlebar_bg_normal = "#242424"
-- }}}

-- {{{ taglist
theme.taglist_font = "Linux Libertine G Bold 10"
theme.taglist_fg_focus = theme.bg_urgent
theme.taglist_bg_focus = "#82aaff"
theme.taglist_fg_urgent = theme.bg_urgent
theme.taglist_bg_urgent = "#ff5370"
theme.taglist_bg_occupied = "#636363"
theme.taglist_shape = gears.shape.circle
theme.taglist_shape_border_width = dpi(1)
theme.taglist_shape_border_color = "#777777"
theme.taglist_shape_border_color_focus = theme.taglist_bg_focus
theme.taglist_shape_border_color_urgent = theme.taglist_bg_urgent
theme.taglist_shape_border_color_occupied = theme.taglist_bg_occupied
-- }}}

-- {{{ tasklist
theme.tasklist_fg_normal = theme.titlebar_fg_normal
theme.tasklist_bg_normal = theme.titlebar_bg_normal
theme.tasklist_bg_focus = theme.titlebar_bg_focus
theme.tasklist_fg_urgent = theme.fg_normal
theme.tasklist_bg_indicator = "#303030"
theme.tasklist_bg_indicator_focus = theme.taglist_bg_focus
theme.tasklist_bg_indicator_urgent = theme.taglist_bg_urgent
-- theme.tasklist_shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 2) end
theme.tasklist_font = "Libertinus Sans 10"
-- }}}

-- {{{ systray
theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = dpi(3)
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#ff5370"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)
-- }}}

-- {{{ Misc
theme.awesome_icon = themes_path .. "material_darker/start-menu.svg"
-- }}}

-- {{{ Layout icons
theme.layout_tile = themes_path .. "material_darker/layouts/tile.png"
theme.layout_tileleft = themes_path .. "material_darker/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "material_darker/layouts/tilebottom.png"
theme.layout_tiletop = themes_path .. "material_darker/layouts/tiletop.png"
theme.layout_fairv = themes_path .. "material_darker/layouts/fairv.png"
theme.layout_fairh = themes_path .. "material_darker/layouts/fairh.png"
theme.layout_spiral = themes_path .. "material_darker/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "material_darker/layouts/dwindle.png"
theme.layout_max = themes_path .. "material_darker/layouts/max.png"
theme.layout_fullscreen = themes_path .. "material_darker/layouts/fullscreen.png"
theme.layout_magnifier = themes_path .. "material_darker/layouts/magnifier.png"
theme.layout_floating = themes_path .. "material_darker/layouts/floating.png"
theme.layout_cornernw = themes_path .. "material_darker/layouts/cornernw.png"
theme.layout_cornerne = themes_path .. "material_darker/layouts/cornerne.png"
theme.layout_cornersw = themes_path .. "material_darker/layouts/cornersw.png"
theme.layout_cornerse = themes_path .. "material_darker/layouts/cornerse.png"
-- }}}

-- {{{ notifications
theme.notification_width = dpi(320)
theme.notification_max_width = dpi(380)
theme.notification_height = dpi(80)
theme.notification_max_height = dpi(120)
theme.notification_icon_size = dpi(70)
theme.notification_bg = "#212121"
theme.notification_border_color = "#3F3F3F"
theme.notification_opacity = 0.75
theme.notification_shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 8) end
theme.notification_font = "sans 10"
-- }}}

-- {{{ textclock
theme.textclock_font = "Iwona Cond Heavy 12"
theme.textclock_format = "%Y-%m-%d %H:%M"
-- }}}

-- {{{ calendar
theme.calendar_font = "Iwona Cond Heavy 9"
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
