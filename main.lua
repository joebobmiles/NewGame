GRID_CELL_DIMENSION = 16

function love.load()
    gridTransform = { 0, 0 }

    gridCanvas = love.graphics.newCanvas()

    gridCanvas:renderTo(function ()
        local width, height = love.graphics.getDimensions()

        love.graphics.setColor(255, 255, 255, 1)
        love.graphics.setLineWidth(1)

        for x = gridTransform[1] % 16, width, GRID_CELL_DIMENSION
        do
            love.graphics.line(x, 0, x, height)
        end

        for y = gridTransform[2] % 16, height, GRID_CELL_DIMENSION
        do
            love.graphics.line(0, y, width, y)
        end
    end)
end

function love.update(t)
    local x, y = love.mouse.getPosition()

    if x ~= gridTransform[1] or y ~= gridTransform[2] then
        gridTransform = { x, y }

        gridCanvas:renderTo(function ()
            love.graphics.clear()

            local width, height = love.graphics.getDimensions()

            love.graphics.setColor(255, 255, 255, 1)
            love.graphics.setLineWidth(1)

            for x = gridTransform[1] % 16, width, GRID_CELL_DIMENSION
            do
                love.graphics.line(x, 0, x, height)
            end

            for y = gridTransform[2] % 16, height, GRID_CELL_DIMENSION
            do
                love.graphics.line(0, y, width, y)
            end
        end)
    end
end

function love.draw()
    love.graphics.draw(gridCanvas)
end