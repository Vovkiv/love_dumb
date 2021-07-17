local obj = {x = 100, y = 100, w = 100, h = 100}
local grab = false
local x1, y1

love.mousemoved = function(x, y)
  if grab then
    obj.w = x - obj.x
    obj.h = y - obj.y
  end
end

love.mousereleased = function(_, _, button)
  if button == 1 then
  grab = false
  end
end

love.mousepressed = function(x, y, button)
  if button == 1 then
    if x > obj.x and x < obj.x + obj.w and y > obj.y and y < obj.y + obj.h then
    grab = true
    x1 = math.abs(obj.x - x)
    y1 = math.abs(obj.y - y)
    end
  end
end

love.draw = function()
  love.graphics.rectangle("line", obj.x, obj.y, obj.w, obj.h)
end
