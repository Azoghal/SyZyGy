shipA = class('playerShip')

function shipA:initialize()
	self.health = 1000
	self.x = 300
	self.y = 200
	self.image = love.graphics.newImage("shipA")

end
