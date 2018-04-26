--Menu

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local widget = require("widget")

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	nextscene = function()
		storyboard.gotoScene("initial2b", "fade", 300)
	end

	local background = display.newImageRect("initial1.png", 320, 568);
	background.x = _W/2; background.y = _H/2;

	local okbtn = widget.newButton
	{
		defaultFile = "okbtn.png",
		overFile = "okbtnover.png",
		width = 47,
		height = 47,
	}	okbtn.x = _W/2; okbtn.y = _H/2+168;
	
	okbtn:addEventListener("tap", nextscene)
	
	group:insert(background);
	group:insert(okbtn);

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	print("Initial1");
	
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