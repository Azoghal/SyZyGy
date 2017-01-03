journeyA = class("journey")

function journeyA:initialize()
	self.enemies = {1,1,1,1,1,1,1,1,1,1,1,1}
	self.times = {150,150,150,150,150,150,150,150,100,100,100,100,}
	self.reward = 1000
	ship = shipA:new()
	turret = turretA:new()
	shield = shield:new()
end

