local awful = require("awful")


-------------------------------
-- => Mouse
-------------------------------
--awful.mouse.append_global_mousebindings({
--})


client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        --- left click
        awful.button({}, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        -- Move client
        awful.button({ MODKEY }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        -- Resize client
        awful.button({ MODKEY }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

