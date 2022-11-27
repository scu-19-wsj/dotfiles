local awful = require('awful')
local gtable = require('gears.table')

mediakeys = gtable.join(
  -- Volume Control
  awful.key({}, "XF86AudioMute",
    function()
      awful.util.spawn("amixer set Master toggle", false)
    end,
    {description = "mute/unmute volume", group = "controls"}),

  awful.key({}, "XF86AudioMicMute",
    function()
      awful.spawn.with_shell("pactl set-source-mute 1 toggle")
    end,
    {description = "mute/unmute mic", group = "controls"}),

  awful.key({}, "XF86AudioLowerVolume",
    function()
      awful.util.spawn("amixer set Master 5%-", false)
    end,
    {description = "lower volume", group = "controls"}),

  awful.key({}, "XF86AudioRaiseVolume",
    function()
      awful.util.spawn("amixer set Master 5%+", false)
    end,
    {description = "raise volume", group = "controls"}),

  -- Media Controls
  awful.key({}, "XF86AudioPlay",
    function()
      awful.spawn.with_shell("playerctl play-pause")
    end,
    {description = "toggle play/pause", group = "controls"}),

  awful.key({}, "XF86AudioStop",
    function()
      awful.spawn.with_shell("playerctlstop")
    end,
    {description = "stops music", group = "controls"}),

  awful.key({}, "XF86AudioNext",
    function()
      awful.spawn.with_shell("playerctl next")
    end,
    {description = "next song", group = "controls"}),

  awful.key({}, "XF86AudioPrev",
    function()
      awful.spawn.with_shell("playerctl previous")
    end,
    {description = "previous song", group = "controls"}),

  -- Screen Brightness
  awful.key({}, "XF86MonBrightnessUp",
    function()
      awful.spawn.with_shell("light -A 5")
    end,
    {description = "Increase brightness", group = "controls"}),

  awful.key({}, "XF86MonBrightnessDown",
    function()
      awful.spawn.with_shell("light -U 5")
    end,
    {description = "Decrease brightness", group = "controls"}),

  -- Caffeine Toggle
  awful.key({}, "XF86Launch1",
    function()
      awful.spawn.with_shell("caffeine-toggle")
    end,
    {description = "Toggle Caffeine", group = "controls"}),

  -- Screenshot
  awful.key({}, "Print",
    function()
      awful.spawn.with_shell("xfce4-screenshooter -f -s ~/Pictures/Screenshots")
    end,
    {description = "took screenshot of entire screen", group = "screenshot"}),

  awful.key({ shiftkey }, "Print",
    function()
      awful.spawn.with_shell("xfce4-screenshooter -w -s ~/Pictures/Screenshots")
    end,
    {description = "took screenshot of focused window", group = "screenshot"}),

  awful.key({ ctrlkey }, "Print",
    function()
      awful.spawn.with_shell("xfce4-screenshooter -r -s ~/Pictures/Screenshots")
    end,
    {description = "took screenshot of selected area", group = "screenshot"})
)
