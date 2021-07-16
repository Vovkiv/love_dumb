--Resizing
--quite bad, but as example it's okay, i guess
local obj = {x = 100, y = 100, w = 100, h = 100}
local grab = false

love.update = function()
  if grab and not love.mouse.isDown(1) then
    grab = false
  end
  if grab then
    local mx, my = love.mouse.getPosition()
    obj.w = mx - obj.x
    obj.h = my - obj.y
  end
end

love.mousepressed = function(x, y)
  if x > obj.x and x < obj.x + obj.w and y > obj.y and y < obj.y + obj.h then
    grab = true
    end
end
love.draw = function()
  love.graphics.rectangle("line", obj.x, obj.y, obj.w, obj.h)
end
