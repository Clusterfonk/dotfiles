local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local cmd = require("configuration.defaults.commands")
--
-- => Global Keybinds
--
awful.keyboard.append_global_keybindings({
    --- Launcher
	awful.key({ MODKEY          }, "o", function() awful.spawn(cmd.launcher) end,
	          { description = "open launcher", group = "cmd" }),

    --- Terminal
	awful.key({ MODKEY, SHIFT   }, "Return", function() awful.spawn(cmd.terminal) end,
	          { description = "open terminal", group = "cmd" }),

    --- Editor 
	awful.key({ MODKEY, SHIFT   }, "e", function() awful.spawn(cmd.text_editor) end,
	          { description = "open editor", group = "cmd" }),

    --- Web browser
	awful.key({ MODKEY, SHIFT   }, "w", function() awful.spawn(cmd.web_browser) end,
	          { description = "open web browser", group = "cmd" }),

    -- Menubar <- TODO: replace with launcher
    awful.key({ MODKEY          }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "cmd"})

})

-- Standard
awful.keyboard.append_global_keybindings({
    awful.key({ MODKEY, CTRL }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ MODKEY, SHIFT   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    -- help
    awful.key({ MODKEY, CTRL, SHIFT }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
})

-- Layout Navigation
awful.keyboard.append_global_keybindings({
    awful.key({ MODKEY,           }, "Tab", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ MODKEY,           }, "j", function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),

    awful.key({ MODKEY,           }, "k", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),

    awful.key({ MODKEY,  SHIFT    }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    awful.key({ MODKEY,  SHIFT    }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ MODKEY,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    awful.key({ MODKEY,           }, ".", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ MODKEY,           }, ",", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
})

-- Layout manipulation
awful.keyboard.append_global_keybindings({
    awful.key({ MODKEY,           }, "l", function () awful.tag.incmwfact( 0.05) end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ MODKEY,           }, "h", function () awful.tag.incmwfact(-0.05) end,
              {description = "decrease master width factor", group = "layout"}),

    awful.key({ MODKEY, CTRL }, "h", function () awful.tag.incncol( 1, nil, true) end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ MODKEY, CTRL }, "l", function () awful.tag.incncol(-1, nil, true) end,
              {description = "decrease the number of columns", group = "layout"}),

    awful.key({ MODKEY, }, "space", function () awful.layout.inc( 1) end,
              {description = "select next", group = "layout"}),

    awful.key({ MODKEY, CTRL }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore all minimized", group = "client"}),
})


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


-- workspaces
awful.keyboard.append_global_keybindings({
    -- view workspace
    awful.key({
		modifiers = { MODKEY },
		keygroup = "numrow",
		description = "only view tag",
		group = "tags",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),
    -- move client to tag
    awful.key({
		modifiers = { MODKEY, SHIFT },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tags",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
    -- TODO: keybind to 0 and get all available tags
    -- Toggle all tags
    awful.key({
		modifiers = { MODKEY, }, "0",
		description = "toggle tag",
		group = "tags",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),
})
