require "src.objects.LinkedList"

trails = LinkedList:new()

function drawTrail()
  local currentNode = trails.head;
  local i = 0
  while (i < trails.length and currentNode ~= nil) do
    love.graphics.setColor(math.random(0, 50),math.random(0, 50), math.random(200, 255))
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
    x=player.x + 100 + math.random(-50, 50),
    y=player.y + 150 + math.random(-50, 50),
    size=math.random(2, 20),
    time=2,
     }
end