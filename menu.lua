mainMenu = class("menu")

function mainMenu:initialize()
	self.title = {}
	self.title.Img = love.graphics.newImage("Title.png")
	self.title.x = width2-264
	self.title.y = 100
	self.button1 = {}
	self.button1.x = width2-100
	self.button1.y = 300
	self.button1.width = 200
	self.button1.height = 100
	self.button1.text = "Sodom to Gomorrah"
end

function mainMenu:button1click()
	if journeyOn == false and love.mouse.isDown(1) then
		mx,my = love.mouse.getPosition()
		if CheckCollision(mx,my,1,1,self.button1.x,self.button1.y,self.button1.width,self.button1.height) == true then
			bean = journeyList[joI]:new()
			journeyOn = true
		end
	end
end

function mainMenu:draw()
	love.graphics.draw(self.title.Img,self.title.x,self.title.y,0,2,2)
	love.graphics.setColor(150,150,150,100)
	love.graphics.rectangle("fill",self.button1.x,self.button1.y,self.button1.width,self.button1.height)
	love.graphics.reset()
	love.graphics.print(self.button1.text,self.button1.x + 40,self.button1.y + 45)
end