--Moving
local obj = {x = 100, y = 100, w = 100, h = 100}
local grab = false
local x1, y1

love.update = function()
  if grab and not love.mouse.isDown(1) then
    grab = false
  end
  if grab then
    local mx, my = love.mouse.getPosition()
    obj.x = mx - x1
    obj.y = my - y1
  end
end

love.mousepressed = function(x, y)
  if x > obj.x and x < obj.x + obj.w and y > obj.y and y < obj.y + obj.h then
    grab = true
    x1 = math.abs(obj.x - x)
    y1 = math.abs(obj.y - y)
    end
end
love.draw = function()
  love.graphics.rectangle("line", obj.x, obj.y, obj.w, obj.h)
end
