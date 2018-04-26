--restarthtp9

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata" )
local sfx = require( "sfx" )
audio.setVolume( 0.5, { channel=2 } )

local restarthtp = function()
	storyboard.gotoScene("level3", "fade", 300)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	-- Resetting Global Variables for Level 3
	arrowdata.ad1 = nil
	arrowdata.ar1 = nil
	arrowdata.au1 = nil
	arrowdata.ar2 = nil
	arrowdata.ar3 = nil
	arrowdata.ar4 = nil
	arrowdata.ar5 = nil
	
	arrowdata.ad1 = 0
	arrowdata.ar1 = 0
	arrowdata.au1 = 0
	arrowdata.ar2 = 0
	arrowdata.ar3 = 0
	arrowdata.ar4 = 0
	arrowdata.ar5 = 0
	
	local image = display.newImageRect("loadinglevels.png", 320, 480)
	image.x = _W/2; image.y = _H/2
	
	group:insert(image)
		
	theTimer = timer.performWithDelay( 2000, restarthtp)
	
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
	print("Loading Level 3");
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