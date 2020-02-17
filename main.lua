function love.load()
  player = {
    x = love.graphics.getWidth() / 8,
    y = love.graphics.getHeight() / 2,
    image = love.graphics.newImage('assets/snelly.png')
  }
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
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.draw(player.image, player.x, player.y, 0, 0.5, 0.5)

  checkForMovement()
end