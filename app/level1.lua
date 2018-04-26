--level1:  kinda like level 1

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require("arrowdata")
arrowdata.ispaused = 0
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

physics.setDrawMode( "normal" )

-- Predeclaring stuff because if I don't do this stuff goes wrong
local borderTop, borderBottom, borderLeft, borderRight
local restarthtp, nextscene
local check3, pauseball, ball, pausebutton
local flag, spikes, block
local pausegroup, wingroup
local pausegame, gotomenu, resumegame
local winbackground, overlaybutton, htpwinoverlay, backtomainbtn
local htpwinoverlayg, overlaybuttong
local rect1, rect2, rect3, rect4
local slide1, slide2, slide3, slide4
local tutorial1, tutorial2, tutorial3, tutorial4
local bumprect1, bumprect2, bumprect3, bumprect4
timerStash = {}
transitionStash = {}

local check3a, check3b

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
local json = require("json")
function saveTable(t, filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local file = io.open(path, "w")
    if file then
        local contents = json.encode(t)
        file:write( contents )
        io.close( file )
        return true
    else
        return false
    end
end

function loadTable(filename)
    local path = system.pathForFile( filename, system.DocumentsDirectory)
    local contents = ""
    local myTable = {}
    local file = io.open( path, "r" )
    if file then
         local contents = file:read( "*a" )
         myTable = json.decode(contents);
         io.close( file )
         return myTable 
    end
    return nil
end

ispassed = loadTable("chkftl2.json")
--==================================================================
--PhysicsEditor required stuff
local scaleFactor = 1.0
local physicsData = (require "bl1block").physicsData(scaleFactor)

--==================================================================
local downPress = false
function onBackButtonPressed(e)
    if (e.phase == "down" and e.keyName == "back") then
        downPress = true
        return true
    else
        if (e.phase == "up" and e.keyName == "back" and downPress) then
				if arrowdata.ispaused == 0 then
					pausegame();
				elseif arrowdata.ispaused == 1 then
					resumegame();
				end
            return true
        end
    end
    return false; --THE LINE YOU REALLY NEED IS THIS ONE!!!
end
 Runtime:addEventListener( "key", onBackButtonPressed )
--==================================================================

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	--======================================================================
	-- Images always goes first
	local background = display.newImageRect("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 - 112; ball.y = _H/2 - 202
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	block = display.newImageRect("l1block.png", 320, 480)
	physics.addBody( block, "static", physicsData:get("block") )
	block.x = _W/2; block.y = _H/2
	
	spikes = display.newImageRect("l1block.png", 320, 480)
	physics.addBody( spikes, "static", physicsData:get("spikes") )
	spikes.x = _W/2; spikes.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2 - 112; flag.y = _H/2 + 170
	physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1 } )
	
	local pausebutton = widget.newButton
	{
		defaultFile = "pausebuttonbottom.png",
		overFile = "pausebuttonbottomover.png",
		width = 37,
		height = 37,
	}	pausebutton.x = 18; pausebutton.y = _H-18;
	
	-- Tutorial Rectangles
	rect1 = display.newRect(_W/2+125, _H/2-233, 64, 64)
	rect1:setFillColor(0, 0, 0, 0)
	physics.addBody( rect1, "static", {isSensor = true} )

	rect2 = display.newRect(_W/2+85, _H/2+140, 64, 20)
	rect2:setFillColor(0, 0, 0, 0)
	physics.addBody( rect2, "static", {isSensor = true} )

	--========================================================
	-- Functions to make this game work
	-- There are 2 variations of the check3 function,
	-- check3b is the original one
	function check3a(event)

		boostxf = event.xStart - event.x
		boostyf = event.yStart - event.y
		
		
		if boostxf == 0 and boostyf == 0 then
			ball:setLinearVelocity(0, 0)
			print("ball paused")
		else
			boostx = boostxf/-350
			boosty = boostyf/-350
			
			ball:applyLinearImpulse( boostx, boosty, ball.x, ball.y )
		end
		
	end
	--========================================================
	function check3b(event)

		boostxf = event.xStart - event.x
		boostyf = event.yStart - event.y
		
		boostx = boostxf/-350
		boosty = boostyf/-350
		
		ball:applyLinearImpulse( boostx, boosty, ball.x, ball.y )
		
	end
	--========================================================
	function pauseball(event)
			
			ball:setLinearVelocity(0, 0)
			print("ball paused")
	end

	-- Try changing this value to check3b or check3a
	check3 = check3b
	Runtime:addEventListener("tap", pauseball);
	Runtime:addEventListener("touch", check3);
	--========================================================
	--functions
	
	-- This one shows the wingroup
	nextscene = function(event)
		wingroup.isVisible = true
		ispassed.l1 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	-- This one goes to the next level.
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl2")
	end
	
	-- This one pauses the game and shows the pausegroup
	pausegame = function(event)
		pausegroup.isVisible = true
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		arrowdata.ispaused = 1
	end
	
	-- This one unpauses the game and hides the pausegroup
	resumegame = function(event)
		pausegroup.isVisible = false
		Runtime:addEventListener("tap", pauseball);
		Runtime:addEventListener("touch", check3);
		arrowdata.ispaused = 0
	end
	
	-- This one goes back to the menu
	-- You don't say
	gotomenu = function(event)
		storyboard.gotoScene("level select", "fade", 300)
		sfx.levelbgplay = 0
		audio.pause( sfx.levelbackground )
	end
	
	restarthtp = function(event)
		-- No more a bunch of stuff because I stuffed it into exitscene
		storyboard.gotoScene("restartl1", "fade", 100)
		print("collided!")
	end
	
	--========================================================
	--	New group
	--	For the pause screen
	-- 	using raster images instead of an ugly iOS dialog box
	pausegroup = display.newGroup()
	
	local overlaybutton2 = widget.newButton
	{
		defaultFile = "resumebutton.png",
		overFile = "resumebuttonover.png",
		width = 153,
		height = 38,
	}	overlaybutton2.x = _W/2; overlaybutton2.y = _H/2
	overlaybutton2:addEventListener("tap", resumegame)
	
	htpwinoverlay = display.newImageRect("gamepauseoverlay.png", 263, 269)
	htpwinoverlay.x = _W/2; htpwinoverlay.y = _H/2
	
	local backtomainbtn = widget.newButton
	{
		defaultFile = "backtomainred.png",
		overFile = "backtomainredover.png",
		width = 153,
		height = 38,
	}	backtomainbtn.x = _W/2; backtomainbtn.y = _H/2+60
	backtomainbtn:addEventListener("tap", gotomenu)
	
	local annoyingpausebutton = display.newImageRect("pausebuttonbottom.png", 37, 37)
	annoyingpausebutton.x = 18; annoyingpausebutton.y = _H-18
	
	pausegroup:insert(htpwinoverlay)
	pausegroup:insert(overlaybutton2)
	pausegroup:insert(backtomainbtn)
	pausegroup:insert(annoyingpausebutton)

	pausegroup.isVisible = false

	pausebutton:addEventListener("tap", pausegame);
	--=============================================================================
	-- Win group
	-- For the Win screen
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
	-- For the Tutorial, 4 groups are created
	-- then the isVisible property to hide or show them
	tutorial1 = display.newGroup()
	
	slide1 = display.newImageRect("l1tutorial1.png", 320, 480)
	slide1.x = _W/2; slide1.y = _H/2
	
	tutorial1:insert(slide1)
	
	tutorial1.isVisible = true
	--=============================================================================
	tutorial2 = display.newGroup()
	
	slide2 = display.newImageRect("l1tutorial2.png", 320, 480)
	slide2.x = _W/2; slide2.y = _H/2
	
	tutorial2:insert(slide2)
	
	tutorial2.isVisible = false
	--=============================================================================
	tutorial3 = display.newGroup()
	
	slide3 = display.newImageRect("l1tutorial3.png", 320, 480)
	slide3.x = _W/2; slide3.y = _H/2
	
	tutorial3:insert(slide3)
	
	tutorial3.isVisible = false
	--=============================================================================
	tutorial4 = display.newGroup()
	
	slide4 = display.newImageRect("blank.png", 320, 480)
	slide4.x = _W/2; slide4.y = _H/2
	
	tutorial4:insert(slide4)
	
	tutorial4.isVisible = false
	--=============================================================================
	-- Bumprect functions, hide and show groups
	bumprect3 = function()
		tutorial3.isVisible = false
		--tutorial4.isVisible = true
	end

	bumprect1 = function()
		tutorial1.isVisible = false
		tutorial2.isVisible = true
		rect1:removeSelf()
		rect1 = nil
	end
	
	bumprect2 = function()
		tutorial2.isVisible = false
		tutorial3.isVisible = true
		rect2:removeSelf()
		rect2 = nil
		timerStash.thetimer = timer.performWithDelay(1000, bumprect3)
	end
	--=============================================================================
	flag.collision = nextscene
	spikes.collision = restarthtp
	rect1.collision = bumprect1
	rect2.collision = bumprect2
	
	flag:addEventListener("collision", flag)
	spikes:addEventListener("collision", spikes)
	rect1:addEventListener("collision", rect1)
	rect2:addEventListener("collision", rect2)

	group:insert(background);
	group:insert(ball);
	group:insert(block);
	group:insert(spikes);
	group:insert(flag)
	group:insert(pausebutton)
	group:insert(rect1)
	group:insert(rect2)
	group:insert(tutorial1)
	group:insert(tutorial2)
	group:insert(tutorial3)
	group:insert(tutorial4)
	group:insert(pausegroup)
	group:insert(wingroup)

	
end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level1 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
		--borderTop:removeEventListener("collision", borderTop)
		flag:removeEventListener("collision", flag)
		spikes:removeEventListener("collision", spikes)
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	cancelAllTransitions()
	cancelAllTimers()
 Runtime:removeEventListener( "key", onBackButtonPressed )
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