Tile = Class {}

function Tile:init(t, c, x, y)
  self.type, self.color, self.x, self.y = t, c, x, y
end

function Tile:render()
  love.graphics.draw(gTextures['match3'], gFrames['tile'][self.type][self.color], self.x, self.y)
end