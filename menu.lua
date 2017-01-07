

mainMenu = class("menu")

function mainMenu:initialize()
	self.on = true
	self.title = {}
	self.buttons = {}
	self.title.Img = love.graphics.newImage("Title.png")
	self.title.x = width2-264
	self.title.y = 100
	butto = button:new(width2-100,300,200,100,"Journeys","button.png",buttonsJ)
	butto2 = button:new(width2-100,450,200,100,"Endless","button.png",buttonsEnd)
	table.insert(self.buttons,butto)
	table.insert(self.buttons,butto2)
end

function mainMenu:draw()
	if self.on == true then
		love.graphics.draw(self.title.Img,self.title.x,self.title.y,0,2,2)
		for i,e in ipairs(self.buttons) do
			love.graphics.draw(e.image,e.x,e.y)
			love.graphics.print(e.text,e.x + 40,e.y + 45)
			e:click()
		end
	end
end

jMenu  = class("menu")

function jMenu:initialize()
	self.on = false
	self.title = {}
	self.buttons = {}
	self.title.Img = love.graphics.newImage("Title.png")
	self.title.x = width2-264
	self.title.y = 100
	butto = button:new(width2-100,300,200,100,"Sodom to Gomorrah","button.png",buttonsStD)
	table.insert(self.buttons,butto)
end

function jMenu:draw()
	if self.on == true then
		love.graphics.draw(self.title.Img,self.title.x,self.title.y,0,2,2)
		for i,e in ipairs(self.buttons) do
			love.graphics.draw(e.image,e.x,e.y)
			love.graphics.print(e.text,e.x + 40,e.y + 45)
			e:click()
		end
	end
end


button = class("button")

function button:initialize(x,y,width,height,text,image,onclick)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.text = text
	self.image = love.graphics.newImage("button.png")
	self.onclick = onclick
end
function button:click()
	if journeyOn == false and love.mouse.isDown(1) then
		mx,my = love.mouse.getPosition()
		if CheckCollision(mx,my,1,1,self.x,self.y,self.width,self.height) == true then
			self.onclick()
		end
	end
end


