--htp2

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local physics = require("physics");
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

physics.setDrawMode( "normal" )

local ball

--functions


-- Forward declaring stuff because if I don't do this stuff goes wrong
local borderTop, borderBottom, borderLeft, borderRight
local pauseball; local check3
local restarthtp
local check3a, check3b

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local background = display.newImageRect("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	local indicator = display.newImageRect("fingerhover.png", 183, 209)
	indicator.x = 50; indicator.y = _H/2+100
	indicator.isVisible = false
	
	local transitiontime = 340
	
	local moveindicator, moveindicator2
	
	local setx = function()
		indicator.y = _H/2
	end
	
	moveindicator2 = function()
		indicator.y = _H/2+100;
		transition.to(indicator, {time=transitiontime, y=_H/2})
		timer.performWithDelay(transitiontime, moveindicator)
		timer.performWithDelay(transitiontime, setx)
	end
	
	moveindicator = function()
		transition.to(indicator, {time=transitiontime, y=_H/2})
		timer.performWithDelay(transitiontime, moveindicator2)
		timer.performWithDelay(transitiontime, setx)
	end
		
	local function indicatorvisible()
		indicator.isVisible = true
	end
	
	timer.performWithDelay(350, indicatorvisible)
	
	moveindicator();
	
	
	local ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2+80; ball.y = _H/2+150
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0, radius=30 } )
	
	ball:applyLinearImpulse( 0, -1, ball.x, ball.y )
	
	local flag = display.newImageRect("flag.png", 56, 61);
	flag.x = _W/2+80; flag.y = _H/2-150
	physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0, radius=30 } )

	
	restarthtp = function(event)
		-- No more a bunch of stuff because I stuffed it into exitscene
		storyboard.gotoScene("restartinitial2", "fade", 100)

		print("collided!")
	end
	
	borderTop = display.newRect( 0, -70, 638, 1 )
	borderTop:setFillColor(0, 0, 0, 0)
	physics.addBody( borderTop, "static", { density=0.9, friction=0.5, bounce=0 } )
	
	borderBottom = display.newRect( -70, _H+70, 638, 1 )
	borderBottom:setFillColor(0, 0, 0, 0)
	physics.addBody( borderBottom, "static", { density=0.9, friction=0.5, bounce=0 } )
	
	borderLeft = display.newRect( -70, -70, 1, 638 )
	borderLeft:setFillColor(0, 0, 0, 0)
	physics.addBody( borderLeft, "static", { density=0.9, friction=0.5, bounce=0 } )
	
	borderRight = display.newRect( _W+70, -70, 1, 638 )
	borderRight:setFillColor(0, 0, 0, 0)
	physics.addBody( borderRight, "static", { density=0.9, friction=0.5, bounce=0 } )
	
	--========================================================
	local nextscene = function(event)
		storyboard.gotoScene( "restartinitial2c" )
		ball:setLinearVelocity(0, 0)

	end
	
	borderTop.collision = restarthtp
	borderLeft.collision = restarthtp
	borderBottom.collision = restarthtp
	borderRight.collision = restarthtp
	flag.collision = nextscene
	
	borderTop:addEventListener("collision", borderTop)
	borderLeft:addEventListener("collision", borderLeft)
	borderBottom:addEventListener("collision", borderBottom)
	borderRight:addEventListener("collision", borderRight)
	flag:addEventListener("collision", flag)

	group:insert(background);
	group:insert(ball);
	group:insert(borderTop);
	group:insert(borderBottom);
	group:insert(borderLeft);
	group:insert(borderRight);
	group:insert(indicator)
	group:insert(flag)
	
end

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Initial2b");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
		borderTop:removeEventListener("collision", borderTop)
		borderLeft:removeEventListener("collision", borderLeft)
		borderRight:removeEventListener("collision", borderRight)
		borderBottom:removeEventListener("collision", borderBottom)
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	
storyboard.purgeAll() 
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	

	
end

--===============================================================================

scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )

scene:addEventListener( "destroyScene", scene )

return scene