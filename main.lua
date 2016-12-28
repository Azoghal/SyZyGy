class = require 'middleclass'

require 'ship'
require 'turret'
require 'enemy'
require 'shield'

function love.load()
	love.graphics.setDefaultFilter('nearest','nearest')
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

	function bulletmove()
		for i,e in ipairs(bullets) do 
			e.x,e.y = e.x + e.vx,e.y+e.vy
		end
	end

	local img = love.graphics.newImage('Blue_Particle_effect.png')
 
	psystem = love.graphics.newParticleSystem(img, 32)
	psystem:setParticleLifetime(2, 5)
	psystem:setEmissionRate(10)
	psystem:setSizeVariation(1)
	psystem:setLinearAcceleration(-2, 5, 2, 20)
	psystem:setColors(255, 255, 255, 255, 255, 255, 255, 0) 

	local img2 = love.graphics.newImage('Orange_Particle_effect.png')
 
	psystem2 = love.graphics.newParticleSystem(img2, 32)
	psystem2:setParticleLifetime(2, 5)
	psystem2:setEmissionRate(10)
	psystem2:setSizeVariation(1)
	psystem2:setLinearAcceleration(-2, 5, 2, 30)
	psystem2:setColors(255, 255, 255, 255, 255, 255, 255, 0) 

	starMake()

end

function love.update(dt)
	StarUpd()

	shield:points()

	bulletmove()

	if love.mouse.isDown(1) and turret.cd <= 0 then
		turret:shoot()
	end

	psystem:update(dt)
	psystem2:update(dt)

end

function love.draw()
	bean = love.mouse.getPosition()
	love.graphics.print(tostring(bean))
	love.graphics.print(tostring(bean))

	for i,e in ipairs(stars) do
		love.graphics.circle("fill",e.x,e.y,2)
	end


	for i,e in ipairs(stars) do
		love.graphics.circle("fill",e.x,e.y,2)
	end

	love.graphics.draw(ship.image,ship.x,ship.y,0,1,1,50,75)

	love.graphics.draw(psystem,265 ,465)
	love.graphics.draw(psystem,335 ,465)
	love.graphics.draw(psystem2,300,470)

	for i,e in ipairs(bullets) do
		love.graphics.draw(e.image,e.x,e.y,e.anger,2,2,3,5)
	end


	shield:draw()
	turret:draw()

end

