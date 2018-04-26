--restartl1

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata10" )


local restarthtp = function()
	storyboard.gotoScene("level10", "fade", 100)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view

	theTimer = timer.performWithDelay( 300, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
		arrowdata.ah1102= 0
		arrowdata.ah1101= 0
		arrowdata.ah101= 0
		arrowdata.ah11101= 0
		arrowdata.ahtr= 0
		arrowdata.g111ar1 = 0
		arrowdata.g111ar2 = 0
		arrowdata.g12ar1 = 0
		arrowdata.g12ar2 = 0
		arrowdata.g12al1 = 0
		arrowdata.g12al2 = 0
		arrowdata.continue = 0


	
		local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	print("Level 10 restarting");
	
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