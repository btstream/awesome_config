-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- local themes_path = require("gears.filesystem").get_themes_dir()
local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "material_darker/background.png"
-- }}}

-- {{{ Styles
theme.font      = "CaskaydiaCove Nerd Font Mono 10"
-- theme.font       = "sans 10"

-- {{{ Colors
theme.fg_normal  = "#eeffff"
theme.fg_focus   = "#eeffff"
theme.fg_urgent  = "#ff5370"
theme.bg_normal  = "#212121"
theme.bg_focus   = "#4a4a4a"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = 5
theme.gap_single_client = false
theme.border_width  = dpi(1)
theme.border_normal = "#212121"
theme.border_focus  = "#82aaff"
theme.border_marked = "#82aaff"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#212121"
theme.titlebar_bg_normal = "#212121"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_fg_focus = "#82aaff"
theme.taglist_bg_focus = "#4a4a4a"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#ff5370"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
-- theme.taglist_squares_sel   = themes_path .. "material_darker/taglist/squarefz.png"
-- theme.taglist_squares_unsel = themes_path .. "material_darker/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "material_darker/start-menu.svg"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "material_darker/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "material_darker/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "material_darker/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "material_darker/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "material_darker/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "material_darker/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "material_darker/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "material_darker/layouts/dwindle.png"
theme.layout_max        = themes_path .. "material_darker/layouts/max.png"
theme.layout_fullscreen = themes_path .. "material_darker/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "material_darker/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "material_darker/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "material_darker/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "material_darker/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "material_darker/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "material_darker/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "material_darker/titlebar/win10/close_focus.svg"
theme.titlebar_close_button_normal = themes_path .. "material_darker/titlebar/win10/close_normal.svg"

theme.titlebar_minimize_button_normal = themes_path .. "material_darker/titlebar/win10/minimize_normal.svg"
theme.titlebar_minimize_button_focus  = themes_path .. "material_darker/titlebar/win10/minimize_focus.svg"

theme.titlebar_ontop_button_focus_active  = themes_path .. "material_darker/titlebar/win10/ontop_focus_active.svg"
theme.titlebar_ontop_button_normal_active = themes_path .. "material_darker/titlebar/win10/ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "material_darker/titlebar/win10/ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "material_darker/titlebar/win10/ontop_normal_inactive.svg"

theme.titlebar_sticky_button_focus_active  = themes_path .. "material_darker/titlebar/win10/sticky_focus_active.svg"
theme.titlebar_sticky_button_normal_active = themes_path .. "material_darker/titlebar/win10/sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "material_darker/titlebar/win10/sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "material_darker/titlebar/win10/sticky_normal_inactive.svg"

theme.titlebar_floating_button_focus_active  = themes_path .. "material_darker/titlebar/win10/floating_focus_active.svg"
theme.titlebar_floating_button_normal_active = themes_path .. "material_darker/titlebar/win10/floating_normal_active.svg"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "material_darker/titlebar/win10/floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_inactive = themes_path .. "material_darker/titlebar/win10/floating_normal_inactive.svg"

theme.titlebar_maximized_button_focus_active  = themes_path .. "material_darker/titlebar/win10/maximized_focus_active.svg"
theme.titlebar_maximized_button_normal_active = themes_path .. "material_darker/titlebar/win10/maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "material_darker/titlebar/win10/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "material_darker/titlebar/win10/maximized_normal_inactive.svg"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
