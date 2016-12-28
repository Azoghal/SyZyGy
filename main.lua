class = require 'middleclass'

require 'ship'
require 'turret'
require 'enemy'
require 'shield'

function love.load()
	love.window.setMode( 600, 800)
	ship = shipA:new()
end

function love.update()
end

function love.draw()
	love.graphics.draw(ship.image,ship.x,ship.y,0,1,1,50,75)
end

