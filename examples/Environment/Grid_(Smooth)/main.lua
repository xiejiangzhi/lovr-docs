function lovr.load()
  shader = lovr.graphics.newShader([[
    out vec2 scale;

    vec4 lovrmain() {
      scale = vec2(length(Transform[0]), length(Transform[1]));
      return DefaultPosition;
    }
  ]], [[
    uniform float lineWidth;

    in vec2 scale;

    // https://bgolus.medium.com/the-best-darn-grid-shader-yet-727f9278b9d8
    vec4 lovrmain() {
      vec2 uv = (UV - 1.) * scale;
      vec4 uvDDXY = vec4(dFdx(uv), dFdy(uv));
      vec2 uvDeriv = vec2(length(uvDDXY.xz), length(uvDDXY.yw));
      vec2 drawWidth = clamp(vec2(lineWidth), uvDeriv, vec2(.5));
      vec2 lineAA = uvDeriv * 1.5;
      vec2 gridUV = 1.0 - abs(fract(uv) * 2. - 1.);
      vec2 grid2 = smoothstep(lineWidth + lineAA, lineWidth - lineAA, gridUV);
      grid2 *= clamp(lineWidth / drawWidth, 0., 1.);
      grid2 = mix(grid2, vec2(lineWidth), clamp(uvDeriv * 2. - 1., 0., 1.));
      float grid = mix(grid2.x, 1., grid2.y);
      return vec4(Color.rgb * grid, Color.a);
    }
  ]])
end

function lovr.draw(pass)
  pass:setShader(shader)
  pass:send('lineWidth', .05)
  pass:plane(0, 0, 0, 50, 50, -math.pi / 2, 1, 0, 0)
end
