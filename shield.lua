shield = class('shield2')

function shield:initialize()
	self.radius = 150
	self.centerX = 300
	self.centerY = 400
	self.colour = {0,255,255}
	self.angle = 135
	self.angle2 = 225
	self.pointA = {}
	self.pointB = {}
	self.strength = 100
	self.AngleDif = 90
	self.rSpeed = 1
	self.deflectorIMG = love.graphics.newImage("deflector.png")
end

function shield:points()
	self.pointA[1] = self.centerX + (math.sin((self.angle)*math.pi/180)*self.radius)
	self.pointA[2] = self.centerY + (math.cos((self.angle)*math.pi/180)*self.radius)
	self.pointB[1] = self.centerX + (math.sin((self.angle2)*math.pi/180)*self.radius)
	self.pointB[2] = self.centerY + (math.cos((self.angle2)*math.pi/180)*self.radius)

	if love.keyboard.isDown("a") then
		self.angle = self.angle + self.rSpeed
		self.angle2 = self.angle2 + self.rSpeed
		if self.angle == 360 then
			self.angle = 0
		end 
		if self.angle2 == 360 then
			self.angle2 = 0
		end
	end
	if love.keyboard.isDown("d") then
		self.angle = self.angle - self.rSpeed
		self.angle2 = self.angle2 - self.rSpeed
		if self.angle == 0 then
			self.angle = 360
		end 
		if self.angle2 == 0 then
			self.angle2 = 360
		end 
	end

	
	

end

function shield:draw()
	love.graphics.setColor(self.colour)
	love.graphics.circle("line",self.centerX,self.centerY,self.radius)
	love.graphics.draw(self.deflectorIMG,self.centerX,self.centerY,-math.rad(self.angle2)+math.pi,1,1,0,150)
	
	

	love.graphics.circle("fill",self.pointA[1],self.pointA[2],5)
	love.graphics.circle("fill",self.pointB[1],self.pointB[2],5)

	love.graphics.reset()

	love.graphics.print(tostring(self.angle))
	love.graphics.print(tostring(self.angle2),0,20)

end