--[[
Should console have mouse support?
Should console have copy/paste/highlight system?
Should console have pin to value?(watch window?)

Unpack tables
]]

local usePrint = false -- print stuff with "print()"
local blockKeyboard = true -- prevenet ingame buttons events if it active
local activateByComma = true -- should console activated by internal "~" implementation
local

--local profi = require("profi")
--local console = require("console/console")

--love.window.setMode(800, 600, {resizable = true})
--love.keyboard.setKeyRepeat(true)

--function love.draw()
--  love.graphics.rectangle("fill", 200, 200, 100, 100)
--  console.draw()
--end

--function love.keypressed(key, scancode)
--  console.keypressed(key, scancode)
--end

--function love.textinput(text)
--  console.textinput(text)
--end
local utf8 = require("utf8")
text1 = ""
local font = love.graphics.getFont()
local x = 0
local startX = 20
local width = 100

function love.textinput(text)
  text1 = text1 .. text
end

function love.draw()
love.graphics.setScissor(startX, 0, width + startX, 600)
  
  if font:getWidth(text1) > width + startX then
    x = (startX - font:getWidth(text1)) + (width + startX)
  else
    x = startX
  end
  
  love.graphics.print(text1, x, 0)
  love.graphics.setScissor()
  love.graphics.rectangle("fill", 400, 400, 100, 100)
end

function love.keypressed(key)
  if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(text1, -1)

        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            text1 = string.sub(text1, 1, byteoffset - 1)
        end
    end
end
