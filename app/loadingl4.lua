--restarthtp9

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata4" )
local sfx = require( "sfx" )
audio.setVolume( 0.5, { channel=2 } )

local restarthtp = function()
	storyboard.gotoScene("level4", "fade", 300)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	-- Resetting Global Variables for Level 4
arrowdata.g1ad1 = nil

arrowdata.g11al1 = nil

arrowdata.g111ar1 = nil
arrowdata.g111ar2 = nil
arrowdata.g111ar3 = nil

arrowdata.g112al1 = nil
arrowdata.g112au1 = nil
arrowdata.g112ar1 = nil
arrowdata.g112ad1 = nil
arrowdata.g112al2 = nil
arrowdata.g112au2 = nil
arrowdata.g112ar2 = nil
arrowdata.g112ad2 = nil

arrowdata.g12al1 = nil
arrowdata.g12al2 = nil
arrowdata.g12ar1 = nil
arrowdata.g12ar2 = nil

arrowdata.g12ad1 = nil
arrowdata.g12ad2 = nil
arrowdata.g12ad3 = nil
arrowdata.g12ad4 = nil
arrowdata.g12ad5 = nil
arrowdata.g12ad6 = nil

arrowdata.g12au1 = nil
arrowdata.g12au2 = nil
arrowdata.g12au3 = nil
arrowdata.g12au4 = nil
arrowdata.g12au5 = nil
arrowdata.g12au6 = nil

arrowdata.g121ad1 = nil
arrowdata.g121ad2 = nil

arrowdata.g1ad1 = 0

arrowdata.g11al1 = 0

arrowdata.g111ar1 = 0
arrowdata.g111ar2 = 0
arrowdata.g111ar3 = 0

arrowdata.g112al1 = 0
arrowdata.g112au1 = 0
arrowdata.g112ar1 = 0
arrowdata.g112ad1 = 0
arrowdata.g112al2 = 0
arrowdata.g112au2 = 0
arrowdata.g112ar2 = 0
arrowdata.g112ad2 = 0

arrowdata.g12al1 = 0
arrowdata.g12al2 = 0
arrowdata.g12ar1 = 0
arrowdata.g12ar2 = 0

arrowdata.g12ad1 = 0
arrowdata.g12ad2 = 0
arrowdata.g12ad3 = 0
arrowdata.g12ad4 = 0
arrowdata.g12ad5 = 0
arrowdata.g12ad6 = 0

arrowdata.g12au1 = 0
arrowdata.g12au2 = 0
arrowdata.g12au3 = 0
arrowdata.g12au4 = 0
arrowdata.g12au5 = 0
arrowdata.g12au6 = 0

arrowdata.g121ad1 = 0
arrowdata.g121ad2 = 0

	arrowdata.a11 = nil
	arrowdata.a11 = 0
	
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
	print("Loading Level 4");
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