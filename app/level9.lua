-- Level 9:  kinda like level 7

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata9" )
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

physics.setDrawMode( "normal" )

-- Forward Declaring stuff because if I don't do this stuff goes wrong
local restarthtp, nextscene
local check3, pauseball, ball, pausebutton
local flag
local pausegroup, wingroup
local pausegame, gotomenu, resumegame
local winbackground, overlaybutton, htpwinoverlay, backtomainbtn
local htpwinoverlayg, overlaybuttong
local blinkbs, blinkbs2
local l9bs1201, l9bs1201cover



playarrowsound = function()
    audio.play( sfx.arrowpop )
end

-- Lua Tables: Groups, Blocks, Spikes, Arrows, Portals, 
-- and Portal Switchie Functions.
local groups = {}
local blocks = {}
local spikes = {}
local portals = {}
local ps = {}

-- Shrinkers
local s = {}
local cs = {}
local dcs = {}

-- Plus Hidden passageways and Activators.
local h = {}
local ah = {}

-- And arrows and Collision Arrow functions
-- ca is also known as Canada
local a = {}
local ca = {}

arrowdata.ballissmall = 0
arrowdata.ah1401 = 0
arrowdata.ah101 = 0
arrowdata.ah1501 = 0
arrowdata.continue = 0
arrowdata.g11al1 = 0
arrowdata.g11al2 = 0
arrowdata.g11al3 = 0
arrowdata.g13ar1 = 0
arrowdata.g13ar2 = 0
arrowdata.g13au1 = 0
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
local physicsData = (require "bl9block").physicsData(scaleFactor)

ca.moveballup = function()
	ball:applyLinearImpulse( 0, -3, ball.x, ball.y )
end
ca.moveballdown = function()
	ball:applyLinearImpulse( 0, 3, ball.x, ball.y )
end
ca.moveballright = function()
	ball:applyLinearImpulse( 3, 0, ball.x, ball.y )
end
ca.moveballleft = function()
	ball:applyLinearImpulse( -3, 0, ball.x, ball.y )
