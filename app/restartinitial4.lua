--restarthtp2

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local restarthtp = function()
	storyboard.gotoScene("initial4", "fade", 300)
end

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
function scene:createScene( event )
	local group = self.view
		
	timerStash.theTimer = timer.performWithDelay( 500, restarthtp)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	
		local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
storyboard.purgeAll() 

	print("Initial scene 4 restarting");
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
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