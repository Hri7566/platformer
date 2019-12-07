swidth = love.graphics.getWidth()
sheight = love.graphics.getHeight()

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local Json = require('json.json')
local Objects = require('Objects')
local Player = require('Player')
local Keybinds = require('Keybinds')
local Sound = require('Sound')
local Collision = require('Collision')

function love.load()
    
end

function love.update(dt)
    swidth = love.graphics.getWidth()
    sheight = love.graphics.getHeight()
    keybinds:load(dt)

    if player.x <= 0 then
        player.x = 0
        secret:play()
    end

    if player.x + player.w >= swidth then
        player.x = swidth - player.w
    end
end

function love.draw()
    love.graphics.push()
    player:draw()
    objects.ground:draw()
    love.graphics.pop()
    love.graphics.setShader()
end