--restartl1

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata11" )


local restarthtp = function()
	storyboard.gotoScene("level11", "fade", 100)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	arrowdata.g11au1 = 0
	arrowdata.g111au1 = 0
	arrowdata.g111au2 = 0
	arrowdata.g111al1 = 0
	arrowdata.g111ad1 = 0
	
	arrowdata.g121al1 = 0
	arrowdata.g121al2 = 0
	arrowdata.g121al3 = 0
	
	arrowdata.g1211ar1 = 0
	arrowdata.g1211ar2 = 0
	arrowdata.g1211ar3 = 0
	arrowdata.g1212ar1 = 0
	arrowdata.g1212ar2 = 0
	arrowdata.g1212ar3 = 0
	
	arrowdata.ah12101 = 0
	arrowdata.ah121201 = 0

	theTimer = timer.performWithDelay( 300, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	print("Level 11 restarting");
	
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