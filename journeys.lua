journeyList = {}

journeyEndless = class("journey")

function journeyEndless:initialize()
	self.enemies = {1}
	self.times = {200}
	self.score = 0
	self.timer = 0
	self.hTimer =0
	journeyOn = true
	ship = shipA:new()
	turret = turretA:new()
	shield = shield:new()
end

function journeyEndless:runJourney()
	self.timer = self.timer + 1
	self.hTimer = self.hTimer + 1
	local enI = 1 -- change to mathrandom when more than one enemy
	if self.timer == self.times[enI] then
		local enemy = enemyTypes[enI]:new()
		local eneym = enemyTurretA:new(enemy)
		self.timer = 0
	end
end
journeyA = class("journey")


function journeyA:initialize()
	self.enemies = {1}
	self.times = {200}
	self.length = 3000
	self.timeI = 1

	self.reward = 1000
	self.timer = 0
	self.hTimer = 0
	--for i, e in ipairs(self.times) do
	    --if i ~= 1 then
	        --self.times[i] = e + self.times[i-1]
	    --end
	--end
	ship = shipA:new()
	turret = turretA:new()
	shield = shield:new()
end

function journeyA:runJourney()
	self.timer = self.timer + 1
	self.hTimer = self.hTimer + 1
	if self.hTimer >= self.length and enemies[1] == nil then
		-- return to journey menu
		journeyOn = false
		joI = joI + 1
	else
		local enI = 1 -- change to mathrandom when more than one enemy
		if self.timer == self.times[enI] and self.hTimer < self.length then
			local enemy = enemyTypes[enI]:new()
			local eneym = enemyTurretA:new(enemy)
			self.timer = 0
		end
	end
end

journeyList[1] = journeyA

