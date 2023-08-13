StartGame = Class { __includes = BaseState }

local word = 'MATCH3'
local color = {1, 2, 3, 4, 5, 6}

function StartGame:init()
    Timer.every(0.25, function()
        for i = 1, 6 do
            color[i] = color[i] + 1
            if color[i] == 7 then
                color[i] = 1
            end
        end
    end)
end

function StartGame:enter(params)

end

function StartGame:update(dt)
    Timer.update(dt)
end

function StartGame:render()
    love.graphics.setFont(gFonts['medium'])

    local x = VIRTUAL_WIDTH/2 - 192/2
    for i = 1, 6 do
        love.graphics.setColor(gColors[color[i]])
        love.graphics.print(word:sub(i, i), x, VIRTUAL_HEIGHT/2-30)
        x = x + 32
    end

    love.graphics.setColor(1, 1, 1, 48/255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH/2 - 250/2, VIRTUAL_HEIGHT/2 - 40, 250, 50, 30)
end