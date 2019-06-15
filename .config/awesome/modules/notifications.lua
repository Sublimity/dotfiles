local naughty = require('naughty')
local gears = require('gears')

-- Naughty presets
naughty.config.padding = 8
naughty.config.spacing = 8

naughty.config.defaults.timeout = 5
naughty.config.defaults.screen = 1
naughty.config.defaults.position = 'top_right'
naughty.config.defaults.margin = 16
naughty.config.defaults.ontop = true
naughty.config.defaults.font = 'Roboto Regular 10'
naughty.config.defaults.icon = nil
naughty.config.defaults.icon_size = 32
naughty.config.defaults.shape = gears.shape.rounded_rect
naughty.config.defaults.border_width = 0
naughty.config.defaults.hover_timeout = nil

-- Error handling
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then
            return
        end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end