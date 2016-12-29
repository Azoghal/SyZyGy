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
	centerx = 300
	centery = 400

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
			bdifx = centerx - e.x
	        bdify = centery - e.y
	        bcDist = math.sqrt((bdifx^2)+(bdify^2)) 
	        bullet.angle = math.atan2(bullet.y - centery, bullet.x - centerx)
	        if bcDist > 140 and bcDist < 153 and inAngle(bullet.angle) == true then
	        	table.remove(bullets,i)
	        end
		end
		
	end

	function inAngle(angle)
		if angle > shield.angle and angle < shield.angle2 then
			return true
		end
	end

	function p()
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

		psystem3 = love.graphics.newParticleSystem(img, 32)
		psystem3:setParticleLifetime(2, 5)
		psystem3:setEmissionRate(5)
		psystem3:setSizeVariation(1)
		psystem3:setLinearAcceleration(-2, 5, 2, 17)
		psystem3:setColors(255, 255, 255, 255, 255, 255, 255, 0) 

		psystem4 = love.graphics.newParticleSystem(img2, 32)
		psystem4:setParticleLifetime(2, 4)
		psystem4:setEmissionRate(7)
		psystem4:setSizeVariation(1)
		psystem4:setLinearAcceleration(-2, 5, 2, 15)
		psystem4:setColors(255, 255, 255, 255, 255, 255, 255, 0) 

	end
	
	function pdraw()
		love.graphics.draw(psystem,265 ,465)
		love.graphics.draw(psystem,335 ,465)
		love.graphics.draw(psystem3,260 ,465)
		love.graphics.draw(psystem3,340 ,465)
		love.graphics.draw(psystem3,270 ,465)
		love.graphics.draw(psystem3,330 ,465)
		love.graphics.draw(psystem2,300,467)
		love.graphics.draw(psystem4,295,467)
		love.graphics.draw(psystem4,305,467)
	end

	starMake()
	p()

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
	psystem3:update(dt)
	psystem4:update(dt)

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
		love.graphics.draw(e.image,e.x,e.y,e.anger,2,2,3,5)
	end

	pdraw()
	shield:draw()
	turret:draw()

end

