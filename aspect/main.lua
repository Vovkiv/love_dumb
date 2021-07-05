local aspect = require("aspect")

aspect.setGame(800, 600)
aspect.setColor(1, 1, 0.2, 1)

love.window.setMode(800, 600, {resizable = true})

function love.update()
  aspect.update()
end

function love.draw()
  aspect.start()
    love.graphics.print("scale " .. aspect.getScale(), 350, 280, 0, 2, 2)
  aspect.stop()
end