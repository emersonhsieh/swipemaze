--Level3:  kinda like level 2

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata" )
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

physics.setDrawMode( "normal" )

-- Predeclaring stuff because if I don't do this stuff goes wrong
local borderTop, borderBottom, borderLeft, borderRight
local restarthtp, nextscene
local check3, pauseball, ball, pausebutton
local flag, spikes, block
local block2, spikes2
local pausegroup, wingroup
local pausegame, gotomenu, resumegame
local winbackground, overlaybutton, htpwinoverlay, backtomainbtn
local htpwinoverlayg, overlaybuttong
local group1, group2
local portal1
local portal12
local p1g2tog1, p1g1tog2
local delayp1g2tog1, delayp1g1tog2
local arrowDown1, arrowRight1, arrowUp1, arrowRight2, arrowRight3, arrowRight4, arrowRight5
local check3a, check3b

playarrowsound = function()
    audio.play( sfx.arrowpop )
end

	arrowdata.ar4 = nil
	arrowdata.ad1 = nil
	arrowdata.ar1 = nil
	arrowdata.au1 = nil
	arrowdata.ar2 = nil
	arrowdata.ar3 = nil
	arrowdata.ar5 = nil
	
	arrowdata.ad1 = 0
	arrowdata.ar1 = 0
	arrowdata.au1 = 0
	arrowdata.ar2 = 0
	arrowdata.ar3 = 0
	arrowdata.ar4 = 0
	arrowdata.ar5 = 0
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
local physicsData = (require "bl3block").physicsData(scaleFactor)

