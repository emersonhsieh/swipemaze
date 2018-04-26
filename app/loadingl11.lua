--restarthtp9

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata11" )
local sfx = require( "sfx" )

local restarthtp = function()
	storyboard.gotoScene("level11", "fade", 300)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	-- Resetting Global Variables for Level 11

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

	
	local image = display.newImageRect("loadinglevels.png", 320, 480)
	image.x = _W/2; image.y = _H/2
	
	group:insert(image)
		
	theTimer = timer.performWithDelay( 400, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	if sfx.levelbgplay == 0 then
		sfx.levelbgplay = 1
		audio.play( sfx.levelbackground, {loops=-1}  )
	elseif sfx.levelbgplay == 1 then

	end
	
		local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	print("Loading Level 11");
	storyboard.purgeAll() 

	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
storyboard.purgeAll() 
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