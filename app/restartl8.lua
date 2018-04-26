--restartl1

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata8" )


local restarthtp = function()
	storyboard.gotoScene("level8", "fade", 100)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	arrowdata.ah201 = nil
	arrowdata.ah201 = 0

	arrowdata.ah401 = nil
	arrowdata.ah401 = 0

	arrowdata.g3al1 = nil
	arrowdata.g3al1 = 0
	arrowdata.g3al2 = nil
	arrowdata.g3al2 = 0

	theTimer = timer.performWithDelay( 300, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	
		local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	print("Level 8 restarting");
	
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