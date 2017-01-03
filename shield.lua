shield = class('shield2')

function shield:initialize()
	self.radius = 150
	self.centerX = width/2
	self.centerY = height/2
	self.secShield = 100
	
	self.angle = 225
	self.angle2 = 315
	self.pointA = {}
	self.pointB = {}
	self.AngleDif = 90
	self.rSpeed = 1
	self.deflectorIMG = love.graphics.newImage("deflector.png")
end

function shield:points()
	if self.secShield > 255 then
		self.secShield = 255
	end
	self.colour = {0,135,200,self.secShield}
	self.pointA[1] = self.centerX + (math.sin((self.angle)*math.pi/180)*self.radius)
	self.pointA[2] = self.centerY + (math.cos((self.angle)*math.pi/180)*self.radius)
	self.pointB[1] = self.centerX + (math.sin((self.angle2)*math.pi/180)*self.radius)
	self.pointB[2] = self.centerY + (math.cos((self.angle2)*math.pi/180)*self.radius)

	if love.keyboard.isDown("a") then
		self.angle = self.angle - self.rSpeed
		self.angle2 = self.angle2 - self.rSpeed
		if self.angle < 0 then
			self.angle = 360
		end 
		if self.angle2 < 0 then
			self.angle2 = 360
		end
	end
	if love.keyboard.isDown("d") then
		self.angle = self.angle + self.rSpeed
		self.angle2 = self.angle2 + self.rSpeed
		if self.angle > 360 then
			self.angle = 0
		end 
		if self.angle2 > 360 then
			self.angle2 = 0
		end 
	end
end

function shield:draw()
	love.graphics.setColor(self.colour)
	love.graphics.circle("line",self.centerX,self.centerY,self.radius)
	love.graphics.reset()
	love.graphics.draw(self.deflectorIMG,self.centerX,self.centerY,math.rad(self.angle2),1,1,0,150)

	love.graphics.reset()

end

-- stop own bullets if tried to shoot thru shiedl
