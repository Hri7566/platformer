keybinds = {}
keybinds.left = 'a'
keybinds.right = 'd'
keybinds.jump = 'space'
keybinds.sprint = 'lshift'

mouse = {}
mouse.x, mouse.y = love.mouse.getPosition()

function keybinds:load(dt)
    if love.keyboard.isDown('escape') then love.event.quit() end
    if love.keyboard.isDown(self.left) then player.x = player.x - player.velx * dt end
    if love.keyboard.isDown(self.right) then player.x = player.x + player.velx * dt end
    if love.keyboard.isDown(self.jump) then 
        if player.vely == 0 then
            player.vely = player.maxjump
        end
    end
    if player.vely ~= 0 then
        player.y = player.y + player.vely * dt
        player.vely = player.vely - player.g * dt
    end

    if player.y > objects.ground.y - player.h then
        player.vely = 0
        player.y = objects.ground.y - player.h
    end

    if love.keyboard.isDown(self.sprint) then player.velx = 500 else player.velx = 300 end
    if love.keyboard.isDown('r') then love.event.quit('restart') end
end