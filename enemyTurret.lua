enemyTurretA = class('enemyTurret')

function enemyTurretA:initialize(parent)
	self.x = y
	self.y = x
	self.image = love.graphics.newImage("Laser Turret.png")
	self.image2 = love.graphics.newImage("Laser Turret Base.png")
	self.anger = 0
	self.cd = parent.cd
	self.parent = parent
	table.insert(eTurrets,self)
end

function enemyTurretA:draw()
	if self.parent.health <= 0 then
		for i,e in ipairs(eTurrets) do
			if e == self then
				table.remove(eTurrets,i)
			end
		end
	end
	self.x,self.y = self.parent.x+70,self.parent.y+67
	if ship then
		mx, my = ship.x,ship.y
		self.anger = math.atan2(self.y - my, self.x - mx)
	end
	love.graphics.draw(self.image2,self.x,self.y,0,0.5,0.5,25,28)
	love.graphics.draw(self.image,self.x+1,self.y-2,self.anger+1.5*math.pi,0.5,0.5,20,32)
	self.cd = self.cd -1
end

function enemyTurretA:shoot()
	mx,my = ship.x,ship.y
	self.anger = math.atan2(self.y - my, self.x - mx)+math.pi
	bullet = {}
	bullet.image = love.graphics.newImage("laser1.png")
	bullet.damage = 50
	bullet.anger = self.anger+(0.5*math.pi)
	bullet.angle = 0
	bullet.x,bullet.y = self.x,self.y
	bullet.vx, bullet.vy = math.cos(self.anger)*10, math.sin(self.anger)*10
	self.cd = 200

	table.insert(ebullets,bullet)
end

