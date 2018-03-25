return {
  summary = 'Get an attribute of a single vertex in the VertexData.',
  description = 'Get the components of a specific attribute of a single vertex in the VertexData.',
  arguments = {
    {
      name = 'index',
      type = 'number',
      description = 'The index of the vertex to retrieve the attribute of.'
    },
    {
      name = 'attribute',
      type = 'number',
      description = 'The index of the attribute to retrieve the components of.'
    }
  },
  returns = {
    {
      name = '...',
      type = 'number',
      description = 'The components of the vertex attribute.'
    }
  }
}
