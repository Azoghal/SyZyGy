journeyA = class("journey")

function journeyA:initialize()
	self.enemies = {1,1,1,1,1,1,1,1,1,1,1,1}
	self.times = {200,200,200,200,200,200,200,200,200,200,200,200}
	self.timeI = 1
	self.reward = 1000
	self.timer = 0
	for i, e in ipairs(self.times) do
	    if i ~= 1 then
	        self.times[i] = e + self.times[i-1]
	    end
	end

	ship = shipA:new()
	turret = turretA:new()
	shield = shield:new()
end

function journeyA:runJourney()
	self.timer = self.timer + 1
	if self.timer == self.times[self.timeI] then
		typee = self.enemies[self.timeI]
		enemy = enemyTypes[typee]:new()
		enemyt = enemyTurretA:new(enemy)
		self.timeI = self.timeI + 1
	end
end
