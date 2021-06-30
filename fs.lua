local module = 
{
  cycle = function()
    if love.window.isMaximized() == false and love.window.getFullscreen() == false then -- maximize window
      love.window.setFullscreen (false)
      love.window.maximize()
    elseif love.window.isMaximized() == true and love.window.getFullscreen() == false then -- fullscreen
      love.window.setFullscreen (true)
    elseif love.window.getFullscreen() == true then -- windowed
      love.window.setFullscreen (false)
      love.window.restore()
    end
  end,
  windowed = function()
    love.window.setFullscreen(false)
    love.window.restore()
  end,
  fullscreen = function()
    love.window.setFullscreen (true)
  end,
  max = function()
    love.window.setFullscreen (false)
    love.window.maximize()
  end,
}

return module