--love.window.setMode(800, 600, {resizable = true})

local fov = require ('fov')

function love.load()
--	local ww, wh = love.window.getDesktopDimensions( displayindex )
--	love.window.setMode( ww/2, wh/2)
	
	width, height = 1000, 1000

	map = {}
	rez = 10
	max_i, max_j = math.floor(width / rez), math.floor(height / rez)
	for i = 1, max_i do
		map[i] = {}
		for j = 1, max_j do
			if math.random (100) == 1 then
				map[i][j] = 0 -- 0 is wall, black
			else
				map[i][j] = 1 -- 1 is space, white
			end
		end
	end
	
	player = {i=math.floor(max_i/2), j=math.floor(max_j/2)}
	radius = max_j
end

 
function love.update(dt)
	
end


--[[function love.draw()
	-- draw map
	for i, js in pairs (map) do
		for j, value in pairs (js) do
			local c = (value + 1)/3
      if value == 0 then love.graphics.setColor(1, 0, 0, 1)
    elseif value == 1 then love.graphics.setColor(0.4, 0.7, 0.9, 1) end

			love.graphics.rectangle('fill', rez*(i-1), rez*(j-1), rez, rez)
		end
	end
	
	-- get and draw fov
	local view = fov.get (map, player.i, player.j, radius)
	for i, js in pairs (view) do
		for j, value in pairs (js) do
			local c = value and 1 or 0
			love.graphics.setColor (1, 1, 1, 0.5)
			love.graphics.rectangle('fill', rez*(i-1), rez*(j-1), rez, rez)
		end
	end
	
	-- draw player
	love.graphics.setColor (0,1,0)
	love.graphics.rectangle('fill', rez*(player.i-1), rez*(player.j-1), rez, rez)
	
	-- GUI
	love.graphics.setColor (1,1,1)
	love.graphics.print('press WASD to move green dot')
end
--]]
function love.keypressed(key, scancode, isrepeat)
  
  if key == "space" then map[love.math.random(1, max_i)][love.math.random(1, max_j)] = love.math.random(0, 1) end
	if key == "d" then
		player.i = player.i + 1
	elseif key == "s" then
		player.j = player.j + 1
	elseif key == "a" then
		player.i = player.i - 1
	elseif key == "w" then
		player.j = player.j - 1
	elseif key == "escape" then
		love.event.quit()
	end
end
