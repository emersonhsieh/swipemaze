--restartl4

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata5" )


local restarthtp = function()
	storyboard.gotoScene("level5", "fade", 100)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view

	theTimer = timer.performWithDelay( 300, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	
	arrowdata.ah101 = 0

	arrowdata.ah102 = 0

	arrowdata.ah1201 = 0

	arrowdata.g1ad1  = 0
	arrowdata.g1ad2 = 0
	arrowdata.g11al1 = 0
	arrowdata.g11al2 = 0

	arrowdata.g121al1 = 0

	arrowdata.g121ar1 = 0
	
	arrowdata.g11al1 = 0

	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	print("Level 5 restarting");
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

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