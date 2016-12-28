class = require 'middleclass'

require 'ship'
require 'turret'
require 'enemy'
require 'shield'

function love.load()
	ship = shipA:new()
end

function love.update()
end

function love.draw()
	love.graphics.draw(ship.image,ship.x,ship.y,0,1,1,50,75)
end

