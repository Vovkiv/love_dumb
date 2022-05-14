local yOffset = 0
local xOffset = 0
local xDirection = -1
local yDirection = -1
local width, height = 32, 32
local speed = 80
love.window.setMode(800, 600, {resizable = true})
love.graphics.setDefaultFilter("nearest", "nearest")

love.draw = function()
  local windowWidth = love.graphics.getWidth()
  local windowHeight = love.graphics.getHeight()
  local mx, my = love.mouse.getPosition()
  
  if mx > windowWidth / 2 then
    xDirection = 1
  else
    xDirection = -1
  end

  if my > windowHeight / 2 then
    yDirection = 1
  else
    yDirection = -1
  end

  xOffset = xOffset + (xDirection * math.abs((mx - windowWidth / 2) / speed))
  yOffset = yOffset + (yDirection * math.abs((my - windowHeight / 2) / speed))

  if yOffset < -height or yOffset > height then
    yOffset = 0
  end
  if xOffset < -width or xOffset > width then
    xOffset = 0
  end
  love.graphics.translate(xOffset, yOffset)
  for x = -1, windowWidth / width + 1 do
    for y = -1, windowHeight / height + 1 do
      love.graphics.rectangle("line", x * width, y * height, width, height)
    end
  end
end