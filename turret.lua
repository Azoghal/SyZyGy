turretA = class('playerTurret')

function turretA:initialize()
	self.x = ship.x
	self.y = ship.y - 9
	self.image = love.graphics.newImage("STurret1.png")
	self.anger = 0
end

function turretA:draw()
	mx,my = love.mouse.getPosition()
	self.anger = math.atan2(self.y - my, self.x - mx)
	love.graphics.draw(self.image,self.x,self.y,self.anger+math.pi,1,1,20,25)
end

function turretA:shoot()
	mx,my = love.mouse.getPosition()
	self.anger = math.atan2(self.y - my, self.x - mx)
	bullet = {}
	bullet.x,bullet.y = self.x,self.y
	bullet.vx, bullet.vy = math.cos(self.anger)*5, math.sin(self.anger)*5

	table.insert(bullets,bullet)
end