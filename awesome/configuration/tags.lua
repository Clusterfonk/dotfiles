local awful = require("awful")

-- 
-- Configure Tag Properties
-- 
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "I", "II", "III", "IV", "V", "VI", "VII", "VIII"}, s, awful.layout.layouts[1])
end)
