objects = {
    ground = {
        x = 0,
        y = (sheight)/3 * 2,
        w = love.graphics.getWidth(),
        h = (sheight) * 1/3
    },
    box = {
        x = 128,
        y = (sheight)/3 * 2 - 32,
        w = 32,
        h = 32
    }
}

objects.length = tablelength(objects)

function objects.ground:draw()
    love.graphics.rectangle('fill', objects.ground.x, objects.ground.y, objects.ground.w, objects.ground.h)
end

return objects