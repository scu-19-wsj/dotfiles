local awful = require('awful')
local wibox = require('wibox')
local build_widget = require('widgets.build_widget')
beautiful = require('beautiful')

local calendar_widget = require("widgets.calendar")

local widgets = {}

-- From Files
widgets.cpu = require('widgets.cpu')
widgets.mem = require('widgets.mem')
widgets.temp = require('widgets.temp')
widgets.disk = require('widgets.disk')
widgets.vol = require('widgets.vol')
widgets.bat = require('widgets.bat')
widgets.media = require('widgets.media')
widgets.kblayout = require('widgets.kblayout')

-- widget.textclock = wibox.widget.textclock()

-- Separators
widgets.space = wibox.widget.textbox('<span>  </span>')
widgets.seperator = wibox.widget.textbox(string.format(' <span color="%s">|</span>  ', beautiful.xcolor8))

-- Textclock
local textclock_text =wibox.widget.textclock(" %d %b %a %I:%M %p")


-- local month_calendar = awful.widget.calendar_popup.month()
-- month_calendar:attach( widgets.textclock, 'tc' )


-- default
local cw = calendar_widget()
-- or customized
local cw = calendar_widget({
    theme = 'outrun',
    placement = 'top_center',
    start_sunday = false,
    radius = 8,
-- with customized next/previous (see table above)
    previous_month_button = 4,
    next_month_button = 5,
})
textclock_text:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)
widgets.textclock = build_widget:new(textclock_text, "", beautiful.xcolor13, true).widget


return widgets
