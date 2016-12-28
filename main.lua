class = require 'middleclass'

require 'ship'
require 'turret'
require 'enemy'
require 'shield'

function love.load()
	ship = shipA:new()
	stars = {}
	love.window.setMode( 600, 800)

	for i=0,200,1 do
		star = {}
		star.x, star.y = math.random(0,800), math.random(0,800)
		table.insert(stars,star)
	end

end

function love.update()
	for i,e in ipairs(stars) do
		e.y = e.y + 1
	end
end

function love.draw()

	for i,e in ipairs(stars) do
		love.graphics.circle("fill",e.x,e.y,2)
	end

	love.graphics.draw(ship.image,ship.x,ship.y,0,1,1,50,75)

end

