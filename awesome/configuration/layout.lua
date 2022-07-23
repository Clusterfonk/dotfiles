local awful = require("awful")
local gears = require("gears")


-- 
-- Configure Tag Properties
-- 
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "I", "II", "III", "IV", "V", "VI", "VII", "VIII"}, s, awful.layout.layouts[1])
end)

-- Table of layouts to cover with awful.layout.inc, order matters.
-- }}}

awful.connect_signal("request::default_layouts", function()
    awful.layout.layouts = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
      -- awful.layout.suit.tile.left,
      -- awful.layout.suit.tile.bottom,
      -- awful.layout.suit.tile.top,
      -- awful.layout.suit.fair,
      -- awful.layout.suit.fair.horizontal,
      -- awful.layout.suit.spiral,
      -- awful.layout.suit.spiral.dwindle,
      -- awful.layout.suit.max,
      -- awful.layout.suit.max.fullscreen,
      -- awful.layout.suit.magnifier,
      -- awful.layout.suit.corner.nw,
      -- awful.layout.suit.corner.ne,
      -- awful.layout.suit.corner.sw,
      -- awful.layout.suit.corner.se,
    }
end)
