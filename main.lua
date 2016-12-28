class = require 'middleclass'

require 'ship'
require 'turret'
require 'enemy'
require 'shield'

function love.load()
	ship = shipA:new()
	stars = {}

	

	love.window.setMode( 600, 800)

	function starMake()

		for i=0,200,1 do
			star = {}
			star.x, star.y = math.random(0,600), math.random(0,800)
		end

		for i=0,200,1 do
			star = {}
			star.x, star.y = math.random(0,800), math.random(0,800)

			table.insert(stars,star)
		end

	end

	function StarUpd() 
		for i,e in ipairs(stars) do
			e.y = e.y + 1
			if e.y > 800 then
				e.y, e.x = 0, math.random(800)
			end
		end
	end

	starMake()

end

function love.update()
	StarUpd()
end

function love.draw()

	for i,e in ipairs(stars) do
		love.graphics.circle("fill",e.x,e.y,2)
	end


	for i,e in ipairs(stars) do
		love.graphics.circle("fill",e.x,e.y,2)
	end

	love.graphics.draw(ship.image,ship.x,ship.y,0,1,1,50,75)

end

