---------------------------------------------------------------
--  Sections:
--      -> Theme 
--      -> Configuration 
--      -> Modules
--      -> UI 
--      -> Garbage-Collection
--      -> Error-Handling
---------------------------------------------------------------

pcall(require, "luarocks.loader")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

---------------------------------------------------------------
-- => Theme
---------------------------------------------------------------
local theme_dir = gears.filesystem.get_themes_dir() .. "default/"
beautiful.init(theme_dir .. "theme.lua")

---------------------------------------------------------------
-- => Configuration
---------------------------------------------------------------
require("configuration")

---------------------------------------------------------------
-- => Modules
---------------------------------------------------------------
--require("modules.auto-start") TODO
require("modules.sloppy-focus")
require("modules.set_wallpaper")

---------------------------------------------------------------
-- => UI
---------------------------------------------------------------
require("ui")

---------------------------------------------------------------
-- => Garbage-Collection
---------------------------------------------------------------
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
gears.timer({
    timeout = 5,
    autostart = true,
    call_now = true,
    callback = function()
            collectgarbage("collect")
    end,
})

---------------------------------------------------------------
-- => Error Handling
---------------------------------------------------------------
local naughty = require("naughty")
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

