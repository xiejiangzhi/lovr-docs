return {
  summary = 'Check if the Shader has a variable.',
  description = 'Returns whether the Shader has a variable.',
  arguments = {
    name = {
      type = 'string',
    }
  },
  returns = {
    exists = {
      type = 'boolean',
      description = 'Whether the Shader has the variable.'
    }
  },
  variants = {
    {
      arguments = { 'name' },
      returns = { 'exists' }
    }
  },
}
