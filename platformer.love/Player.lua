player = {}

player.w = 32
player.h = 32
player.x = 64
player.y = objects.ground.y - player.h
player.velx = 300
player.vely = 0
player.maxjump = -300
player.g = -500
player.img = love.graphics.newImage('img/player.png')

function player:draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.draw(player.img, player.x, player.y)
    love.graphics.setColor(1, 1, 1)
end

return player