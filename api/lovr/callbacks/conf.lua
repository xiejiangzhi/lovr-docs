return {
  tag = 'callbacks',
  summary = 'Called to read configuration settings at startup.',
  description = [[
    The `lovr.conf` callback lets you configure default settings for LÖVR.  It is called once right
    before the game starts.  Make sure you put `lovr.conf` in a file called `conf.lua`, a special
    file that's loaded before the rest of the framework initializes.
  ]],
  arguments = {
    {
      name = 't',
      type = 'table',
      description = 'The table to edit the configuration settings on.',
      table = {
        {
          name = 'identity',
          type = 'string',
          description = 'A unique label for this project.'
        },
        {
          name = 'headset',
          type = 'table',
          description = 'Configuration for the headset.',
          table = {
            {
              name = 'drivers',
              type = 'table',
              description = 'An ordered list of preferred headset drivers.'
            },
            {
              name = 'mirrored',
              type = 'boolean',
              description = [[
                Whether the desktop window should display a mirror of what's in the headset.
              ]]
            },
            {
              name = 'offset',
              type = 'number',
              description = 'The vertical offset for seated experiences.'
            }
          }
        },
        {
          name = 'modules',
          type = 'table',
          description = 'The set of enabled modules to use.',
          table = {
            {
              name = 'audio',
              type = 'boolean',
              description = 'Whether the audio module should be enabled.'
            },
            {
              name = 'event',
              type = 'boolean',
              description = 'Whether the event module should be enabled.'
            },
            {
              name = 'filesystem',
              type = 'boolean',
              description = 'Whether the filesystem module should be enabled.'
            },
            {
              name = 'graphics',
              type = 'boolean',
              description = 'Whether the graphics module should be enabled.'
            },
            {
              name = 'headset',
              type = 'boolean',
              description = 'Whether the headset module should be enabled.'
            },
            {
              name = 'math',
              type = 'boolean',
              description = 'Whether the math module should be enabled.'
            },
            {
              name = 'physics',
              type = 'boolean',
              description = 'Whether the physics module should be enabled.'
            },
            {
              name = 'timer',
              type = 'boolean',
              description = 'Whether the timer module should be enabled.'
            }
          }
        },
        {
          name = 'gammacorrect',
          type = 'boolean',
          description = 'Whether colors are gamma corrected.'
        },
        {
          name = 'window',
          type = 'table',
          description = 'Configuration for the window.',
          table = {
            {
              name = 'width',
              type = 'number',
              description = 'The width of the window.'
            },
            {
              name = 'height',
              type = 'number',
              description = 'The height of the window.'
            },
            {
              name = 'fullscreen',
              type = 'boolean',
              description = 'Whether the window is fullscreen.'
            },
            {
              name = 'msaa',
              type = 'number',
              description = 'The number of antialiasing samples to use.'
            },
            {
              name = 'title',
              type = 'string',
              description = 'The window title.'
            },
            {
              name = 'icon',
              type = 'string',
              description = 'The path to the window icon file.'
            }
          }
        }
      }
    }
  },
  returns = {},
  notes = [[
    Disabling the `headset` module can improve startup time a lot if you aren't intending to use
    `lovr.headset`.

    You can set `t.window` to nil to avoid creating the window. You can do it yourself later by
    using `lovr.graphics.createWindow`.

    If the `lovr.graphics` module is disabled or the window isn't created, attempting to use any
    functionality requiring graphics may cause a crash.

    The `headset.offset` field is a vertical offset applied to the scene for headsets that do not
    center their tracking origin on the floor.  This can be thought of as a "default user height".
    Setting this offset makes it easier to design experiences that work in both seated and standing
    VR configurations.
  ]],
  example = {
    description = 'A noop conf.lua that sets all configuration settings to their defaults:',
    code = [[
        function lovr.conf(t)

          -- Set the project identity
          t.identity = 'default'

          -- Headset settings
          t.headset.drivers = { 'openvr', 'webvr', 'fake' }
          t.headset.mirror = true
          t.headset.offset = 1.7

          -- Enable or disable different modules
          t.modules.audio = true
          t.modules.event = true
          t.modules.graphics = true
          t.modules.headset = true
          t.modules.math = true
          t.modules.physics = true
          t.modules.timer = true

          -- Configure gamma correction
          t.gammacorrect = false

          -- Configure the desktop window
          t.window.width = 800
          t.window.height = 600
          t.window.fullscreen = false
          t.window.msaa = 0
          t.window.title = 'LÖVR'
          t.window.icon = nil
        end
    ]]
  },
  related = {
    'lovr.load'
  }
}
