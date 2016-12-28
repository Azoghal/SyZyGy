shield = class('shield')

function shield:initalize()
	self.radius = 200
	self.colour = {0,255,255}
	self.dAngle = 0
	self.pointA = {}
	self.pointB = {}
	self.strength = 100
	self.AngleDif = 90
end