end
--========================================================
	ca.g11al1 = function(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g11al1 collided, g11al1 +1")
			playarrowsound();
		arrowdata.g11al1 = 1

		end
	end
	ca.g11al2 = function(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g11al2 collided, g11al2 +1")
			playarrowsound();
		arrowdata.g11al2 = 1

		end
	end
	ca.g11al3 = function(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g11al3 collided, g11al3 +1")
			playarrowsound();
		arrowdata.g11al3 = 1

		end
	end

	ca.g13ar1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g13ar1 collided, g13ar1 +1")
			playarrowsound();
		arrowdata.g13ar1 = 1

		end
	end
	ca.g13ar2 = function(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g13ar2 collided, g13ar2 +1")
			playarrowsound();
		arrowdata.g13ar2 = 1

		end
	end
	ca.g13au1 = function(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballup();
	        event.target:removeSelf();
            event.target= nil;
			print("g13au1 collided, g13au1 +1")
			playarrowsound();
		arrowdata.g13au1 = 1

		end
	end
--=============================================================================================================================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 + 120; ball.y = _H/2 - 200
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	miniball = display.newImageRect("ballsmall.png", 25, 25);
	miniball.x = _W/2 + 123; miniball.y = _H/2 +200
	miniball.gravityScale = 0
	miniball.isVisible = false
	
	local pausebutton = widget.newButton
	{
		defaultFile = "pausebuttonbottom.png",
		overFile = "pausebuttonbottomover.png",
		width = 37,
		height = 37,
	}	pausebutton.x = 18; pausebutton.y = _H-18;
	
	--========================================================
	groups.g1 = display.newGroup()
	
	blocks.b1 = display.newImageRect("l9block1.png", 320, 480)
	blocks.b1.x = _W/2; blocks.b1.y = _H/2
	physics.addBody( blocks.b1, "static", physicsData:get("l9block1") )
	
	portals.p1to11 = display.newImageRect("blank.png", 320, 480)
	portals.p1to11.x = _W/2; portals.p1to11.y = _H/2
	physics.addBody( portals.p1to11, "static", physicsData:get("l9p1to11") )
	
	portals.p1to12 = display.newImageRect("blank.png", 320, 480)
	portals.p1to12.x = _W/2; portals.p1to12.y = _H/2
	physics.addBody( portals.p1to12, "static", physicsData:get("l9p1to12") )
	
	portals.p1to13 = display.newImageRect("blank.png", 320, 480)
	portals.p1to13.x = _W/2; portals.p1to13.y = _H/2
	physics.addBody( portals.p1to13, "static", physicsData:get("l9p1to13") )
	
	portals.p1to14 = display.newImageRect("blank.png", 320, 480)
	portals.p1to14.x = _W/2; portals.p1to14.y = _H/2
	physics.addBody( portals.p1to14, "static", physicsData:get("l9p1to14") )
	
	portals.p1to15 = display.newImageRect("blank.png", 320, 480)
	portals.p1to15.x = _W/2; portals.p1to15.y = _H/2
	physics.addBody( portals.p1to15, "static", physicsData:get("l9p1to15") )
	
	h.h101 = display.newImageRect("l9h101.png", 320, 480)
	h.h101.x = _W/2; h.h101.y = _H/2
	physics.addBody( h.h101, "static", physicsData:get("l9h101") )
	
	ah.ah101 = display.newImageRect("blank.png", 320, 480)
	ah.ah101.x = _W/2; ah.ah101.y = _H/2
	physics.addBody( ah.ah101, "static", physicsData:get("l9ah101") )
	
	ah.ah101over = display.newImageRect("l9ah101over.png", 320, 480)
	ah.ah101over.x = _W/2; ah.ah101over.y = _H/2
	ah.ah101over.isVisible = false
	
	local dah101
	
	local cah101 = function()
		transition.to(h.h101, {time=3000, x=(_W/2-80), transition = easing.inQuad})
		print("h.h101 opened!")
		arrowdata.ah101= 1
		ah.ah101over.isVisible = true
		dah101();
	end
	
	dah101 = function()
		ah.ah101:removeEventListener("collision", cah101)
	end
	
	ah.ah101:addEventListener("collision", cah101)
	
	groups.g1:insert(blocks.b1)
	groups.g1:insert(portals.p1to11)
	groups.g1:insert(portals.p1to12)
	groups.g1:insert(portals.p1to13)
	groups.g1:insert(portals.p1to14)
	groups.g1:insert(portals.p1to15)
	groups.g1:insert(h.h101)
	groups.g1:insert(ah.ah101)
	groups.g1:insert(ah.ah101over)
	groups.g1.isVisible = true
	--========================================================
	groups.g11 = display.newGroup()
	
	blocks.b11 = display.newImageRect("l9block11.png", 320, 480)
	blocks.b11.x = _W/2; blocks.b11.y = _H/2
	
	spikes.s11 = display.newImageRect("blank.png", 320, 480)
	spikes.s11.x = _W/2; spikes.s11.y = _H/2
	
	portals.p11to1 = display.newImageRect("blank.png", 320, 480)
	portals.p11to1.x = _W/2; portals.p11to1.y = _H/2
	
	a.g11al1 = display.newImageRect("arrowleft.png", 28, 32)
	a.g11al1.x = _W/2+120; a.g11al1.y = _H/2-200
	
	a.g11al2 = display.newImageRect("arrowleft.png", 28, 32)
	a.g11al2.x = _W/2+60; a.g11al2.y = _H/2-200
	
	a.g11al3 = display.newImageRect("arrowleft.png", 28, 32)
	a.g11al3.x = _W/2; a.g11al3.y = _H/2-200
	
	a.g11al1:addEventListener("collision", ca.g11al1)
	a.g11al2:addEventListener("collision", ca.g11al2)
	a.g11al3:addEventListener("collision", ca.g11al3)
	
	groups.g11:insert(blocks.b11)
	groups.g11:insert(spikes.s11)
	groups.g11:insert(portals.p11to1)
	groups.g11:insert(a.g11al2)
	groups.g11:insert(a.g11al1)
	groups.g11:insert(a.g11al3)
	groups.g11.isVisible = false
	--========================================================
	groups.g12 = display.newGroup()
	
	blocks.b12 = display.newImageRect("l9block12.png", 320, 480)
	blocks.b12.x = _W/2; blocks.b12.y = _H/2
	
	spikes.s12 = display.newImageRect("blank.png", 320, 480)
	spikes.s12.x = _W/2; spikes.s12.y = _H/2
	
	portals.p12to1 = display.newImageRect("blank.png", 320, 480)
	portals.p12to1.x = _W/2; portals.p12to1.y = _H/2
	
	ah.ah1501 = display.newImageRect("blank.png", 320, 480)
	ah.ah1501.x = _W/2; ah.ah1501.y = _H/2
	
	ah.ah1501over = display.newImageRect("l9ah1501over.png", 320, 480)
	ah.ah1501over.x = _W/2; ah.ah1501over.y = _H/2
	ah.ah1501over.isVisible = false
	
	local dah1501
	
	local cah1501 = function()
		transition.to(h.h1501, {time=3000, y=(_H/2+80), transition = easing.inQuad})
		print("h.h1501 opened!")
		arrowdata.ah1501= 1
		ah.ah1501over.isVisible = true
		dah1501();
	end
	
	dah1501 = function()
		ah.ah1501:removeEventListener("collision", cah1501)
	end
	
	ah.ah1501:addEventListener("collision", cah1501)
	
	l9bs1201 = display.newImageRect("l9bs1201.png", 172, 23)
	l9bs1201.x = _W/2+25; l9bs1201.y = _H/2+140
	
	l9bs1201cover = display.newImageRect("blank.png", 172, 23)
	l9bs1201cover.x = _W/2+25; l9bs1201cover.y = _H/2+140

	groups.g12:insert(blocks.b12)
	groups.g12:insert(spikes.s12)
	groups.g12:insert(portals.p12to1)
	groups.g12:insert(ah.ah1501)
	groups.g12:insert(ah.ah1501over)
	groups.g12:insert(l9bs1201)
	groups.g12:insert(l9bs1201cover)
	groups.g12.isVisible = false
	--========================================================
	groups.g13 = display.newGroup()
	
	blocks.b13 = display.newImageRect("l9block13.png", 320, 480)
	blocks.b13.x = _W/2; blocks.b13.y = _H/2
	
	spikes.s13 = display.newImageRect("blank.png", 320, 480)
	spikes.s13.x = _W/2; spikes.s13.y = _H/2
	
	portals.p13to1 = display.newImageRect("blank.png", 320, 480)
	portals.p13to1.x = _W/2; portals.p13to1.y = _H/2
	
	ah.ah1401 = display.newImageRect("blank.png", 320, 480)
	ah.ah1401.x = _W/2; ah.ah1401.y = _H/2
	
	ah.ah1401over = display.newImageRect("l9ah1401over.png", 320, 480)
	ah.ah1401over.x = _W/2; ah.ah1401over.y = _H/2
	ah.ah1401over.isVisible = false
	
	local dah1401
	
	local cah1401 = function()
		transition.to(h.h1401, {time=3000, x=(_W/2+80), transition = easing.inQuad})
		print("h.h1401 opened!")
		arrowdata.ah1401= 1
		ah.ah1401over.isVisible = true
		dah1401();
	end
	
	dah1401 = function()
		ah.ah1401:removeEventListener("collision", cah1401)
	end
	
	ah.ah1401:addEventListener("collision", cah1401)
	
	a.g13ar1 = display.newImageRect("arrowright.png", 32, 32)
	a.g13ar1.x = _W/2+60; a.g13ar1.y = _H/2

	a.g13ar2 = display.newImageRect("arrowright.png", 32, 32)
	a.g13ar2.x = _W/2+60; a.g13ar2.y = _H/2+100
	
	a.g13au1 = display.newImageRect("arrowup.png", 32, 26)
	a.g13au1.x = _W/2-110; a.g13au1.y = _H/2-75
	
	a.g13ar1:addEventListener("collision", ca.g13ar1)
	a.g13ar2:addEventListener("collision", ca.g13ar2)
	a.g13au1:addEventListener("collision", ca.g13au1)
	
	groups.g13:insert(blocks.b13)
	groups.g13:insert(spikes.s13)
	groups.g13:insert(portals.p13to1)
	groups.g13:insert(ah.ah1401)
	groups.g13:insert(ah.ah1401over)
	groups.g13:insert(a.g13ar1)
	groups.g13:insert(a.g13ar2)
	groups.g13:insert(a.g13au1)
	groups.g13.isVisible = false
	--========================================================
	groups.g14 = display.newGroup()
	
	blocks.b14 = display.newImageRect("l9block14.png", 320, 480)
	blocks.b14.x = _W/2; blocks.b14.y = _H/2
	
	portals.p14to1 = display.newImageRect("blank.png", 320, 480)
	portals.p14to1.x = _W/2; portals.p14to1.y = _H/2
	
	h.h1401 = display.newImageRect("l9h1401.png", 320, 480)
	h.h1401.x = _W/2; h.h1401.y = _H/2
	
	groups.g14:insert(blocks.b14)
	groups.g14:insert(portals.p14to1)
	groups.g14:insert(h.h1401)
	groups.g14.isVisible = false
	--========================================================
	groups.g15 = display.newGroup()
	
	blocks.b15 = display.newImageRect("l9block15.png", 320, 480)
	blocks.b15.x = _W/2; blocks.b15.y = _H/2
	
	portals.p15to1 = display.newImageRect("blank.png", 320, 480)
	portals.p15to1.x = _W/2; portals.p15to1.y = _H/2
	
	portals.p15to151 = display.newImageRect("blank.png", 320, 480)
	portals.p15to151.x = _W/2; portals.p15to151.y = _H/2
	
	h.h1501 = display.newImageRect("l9h1501.png", 320, 480)
	h.h1501.x = _W/2; h.h1501.y = _H/2
	
	s.s1501 = display.newImageRect("l9s1501.png", 320, 480)
	s.s1501.x = _W/2; s.s1501.y = _H/2
	
	s.s15012 = display.newImageRect("blank.png", 320, 480)
	s.s15012.x = _W/2; s.s15012.y = _H/2

	groups.g15:insert(blocks.b15)
	groups.g15:insert(portals.p15to1)
	groups.g15:insert(portals.p15to151)
	groups.g15:insert(h.h1501)
	groups.g15:insert(s.s1501)
	groups.g15:insert(s.s15012)
	groups.g15.isVisible = false
	--========================================================
	groups.g151 = display.newGroup()
	
	blocks.b151 = display.newImageRect("l9block151.png", 320, 480)
	blocks.b151.x = _W/2; blocks.b151.y = _H/2
	
	portals.p151to15 = display.newImageRect("blank.png", 320, 480)
	portals.p151to15.x = _W/2; portals.p151to15.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2+98; flag.y = _H/2-205

	groups.g151:insert(flag)
	groups.g151:insert(blocks.b151)
	groups.g151:insert(portals.p151to15)
	groups.g151.isVisible = false
--=============================================================================================================================================================
	ps.entergroup1 = function()
		groups.g1.isVisible = true
		physics.addBody( blocks.b1, "static", physicsData:get("l9block1") )
		physics.addBody( portals.p1to11, "static", physicsData:get("l9p1to11") )
		physics.addBody( portals.p1to12, "static", physicsData:get("l9p1to12") )
		physics.addBody( portals.p1to13, "static", physicsData:get("l9p1to13") )
		physics.addBody( portals.p1to14, "static", physicsData:get("l9p1to14") )
		physics.addBody( portals.p1to15, "static", physicsData:get("l9p1to15") )
		physics.addBody( h.h101, "static", physicsData:get("l9h101") )
		physics.addBody( ah.ah101, "static", physicsData:get("l9ah101") )
	end
	ps.entergroup11 = function()
		groups.g11.isVisible = true
		physics.addBody( blocks.b11, "static", physicsData:get("l9block11") )
		physics.addBody( spikes.s11, "static", physicsData:get("l9block11spikes") )
		physics.addBody( portals.p11to1, "static", physicsData:get("l9p11to1") )
		
		if arrowdata.g11al2==0 then
			print("added g11al2 physics")
			physics.addBody( a.g11al2, "static", { isSensor = true} )
		elseif arrowdata.g11al2==1 then
			print("skipped g11al2, no adding physics")
		end
		if arrowdata.g11al1==0 then
			print("added g11al1 physics")
			physics.addBody( a.g11al1, "static", { isSensor = true} )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no adding physics")
		end
		if arrowdata.g11al3==0 then
			print("added g11al3 physics")
			physics.addBody( a.g11al3, "static", { isSensor = true} )
		elseif arrowdata.g11al3==1 then
			print("skipped g11al3, no adding physics")
		end
	end
	ps.entergroup12 = function()
		groups.g12.isVisible = true
		physics.addBody( blocks.b12, "static", physicsData:get("l9block12") )
		physics.addBody( spikes.s12, "static", physicsData:get("l9block12spikes") )
		physics.addBody( portals.p12to1, "static", physicsData:get("l9p12to1") )
		physics.addBody( ah.ah1501, "static", physicsData:get("l9ah1501") )
		--physics.addBody( l9bs1201, "static", physicsData:get("l9bs1201") )
		--physics.addBody( l9bs1201cover, "static", physicsData:get("l9bs1201cover") )

	arrowdata.continue = 1
	stopbs = function()
		physics.removeBody(l9bs1201)
		physics.removeBody(l9bs1201cover)
		blinkbs = nil
		blinkbs2 = nil
	end
	blinkbs = function()
		l9bs1201.isVisible = false
		physics.removeBody(l9bs1201)
		physics.removeBody(l9bs1201cover)
		if arrowdata.continue == 1 then
			timer.performWithDelay(500, blinkbs2)
		else
			stopbs();
		end
	end
	
	blinkbs2 = function()
		l9bs1201.isVisible = true
		physics.addBody( l9bs1201, "static", physicsData:get("l9bs1201") )
		physics.addBody( l9bs1201cover, "static", physicsData:get("l9bs1201cover") )
		if arrowdata.continue == 1 then
			timer.performWithDelay(500, blinkbs)
		else
			stopbs();
		end	
		
	end
	
	blinkbs();
	
	end
	ps.entergroup13 = function()
		groups.g13.isVisible = true
		physics.addBody( blocks.b13, "static", physicsData:get("l9block13") )
		physics.addBody( spikes.s13, "static", physicsData:get("l9block13spikes") )
		physics.addBody( portals.p13to1, "static", physicsData:get("l9p13to1") )
		physics.addBody( ah.ah1401, "static", physicsData:get("l9ah1401") )
		if arrowdata.g13au1==0 then
			print("added g13au1 physics")
			physics.addBody( a.g13au1, "static", { isSensor = true} )
		elseif arrowdata.g13au1==1 then
			print("skipped g13au1, no adding physics")
		end
		if arrowdata.g13ar1==0 then
			print("added g13ar1 physics")
			physics.addBody( a.g13ar1, "static", { isSensor = true} )
		elseif arrowdata.g13ar1==1 then
			print("skipped g13ar1, no adding physics")
		end
		if arrowdata.g13ar2==0 then
			print("added g13ar2 physics")
			physics.addBody( a.g13ar2, "static", { isSensor = true} )
		elseif arrowdata.g13ar2==1 then
			print("skipped g13ar2, no adding physics")
		end
	end
	ps.entergroup14 = function()
		groups.g14.isVisible = true
		physics.addBody( blocks.b14, "static", physicsData:get("l9block14") )
		physics.addBody( portals.p14to1, "static", physicsData:get("l9p14to1") )
		physics.addBody( h.h1401, "static", physicsData:get("l9h1401") )
	end
	ps.entergroup15 = function()
		groups.g15.isVisible = true
		physics.addBody( blocks.b15, "static", physicsData:get("l9block15") )
		physics.addBody( portals.p15to1, "static", physicsData:get("l9p15to1") )
		physics.addBody( portals.p15to151, "static", physicsData:get("l9p15to151") )
		physics.addBody( s.s1501, "static", physicsData:get("l9s1501") )
		physics.addBody( s.s15012, "static", physicsData:get("l9s15012") )
		physics.addBody( h.h1501, "static", physicsData:get("l9h1501") )
	end
	ps.entergroup151 = function()
		groups.g151.isVisible = true
		physics.addBody( blocks.b151, "static", physicsData:get("l9block151") )
		physics.addBody( portals.p151to15, "static", physicsData:get("l9p151to15") )
		physics.addBody( flag, "static", {bounce = 0.2})
	end
	--========================================================
	ps.exitgroup1 = function()
		groups.g1.isVisible = false
		physics.removeBody(blocks.b1)
		physics.removeBody(portals.p1to11)
		physics.removeBody(portals.p1to12)
		physics.removeBody(portals.p1to13)
		physics.removeBody(portals.p1to14)
		physics.removeBody(portals.p1to15)
		physics.removeBody(h.h101)
		physics.removeBody(ah.ah101)
	end
	ps.exitgroup11 = function()
		groups.g11.isVisible = false
		physics.removeBody(blocks.b11)
		physics.removeBody(spikes.s11)
		physics.removeBody(portals.p11to1)
		
		if arrowdata.g11al1==0 then
			print("removed g11al1 physics")
			physics.removeBody( a.g11al1 )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no removing physics")
		end
		
		if arrowdata.g11al2==0 then
			print("removed g11al2 physics")
			physics.removeBody( a.g11al2 )
		elseif arrowdata.g11al2==1 then
			print("skipped g11al2, no removing physics")
		end
		
		if arrowdata.g11al3==0 then
			print("removed g11al3 physics")
			physics.removeBody( a.g11al3 )
		elseif arrowdata.g11al3==1 then
			print("skipped g11al3, no removing physics")
		end
	end
	ps.exitgroup12 = function()
		groups.g12.isVisible = false
		physics.removeBody(blocks.b12)
		physics.removeBody(spikes.s12)
		physics.removeBody(portals.p12to1)
		physics.removeBody(ah.ah1501)
		arrowdata.continue = 0
	end
	ps.exitgroup13 = function()
		groups.g13.isVisible = false
		physics.removeBody(blocks.b13)
		physics.removeBody(spikes.s13)
		physics.removeBody(portals.p13to1)
		physics.removeBody(ah.ah1401)
		if arrowdata.g13ar1==0 then
			print("removed g13ar1 physics")
			physics.removeBody( a.g13ar1 )
		elseif arrowdata.g13ar1==1 then
			print("skipped g13ar1, no removing physics")
		end
		if arrowdata.g13ar2==0 then
			print("removed g13ar2 physics")
			physics.removeBody( a.g13ar2 )
		elseif arrowdata.g13ar2==1 then
			print("skipped g13ar2, no removing physics")
		end
		if arrowdata.g13au1==0 then
			print("removed g13au1 physics")
			physics.removeBody( a.g13au1 )
		elseif arrowdata.g13au1==1 then
			print("skipped g13au1, no removing physics")
		end
	end
	ps.exitgroup14 = function()
		groups.g14.isVisible = false
		physics.removeBody(blocks.b14)
		physics.removeBody(portals.p14to1)
		physics.removeBody(h.h1401)
	end
	ps.exitgroup15 = function()
		groups.g15.isVisible = false
		physics.removeBody(blocks.b15)
		physics.removeBody(portals.p15to1)
		physics.removeBody(portals.p15to151)
		physics.removeBody(s.s1501)
		physics.removeBody(s.s15012)
		physics.removeBody(h.h1501)
	end
	ps.exitgroup151 = function()
		groups.g151.isVisible = false
		physics.removeBody(blocks.b151)
		physics.removeBody(flag)
		physics.removeBody(portals.p151to15)
	end
--=============================================================================================================================================================
	--========================================================
	-- Shrinkers
	cs.s1501small = function()
		ball.isVisible = false
		miniball.isVisible = true
		
		physics.removeBody(ball)
		physics.addBody( miniball, "dynamic", { density=1.5, friction=0.5, bounce=0.1, radius=12 } )
		miniball.x = _W/2-60; miniball.y = _H/2-200
		ps.mvminiballleft();
		
		arrowdata.ballissmall = 1
		print("Ball becoming smaller!")

	end
	dcs.s1501small = function()
		timer.performWithDelay(100, cs.s1501small)
	end
	s.s1501:addEventListener("collision", dcs.s1501small)
	--========================================================
	cs.s1501big = function()
		ball.isVisible = true
		miniball.isVisible = false
		
		physics.removeBody(miniball)
		physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		ball.x = _W/2+70; ball.y = _H/2-200
		ps.mvballright();

	arrowdata.ballissmall = 0
	
	print("Ball becoming bigger!")
		
	end
	dcs.s1501big = function()
		timer.performWithDelay(100, cs.s1501big)
	end
	s.s15012:addEventListener("collision", dcs.s1501big)
	--========================================================
	-- Portal Switchie
	ps.mvballup = function()
		ball:applyLinearImpulse( 0, -2, ball.x, ball.y )
	end
	ps.mvballdown = function()
		ball:applyLinearImpulse( 0, 2, ball.x, ball.y )
	end
	ps.mvballright = function()
		ball:applyLinearImpulse( 2, 0, ball.x, ball.y )
	end
	ps.mvballleft = function()
		ball:applyLinearImpulse( -2, 0, ball.x, ball.y )
	end
	ps.mvminiballright = function()
		miniball:applyLinearImpulse( 1, 0, miniball.x, miniball.y )
	end
	ps.mvminiballleft = function()
		miniball:applyLinearImpulse( -1, 0, miniball.x, miniball.y )
	end
	ps.mvminiballup = function()
		miniball:applyLinearImpulse( 0, -1, miniball.x, miniball.y )
	end
	ps.mvminiballdown = function()
		miniball:applyLinearImpulse( 0, 1, miniball.x, miniball.y )
	end
	--========================================================
	-- Portal Switchies
	-- ps.p1to11
	ps.p1to11 = function()
	
		ps.exitgroup1();
		ps.entergroup11();
		
		ball.x = _W/2 + 110; ball.y = _H/2 -200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1to11")
	
	end
	
	ps.delayp1to11 = function()
		timer.performWithDelay(1, ps.p1to11)
	end
	
	portals.p1to11:addEventListener("collision", ps.delayp1to11)
	--========================================================
	-- ps.p11to1
	ps.p11to1 = function()
	
		ps.exitgroup11();
		ps.entergroup1();
		
		ball.x = _W/2 - 32; ball.y = _H/2 -116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p11to1")
	
	end
	
	ps.delayp11to1 = function()
		timer.performWithDelay(1, ps.p11to1)
	end
	
	portals.p11to1:addEventListener("collision", ps.delayp11to1)
	--========================================================
	-- ps.p1to12
	ps.p1to12 = function()
	
		ps.exitgroup1();
		ps.entergroup12();
		
		ball.x = _W/2 +110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1to12")
	
	end
	
	ps.delayp1to12 = function()
		timer.performWithDelay(1, ps.p1to12)
	end
	
	portals.p1to12:addEventListener("collision", ps.delayp1to12)
	--========================================================
	-- ps.p12to1
	ps.p12to1 = function()
	
		ps.exitgroup12();
		ps.entergroup1();
		
		ball.x = _W/2 +52; ball.y = _H/2 - 40
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p12to1")
	
	end
	
	ps.delayp12to1 = function()
		timer.performWithDelay(1, ps.p12to1)
	end
	
	portals.p12to1:addEventListener("collision", ps.delayp12to1)
	--========================================================
	-- ps.p1to13
	ps.p1to13 = function()
	
		ps.exitgroup1();
		ps.entergroup13();
		
		ball.x = _W/2 +110; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1to13")
	
	end
	
	ps.delayp1to13 = function()
		timer.performWithDelay(1, ps.p1to13)
	end
	
	portals.p1to13:addEventListener("collision", ps.delayp1to13)
	--========================================================
	-- ps.p13to1
	ps.p13to1 = function()
	
		ps.entergroup1();
		ps.exitgroup13();
		
		ball:setLinearVelocity(0, 0)
		print("p13to1")
		
		physics.removeBody(ball)
		physics.removeBody(blocks.b1)
		
		ball.x = _W/2 -110; ball.y = _H/2 + 40
		
		local function addphysics()
			physics.addBody( blocks.b1, "static", physicsData:get("l9block1") )
			physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		end
		timer.performWithDelay(0.25, addphysics)
		
		timer.performWithDelay(1, ps.mvballright)
	
	end
	
	ps.delayp13to1 = function()
		timer.performWithDelay(1, ps.p13to1)
	end
	
	portals.p13to1:addEventListener("collision", ps.delayp13to1)
	--========================================================
	-- ps.p1to14
	ps.p1to14 = function()
	
		ps.exitgroup1();
		ps.entergroup14();
		
		ball.x = _W/2 +110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1to14")
	
	end
	
	ps.delayp1to14 = function()
		timer.performWithDelay(1, ps.p1to14)
	end
	
	portals.p1to14:addEventListener("collision", ps.delayp1to14)
	--========================================================
	-- ps.p14to1
	ps.p14to1 = function()
	
		ps.exitgroup14();
		ps.entergroup1();
		
		ball.x = _W/2 -110; ball.y = _H/2 +116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p14to1")
	
	end
	
	ps.delayp14to1 = function()
		timer.performWithDelay(1, ps.p14to1)
	end
	
	portals.p14to1:addEventListener("collision", ps.delayp14to1)
	--========================================================
	-- ps.p1to15
	ps.p1to15 = function()
	
		ps.entergroup15();
		ps.exitgroup1();
		
		ball.x = _W/2 + 120; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p1to15")
	
	end
	
	ps.delayp1to15 = function()
		timer.performWithDelay(1, ps.p1to15)
	end
	
	portals.p1to15:addEventListener("collision", ps.delayp1to15)
	--========================================================
	-- ps.p15to1
	ps.p15to1 = function()
	
		ps.entergroup1();
		ps.exitgroup15();
		
		ball.x = _W/2 +120; ball.y = _H/2+126
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p15to1")
	
	end
	
	ps.delayp15to1 = function()
		timer.performWithDelay(1, ps.p15to1)
	end
	
	portals.p15to1:addEventListener("collision", ps.delayp15to1)
	--========================================================
	-- ps.p15to151
	ps.p15to151 = function()
	
		ps.entergroup151();
		ps.exitgroup15();
		
		miniball.x = _W/2 +142; miniball.y = _H/2-220
		miniball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvminiballdown)
		print("p15to151")
	
	end
	
	ps.delayp15to151 = function()
		timer.performWithDelay(1, ps.p15to151)
	end
	
	portals.p15to151:addEventListener("collision", ps.delayp15to151)
	--========================================================
	-- ps.p151to15
	ps.p151to15 = function()
	
		ps.entergroup15();
		ps.exitgroup151();
		
		miniball.x = _W/2 +10; miniball.y = _H/2+125
		miniball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvminiballup)
		print("p151to15")
	
	end
	
	ps.delayp151to15 = function()
		timer.performWithDelay(1, ps.p151to15)
	end
	
	portals.p151to15:addEventListener("collision", ps.delayp151to15)
	--=============================================================================================================================================================	
	-- Functions to make this game work
	-- There are 2 variations of the check3 function,
	-- check3b is the original one
	function check3a(event)

		boostxf = event.xStart - event.x
		boostyf = event.yStart - event.y
		
		if arrowdata.ballissmall == 0 then
			if boostxf == 0 and boostyf == 0 then
				ball:setLinearVelocity(0, 0)
				print("ball paused")
			else
				boostx = boostxf/-350
				boosty = boostyf/-350
				
				ball:applyLinearImpulse( boostx, boosty, ball.x, ball.y )
			end
		else
			if boostxf == 0 and boostyf == 0 then
				miniball:setLinearVelocity(0, 0)
				print("ball paused")
			else
				boostx = boostxf/-500
				boosty = boostyf/-500
				
				miniball:applyLinearImpulse( boostx, boosty, miniball.x, miniball.y )
			end
		end
		
	end
	--========================================================
	function check3b(event)

		boostxf = event.xStart - event.x
		boostyf = event.yStart - event.y
		
		if arrowdata.ballissmall == 0 then
			boostx = boostxf/-350
			boosty = boostyf/-350
			ball:applyLinearImpulse( boostx, boosty, ball.x, ball.y )
		else
			boostx = boostxf/-500
			boosty = boostyf/-500
			miniball:applyLinearImpulse( boostx, boosty, miniball.x, miniball.y )
		end
		
	end
	--========================================================
	function pauseball(event)
		if arrowdata.ballissmall == 0 then
			ball:setLinearVelocity(0, 0)
			print("ball paused")
		else
			miniball:setLinearVelocity(0, 0)
			print("miniball paused")
		end
	end

	-- Try changing this value to check3b or check3a
	check3 = check3b
	Runtime:addEventListener("tap", pauseball);
	Runtime:addEventListener("touch", check3);
	
	--functions
	nextscene = function(event)
		wingroup.isVisible = true
		ispassed.l9 = 1
		saveTable(ispassed, "chkftl2.json")
		miniball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl10")
	end
	
	pausegame = function(event)
		pausegroup.isVisible = true
		
		if arrowdata.ballissmall == 0 then
			ball:setLinearVelocity(0, 0)
		else
			miniball:setLinearVelocity(0, 0)
		end
		
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
		storyboard.gotoScene("restartl9", "fade", 100)
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
	spikes.s11.collision = restarthtp
	spikes.s12.collision = restarthtp
	spikes.s13.collision = restarthtp
	l9bs1201.collision = restarthtp

	flag:addEventListener("collision",	flag)
	spikes.s11:addEventListener("collision", spikes.s11)
	spikes.s12:addEventListener("collision", spikes.s12)
	spikes.s13:addEventListener("collision", spikes.s13)
	l9bs1201:addEventListener("collision", l9bs1201)
	
	group:insert(background);
	group:insert(ball)
	group:insert(miniball)
	group:insert(groups.g1)
	group:insert(groups.g11)
	group:insert(groups.g12)
	group:insert(groups.g13)
	group:insert(groups.g14)
	group:insert(groups.g15)
	group:insert(groups.g151)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 9 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)
	spikes.s11:removeEventListener("collision", spikes.s11)
	spikes.s12:removeEventListener("collision", spikes.s12)
	spikes.s13:removeEventListener("collision", spikes.s13)
	l9bs1201:removeEventListener("collision", l9bs1201)
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	arrowdata.ballissmall = 0
	arrowdata.ah1401 = 0
	arrowdata.ah101 = 0
	arrowdata.ah1501 = 0
	arrowdata.continue = 0
	arrowdata.g11al1 = 0
	arrowdata.g11al2 = 0
	arrowdata.g11al3 = 0
	arrowdata.g13ar1 = 0
	arrowdata.g13ar2 = 0
	arrowdata.g13au1 = 0
	
	blinkbs = nil
	blinkbs2 = nil
	
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