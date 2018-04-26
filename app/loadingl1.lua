--restarthtp9

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local sfx = require( "sfx" )
audio.setVolume( 0.5, { channel=2 } )

local restarthtp = function()
	storyboard.gotoScene("level1", "fade", 300)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	local image = display.newImageRect("loadingl2.png", 320, 480)
	image.x = _W/2; image.y = _H/2
	
	local image2 = display.newImageRect("loadingl3.png", 320, 480)
	image2.x = _W/2; image2.y = _H/2
	image2.isVisible = false
	
	local function image2visible()
		image.isVisible = false
		image2.isVisible = true
	end
	
	theTimer = timer.performWithDelay( 1500, image2visible )
	
	group:insert(image)
	group:insert(image2)
		
	theTimer = timer.performWithDelay( 3000, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	if sfx.levelbgplay == 0 then
		sfx.levelbgplay = 1
		audio.play( sfx.levelbackground, {loops=-1}  )
	elseif sfx.levelbgplay == 1 then

	end

	print("Loading Level 1");
	
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