--htp2

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require( "widget" )
local physics = require("physics");
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

physics.setDrawMode( "normal" )

-- Forward declaring stuff because if I don't do this stuff goes wrong
local flag
local ball
local pauseball
local restarthtp
local block, spikes

--PhysicsEditor required stuff
local scaleFactor = 1.0
local physicsData = (require "binitial5block").physicsData(scaleFactor)
--==================================================================
timerStash = {}
transitionStash = {}

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
--==================================================================

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2+115; ball.y = _H/2+200
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	ball:applyLinearImpulse( 0, -1, ball.x, ball.y )
	
	block = display.newImageRect("initial5block.png", 320, 480)
	physics.addBody( block, "static", physicsData:get("initial5block") )
	block.x = _W/2; block.y = _H/2
	
	spikes = display.newImageRect("blank.png", 320, 480)
	physics.addBody( spikes, "static", physicsData:get("initial5blockspikes") )
	spikes.x = _W/2; spikes.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2-120; flag.y = _H/2 -115
	physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1} )
	--[[
	local initialtip = display.newImageRect("initial5tip.png", 320, 480)
	initialtip.x = _W/2; initialtip.y = _H/2]]--
	--========================================================
	local indicator = display.newImageRect("fingerhover.png", 183, 209)
	indicator.x = 50; indicator.y = _H/2+200
	indicator.isVisible = false
	
	local transitiontime = 340
	
	local moveindicator, moveindicator2
	
	local setx = function()
		indicator.y = _H/2+100
	end
	
	moveindicator2 = function()
		indicator.y = _H/2+200;
		transition.to(indicator, {time=transitiontime, y=_H/2+100})
		timer.performWithDelay(transitiontime, moveindicator)
		timer.performWithDelay(transitiontime, setx)
	end
	
	moveindicator = function()
		transition.to(indicator, {time=transitiontime, y=_H/2+100})
		timer.performWithDelay(transitiontime, moveindicator2)
		timer.performWithDelay(transitiontime, setx)
	end
		
	local function indicatorvisible()
		indicator.isVisible = true
	end
	
	timer.performWithDelay(350, indicatorvisible)
	
	moveindicator();
	--========================================================
	local indicator2 = display.newImageRect("fingertap.png", 183, 209)
	indicator2.x = 50; indicator2.y = _H/2+100
	indicator2.isVisible = false
	
	local indicator2a = display.newImageRect("fingerhover.png", 183, 209)
	indicator2a.x = 50; indicator2a.y = _H/2+100
	indicator2a.isVisible = false
	--========================================================
	local indicator3 = display.newImageRect("fingerhover.png", 183, 209)
	indicator3.x = 100; indicator3.y = _H/2+100
	indicator3.isVisible = false
	
	local transitiontime = 340
	
	local moveindicator3, moveindicator32
	
	local setx3 = function()
		indicator3.x = 0
	end
	
	moveindicator32 = function()
		indicator3.x = 100;
		transition.to(indicator3, {time=transitiontime, x=0})
		timer.performWithDelay(transitiontime, moveindicator3)
		timer.performWithDelay(transitiontime, setx3)
	end
	
	moveindicator3 = function()
		transition.to(indicator3, {time=transitiontime, x=0})
		timer.performWithDelay(transitiontime, moveindicator32)
		timer.performWithDelay(transitiontime, setx3)
	end
	
	moveindicator3();
	--========================================================
	local rect1 = display.newRect(_W-67, _H/2-205, 64, 64)
	rect1:setFillColor(0, 0, 0, 0)
	physics.addBody( rect1, "static", {isSensor = true} )
	
	local bumprect1 = function()
		indicator.isVisible = false
		indicator2.isVisible = true
		ball:setLinearVelocity(0, 0)
		rect1:removeSelf()
		rect1 = nil
		print("bumprect")
		
		local function indicatorvisible2a()
			indicator2.isVisible = false
			indicator2a.isVisible = true
		end
		
		timer.performWithDelay(150, indicatorvisible2a)
		
		local function indicatorvisible3()
			indicator2a.isVisible = false
			indicator3.isVisible = true
			ball:applyLinearImpulse( -1, 0, ball.x, ball.y )
		end
		
		timer.performWithDelay(750, indicatorvisible3)
	
	end
	
	rect1:addEventListener("collision", bumprect1)
	
	--========================================================
	
	--functions
	nextscene = function(event)
		local bla = function()
			storyboard.gotoScene("restartinitial5", "fade", 100)
		end
		timerStash.thetimer = timer.performWithDelay(1, bla)
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl1")
	end
	
	gotomenu = function(event)
		storyboard.gotoScene("level select", "fade", 300)
	end
	
	restarthtp = function(event)
		-- No more a bunch of stuff because I stuffed it into exitscene
		storyboard.gotoScene("restartinitial5", "fade", 100)
		print("collided!")
	end
	
	--=============================================================================
	wingroup = display.newGroup()
	
	htpwinoverlayg = display.newImageRect("htpwinoverlay.png", 263, 215)
	htpwinoverlayg.x = _W/2; htpwinoverlayg.y = _H/2
	
	local overlaybuttong = widget.newButton
	{
		defaultFile = "htpwinoverlaygreen.png",
		overFile = "htpwinoverlaygreenover.png",
		width = 153,
		height = 38,
	}	overlaybuttong.x = _W/2; overlaybuttong.y = _H/2+40
	overlaybuttong:addEventListener("tap", wingameatlast)
	
	wingroup.isVisible = false
	
	wingroup:insert(htpwinoverlayg)
	wingroup:insert(overlaybuttong)
	--=============================================================================

	flag.collision = nextscene
	spikes.collision = restarthtp
	flag:addEventListener("collision", flag)
	spikes:addEventListener("collision", spikes)
	
	group:insert(ball);
	group:insert(flag);
	group:insert(block)
	group:insert(spikes)
	group:insert(indicator)
	group:insert(indicator2)
	group:insert(indicator3)
	group:insert(indicator2a)
	group:insert(wingroup)
	--group:insert(initialtip)
	group:insert(rect1)

	
end

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Initial5b");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
		flag:removeEventListener("collision", flag)
		spikes:removeEventListener("collision", spikes)
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