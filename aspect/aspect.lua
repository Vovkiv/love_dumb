-- https://github.com/Vovkiv/love_dumb/blob/main/aspect/aspect.lua

-- default
local background = false -- if false, black bars will copy colors from love.graphics.getBackgroundColor, true - copy colors from r, g, b, a
local gameWidth, gameHeight = 800, 600
local r, g, b, a = 0, 0, 0, 1

-- love
local lovePop, lovePush, loveTranslate, loveScale, loveColor, loveRectangle, loveBackground, loveWidth, loveHeight, abs = love.graphics.pop, love.graphics.push, love.graphics.translate, love.graphics.scale, love.graphics.setColor, love.graphics.rectangle, love.graphics.getBackgroundColor, love.graphics.getWidth, love.graphics.getHeight, math.abs

-- local
local x1, y1, w1, h1, x2, y2, w2, h2 -- black bars positions
local windowWidth, windowHeight      -- actual window size
local xoff, yoff                     -- offset of black bars; if black bar width = 10, then xoff = 10, which can be used to correct mouse position
local gameAspect, windowAspect 
local scale
local a_                             -- optimization value

local module =
{
  setColor = function(r1, g1, b1, a1) r, g, b, a = r1, g1, b1, a1 end, -- color of black bars
  getColor = function() return r, g, b end,

  setGame = function(w, h) gameWidth, gameHeight = w, h end, -- game width, height, scale
  getGame = function() return gameWidth, gameHeight end,
  getGameWidth = function() return gameWidth end,
  getGameHeight = function() return gameHeight end,
  getGameAspect = function() return gameAspect end,

  getOff = function() return xoff, yoff end, -- offset of black bars
  getX = function() return xoff end,
  getY = function() return yoff end,

  getScale = function() return scale end,

  getWindow = function() return windowWidth, windowWidth end, -- window width, height, aspect
  getWindowWidth = function() return windowWidth end,
  getWindowHeight = function() return windowHeight end,
  getWindowAspect = function() return windowAspect end,

  getBackground = function() return background end,
  setBackground = function(back) -- change "background", if value ~= bool, then just switch "background" with not
    if type(back) == "boolean" then
      background = back
    else
      background = not background
    end
  end,

  getBar1 = function() return x1, w1, y1, h1 end, -- if horizontal 1st = left, 2nd = right; if vertical 1st = upper, 2nd = bottom
  getBar2 = function() return x2, w2, y2, h2 end,

  update = function()
    windowWidth, windowHeight = loveWidth(), loveHeight()
    gameAspect = gameWidth / gameHeight
    windowAspect = windowWidth / windowHeight
    if gameAspect > windowAspect then
      scale = windowWidth / gameWidth
      a_ = abs((gameHeight * scale - windowHeight) / 2)
      x1, y1, w1, h1 = 0, 0, windowWidth, a_
      x2, y2, w2, h2 = 0, windowHeight, windowWidth, -a_
      xoff, yoff = 0, windowHeight / 2 - (scale * gameHeight) / 2
    elseif gameAspect < windowAspect then
      scale = windowHeight / gameHeight
      a_ = abs((gameWidth * scale - windowWidth) / 2)
      x1, y1, w1, h1 = 0, 0, a_, windowHeight
      x2, y2, w2, h2 = windowWidth, 0, -a_, windowHeight
      xoff, yoff = windowWidth / 2 - (scale * gameWidth) / 2, 0
    else
      scale = windowWidth / gameWidth
      x1, y1, w1, h1 = 0, 0, 0, 0
      x2, y2, w2, h2 = 0, 0, 0, 0
      xoff, yoff = 0, 0
    end
  end,

  start = function ()
    lovePush()
    loveTranslate(xoff, yoff)
    loveScale(scale, scale)
  end,
  stop = function ()
    lovePop()
    lovePush("all")
    if not background then loveColor(r, g, b, a)
    else loveColor(loveBackground()) end
    loveRectangle("fill", x1, y1, w1, h1)
    loveRectangle("fill", x2, y2, w2, h2)
    lovePop()
  end
}

return module
