package.path = package.path .. ';./objects/?.lua'
require("src.objects.trail")

function love.load()
  player = {
    x = love.graphics.getWidth() / 8,
    y = love.graphics.getHeight() / 2,
    image = love.graphics.newImage('assets/snelly.png')
  }
end

function love.update(dt)
  incrementTimeForTrail(dt)
  if (player.x ~= lastX or player.y ~= lastY) then
    addTrail(player)
    lastX = player.x
    lastY = player.y
  end
end

function checkForMovement()
  if (love.keyboard.isDown('d')) then
      player.x = player.x + 1
  end

  if (love.keyboard.isDown('a')) then
      player.x = player.x - 1
  end

  if (love.keyboard.isDown('w')) then
      player.y = player.y - 1
  end

  if (love.keyboard.isDown('s')) then
      player.y = player.y + 1
  end
end

function love.draw()
  
  drawTrail()
  love.graphics.draw(player.image, player.x, player.y, 0, 0.5, 0.5)

  checkForMovement()
end