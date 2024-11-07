return {
  tag = 'headset-misc',
  summary = 'Update the headset module.',
  description = [[
    Updates the headset module, blocking until it is time to start a new frame and polling new input
    states.  This should only be called once at the beginning of a frame, and is normally taken care
    of by the default `lovr.run` implementation.
  ]],
  arguments = {},
  returns = {},
  variants = {
    {
      arguments = {},
      returns = {}
    }
  },
  related = {
    'lovr.headset.submit'
  }
}
