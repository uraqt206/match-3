Board = Class {}

function Board:init(offx, offy, currentX, currentY)
  self.board = {}
  for i = 0, 7 do
    local temp = {}
    for j = 0, 7 do
      table.insert(temp, Tile(math.random(18), math.random(6), j * 32 + offx + j, i * 32 + offy + i))
    end
    table.insert(self.board, temp)
  end
  self.currentX, self.currentY = currentX, currentY
end

function Board:update(dt)
  if love.keyboard.wasPressed('a') then
    self.currentY = math.max(1, self.currentY - 1)
  end

  if love.keyboard.wasPressed('s') then
    self.currentX = math.min(8, self.currentX + 1)
  end

  if love.keyboard.wasPressed('d') then
    self.currentY = math.min(8, self.currentY + 1)
  end

  if love.keyboard.wasPressed('w') then
    self.currentX = math.max(1, self.currentX - 1)
  end
end

function Board:render()
  for i = 1, 8 do
    for j = 1, 8 do
      if i == self.currentX and j == self.currentY then
        love.graphics.setLineWidth(3)
        love.graphics.setColor(1, 0, 1/2, 1)
        love.graphics.rectangle('line', self.board[i][j].x, self.board[i][j].y, 32, 32)
        love.graphics.setColor(1, 1, 1, 1)
        self.board[i][j]:render()
      else
        self.board[i][j]:render()
      end
    end
  end
end