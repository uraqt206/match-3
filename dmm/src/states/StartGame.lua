StartGame = Class { __includes = BaseState }


function StartGame:init()
    self.word = {'M', 'A', 'T', 'C', 'H', '3'}
    self.color = {1, 2, 3, 4, 5, 6}

    self.currentSelect = 1
    self.board = Board(VIRTUAL_WIDTH / 2 - 32 * 4 - 3.5, VIRTUAL_HEIGHT / 2 - 32 * 4 - 3.5, 0, 0)

    Timer.every(0.2, function()
        for i = 1, 6 do
            self.color[i] = self.color[i] + 1
            if self.color[i] == 7 then
                self.color[i] = 1
            end
        end
    end)

    self.titleWidth = 20
    for i = 1, 6 do
        self.titleWidth = self.titleWidth + gFonts['big']:getWidth(self.word[i])
    end
end

function StartGame:enter(params)

end

function StartGame:update(dt)
    Timer.update(dt)

    if love.keyboard.wasPressed('w') then
        self.currentSelect = math.max(1, self.currentSelect - 1)
    end

    if love.keyboard.wasPressed('s') then
        self.currentSelect = math.min(2, self.currentSelect + 1)
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if self.currentSelect == 2 then
            love.event.quit()
        else
            gStateMachine:change('playing')
        end
    end
end

function StartGame:render()
    self.board:render()

    love.graphics.setColor(0, 0, 0, 128/255)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    self:renderRect(VIRTUAL_HEIGHT / 2 - 60)
    self:renderRect(VIRTUAL_HEIGHT / 2 + 70)
    self:renderTitle(VIRTUAL_HEIGHT / 2 - 50, true)
    self:renderTitle(VIRTUAL_HEIGHT / 2 - 50, false)

    -- render word start and exit
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(1, 1, 1, 1);

    if self.currentSelect == 1 then
        love.graphics.setColor(0, 250, 255, 1)
    end
    love.graphics.printf('START', 0, VIRTUAL_HEIGHT / 2 + 80, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1);

    if self.currentSelect == 2 then
        love.graphics.setColor(0, 250, 255, 1)
    end
    love.graphics.printf('EXIT', 0, VIRTUAL_HEIGHT / 2 + 100, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1);
end

function StartGame:renderTitle(y, shadow)
    love.graphics.setFont(gFonts['big'])

    local x = VIRTUAL_WIDTH/2 - self.titleWidth/2 
    for i = 1, 6 do
        if shadow == true then
            love.graphics.setColor(34/255, 32/255, 52/255, 1)
            love.graphics.print(self.word[i], x + 3, y)
        else
            love.graphics.setColor(gColors[self.color[i]]); 
            love.graphics.print(self.word[i], x, y)
        end
        
        x = x + gFonts['big']:getWidth(self.word[i])
        if i == 5 then
            x = x + 20
        end
    end
end

function StartGame:renderRect(y)
    love.graphics.setColor(1, 1, 1, 80 / 255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - self.titleWidth / 2 - 20, y, self.titleWidth + 40, 50, 10)
end