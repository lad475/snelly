package.path = package.path .. ';./objects/?.lua'
require("src.objects.trail")

function love.load()
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 9.81*64, true)

  objects = {}
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
  objects.ground.shape = love.physics.newRectangleShape(650, 50) --make a rectangle with a width of 650 and a height of 50
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)

  objects.player = {
    image = love.graphics.newImage('assets/snelly.png'),
    body = love.physics.newBody(world, 0, 0, 'dynamic'),
    shape = love.physics.newRectangleShape(100, 100, 100, 100)
  }
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1)
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
  love.window.setMode(650, 650) -- set the window dimensions to 650 by 650
end

function love.update(dt)
  world:update(dt)
  incrementTimeForTrail(dt)
  if (objects.player.body:getX() ~= lastX or objects.player.body:getY() ~= lastY) then
    addTrail(objects.player.body)
    objects.player.body:getX()
    objects.player.body:getY()
  end
end

function checkForMovement()
  if (love.keyboard.isDown('d')) then
    objects.player.body:applyForce(400, 0)
  end

  if (love.keyboard.isDown('a')) then
    objects.player.body:applyForce(-400, 0)
  end

  -- if (love.keyboard.isDown('w')) then
  -- end

  -- if (love.keyboard.isDown('s')) then
  -- end
end

function love.draw()
  love.graphics.setColor(0.28, 0.63, 0.05) -- set the drawing color to green for the ground
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  love.graphics.setBackgroundColor(1,1,1)
  drawTrail()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(objects.player.image, objects.player.body:getX(), objects.player.body:getY(), 0, .5)

  checkForMovement()
end