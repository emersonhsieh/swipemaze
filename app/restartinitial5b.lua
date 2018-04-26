--restarthtp2c

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local restarthtp = function()
	storyboard.gotoScene("initial5b", "fade", 100)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
		
	theTimer = timer.performWithDelay( 300, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	
		local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
storyboard.purgeAll() 

	print("Initial scene 5b restarting");
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	
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