turretTypes = {}
turretA = class('playerTurret')

function turretA:initialize()
	self.x = ship.x
	self.y = ship.y - 9
	self.image = love.graphics.newImage("Laser Turret.png")
	self.image2 = love.graphics.newImage("Laser Turret Base.png")
	self.anger = 0
	self.cd = 0
end

function turretA:draw()
	mx,my = love.mouse.getPosition()
	self.anger = math.atan2(self.y - my, self.x - mx)
	love.graphics.draw(self.image2,self.x,self.y,0,1,1,25,28)
	love.graphics.draw(self.image,self.x+1,self.y-2,self.anger+1.5*math.pi,1,1,20,32)
	self.cd = self.cd -1
end

function turretA:shoot()
	mx,my = love.mouse.getPosition()
	self.anger = math.atan2(self.y - my, self.x - mx)+math.pi
	bullet = {}
	bullet.image = love.graphics.newImage("laser1.png")
	bullet.damage = 50
	bullet.scale = 2
	bullet.anger = self.anger+(0.5*math.pi)
	bullet.angle = 0
	bullet.x,bullet.y = self.x,self.y
	bullet.vx, bullet.vy = math.cos(self.anger)*10, math.sin(self.anger)*10
	self.cd = 100

	table.insert(bullets,bullet)
end

turretTypes[1] = turretA

turretB = class('playerTurret',turretA)

function turretB:initialize()
	self.x = ship.x
	self.y = ship.y - 9
	self.image = love.graphics.newImage("Neutrino Turret.png")
	self.image2 = love.graphics.newImage("Neutrino Turret Base.png")
	self.anger = 0
	self.cd = 0
end

function turretA:shoot()
	mx,my = love.mouse.getPosition()
	self.anger = math.atan2(self.y - my, self.x - mx)+math.pi+(math.random(-0.5,0.5,0.1)/10)
	bullet = {}
	bullet.image = love.graphics.newImage("laser2.png")
	bullet.damage = 10
	bullet.scale = 1
	bullet.anger = self.anger+(0.5*math.pi)
	bullet.angle = 0
	bullet.x,bullet.y = self.x,self.y
	bullet.vx, bullet.vy = math.cos(self.anger)*10, math.sin(self.anger)*10
	self.cd = 10

	table.insert(bullets,bullet)
end