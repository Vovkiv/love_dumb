local module =
{
  r = 1,
  g = 1,
  b = 1,
  a = 1,

  x1 = 0,
  y1 = 0,
  w1 = 0,
  h1 = 0,
  x2 = 0,
  y2 = 0,
  w2 = 0,
  h2 = 0,

  scale = 0,
  windowWidth = 0,
  windowHeight = 0,
  gameWidth = 0,
  gameHeight = 0,
  x = 0,
  y = 0,
  setColor = function (self, r, g, b, a) self.r, self.g, self.b, self.a = r, g, b, a end,
  set = function (self, w, h) self.gameWidth, self.gameHeight = w, h end,
  update = function (self)
    local windowWidth, windowHeight = love.graphics.getWidth(), love.graphics.getHeight()
    local gameWidth, gameHeight = self.gameWidth, self.gameHeight
    self.windowWidth, self.windowHeight = windowWidth, windowHeight

    local gameAspect = gameWidth / gameHeight
    local windowAspect = windowWidth / windowHeight

    if gameAspect > windowAspect then
      local scale = windowWidth / gameWidth
      local a = math.abs((gameHeight * scale - windowHeight) / 2)
      self.scale = scale
      self.x1, self.y1, self.w1, self.h1 = 0, 0, windowWidth, a
      self.x2, self.y2, self.w2, self.h2 = 0, windowHeight, windowWidth, -a
      self.x, self.y = 0, windowHeight / 2 - (scale * gameHeight) / 2
    elseif gameAspect < windowAspect then
      local scale = windowHeight / gameHeight
      local a = math.abs((gameWidth * scale - windowWidth) / 2)
      self.scale = scale
      self.x1, self.y1, self.w1, self.h1 = 0, 0, a, windowHeight
      self.x2, self.y2, self.w2, self.h2 = windowWidth, 0, -a, windowHeight
      self.x, self.y = windowWidth / 2 - (scale * gameWidth) / 2, 0
    else
      self.scale = windowWidth / gameWidth
      self.x1, self.y1, self.w1, self.h1 = 0, 0, 0, 0
      self.x2, self.y2, self.w2, self.h2 = 0, 0, 0, 0
      self.x, self.y = 0, 0
    end
  end,
  start = function (self)
    local scale = self.scale
    love.graphics.push()
    love.graphics.translate (self.x, self.y)
    love.graphics.scale (scale, scale)
  end,
  stop = function (self)
    love.graphics.pop()
    local shader = love.graphics.getShader()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(self.r, self.g, self.b, self.a)
    love.graphics.rectangle ("fill", self.x1, self.y1, self.w1, self.h1)
    love.graphics.rectangle ("fill", self.x2, self.y2, self.w2, self.h2)

    love.graphics.setColor (r, g, b, a)
    love.graphics.setShader (shader)
  end
}

return module