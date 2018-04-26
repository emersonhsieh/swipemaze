-- Initial3b

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require( "widget" )


local timerStash = {};
local transitionStash = {}

function cancelAllTimers()
    local k, v

    for k,v in pairs(timerStash) do
        timer.cancel( v )
        v = nil; k = nil
    end

    timerStash = nil
    timerStash = {}
end

--

function cancelAllTransitions()
    local k, v

    for k,v in pairs(transitionStash) do
        transition.cancel( v )
        v = nil; k = nil
    end

    transitionStash = nil
    transitionStash = {}
end

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	nextscene = function()
		storyboard.gotoScene("initial4", "fade", 300)
	end

	local background = display.newImageRect("htp5.png", 320, 568);
	background.x = _W/2; background.y = _H/2;

	local okbtn = widget.newButton
	{
		defaultFile = "okbtn.png",
		overFile = "okbtnover.png",
		width = 47,
		height = 47,
	}	okbtn.x = _W/2; okbtn.y = _H/2+200;
	
	okbtn:addEventListener("tap", nextscene)
	
	group:insert(background);
	group:insert(okbtn);
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	print("Initial3b");
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
storyboard.purgeAll() 
	cancelAllTransitions()
	cancelAllTimers()
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