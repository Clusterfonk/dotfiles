-- @license APGL-3.0 <https://www.gnu.org/licenses/>
-- @author Clusterfonk <https://github.com/Clusterfonk>
---------------------------------------------------------------
--  Sections:
--      -> Theme 
--      -> Configuration 
--      -> Modules
--      -> UI 
--      -> Garbage-Collection
--      -> Error-Handling
---------------------------------------------------------------
local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local naughty = require("naughty")
local wibox = require("wibox")


local colors = { }
colors.black_1          = "#282828"
colors.black_2          = "#928374"
colors.red_1            = "#cc241d"
colors.red_2            = "#fb4934"
colors.green_1          = "#98971a"
colors.green_2          = "#b8bb26"
colors.yellow_1         = "#d79921"
colors.yellow_2         = "#fabd2f"
colors.blue_1           = "#458588"
colors.blue_2           = "#83a598"
colors.purple_1         = "#b16286"
colors.purple_2         = "#d3869b"
colors.aqua_1           = "#689d6a"
colors.aqua_2           = "#8ec07c"
colors.white_1          = "#a89984"
colors.white_2          = "#ebdbb2"
colors.orange_1         = "#d65d0e"
colors.orange_2         = "#fe8019"

colors.bw_0_h           = "#1d2021"
colors.bw_0             = "#282828"
colors.bw_0_s           = "#32302f"
colors.bw_1             = "#3c3836"
colors.bw_2             = "#504945"
colors.bw_3             = "#665c54"
colors.bw_4             = "#7c6f64"
colors.bw_5             = "#928374"
colors.bw_6             = "#a89984"
colors.bw_7             = "#bdae93"
colors.bw_8             = "#d5c4a1"
colors.bw_9             = "#ebdbb2"
colors.bw_10            = "#fbf1c7"

local theme = { }
local config_root_dir = gfs.get_configuration_dir()
local theme_dir = config_root_dir .. "theme/gruvbox/"
theme.wallpaper = theme_dir .. "/wallpaper.png"
-- TODO: maybe blur wallpaper when panel open

-- Font
function theme:create_font(args)
    args = args or {}
    args.size = args.size or theme.font_size

    if args.emphasis then
        return theme.font_name .. " " .. args.emphasis .. " " .. args.size
    end
    return theme.font_name .. " " .. args.size
end

theme.font_name = "Fira Mono"
theme.font_size = "11"
theme.font = theme:create_font()
theme.font_bold = theme:create_font({emphasis = "Bold"})
theme.font_italic = theme:create_font({emphasis = "Italic"})
theme.font_bold_italic = theme:create_font({emphasis = "Bold Italic"})

-- border
theme.border_width = 1
theme.border_radius = 0
theme.border_normal = colors.bw_2
theme.border_focus = colors.red_2
theme.border_marked = colors.bw_5
theme.useless_gap = 5

-- general
theme.fg_normal = colors.bw_9
theme.fg_focus = colors.red_2
theme.fg_urgent = colors.bw_0
theme.bg_normal = colors.bw_0
theme.bg_focus = colors.bw_2
theme.bg_urgent = colors.red_2

-- taglist
theme.taglist_fg_normal = theme.fg_normal
theme.taglist_fg_focus = theme.fg_focus
theme.taglist_fg_urgent = colors.bw_0
theme.taglist_fg_empty = colors.bw_2
theme.taglist_bg_normal = colors.bw_0
theme.taglist_bg_occupied = colors.bw_0
theme.taglist_bg_empty = colors.bw_0
theme.taglist_bg_volatile = colors.bw_0
theme.taglist_bg_focus = colors.bw_0
theme.taglist_bg_urgent = colors.red_2
theme.taglist_border_color = theme.taglist_fg_empty
theme.taglist_border_width = 2
theme.taglist_underline_height = 2

-- titlebar
theme.titlebar_enabled = false

-- help popup
theme.hotkeys_border_width = 30
theme.hotkeys_border_color = colors.bw_0
theme.hotkeys_group_margin = 30
theme.hotkeys_shape =   function(cr, width, height)
                            gears.shape.rounded_rect(cr, width, height, 20)
                        end
-- prompt
theme.prompt_bg = colors.bw_2
theme.prompt_fg = theme.fg_normal
theme.bg_systray = theme.tasklist_bg_normal        

-- snap
theme.snap_bg = theme.border_focus
theme.snap_shape =  function(cr, w, h)
                        gears.shape.rounded_rect(cr, w, h, theme.border_radius or 0)
                    end

-- Icons
-- layout icons
local layout_dir = theme_dir .. "layouts/"
theme.layout_floating = gears.color.recolor_image(layout_dir .. "floating.png", theme.fg_normal)
theme.layout_tile = gears.color.recolor_image(layout_dir .. "tile.png", theme.fg_normal)

-- widget icons
local icon_dir = theme_dir .. "icons/"
local function loading_icon(filename) 
    local lgi_cairo_surface = gears.surface.load_silently(icon_dir .. filename .. ".svg")
    return gears.color.recolor_image(lgi_cairo_surface, theme.fg_normal)
end

theme.icon = {}
theme.icon.bell_normal = loading_icon("bell-normal")
theme.icon.notification = loading_icon("notification")

theme.icon.menu_up = loading_icon("menu-up")
-- theme.icon.menu_left = gears.color.recolor_image(icon_dir .. "menu-left.svg", theme.fg_normal)
-- theme.icon.menu_right = gears.color.recolor_image(icon_dir .. "menu-right.svg", theme.fg_normal)
theme.icon.menu_down = loading_icon("menu-down")

theme.icon.headphones = loading_icon("headphones")
theme.icon.vol_high = loading_icon("volume-high")
theme.icon.vol_mid = loading_icon("volume-mid")
theme.icon.vol_low = loading_icon("volume-low")
theme.icon.vol_muted = loading_icon("volume-muted")
theme.icon.mic = loading_icon("microphone")
theme.icon.mic_muted = loading_icon("microphone-muted")

-- systray
theme.systray = {}
theme.systray.icon_spacing = 4

-- TODO: notification theme settings might be not needed set naughty directly
theme.notification_fg = theme.fg_normal
theme.notification_bg = theme.bg_normal
theme.notification_border_color = theme.border_normal
theme.notification_border_width = theme.border_width
theme.notification_icon_size = 80

theme.notification_max_width = 600
theme.notification_max_height = 400
theme.notification_margin = 20
theme.notification_shape =  function(cr, width, height)
                                gears.shape.rounded_rect(cr, width, height, theme.border_radius or 0)
                            end

-- naughty
naughty.config.padding = 15
naughty.config.spacing = 10
naughty.config.defaults.timeout = 5
naughty.config.defaults.margin = theme.notification_margin
naughty.config.defaults.border_width = theme.notification_border_width
-- TODO needed ?
naughty.config.presets.normal = {
    font = theme.font,
    fg = theme.notification_fg,
    bg = theme.notification_bg,
    border_width = theme.notification_border_width,
    margin = theme.notification_margin,
}

naughty.config.presets.low                      = naughty.config.presets.normal
naughty.config.presets.ok                       = naughty.config.presets.normal
naughty.config.presets.info                     = naughty.config.presets.normal
naughty.config.presets.warn                     = naughty.config.presets.normal

naughty.config.presets.critical                 = {
                                                      font         = theme.font,
                                                      fg           = colors.red_2,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                      timeout      = 0,
                                                  }

return theme