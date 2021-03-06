--restarthtp9

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata8" )
local sfx = require( "sfx" )

local restarthtp = function()
	storyboard.gotoScene("level8", "fade", 300)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	-- Resetting Global Variables for Level 8
	
	arrowdata.ah201 = nil
	arrowdata.ah201 = 0

	arrowdata.ah401 = nil
	arrowdata.ah401 = 0
	
	arrowdata.g3al1 = nil
	arrowdata.g3al1 = 0
	arrowdata.g3al2 = nil
	arrowdata.g3al2 = 0

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
	print("Loading Level 8");
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