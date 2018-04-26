--restarthtp9

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local arrowdata = require( "arrowdata6" )
local sfx = require( "sfx" )

local restarthtp = function()
	storyboard.gotoScene("level6", "fade", 300)
end

-- CODING BEGINS
function scene:createScene( event )
	local group = self.view
	
	-- Resetting Global Variables for Level 6
arrowdata.ah1301 = nil
arrowdata.ah1401 = nil

arrowdata.ah1301 = 0
arrowdata.ah1401 = 0

arrowdata.g1al1 = nil
arrowdata.g1ar1 = nil
arrowdata.g1au1 = nil
arrowdata.g1ad1 = nil

arrowdata.g14al1 = nil
arrowdata.g14al2 = nil
arrowdata.g14al3 = nil
arrowdata.g14ar1 = nil
arrowdata.g14ar2 = nil
arrowdata.g14ar3 = nil

arrowdata.g1al1 = 0
arrowdata.g1ar1 = 0
arrowdata.g1au1 = 0
arrowdata.g1ad1 = 0

arrowdata.g14al1 = 0
arrowdata.g14al2 = 0
arrowdata.g14al3 = 0
arrowdata.g14ar1 = 0
arrowdata.g14ar2 = 0
arrowdata.g14ar3 = 0

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
	
	arrowdata.g11al1 = 0
	
		local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	print("Loading Level 6");
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