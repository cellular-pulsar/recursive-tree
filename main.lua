local width, height = love.graphics.getDimensions()

local angle = math.pi / 4
local adjust = 1
local size = 200

function branch(len)
	love.graphics.line(0, 0, 0, -len)
	love.graphics.translate(0, -len)
	if len > 2 then
		love.graphics.push()
		love.graphics.rotate(angle * adjust)
		branch(len * 0.67)
		love.graphics.pop()
		love.graphics.push()
		love.graphics.rotate(-angle * adjust)
		branch(len * 0.67)
		love.graphics.pop()
	end
end

function love.update()
	if love.keyboard.isDown("i") then
		adjust = adjust - .01
	end
	if love.keyboard.isDown("o") then
		adjust = adjust + .01
	end
	if love.keyboard.isDown("k") then
		size = size - 1
	end
	if love.keyboard.isDown("l") then
		size = size + 1
	end
end

function love.draw()
	love.graphics.setColor(1,1,1)
	love.graphics.print("Size: "..size.."\nAngle: "..angle * adjust, 1, 1)
	love.graphics.translate(width/2, height)
	branch(size)
	count = 0
end