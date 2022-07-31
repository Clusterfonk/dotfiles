-- @license APGL-3.0 <https://www.gnu.org/licenses/>
-- @author Clusterfonk <https://github.com/Clusterfonk>
local awful = require("awful")
local capi = {keygrabber = keygrabber }
local wibox = require("wibox")
local gears = require("gears")
local bt = require("beautiful")


local HOME_DIR = os.getenv("HOME")
local WIDGET_DIR = HOME_DIR .. '/.config/awesome/awesome-wm-widgets/logout-popup-widget'


local w = wibox {
    bg = beautiful.fg_normal,
    max_widget_size = 500,
    ontop = true,
    height = 200,
    width = 400,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 8)
    end
}

local action = wibox.widget {
    text = ' ',
    widget = wibox.widget.textbox
}

local phrase_widget = wibox.widget{
    align  = 'center',
    widget = wibox.widget.textbox
}

local function launch(args)
    args = args or {}

    local bg_color = args.bg_color or beautiful.bg_normal
    local accent_color = args.accent_color or beautiful.bg_focus
    local text_color = args.text_color or beautiful.fg_normal
    local label_color = args.label_color or beautiful.fg_focus
    local phrases = args.phrases or {'Goodbye!'}
    local icon_size = args.icon_size or 40
    local icon_margin = args.icon_margin or 16

    local onlogout = args.onlogout or function () awesome.quit() end
    local onlock = args.onlock or function() awful.spawn.with_shell("i3lock") end
    local onreboot = args.onreboot or function() awful.spawn.with_shell("reboot") end
    local onsuspend = args.onsuspend or function() awful.spawn.with_shell("systemctl suspend") end
    local onpoweroff = args.onpoweroff or function() awful.spawn.with_shell("shutdown now") end

    w:set_bg(bg_color)
    if #phrases > 0 then
        phrase_widget:set_markup(
            '<span color="'.. text_color .. '" size="20000">' .. phrases[ math.random( #phrases ) ] .. '</span>')
    end

    w:setup {
        {
            phrase_widget,
            {
                {
                    create_button('log-out', 'Log Out (l)',
                        accent_color, label_color, onlogout, icon_size, icon_margin),
                    create_button('lock', 'Lock (k)',
                        accent_color, label_color, onlock, icon_size, icon_margin),
                    create_button('refresh-cw', 'Reboot (r)',
                        accent_color, label_color, onreboot, icon_size, icon_margin),
                    create_button('moon', 'Suspend (u)',
                        accent_color, label_color, onsuspend, icon_size, icon_margin),
                    create_button('power', 'Power Off (s)',
                        accent_color, label_color, onpoweroff, icon_size, icon_margin),
                    id = 'buttons',
                    spacing = 8,
                    layout = wibox.layout.fixed.horizontal
                },
                valign = 'center',
                layout = wibox.container.place
            },
            {
                action,
                haligh = 'center',
                layout = wibox.container.place
            },
            spacing = 32,
            layout = wibox.layout.fixed.vertical
        },
        id = 'a',
        shape_border_width = 1,
        valign = 'center',
        layout = wibox.container.place
    }

    w.screen = mouse.screen
    w.visible = true

    awful.placement.centered(w)
    capi.keygrabber.run(function(_, key, event)
        if event == "release" then return end
        if key then
            if key == 'Escape' then
                phrase_widget:set_text('')
                capi.keygrabber.stop()
                w.visible = false
            elseif key == 's' then onpoweroff()
            elseif key == 'r' then onreboot()
            elseif key == 'u' then onsuspend()
            elseif key == 'k' then onlock()
            elseif key == 'l' then onlogout()
            end

            if key == 'Escape' or string.match("srukl", key) then
                phrase_widget:set_text('')
                capi.keygrabber.stop()
                w.visible = false
            end
        end
    end)
end

local function widget(args)
    local icon = args.icon or WIDGET_DIR .. '/power.svg'

    local res = wibox.widget {
        {
            {
                image = icon,
                widget = wibox.widget.imagebox
            },
            margins = 4,
            layout = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
    }

    res:buttons(
        awful.util.table.join(
            awful.button({}, 1, function()
                if w.visible then
                    phrase_widget:set_text('')
                    capi.keygrabber.stop()
                    w.visible = false
                else
                    launch(args)
                end
            end)
        ))

    return res

end

return {
    launch = launch,
    widget = widget
}