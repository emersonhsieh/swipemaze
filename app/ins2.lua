--Menu

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local nextscene = function(event)
	storyboard.gotoScene( "menu", "fade", 200 )
end

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local background = display.newImageRect("instructions2.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	background:addEventListener("tap", nextscene);
	
	group:insert(background);
	
end

--==================================================================
--[[
local downPress = false
local function onBackButtonPressed(e)
    local keyname = event.keyName;

    if (e.phase == "down" and e.keyName == "back") then
        downPress = true
        return true
    else
        if (e.phase == "up" and e.keyName == "back" and downPress) then
				storyboard.gotoScene("ins1", "fade", 300)
            return true
        end
    end
    return false; --THE LINE YOU REALLY NEED IS THIS ONE!!!
end

--add the key callback
Runtime:addEventListener( "key", onBackButtonPressed );
]]--
--==================================================================


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	print("Ins 2");
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	storyboard.purgeAll() 
Runtime:removeEventListener( "key", onBackButtonPressed );

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