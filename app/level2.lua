--Level2:  kinda like level 2

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
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
local group1, group2
local portal1, portal2
local portal12, portal22
local p1g2tog1, p1g1tog2
local p2g2tog1, p2g1tog2
local delayp1g2tog1, delayp1g1tog2
local delayp2g2tog1, delayp2g1tog2
local check3a, check3b
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
local physicsData = (require "bl2block").physicsData(scaleFactor)

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	group1 = display.newGroup()
	
	local background = display.newImageRect("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 - 112; ball.y = _H/2 + 202
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	block = display.newImageRect("l2block.png", 320, 480)
	physics.addBody( block, "static", physicsData:get("block") )
	block.x = _W/2; block.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2 - 46; flag.y = _H/2 + 202
	physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1 } )
	
	local pausebutton = widget.newButton
	{
		defaultFile = "pausebuttonbottom.png",
		overFile = "pausebuttonbottomover.png",
		width = 37,
		height = 37,
	}	pausebutton.x = 18; pausebutton.y = _H-18;
	
	group1:insert(block);
	group1:insert(flag)

	group1.isVisible = true
	--========================================================
	group2 = display.newGroup()
	
	block2 = display.newImageRect("l2block2.png", 320, 480)
	--physics.addBody( block, "static", physicsData:get("block2") )
	block2.x = _W/2; block2.y = _H/2
	
	spikes = display.newImageRect("blank.png", 320, 480)
	--physics.addBody( spikes, "static", physicsData:get("spikes") )
	spikes.x = _W/2; spikes.y = _H/2
	
	group2:insert(block2)
	group2:insert(spikes)

	group2.isVisible = false
	--========================================================
	local backgroundgroup = display.newGroup()
	
	local background2 = display.newImageRect("background.png", 320, 568);
	background2.x = _W/2; background2.y = _H/2;
	
	backgroundgroup:insert(background2)
	
	backgroundgroup.isVisible = false
	--========================================================
	local portalgroup = display.newGroup()
	
	portal1 = display.newImageRect("l2portal1.png", 12, 72)
	portal1.x = _W/2+154; portal1.y = _H/2 - 199
	physics.addBody( portal1, "static", { isSensor = true } )

	portal2 = display.newImageRect("l2portal2.png", 12, 72)
	portal2.x = _W/2+154; portal2.y = _H/2 - 122
	physics.addBody( portal2, "static", { isSensor = true } )
	
	portalgroup:insert(portal1)
	portalgroup:insert(portal2)
	portalgroup.isVisible = true
	--========================================================
	local portalgroup2 = display.newGroup()
	
	portal12 = display.newImageRect("l2portal1.png", 12, 72)
	--physics.addBody( portal12, "static", { isSensor = true } )

	portal22 = display.newImageRect("l2portal2.png", 12, 72)
	--physics.addBody( portal22, "static", { isSensor = true } )
	
	portal12.x = _W/2-154; portal12.y = _H/2 - 199
	portal22.x = _W/2-154; portal22.y = _H/2 - 122
	
	portalgroup2:insert(portal12)
	portalgroup2:insert(portal22)
	
	portalgroup2.isVisible = false
	--========================================================
	local tutorial = display.newGroup()
	
	local tutorial2 = display.newImageRect("l2tutorial.png", 320, 480)
	tutorial2.x = _W/2; tutorial.y = _H/2
	
	tutorial:insert(tutorial2)
	
	tutorial.isVisible = true
	--========================================================
	-- Portal 1 from Group1 to group2
	p1g1tog2 = function()
	
		group1.isVisible = false
		physics.removeBody(flag)
		physics.removeBody(block)
		physics.removeBody(portal1)
		physics.removeBody(portal2)
		physics.addBody( block2, "static", physicsData:get("block2") )
		physics.addBody( spikes, "static", physicsData:get("spikes") )
		physics.addBody( portal22, "static", { isSensor = true } )
		physics.addBody( portal12, "static", { isSensor = true } )
		group2.isVisible = true
		portalgroup.isVisible = false
		portalgroup2.isVisible = true
		backgroundgroup.isVisible = false
		tutorial.isVisible = false
		
		print("Portal 1 collided going from g1 to g2")
		
		portal12:addEventListener("collision", delayp1g2tog1)
		portal22:addEventListener("collision", delayp2g2tog1)		
	
		ball.x = _W/2 - 110
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 2, 0, ball.x, ball.y )


	end

	-- Portal 1 from Group2 to Group1
	p1g2tog1 = function()
		
		group2.isVisible = false
		physics.removeBody(block2)
		physics.removeBody(spikes)
		physics.removeBody(portal12)
		physics.removeBody(portal22)
		physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1 } )
		physics.addBody( block, "static", physicsData:get("block") )
		physics.addBody( portal2, "static", { isSensor = true } )
		physics.addBody( portal1, "static", { isSensor = true } )
		group1.isVisible = true
		portalgroup.isVisible = true
		portalgroup2.isVisible = false
		backgroundgroup.isVisible = false
		print("Portal 12 collided going from g2 to g1")
		
		ball.x = _W/2+110
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -2, 0, ball.x, ball.y )
		
	end
	
	-- Portal 2 from Group2 to Group1
	p2g2tog1 = function()
		
		group2.isVisible = false
		physics.removeBody(block2)
		physics.removeBody(spikes)
		physics.removeBody(portal12)
		physics.removeBody(portal22)
		physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1 } )
		physics.addBody( block, "static", physicsData:get("block") )
		physics.addBody( portal2, "static", { isSensor = true } )
		physics.addBody( portal1, "static", { isSensor = true } )
		group1.isVisible = true
		portalgroup.isVisible = true
		portalgroup2.isVisible = false
		backgroundgroup.isVisible = false
		

			print("Portal 2 collided going from g2 to g1")
		
		ball.x = _W/2 + 110
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -2, 0, ball.x, ball.y )
		
	end
	
	
	-- Portal 2 from Group1 to group2
	p2g1tog2 = function()
	
	
		group1.isVisible = false
		physics.removeBody(flag)
		physics.removeBody(block)
		physics.removeBody(portal1)
		physics.removeBody(portal2)
		physics.addBody( block2, "static", physicsData:get("block2") )
		physics.addBody( spikes, "static", physicsData:get("spikes") )
		physics.addBody( portal22, "static", { isSensor = true } )
		physics.addBody( portal12, "static", { isSensor = true } )
		group2.isVisible = true
		portalgroup.isVisible = false
		portalgroup2.isVisible = true
		backgroundgroup.isVisible = false
		
		ball.x = _W/2 - 80
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 2, 0, ball.x, ball.y )
		
		print("Portal 2 collided going from g1 to g2")
	


	end
	
	delayp1g2tog1 = function()
		--backgroundgroup.isVisible = true
		timer.performWithDelay(2, p1g2tog1)
	end
	
	delayp1g1tog2 = function()
		--backgroundgroup.isVisible = true
		timer.performWithDelay(2, p1g1tog2)
	end
	
	delayp2g1tog2 = function()
		--backgroundgroup.isVisible = true
		timer.performWithDelay(2, p2g1tog2)
	end
	
	delayp2g2tog1 = function()
		--backgroundgroup.isVisible = true
		timer.performWithDelay(2, p2g2tog1)
	end

	portal1:addEventListener("collision", delayp1g1tog2)
	portal2:addEventListener("collision", delayp2g1tog2)

	

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
	nextscene = function(event)
		wingroup.isVisible = true
		ispassed.l2 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl3")
	end
	
	pausegame = function(event)
		pausegroup.isVisible = true
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
	end
	resumegame = function(event)
		pausegroup.isVisible = false
		Runtime:addEventListener("tap", pauseball);
		Runtime:addEventListener("touch", check3a);
	end
	gotomenu = function(event)
		storyboard.gotoScene("level select", "fade", 300)
		sfx.levelbgplay = 0
		audio.pause( sfx.levelbackground )
	end
	
	
	
	restarthtp = function(event)
		-- No more a bunch of stuff because I stuffed it into exitscene
		storyboard.gotoScene("restartl2", "fade", 100)
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

	group:insert(background);
	group:insert(group1)
	group:insert(group2)
	group:insert(ball)
	group:insert(wingroup)
	group:insert(pausebutton)
	group:insert(portalgroup)
	group:insert(portalgroup2)
	group:insert(tutorial)
	group:insert(backgroundgroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 2 calling");
	
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