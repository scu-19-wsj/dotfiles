-- Provides:
-- evil::volume
--      volume percentage (integer)
--      muted (boolean)
-- evil::microphone
--      muted (boolean)
local awful = require("awful")
-- local naughty = require("naughty")

local function emit_volume_info()
    -- Get volume info
    awful.spawn.easy_async("wpctl get-volume @DEFAULT_AUDIO_SINK@",
        function(stdout)
          local stdout_sl = string.gsub(stdout, "\n", " ")
          local _, volume, muted = stdout_sl:match("(%w+): (%d+%.*%d*)%s*%[*(%w*)")
          volume = math.floor(tonumber(volume)*100)
        --   naughty.notify({text=tostring(volume)})
          if muted == 'MUTED' then
              awesome.emit_signal("evil::volume", volume, true)
          else
              awesome.emit_signal("evil::volume", volume, false)
          end
        end
    )
end

--[[ local function emit_microphone_info()
    -- Use tail to grab the last line of the output (which refers to the microphone)
    awful.spawn.easy_async_with_shell("pacmd list-sources | grep muted | tail -1 | awk '{print $2}'",
        function(stdout)
            -- Remove trailing whitespace
            muted = stdout:gsub('^%s*(.-)%s*$', '%1')
            if muted ~= nil then
                awesome.emit_signal("evil::microphone", true)
            else
                awesome.emit_signal("evil::microphone", false)
            end
        end
    )
end ]]


-- Run once to initialize widgets
emit_volume_info()
-- emit_microphone_info()

-- Sleeps until pactl detects an event (volume up/down/toggle mute)
local volume_script = [[
    bash -c '
    pw-mon 2> /dev/null | grep --line-buffered "sink"
    ']]


-- Sleeps until pactl detects an event (microphone volume up / down / (un)mute)
local microphone_script = [[
    bash -c '
    pw-mon 2> /dev/null | grep --line-buffered "source"
   ']]

-- Kill old pactl subscribe processes
awful.spawn.easy_async_with_shell("ps x | grep \"pw-mon\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Run emit_volume_info() with each line printed
    awful.spawn.with_line_callback(volume_script, {
        stdout = function(line)
            emit_volume_info()
        end
    })
   -- Run emit_microphone_info() with each line printed
--[[     awful.spawn.with_line_callback(microphone_script, {
        stdout = function(line)
            emit_microphone_info()
        end
    })  ]]

end)
