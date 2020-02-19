Node = {}

function Node:new(o)
  local o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Node:setData(d)
  self.data = d
end

function Node:setNext(node)
  self.next = node
end

LinkedList = {}

function LinkedList:new()
  local o = { head=nil, tail=nil, length=0 }
  setmetatable(o, self)
  self.__index = self
  return o
end

function LinkedList:push(data)
  local newNode = Node:new{data=data}
  if (self.head == nil) then
    self.head = newNode
    self.tail = newNode
  else
    self.tail.next = newNode;
    self.tail = newNode;
  end
  self.length = self.length + 1
end

function LinkedList:print()
  local current = self.head
  while (current ~= nil) do
    print (current.data)
    current = current.next
  end
end


function LinkedList:pop()
  if (self.head == self.tail) then
    self.head = nil
    self.tail = nil
  elseif (self.head ~= nil) then
    self.head = self.head.next
  end
  self.length = self.length - 1
end

function LinkedList:peek()
  if (self.head ~= nil) then
    return self.head.data
  end
  return nil
end

function LinkedList:get(n)
  if (n < self.length and n > 0) then
    local i = 1
    local current = self.head
    while (i < n) do
      current = current.next
      i = i + 1
    end
    return current.data
  else
    print('Could not get ' .. n)
  end
end

function LinkedList:iterator()
  local node = self.head
  return function ()
        if (node ~= nil) then
           local currentData = node.data
           node = node.next
           return currentData
        end
      end
end



