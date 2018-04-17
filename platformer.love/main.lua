require("scroll.lua")

function love.load()
  love.window.setMode(800, 600)
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  ground = {}
  ground.width = w
  ground.height = 500
  ground.x = 0
  ground.y = h - 50
  player = {}
  player.img = love.graphics.newImage("graphics/player.png")
  player.width = 37.5
  player.height = 37.5
  player.speed = 7
  player.jumpheight = -300
  player.gravity = -500
  player.x = 50
  player.y = h - 50 - player.height - 1
  player.yvel = player.jumpheight
  player.ground = player.y

  function drawGround()
    love.graphics.setColor(175, 50, 0)
    love.graphics.rectangle("fill", ground.x, ground.y, ground.width, ground.height)
  end

  function drawPlayer()
    love.graphics.draw(player.img, player.x, player.y, 0, 2.25, 2.25, 0, 0, 0, 0)
  end
end

function love.update(dt)
  if love.keyboard.isDown("a", "left") then
    player.x = player.x - player.speed
    if player.x <= 0 then
      player.x = 2
    end
  end

  if love.keyboard.isDown("d", "right") then
    player.x = player.x + player.speed
    if player.x >= w - player.width then
      player.x = w - player.width - 2
    end
  end

  if love.keyboard.isDown("w", "space", "up") then
    if player.yvel == 0 then
      player.yvel = player.jumpheight
    end
  end

  if player.yvel ~= 0 then
    player.y = player.y + player.yvel * dt
    player.yvel = player.yvel - player.gravity * dt
  end

  if player.y > player.ground then
    player.yvel = 0
    player.y = player.ground
  end
end

function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  drawGround()
  drawPlayer()
end
