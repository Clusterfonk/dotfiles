local awful = require("awful")


client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ MODKEY, }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
        {description = 'toggle fullscreen', group = 'client'}),
        --- Toggle floating
        awful.key({ MODKEY, SHIFT }, "space", awful.client.floating.toggle,
                  {description = "toggle floating", group = "client"}), 

        awful.key({ MODKEY, SHIFT   }, "c",      function (c) c:kill() end,
                  {description = "close", group = "client"}),

        awful.key({ MODKEY, CTRL }, "Return", 
        function (c) c:swap(awful.client.getmaster()) end,
                  {description = "move to master", group = "client"}),

    -- layout manip
-- TODO: move to next and prev screen instead
    awful.key({ MODKEY, SHIFT }, ".",      function (c) c:move_to_screen() end,
              {description = "move to next screen", group = "client"}),
    awful.key({ MODKEY, SHIFT }, ",",      function (c) c:move_to_screen() end,
              {description = "move to prev screen", group = "client"}),

    -- client manip
    -- minimize client
    awful.key({ MODKEY, }, "n",
        function (c)
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),

    --(un)maximize client
    awful.key({ MODKEY, }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),

    --- Center window
    awful.key({ MODKEY, }, "c", 
        function() 
            awful.placement.centered(c, { honor_workarea = true, honor_padding = true })
        end),
})
end)
