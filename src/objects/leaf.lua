Leaf = {}

function Leaf:new() {
  local o = o or {
    size=math.random(5, 20),
    
  }
  setmetatable(o, self)
  self.__index = self
  return o
}