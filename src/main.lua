function love.load()
  love.window.setTitle("Hello World!")

  CatImg = love.graphics.newImage("assets/cat.png")
  Time = 0
end

function love.update()
  Time = Time + love.timer.getDelta()
end

function love.draw()
  local size = math.sin(Time) * 0.5 + 1.5
  love.graphics.scale(size, size)
  love.graphics.draw(CatImg, 0, 0)
end
