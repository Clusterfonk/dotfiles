local awful = require("awful")
local beautiful = require("beautiful")
local ruled = require("ruled")


---
-- => Global rules
---
ruled.client.connect_signal("request::rules", function()
    --- Global
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			raise = true,
			size_hints_honor = false,
			honor_workarea = true,
			honor_padding = true,
			screen = awful.screen.focused,
			focus = awful.client.focus.filter,
			titlebars_enabled = beautiful.titlebar_enabled,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
        {
            id = "tasklist_order",
            rule = {},
            properties = {},
            callback = awful.client.setslave,
        },
	})

---    -- Add titlebars to normal clients and dialogs
---    --- Titlebar rules
---	ruled.client.append_rule({
---		id = "titlebars",
---		rule_any = {
---			class = {
---				"Spotify",
---				"Org.gnome.Nautilus",
---				"Peek",
---			},
---		},
---		properties = {
---			titlebars_enabled = false,
---		},
---	})
    -- Float
	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = {
				"Devtools", --- Firefox devtools
			},
			class = {
				"Lxappearance",
				"Nm-connection-editor",
			},
			name = {
				"Event Tester", -- xev
			},
			role = {
				"AlarmWindow",
				"pop-up",
				"GtkFileChooserDialog",
				"conversation",
			},
			type = {
				"dialog",
			},
		},
		properties = { floating = true },
	})
end)

