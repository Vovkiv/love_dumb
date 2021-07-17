local obj = {x = 100, y = 100, w = 100, h = 100, sw = 1, sh = 1}
local grab = false
local rect = love.graphics.newCanvas(obj.w, obj.h)
obj.w1, obj.h1 = obj.w, obj.h -- to calculate scaling from point A to B, we need to store somewhere original width and height of image
--In this case, i can took values from table with rectangle, but if you need take it from actual image you can use object_with_image:getWidth() and object_with_image:getHeight() (https://www.love2d.org/wiki/Image, https://www.love2d.org/wiki/Texture:getHeight)

love.graphics.setCanvas(rect)
love.graphics.rectangle("line", 0, 0, obj.w, obj.h)
love.graphics.setCanvas()

love.mousemoved = function(x, y)
  if grab then
    obj.sw = math.abs(obj.x - x) / obj.w1
    obj.sh = math.abs(obj.y - y) / obj.h1
  end
end

love.mousereleased = function(x, y, button)
  if button == 1 then
  grab = false
  obj.w = math.abs(obj.x - x)
  obj.h = math.abs(obj.y - y)
  end
end

love.mousepressed = function(x, y, button)
  if button == 1 then
    if x > obj.x and x < obj.x + obj.w and y > obj.y and y < obj.y + obj.h then
    grab = true
    end
  end
end

love.draw = function()
  love.graphics.draw(rect, obj.x, obj.y, 0, obj.sw, obj.sh) -- 4 and 5 argument stand for scaling for this image
end
