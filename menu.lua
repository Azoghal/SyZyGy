

mainMenu = class("menu")

function mainMenu:initialize()
	self.on = true
	self.title = {}
	self.title.Img = love.graphics.newImage("Title.png")
	self.title.x = width2-264
	self.title.y = 100
	butto = button:new(width2-100,300,200,100,"Sodom to Gomorrah","button.png")
	butto2 = buttonEndless:new(width2-100,500,200,100,"Endless","button.png")
end

function mainMenu:draw()
	love.graphics.draw(self.title.Img,self.title.x,self.title.y,0,2,2)
end


button = class("button")

function button:initialize(x,y,width,height,text,image)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.text = text
	self.image = love.graphics.newImage("button.png")
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
	love.graphics.draw(self.image,self.x,self.y)
	love.graphics.reset()
	love.graphics.print(self.text,self.x + 40,self.y + 45)
end

buttonEndless = class("button")

function buttonEndless:initialize(x,y,width,height,text,image)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.text = text
	self.image = love.graphics.newImage("button.png")
	self.onclick = self:click()
	table.insert(buttons,self)
end
function buttonEndless:click()
	if journeyOn == false and love.mouse.isDown(1) then
		mx,my = love.mouse.getPosition()
		if CheckCollision(mx,my,1,1,self.x,self.y,self.width,self.height) == true then
			bean = journeyEndless:new()
			journeyOn = true
		end
	end
end

function buttonEndless:draw()
	love.graphics.draw(self.image,self.x,self.y)
	love.graphics.reset()
	love.graphics.print(self.text,self.x + 40,self.y + 45)
end
