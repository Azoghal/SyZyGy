shipA = class('playerShip')

function shipA:initialize()
	self.health = 1000
	self.x = 300
	self.y = 400
	self.image = love.graphics.newImage("Combat Shuttle Mk1.png")
	self.width = 100
	self.height = 149
end
