require "src.objects.LinkedList"

trails = LinkedList:new()

function drawTrail()
  local currentNode = trails.head;
  local i = 0
  while (i < trails.length and currentNode ~= nil) do
    love.graphics.setColor(currentNode.data.color)
    love.graphics.circle('fill', currentNode.data.x, currentNode.data.y, currentNode.data.size)
    currentNode = currentNode.next
  end
end

function incrementTimeForTrail(dt)
  local currentNode = trails.head;
  local i = 0
  checkTrail()
  while (i < trails.length and currentNode ~= nil) do
    currentNode.data.time = currentNode.data.time - dt
    currentNode.data.color[4] = currentNode.data.time / 4
    currentNode = currentNode.next
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
    size=math.random(2, 15),
    time=4,
    color= {
      .5,
      .5,
      .95,
      1
    }
  }
end