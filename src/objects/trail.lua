require "src.objects.LinkedList"

trails = LinkedList:new()

function drawTrail()
  for trail in trails:iterator() do
    love.graphics.setColor(trail.color)
    love.graphics.circle('fill', trail.x, trail.y, trail.size)
  end
  love.graphics.setColor(0,0,0,1)
  love.graphics.print(trails.length, 100, 100)
  love.graphics.print((collectgarbage("count")), 50, 50)
end

function incrementTimeForTrail(dt)
  local i = 0
  checkTrail()
  for trail in trails:iterator() do
    trail.time = trail.time - dt
    trail.color[4] = trail.time / 4
  end
end

function checkTrail()
  if (trails:peek() ~= nil and trails:peek().time < 0) then
    trails:pop()
  end
end

function addTrail(player)
  trails:push{ 
    x=player.x + 100 + math.random(-100, 50),
    y=player.y + 175 + math.random(-15, 15),
    size=math.random(3, 10),
    time=4,
    color= {
      .8,
      .8,
      .95,
      1
    }
  }
end
