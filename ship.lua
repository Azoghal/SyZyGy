shipA = class('playerShip')

function shipA:initialize()
	self.health = 1000
	self.x = width/2
	self.y = height/2
	self.image = love.graphics.newImage("Combat Shuttle Mk1.png")
	self.width = 100
	self.height = 149
end


