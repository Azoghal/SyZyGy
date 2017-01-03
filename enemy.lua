enemyTypes = {}
enemyA = class('enemyShip')



function enemyA:initialize()
	self.image = love.graphics.newImage("Police Combat Shuttle Sams Recolour.png")
	self.health = 100
	self.spawnbool2 = false
	self.spawnbool = false
	self.height = 148
	self.width = 100
	self.cd = 100
	if enemies[1] then
		while self.spawnbool2 == false do
			self.yFinal = math.random(50,height-150)
			self.xFinal = math.random(50,width-100)
			for i,e in ipairs(enemies) do
				if CheckCollision(e.xFinal+50,e.yFinal+25,100,150,self.xFinal+50,self.yFinal+25,100,150) == true or CheckCollision(width2-150,height2-150,300,300,self.xFinal+50,self.yFinal+25,100,150) == true then
					self.spawnbool = false
					break
				else
					self.spawnbool = true
				end
			end
			if self.spawnbool == true then
				self.spawnbool2 = true
			end
		end
	else
		self.yFinal = math.random(50,height-150)
		self.xFinal = math.random(50,width-100)
	end
	
		
	self.CD = 10
	if self.xFinal < width2 then
		self.xSide = -1
		self.x, self.y = -100,height2 -- left
	elseif self.xFinal > width2 then 
		self.xSide = 1
		self.x, self.y = width+50,height2 -- right s
	end
	self.yStart, self.xStart = self.y, self.x
	self.angle = math.atan2(self.yFinal - self.yStart, self.xFinal - self.xStart)
	self.vx, self.vy = math.cos(self.angle), math.sin(self.angle)
	self.moveComplete = false
	self.ambAngle = 0
	table.insert(enemies,self)
end

--loads initial values into enemy

function enemyA:enemyMove()
	if self.moveComplete == false then
		if self.xSide == 1 then
			if self.x > self.xFinal then
				self.x, self.y = self.vx*10 + self.x, self.vy*10 + self.y
			else
				self.moveComplete = true
			end
		end
		if self.xSide == -1 then
			if self.x < self.xFinal then
				self.x, self.y = self.vx*10 + self.x, self.vy*10 + self.y
			else
				self.moveComplete = true
			end
		end
	end
end

--initial 'engagement' animation

function enemyA:recieveDamage()
	for i,e in ipairs(bullets) do 
		if CheckCollision(e.x,e.y,1,1,self.x,self.y,100,90) == true then
			self.health = self.health - e.damage
			table.remove(bullets,i)
		end
	end
end

function enemyA:ambientMove() 
	
	if self.y < self.yFinal-15 then
		self.ambAngle = math.random(90,270)
	elseif self.y > self.yFinal+15 then
		self.ambAngle = math.random(90,270)
	elseif self.x < self.xFinal-15 then
		self.ambAngle = math.random(0,270)
	elseif self.x > self.xFinal+15 then
		self.ambAngle = math.random(270,360)
	end

	self.vx2, self.vy2 = math.cos(self.ambAngle), math.sin(self.ambAngle)
	self.x, self.y = self.x + self.vx2/2, self.y + self.vy2/2
end

function enemyA:draw()
	love.graphics.draw(self.image,self.x,self.y,0,1,1,59,38)
end

enemyTypes[1] = enemyA
--draws enemy ship