
require 'src/Dependencies'
test = 10

function love.load()
    love.window.setTitle('match-3')

    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true,
    })
    
    gStateMachine:change('start')
end

function love.resize(x, y)
    Push:resize(x, y)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

LOOPING_POINT = 520
SCROLL_SPEED = 130
Current_Point = 0

function love.update(dt)
    Current_Point = (Current_Point + SCROLL_SPEED * dt) % LOOPING_POINT

    gStateMachine:update(dt)

    Timer.update(dt)
end

function love.draw()
    Push:start()

    love.graphics.setColor(1, 1, 1, 150/255)
    love.graphics.draw(gTextures['background'], -Current_Point, 0)
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['small'])
    love.graphics.print(tostring(love.timer.getFPS()), 5, 5)

    gStateMachine:render()

    Push:finish()
end