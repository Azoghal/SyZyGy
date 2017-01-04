button = class("button")

function button:initialize(x,y,width,height,text,image)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.text = text
	self.image = button
	self.onclick = self:click()
	table.insert(buttons,self)
end
function button:click()
	if journeyOn == false and love.mouse.isDown(1) then
		mx,my = love.mouse.getPosition()
		if CheckCollision(mx,my,1,1,self.x,self.y,self.width,self.height) == true then
			bean = journeyList[joI]:new()
			journeyOn = true
		end
	end
end

function button:draw()
	love.graphics.setColor(150,150,150,100)
	love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
	love.graphics.reset()
	love.graphics.print(self.text,self.x + 40,self.y + 45)
end

