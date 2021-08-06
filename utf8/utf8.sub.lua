local utf8 = require("utf8")

utf8.sub = function(str, x, y)
  local x2, y2
  x2 = utf8.offset(str, x)
  if y then
    y2 = utf8.offset(str, y+1)
    if y2 then
      y2 = y2 - 1
    end
  end
  return string.sub(str, x2, y2)
end

return utf8
