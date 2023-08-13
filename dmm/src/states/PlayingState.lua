PlayingState = Class { __includes = BaseState }

function PlayingState:init()
  self.board = Board(VIRTUAL_WIDTH / 2 - 30, VIRTUAL_HEIGHT / 2 - 32 * 4 - 3.5, 1, 1)
end

function PlayingState:enter(params)

end

function PlayingState:update(dt)
  self.board:update(dt)
end

function PlayingState:render()
  self.board:render()
end