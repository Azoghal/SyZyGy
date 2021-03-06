class = require 'middleclass'

require 'ship'
require 'turret'
require 'enemy'
require 'shield'
require 'enemyTurret'
require 'journeys'
require 'menu'

function love.load()
	love.graphics.setDefaultFilter('nearest','nearest')
	cursor = love.mouse.newCursor("Syzygy cursor.png")
	love.mouse.setCursor(cursor)
	enemies = {}
	buttons = {}
	ecd = 50
	mcd = 0
	stars = {}
	bullets = {}
	ebullets = {}
	eTurrets= {}
	width,height = love.window.getDesktopDimensions(1)
	love.window.setMode(width,height,{fullscreen=true})  --  
	centerx = width/2
	centery = height/2
	width2,height2 = width/2,height/2
	bulletInfo = {}
	function buttonsStD()
		if mcd <= 0 then
			bean = journeyList[joI]:new()
			journeyOn = true
			mcd = 25
			ship.secShield = 150
		end
	end
	function buttonsEnd()
		if mcd <= 0 then
			bean = journeyEndless:new()
			journeyOn = true
			mcd = 25
			ship.secShield = 150
		end
	end
	function buttonsJ()
		if mcd <= 0 then
			journeyOn = false
			menu.on = false
			jmenu.on = true
			mcd = 25

		end
	end
	journeyOn = false
	joI = 1
	menu = mainMenu:new()
	jmenu = jMenu:new()

	function enemyCleanup()
		for i,e in ipairs(enemies) do 
			if e.health <= 0 then
				table.remove(enemies,i)
			end
		end
	end

	function bulletCleanup() 
		for i,e in ipairs(bullets) do
			edfx = centerx - e.x
	        edfy = centery - e.y
	        edist = math.sqrt((edfx^2)+(edfy^2)) 
		end
	end
	function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	  return x1 < x2+w2 and
	         x2 < x1+w1 and
	         y1 < y2+h2 and
	         y2 < y1+h1
	end
	math.randomseed(os.clock())
	
	

	function starMake()
		for i=0,500,1 do
			star = {}
			star.x, star.y = math.random(0,width), math.random(0,height)
			star.spd = math.random(50,200,1)/100
			star.sz = star.spd
			star.color = {math.random(150,255),math.random(200,255),math.random(150,255)}
			table.insert(stars,star)
		end
	end

	function StarUpd() 
		for i,e in ipairs(stars) do
			e.y = e.y + e.spd
			if e.y > height then
				e.y, e.x = 0, math.random(width)
			end
		end
	end

	function bulletmove()
		for i,e in ipairs(bullets) do 
			e.x,e.y = e.x + e.vx,e.y+e.vy
			bdifx = centerx - e.x
	        bdify = centery - e.y
	        bcDist = math.sqrt((bdifx^2)+(bdify^2)) 
	        e.angle = ((math.atan2(e.y - centery, e.x - centerx)*180)/math.pi)
	        if e.angle < 0 then
	        	e.angle = (180+e.angle)+180
	        end
	        bulletInfo[1] = e.angle
	        if bcDist > 140 and bcDist < 153 and inAngle(e.angle) == true then
	        	table.remove(bullets,i)
	        end
		end
		for i,e in ipairs(ebullets) do 
			e.x,e.y = e.x + e.vx,e.y+e.vy
			bdifx = centerx - e.x
	        bdify = centery - e.y
	        bcDist = math.sqrt((bdifx^2)+(bdify^2)) 
	        e.angle = ((math.atan2(e.y - centery, e.x - centerx)*180)/math.pi)
	        if e.angle < 0 then
	        	e.angle = (180+e.angle)+180
	        end
	        bulletInfo[1] = e.angle
	        if bcDist > 145 and bcDist < 155 and inAngle(e.angle) == true then
	        	table.remove(ebullets,i)
	        	shield.secShield = shield.secShield + e.damage*0.75
	        elseif shield.secShield > 0 and bcDist > 145 and bcDist < 155 then
	        	table.remove(ebullets,i)
	        	shield.secShield = shield.secShield - e.damage
	        end
		end
		
	end

	function inAngle(angle)
		if angle > shield.angle and angle < shield.angle2 then
			return true
		end
		if shield.angle - shield.angle2 ~= -90 then
			if (angle > shield.angle and angle < 360) or (angle > 0 and angle < shield.angle2) then
				return true
			end
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
		love.graphics.draw(psystem, width2-35,height2+65)  -- centery = 540 centerx = 960   -35,+65
		love.graphics.draw(psystem, width2+35,height2+65)		-- +35,+65
		love.graphics.draw(psystem3,width2-40,height2+65)	-- -40,+65
		love.graphics.draw(psystem3,width2+40,height2+65)	-- +40,+65
		love.graphics.draw(psystem3,width2-30,height2+65)	-- -30,+65
		love.graphics.draw(psystem3,width2+30,height2+65)	-- +30,+65
		love.graphics.draw(psystem2,width2   ,height2+67)	-- +0,+67
		love.graphics.draw(psystem4,width2-5 ,height2+67)	-- -5,+67
		love.graphics.draw(psystem4,width2+5 ,height2+67)	-- +5,+67
	end
	starMake()
	p()
end

function love.update(dt)
	print(math.random(1,2))
	enemyCleanup()
	bulletCleanup()
	mcd = mcd-1
	ecd = ecd -1
	if journeyOn then
		bean:runJourney()
	end
	for i,e in ipairs(eTurrets) do
		if e.cd <= 0 then
			e:shoot()
		end
		e:draw()
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	StarUpd()
	if love.keyboard.isDown("r") then 
		randomPrint(math.random(0,8))
	end
	if journeyOn == true then
		shield:points()
		ship:dmg()
		if love.mouse.isDown(1) and turret.cd <= 0 then
			turret:shoot()
		end
	else
		for i,e in ipairs(buttons) do
			e:click()
		end
	end
	bulletmove()
	psystem:update(dt)
	psystem2:update(dt)
	psystem3:update(dt)
	psystem4:update(dt)
	for i,e in ipairs(enemies) do
		e:ambientMove()
		e:enemyMove()
		e:recieveDamage()
	end
end

function love.draw()
	for i,e in ipairs(stars) do
		love.graphics.setColor(e.color)
		love.graphics.circle("fill",e.x,e.y,e.sz)
		love.graphics.reset()
	end
	for i,e in ipairs(enemies) do
		e:draw()
	end
	for i,e in ipairs(ebullets) do
		love.graphics.draw(e.image,e.x,e.y,e.anger,e.scale,e.scale,3,5)
	end
	for i,e in ipairs(eTurrets) do
		e:draw()
	end
	if journeyOn == true then
		love.graphics.print(tostring(bean.hTimer))
		love.graphics.draw(ship.image,ship.x,ship.y,0,1,1,50,75)
		
		love.graphics.reset()
		for i,e in ipairs(bullets) do
			love.graphics.draw(e.image,e.x,e.y,e.anger,e.scale,e.scale,3,5)
		end
		
		
		turret:draw()
		pdraw()
		shield:draw()
		love.graphics.setColor(0,255,0)
		for i=0,math.floor(ship.health/200),1 do 
			love.graphics.rectangle("fill",40,i*20+100,3,15)
		end
		love.graphics.reset()
	else
		menu:draw()
		jmenu:draw()
	end
end