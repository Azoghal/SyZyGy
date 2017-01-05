shipA = class('playerShip')

function shipA:initialize()
	self.health = 1000
	self.x = width/2
	self.y = height/2
	self.image = love.graphics.newImage("Combat Shuttle Mk1.png")
	self.width = 100
	self.height = 149
end



function shipA:dmg()
	for i,e in ipairs(ebullets) do
		if CheckCollision(e.x,e.y,1,1,self.x,self.y,100,150) == true then
			self.health = self.health - e.damage
			table.remove(ebullets,i)
		end
	end
end