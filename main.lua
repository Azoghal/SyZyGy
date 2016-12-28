class = require 'middleclass'

require 'ship'
require 'turret'
require 'enemy'
require 'shield'

function love.load()
	ship = shipA:new()
	turret = turretA:new()
	shield = shield:new()
	stars = {}
	bullets = {}
	love.window.setMode( 600, 800)

	function starMake()
		for i=0,200,1 do
			star = {}
			star.x, star.y = math.random(0,800), math.random(0,800)
			star.spd = math.random(50,200,1)/100
			table.insert(stars,star)
		end
	end

	function StarUpd() 
		for i,e in ipairs(stars) do
			e.y = e.y + e.spd
			if e.y > 800 then
				e.y, e.x = 0, math.random(800)
			end
		end
	end

	starMake()

	function bulletmove()
		for i,e in ipairs(bullets) do 
			e.x,e.y = e.x + e.vx,e.y+e.vy
		end
	end

end

function love.update()
	StarUpd()

	shield:points()

	bulletmove()

	if love.mouse.isDown(1) then
		turret:shoot()
	end

end

function love.draw()

	for i,e in ipairs(stars) do
		love.graphics.circle("fill",e.x,e.y,2)
	end


	for i,e in ipairs(stars) do
		love.graphics.circle("fill",e.x,e.y,2)
	end

	love.graphics.draw(ship.image,ship.x,ship.y,0,1,1,50,75)

	for i,e in ipairs(bullets) do
		love.graphics.circle("fill",e.x,e.y,2)
	end

	shield:draw()
	turret:draw()

end

