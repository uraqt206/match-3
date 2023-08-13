WINDOW_WIDTH, WINDOW_HEIGHT = 1280, 720

VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 512, 288

-- libraries
Class = require 'lib/class'
Push = require 'lib/push'
Timer = require 'lib/knife.timer'
require 'src/StateMachine'
require 'src/Util'

-- source code
require 'src/Tile'
require 'src/Board'
require 'src/states/BaseState'
require 'src/states/StartGame'
require 'src/states/PlayingState'

gTextures = {
    ['background'] = love.graphics.newImage('graphics/background.png'),
    ['match3'] = love.graphics.newImage('graphics/match3.png'),
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['big'] = love.graphics.newFont('fonts/font.ttf', 32),
}

gFrames = {
    ['tile'] = GenerateQuad(gTextures['match3'], 32, 32)
}

gColors = {
    [1] = {217/255, 87/255, 99/255, 1},
    [2] = {95/255, 205/255, 228/255, 1},
    [3] = {251/255, 242/255, 54/255, 1},
    [4] = {118/255, 66/255, 138/255, 1},
    [5] = {153/255, 229/255, 80/255, 1},
    [6] = {223/255, 113/255, 38/255, 1}
}

gStateMachine = StateMachine {
    ['start'] = function() return StartGame() end,
    ['playing'] = function() return PlayingState() end,
}