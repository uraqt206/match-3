

function GenerateQuad(atlas, width, height)
    local quads = {}
    local temp = {}
    local numWidth = atlas:getWidth() / width
    local numHeight = atlas:getHeight() / height
    for i = 0, numWidth-1 do
        for j = 0, numHeight-1 do
            table.insert(temp, love.graphics.newQuad(i * width, j * height, width, height, atlas))
            if #temp == 6 then
                table.insert(quads, temp)
                temp = {}
            end
        end
    end
    return quads;
end