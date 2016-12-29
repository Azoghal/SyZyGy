turretA = class('playerTurret')

function turretA:initialize()
	self.x = ship.x
	self.y = ship.y - 9
	self.image = love.graphics.newImage("STurret1.png")
	self.anger = 0
	self.cd = 0
end

function turretA:draw()
	mx,my = love.mouse.getPosition()
	self.anger = math.atan2(self.y - my, self.x - mx)
	love.graphics.draw(self.image,self.x,self.y,self.anger+math.pi,1,1,20,25)
	self.cd = self.cd -1
end

function turretA:shoot()
	mx,my = love.mouse.getPosition()
	self.anger = math.atan2(self.y - my, self.x - mx)+math.pi
	bullet = {}
	bullet.image = love.graphics.newImage("laser1.png")
	bullet.anger = self.anger+(0.5*math.pi)
	bullet.angle = 0
	bullet.x,bullet.y = self.x,self.y
	bullet.vx, bullet.vy = math.cos(self.anger)*10, math.sin(self.anger)*10
	self.cd = 100

	table.insert(bullets,bullet)
end