--==============================================================
-- arrow functions
	local function cad1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("ad1 collided, ad1 +1")
			playarrowsound();
			arrowdata.ad1 = 1

		end
	end
	
	local function car1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("car1 collided, ar1 +1")
			playarrowsound();
			arrowdata.ar1 = 1

		end
	end
	
	local function car2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("ar2 collided, ar2 +1")
			playarrowsound();
			arrowdata.ar2 = 1

		end
	end
	
	local function car3(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("ar3 collided, ar3 +1")
			playarrowsound();
			arrowdata.ar3 = 1

		end
	end
	
	local function car4(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("ar4 collided, ar4 +1")
			playarrowsound();
			arrowdata.ar4 = 1

		end
	end
	
	local function car5(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("ar5 collided, ar5 +1")
			playarrowsound();
			arrowdata.ar5 = 1

		end
	end	
	
	local function cau1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, -bf, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("cau1 collided, au1 +1")
			playarrowsound();
			arrowdata.au1 = 1

		end
	end
--==============================================================
-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	group1 = display.newGroup()
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 - 123; ball.y = _H/2 - 202
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	block = display.newImageRect("l3block1.png", 320, 480)
	physics.addBody( block, "static", physicsData:get("block") )
	block.x = _W/2; block.y = _H/2
	
	spikes = display.newImageRect("blank.png", 320, 480)
	physics.addBody( spikes, "static", physicsData:get("spikes") )
	spikes.x = _W/2; spikes.y = _H/2

	local pausebutton = widget.newButton
	{
		defaultFile = "pausebuttonbottom.png",
		overFile = "pausebuttonbottomover.png",
		width = 37,
		height = 37,
	}	pausebutton.x = 18; pausebutton.y = _H-18;
	
	group1:insert(block);
	group1:insert(spikes)

	group1.isVisible = true
	--========================================================
	group2 = display.newGroup()
	
	block2 = display.newImageRect("l3block2.png", 320, 480)
	--physics.addBody( block, "static", physicsData:get("block2") )
	block2.x = _W/2; block2.y = _H/2
	
	spikes2 = display.newImageRect("blank.png", 320, 480)
	--physics.addBody( spikes, "static", physicsData:get("spikes") )
	spikes2.x = _W/2; spikes2.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2 + 90; flag.y = _H/2 - 150
	
	group2:insert(block2)
	group2:insert(spikes2)
	group2:insert(flag)

	group2.isVisible = false
	--========================================================
	local backgroundgroup = display.newGroup()
	
	local background2 = display.newImageRect("background.png", 320, 568);
	background2.x = _W/2; background2.y = _H/2;
	
	backgroundgroup:insert(background2)
	
	backgroundgroup.isVisible = false
	--========================================================
	-- Portal Groups
	local portalgroup = display.newGroup()
	
	portal1 = display.newImageRect("l3portal1.png", 320, 480)
	portal1.x = _W/2; portal1.y = _H/2
	physics.addBody( portal1, "static", physicsData:get("l3portal1") )	
	portalgroup:insert(portal1)
	portalgroup.isVisible = true

	local portalgroup2 = display.newGroup()
	
	portal12 = display.newImageRect("l3portal2.png", 320, 480)
	portal12.x = _W/2; portal12.y = _H/2
	
	portalgroup2:insert(portal12)
	
	portalgroup2.isVisible = false
	--========================================================
		group1arrows = display.newGroup()
	
	arrowDown1 = display.newImageRect("arrowdown.png", 32, 26)
	arrowDown1.x = _W/2 - 118; arrowDown1.y = _H/2 - 50
	physics.addBody( arrowDown1, "static", { isSensor = true} )

	arrowRight1 = display.newImageRect("arrowright.png", 26, 32)
	arrowRight1.x = _W/2 - 116; arrowRight1.y = _H/2 + 218
	physics.addBody( arrowRight1, "static", { isSensor = true} )
	
	arrowUp1 = display.newImageRect("arrowup.png", 32, 26)
	arrowUp1.x = _W/2 - 55; arrowUp1.y = _H/2
	physics.addBody( arrowUp1, "static", { isSensor = true} )
	
	
	arrowRight2 = display.newImageRect("arrowright.png", 28, 32)
	arrowRight2.x = _W/2 + 30; arrowRight2.y = _H/2
	physics.addBody( arrowRight2, "static", { isSensor = true} )
	
	arrowRight3 = display.newImageRect("arrowright.png", 28, 32)
	arrowRight3.x = _W/2 +60; arrowRight3.y = _H/2 + 50
	physics.addBody( arrowRight3, "static", { isSensor = true} )
	
	arrowRight4 = display.newImageRect("arrowright.png", 28, 32)
	arrowRight4.x = _W/2 + 90; arrowRight4.y = _H/2 + 100
	physics.addBody( arrowRight4, "static", { isSensor = true} )
	
	
	arrowDown1:addEventListener( "collision", cad1 )
	arrowRight1:addEventListener( "collision", car1 )
	arrowRight2:addEventListener( "collision", car2 )
	arrowRight3:addEventListener( "collision", car3 )
	arrowRight4:addEventListener( "collision", car4 )

	arrowUp1:addEventListener( "collision", cau1 )

	
	group1arrows:insert(arrowDown1)
	group1arrows:insert(arrowRight1)
	group1arrows:insert(arrowRight2)
	group1arrows:insert(arrowRight3)
	group1arrows:insert(arrowRight4)
	group1arrows:insert(arrowUp1)
	group1arrows.isVisible = true
	
	group2arrows = display.newGroup()
	
	arrowRight5 = display.newImageRect("arrowright.png", 28, 32)
	arrowRight5.x = _W/2 +30; arrowRight5.y = _H/2
	
	arrowRight5:addEventListener( "collision", car5 )
	
	group2arrows:insert(arrowRight5)
	group2arrows.isVisible = false

	--========================================================
	-- Portal switchie functions
	-- Portal 1 from Group1 to group2
	p1g1tog2 = function()
	
		group1.isVisible = false
		group2arrows.isVisible = true
		group1arrows.isVisible = false
		physics.removeBody(block)
		physics.removeBody(portal1)
		physics.removeBody(spikes)
		physics.addBody( block2, "static", physicsData:get("block2") )
		physics.addBody( spikes2, "static", physicsData:get("spikes2") )
		physics.addBody( portal12, "static", physicsData:get("l3portal2") )	
		physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1 } )

		group2.isVisible = true
		portalgroup.isVisible = false
		portalgroup2.isVisible = true
		backgroundgroup.isVisible = false
		
		print("Portal 1 collided going from g1 to g2")
		
		portal12:addEventListener("collision", delayp1g2tog1)
	
		ball.x = _W/2 - 123; ball.y = _H/2 - 180
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, 2, ball.x, ball.y )

		
		if arrowdata.ar5==0 then
			print("added ar5 physics")
			physics.addBody( arrowRight5, "static", { isSensor = true} )
		elseif arrowdata.ar5==1 then
			print("skipped ar5")
		end
		
		if arrowdata.ad1==0 then
			print("removed ad1 physics")
			physics.removeBody(arrowDown1)
		elseif arrowdata.ad1==1 then
			print("skipped ad1, not removing physics")
		end
		
		if arrowdata.ar1==0 then
			print("removed ar1 physics")
			physics.removeBody(arrowRight1)
		elseif arrowdata.ar1==1 then
			print("skipped ar1, not removing physics")
		end
		
		if arrowdata.au1==0 then
			print("removed au1 physics")
			physics.removeBody(arrowUp1)
		elseif arrowdata.au1==1 then
			print("skipped au1, not removing physics")
		end
		
		if arrowdata.ar2==0 then
			print("removed ar2 physics")
			physics.removeBody(arrowRight2)
		elseif arrowdata.ar2==1 then
			print("skipped ar2, not removing physics")
		end

		if arrowdata.ar3==0 then
			print("removed ar3 physics")
			physics.removeBody(arrowRight3)
		elseif arrowdata.ar3==1 then
			print("skipped ar3, not removing physics")
		end

		if arrowdata.ar4==0 then
			print("removed ar4 physics")
			physics.removeBody(arrowRight4)
		elseif arrowdata.ar4==1 then
			print("skipped ar4, not removing physics")
		end

	end

	-- Portal 1 from Group2 to Group1
	p1g2tog1 = function()
		
		group2.isVisible = false
		group1arrows.isVisible = true
		group2arrows.isVisible = false
		physics.removeBody(block2)
		physics.removeBody(spikes2)
		physics.removeBody(portal12)
		physics.removeBody(flag)
		physics.addBody( spikes, "static", physicsData:get("spikes") )
		physics.addBody( block, "static", physicsData:get("block") )
		physics.addBody( portal1, "static", physicsData:get("l3portal1") )	
		group1.isVisible = true
		portalgroup.isVisible = true
		portalgroup2.isVisible = false
		backgroundgroup.isVisible = false
		print("Portal 12 collided going from g2 to g1")
		
		ball.x = _W/2 + 50; ball.y = _H/2 + 160
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, -2, ball.x, ball.y )
		
		if arrowdata.ar5==0 then
			print("removed ar5 physics")
			physics.removeBody(arrowRight5)
		elseif arrowdata.ar5==1 then
			print("skipped ar5, not adding physics back")
		end
		
		if arrowdata.ad1==0 then
			print("added ad1 physics")
			physics.addBody( arrowDown1, "static", { isSensor = true} )
		elseif arrowdata.ad1==1 then
			print("skipped ad1")
		end
		
		if arrowdata.ar1==0 then
			print("added ar1 physics")
			physics.addBody( arrowRight1, "static", { isSensor = true} )
		elseif arrowdata.ar1==1 then
			print("skipped ar1")
		end
		
		if arrowdata.au1==0 then
			print("added au1 physics")
			physics.addBody( arrowUp1, "static", { isSensor = true} )
		elseif arrowdata.au1==1 then
			print("skipped au1")
		end
		
		if arrowdata.ar2==0 then
			print("added ar2 physics")
			physics.addBody( arrowRight2, "static", { isSensor = true} )
		elseif arrowdata.ar2==1 then
			print("skipped ar2")
		end
		
		if arrowdata.ar3==0 then
			print("added ar3 physics")
			physics.addBody( arrowRight3, "static", { isSensor = true} )
		elseif arrowdata.ar3==1 then
			print("skipped ar3")
		end
		
		if arrowdata.ar4==0 then
			print("added ar4 physics")
			physics.addBody( arrowRight4, "static", { isSensor = true} )
		elseif arrowdata.ar4==1 then
			print("skipped ar4")
		end

		
	end
	
	delayp1g2tog1 = function()
		--backgroundgroup.isVisible = true
		timer.performWithDelay(2, p1g2tog1)
	end
	
	delayp1g1tog2 = function()
		--backgroundgroup.isVisible = true
		timer.performWithDelay(2, p1g1tog2)
	end
	
	portal1:addEventListener("collision", delayp1g1tog2)
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
		ispassed.l3 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl4")
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
		Runtime:addEventListener("touch", check3);
	end
	gotomenu = function(event)
		storyboard.gotoScene("level select", "fade", 300)
		sfx.levelbgplay = 0
		audio.pause( sfx.levelbackground )
	end
	
	
	
	restarthtp = function(event)
		-- No more a bunch of stuff because I stuffed it into exitscene
		storyboard.gotoScene("restartl3", "fade", 100)
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
	spikes2.collision = restarthtp

	
	flag:addEventListener("collision", flag)
	spikes:addEventListener("collision", spikes)
	spikes2:addEventListener("collision", spikes2)


	group:insert(background);
	group:insert(group1)
	group:insert(group2)
	group:insert(ball)
	group:insert(pausebutton)
	group:insert(portalgroup)
	group:insert(portalgroup2)
	group:insert(group1arrows)
	group:insert(group2arrows)
	group:insert(wingroup)
	group:insert(backgroundgroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 3 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
		--borderTop:removeEventListener("collision", borderTop)
		flag:removeEventListener("collision", flag)
		spikes2:removeEventListener("collision", spikes2)
		spikes:removeEventListener("collision", spikes)
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	
	arrowdata.ar4 = nil
	arrowdata.ad1 = nil
	arrowdata.ar1 = nil
	arrowdata.au1 = nil
	arrowdata.ar2 = nil
	arrowdata.ar3 = nil
	arrowdata.ar5 = nil
	
	arrowdata.ad1 = 0
	arrowdata.ar1 = 0
	arrowdata.au1 = 0
	arrowdata.ar2 = 0
	arrowdata.ar3 = 0
	arrowdata.ar4 = 0
	arrowdata.ar5 = 0
	
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