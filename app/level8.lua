--Level8:  kinda like level 6 and 7
--Upvalue Limit = 60

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata8" )
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
local check3a, check3b

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

local a = {}
local ca = {}

local h = {}
local ah = {}

arrowdata.ah201 = nil
arrowdata.ah201 = 0

arrowdata.ah401 = nil
arrowdata.ah401 = 0

arrowdata.g3al1 = nil
arrowdata.g3al1 = 0
arrowdata.g3al2 = nil
arrowdata.g3al2 = 0
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
local physicsData = (require "bl8block").physicsData(scaleFactor)
local physicsData6 = (require "bl6block").physicsData(scaleFactor)
--=======================================================================================================================================================
	ca.g3al1 = function(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g3al1 collided, g3al1 +1")
			playarrowsound();
		arrowdata.g3al1 = 1

		end
	end
	ca.g3al2 = function(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g3al2 collided, g3al2 +1")
			playarrowsound();
		arrowdata.g3al2 = 1

		end
	end
--=======================================================================================================================================================
ps.exitgroup1 = function()
	groups.g1.isVisible = false
	physics.removeBody(blocks.b1)
	physics.removeBody(portals.p1to2one)
	physics.removeBody(portals.p1to2two)
	physics.removeBody(portals.p1to3one)
	physics.removeBody(ah.ah201)
end
ps.exitgroup2 = function()
	groups.g2.isVisible = false
	physics.removeBody(blocks.b2)
	physics.removeBody(flag)
	physics.removeBody(portals.p2to1one)
	physics.removeBody(portals.p2to1two)
	physics.removeBody(portals.p2to4one)
	physics.removeBody(portals.p2to4two)
	physics.removeBody(h.h201)
end
ps.exitgroup3 = function()
	groups.g3.isVisible = false
	physics.removeBody(blocks.b3)
	physics.removeBody(spikes.s3)
	physics.removeBody(portals.p3to1one)
	physics.removeBody(portals.p3to4one)
	physics.removeBody(portals.p3to4two)
	physics.removeBody(portals.p3to4three)
	physics.removeBody(portals.p3to31)
		if arrowdata.g3al1==0 then
			print("removed g3al1 physics")
			physics.removeBody( a.g3al1 )
		elseif arrowdata.g3al1==1 then
			print("skipped g3al1, no removing physics")
		end
		
		if arrowdata.g3al2==0 then
			print("removed g3al2 physics")
			physics.removeBody( a.g3al2 )
		elseif arrowdata.g3al2==1 then
			print("skipped g3al2, no removing physics")
		end
end
ps.exitgroup4 = function()
	groups.g4.isVisible = false
	physics.removeBody(blocks.b4)
	physics.removeBody(portals.p4to2one)
	physics.removeBody(portals.p4to2two)
	physics.removeBody(portals.p4to3one)
	physics.removeBody(portals.p4to3two)
	physics.removeBody(portals.p4to3three)
	physics.removeBody(h.h401)
	physics.removeBody(ah.ah401)
end
ps.exitgroup31 = function()
	groups.g31.isVisible = false
	physics.removeBody(blocks.b31)
	physics.removeBody(portals.p31to3)
end
--========================================================
ps.entergroup1 = function()
	groups.g1.isVisible = true
	physics.addBody( blocks.b1, "static", physicsData:get("l8block1") )
	physics.addBody( portals.p1to2one, "static", physicsData:get("l8p1to2one") )
	physics.addBody( portals.p1to2two, "static", physicsData:get("l8p1to2two") )
	physics.addBody( portals.p1to3one, "static", physicsData:get("l8p1to3one") )
	physics.addBody( ah.ah201, "static", physicsData:get("l8ah201") )
end
ps.entergroup2 = function()
	groups.g2.isVisible = true
	physics.addBody( blocks.b2, "static", physicsData:get("l8block2") )
	physics.addBody( flag, "static", {bounce = 0.2} )
	physics.addBody( portals.p2to1one, "static", physicsData:get("l8p2to1one") )
	physics.addBody( portals.p2to1two, "static", physicsData:get("l8p2to1two") )
	physics.addBody( portals.p2to4one, "static", physicsData:get("l8p2to4one") )
	physics.addBody( portals.p2to4two, "static", physicsData:get("l8p2to4two") )
	physics.addBody( h.h201, "static", physicsData:get("l8h201") )
end
ps.entergroup3 = function()
	groups.g3.isVisible = true
	physics.addBody( blocks.b3, "static", physicsData:get("l8block3") )
	physics.addBody( spikes.s3, "static", physicsData:get("l8block3spikes") )
	physics.addBody( portals.p3to1one, "static", physicsData:get("l8p3to1one") )
	physics.addBody( portals.p3to4one, "static", physicsData:get("l8p3to4one") )
	physics.addBody( portals.p3to4two, "static", physicsData:get("l8p3to4two") )
	physics.addBody( portals.p3to4three, "static", physicsData:get("l8p3to4three") )
	physics.addBody( portals.p3to31, "static", physicsData:get("l8p3to31") )
		if arrowdata.g3al2==0 then
			print("added g3al2 physics")
			physics.addBody( a.g3al2, "static", { isSensor = true} )
		elseif arrowdata.g3al2==1 then
			print("skipped g3al2, no adding physics")
		end
		if arrowdata.g3al1==0 then
			print("added g3al1 physics")
			physics.addBody( a.g3al1, "static", { isSensor = true} )
		elseif arrowdata.g3al1==1 then
			print("skipped g3al1, no adding physics")
		end
end
ps.entergroup4 = function()
	groups.g4.isVisible = true
	physics.addBody( blocks.b4, "static", physicsData:get("l8block4") )
	physics.addBody( portals.p4to2one, "static", physicsData:get("l8p4to2one") )
	physics.addBody( portals.p4to2two, "static", physicsData:get("l8p4to2two") )
	physics.addBody( portals.p4to3one, "static", physicsData:get("l8p4to3one") )
	physics.addBody( portals.p4to3two, "static", physicsData:get("l8p4to3two") )
	physics.addBody( portals.p4to3three, "static", physicsData:get("l8p4to3three") )
	physics.addBody( h.h401, "static", physicsData:get("l8h401") )
	physics.addBody( ah.ah401, "static", physicsData:get("l8ah401") )
end
ps.entergroup31 = function()
	groups.g31.isVisible = true
	physics.addBody( blocks.b31, "static", physicsData6:get("l6block141") )
	physics.addBody( portals.p31to3, "static", physicsData:get("l8p31to3") )
end
--=======================================================================================================================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2-120; ball.y = _H/2+200
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	local pausebutton = widget.newButton
	{
		defaultFile = "pausebuttonbottom.png",
		overFile = "pausebuttonbottomover.png",
		width = 37,
		height = 37,
	}	pausebutton.x = 18; pausebutton.y = _H-18;
	--=======================================================================================================================================================
	groups.g1 = display.newGroup()
	
	blocks.b1 = display.newImageRect("l8block1.png", 320, 480)
	blocks.b1.x = _W/2; blocks.b1.y = _H/2
	
	portals.p1to2one = display.newImageRect("blank.png", 0, 0)
	portals.p1to2one.x = _W/2; portals.p1to2one.y = _H/2
	
	portals.p1to2two = display.newImageRect("blank.png", 0, 0)
	portals.p1to2two.x = _W/2; portals.p1to2two.y = _H/2
	
	portals.p1to3one = display.newImageRect("blank.png", 0, 0)
	portals.p1to3one.x = _W/2; portals.p1to3one.y = _H/2
	
	ah.ah201 = display.newImageRect("blank.png", 0, 0)
	ah.ah201.x = _W/2; ah.ah201.y = _H/2
	
	ah.ah201over = display.newImageRect("l8ah201over.png", 320, 480)
	ah.ah201over.x = _W/2; ah.ah201over.y = _H/2
	ah.ah201over.isVisible = false
	
	local dah201
	
	local cah201 = function()
		transition.to(h.h201, {time=3000, y=(_H/2+80), transition = easing.inQuad})
		print("h.h201 opened!")
		arrowdata.ah201= 1
		ah.ah201over.isVisible = true
		dah201();
	end
	
	dah201 = function()
		ah.ah201:removeEventListener("collision", cah201)
	end
	
	ah.ah201:addEventListener("collision", cah201)
	
	groups.g1:insert(blocks.b1)
	groups.g1:insert(portals.p1to2one)
	groups.g1:insert(portals.p1to2two)
	groups.g1:insert(portals.p1to3one)
	groups.g1:insert(ah.ah201)
	groups.g1:insert(ah.ah201over)
	groups.g1.isVisible = false
	--========================================================
	groups.g2 = display.newGroup()

	blocks.b2 = display.newImageRect("l8block2.png", 320, 480)
	physics.addBody( blocks.b2, "static", physicsData:get("l8block2") )
	blocks.b2.x = _W/2; blocks.b2.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	physics.addBody( flag, "static", {bounce = 0.2} )
	flag.x = _W/2-120; flag.y = _H/2-116
	
	portals.p2to1one = display.newImageRect("blank.png", 0, 0)
	portals.p2to1one.x = _W/2; portals.p2to1one.y = _H/2
	physics.addBody( portals.p2to1one, "static", physicsData:get("l8p2to1one") )

	portals.p2to1two = display.newImageRect("blank.png", 0, 0)
	portals.p2to1two.x = _W/2; portals.p2to1two.y = _H/2
	physics.addBody( portals.p2to1two, "static", physicsData:get("l8p2to1two") )

	portals.p2to4one = display.newImageRect("blank.png", 0, 0)
	portals.p2to4one.x = _W/2; portals.p2to4one.y = _H/2
	physics.addBody( portals.p2to4one, "static", physicsData:get("l8p2to4one") )

	portals.p2to4two = display.newImageRect("blank.png", 0, 0)
	portals.p2to4two.x = _W/2; portals.p2to4two.y = _H/2
	physics.addBody( portals.p2to4two, "static", physicsData:get("l8p2to4two") )
	
	h.h201 = display.newImageRect("l8h201.png", 320, 480)
	h.h201.x = _W/2; h.h201.y = _H/2
	physics.addBody( h.h201, "static", physicsData:get("l8h201") )

	groups.g2:insert(blocks.b2)
	groups.g2:insert(flag)
	groups.g2:insert(portals.p2to1one)
	groups.g2:insert(portals.p2to1two)
	groups.g2:insert(portals.p2to4one)
	groups.g2:insert(portals.p2to4two)
	groups.g2:insert(h.h201)
	groups.g2.isVisible = true
	--========================================================
	groups.g3 = display.newGroup()

	blocks.b3 = display.newImageRect("l8block3.png", 320, 480)
	blocks.b3.x = _W/2; blocks.b3.y = _H/2
	
	spikes.s3 = display.newImageRect("blank.png", 320, 480)
	spikes.s3.x = _W/2; spikes.s3.y = _H/2
	
	portals.p3to1one = display.newImageRect("blank.png", 0, 0)
	portals.p3to1one.x = _W/2; portals.p3to1one.y = _H/2

	portals.p3to4one = display.newImageRect("blank.png", 0, 0)
	portals.p3to4one.x = _W/2; portals.p3to4one.y = _H/2

	portals.p3to4two = display.newImageRect("blank.png", 0, 0)
	portals.p3to4two.x = _W/2; portals.p3to4two.y = _H/2

	portals.p3to4three = display.newImageRect("blank.png", 0, 0)
	portals.p3to4three.x = _W/2; portals.p3to4three.y = _H/2
	
	portals.p3to31 = display.newImageRect("blank.png", 0, 0)
	portals.p3to31.x = _W/2; portals.p3to31.y = _H/2
	
	a.g3al1 = display.newImageRect("arrowleft.png", 28, 32)
	a.g3al1.x = _W/2+120; a.g3al1.y = _H/2-116
	
	a.g3al2 = display.newImageRect("arrowleft.png", 28, 32)
	a.g3al2.x = _W/2+60; a.g3al2.y = _H/2-116
	
	a.g3al1:addEventListener("collision", ca.g3al1)
	a.g3al2:addEventListener("collision", ca.g3al2)

	groups.g3:insert(blocks.b3)
	groups.g3:insert(spikes.s3)
	groups.g3:insert(portals.p3to1one)
	groups.g3:insert(portals.p3to4one)
	groups.g3:insert(portals.p3to4two)
	groups.g3:insert(portals.p3to4three)
	groups.g3:insert(portals.p3to31)
	groups.g3:insert(a.g3al1)
	groups.g3:insert(a.g3al2)
	groups.g3.isVisible = false
	--========================================================
	groups.g4 = display.newGroup()
	
	blocks.b4 = display.newImageRect("l8block4.png", 320, 480)
	blocks.b4.x = _W/2; blocks.b4.y = _H/2
	
	portals.p4to2one = display.newImageRect("blank.png", 0, 0)
	portals.p4to2one.x = _W/2; portals.p4to2one.y = _H/2

	portals.p4to2two = display.newImageRect("blank.png", 0, 0)
	portals.p4to2two.x = _W/2; portals.p4to2two.y = _H/2

	portals.p4to3one = display.newImageRect("blank.png", 0, 0)
	portals.p4to3one.x = _W/2; portals.p4to3one.y = _H/2

	portals.p4to3two = display.newImageRect("blank.png", 0, 0)
	portals.p4to3two.x = _W/2; portals.p4to3two.y = _H/2

	portals.p4to3three = display.newImageRect("blank.png", 0, 0)
	portals.p4to3three.x = _W/2; portals.p4to3three.y = _H/2

	h.h401 = display.newImageRect("l8h401.png", 320, 480)
	h.h401.x = _W/2; h.h401.y = _H/2
	
	ah.ah401 = display.newImageRect("blank.png", 0, 0)
	ah.ah401.x = _W/2; ah.ah401.y = _H/2
	
	ah.ah401over = display.newImageRect("l8ah401over.png", 320, 480)
	ah.ah401over.x = _W/2; ah.ah401over.y = _H/2
	ah.ah401over.isVisible = false
	
	local dah401
	
	local cah401 = function()
		transition.to(h.h401, {time=3000, x=(_H/2+80), transition = easing.inQuad})
		print("h.h401 opened!")
		arrowdata.ah401= 1
		ah.ah401over.isVisible = true
		dah401();
	end
	
	dah401 = function()
		ah.ah401:removeEventListener("collision", cah401)
	end
	
	ah.ah401:addEventListener("collision", cah401)
	
	groups.g4:insert(blocks.b4)
	groups.g4:insert(portals.p4to2one)
	groups.g4:insert(portals.p4to2two)
	groups.g4:insert(portals.p4to3one)
	groups.g4:insert(portals.p4to3two)
	groups.g4:insert(portals.p4to3three)
	groups.g4:insert(h.h401)
	groups.g4:insert(ah.ah401)
	groups.g4:insert(ah.ah401over)
	groups.g4.isVisible = false
	--========================================================
	groups.g31 = display.newGroup()
	
	blocks.b31 = display.newImageRect("l8block31.png", 320, 480)
	blocks.b31.x = _W/2; blocks.b31.y = _H/2
	
	portals.p31to3 = display.newImageRect("blank.png", 0, 0)
	portals.p31to3.x = _W/2; portals.p31to3.y = _H/2
	
	groups.g31:insert(blocks.b31)
	groups.g31:insert(portals.p31to3)
	groups.g31.isVisible = false
	--=======================================================================================================================================================
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
	--========================================================
	-- Portal Switchies
	-- ps.p2to1two
	ps.p2to1two = function()
	
		ps.exitgroup2();
		ps.entergroup1();
		
		ball.x = _W/2 + 110; ball.y = _H/2 + 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p2to1two")
	
	end
	
	ps.delayp2to1two = function()
		timer.performWithDelay(1, ps.p2to1two)
	end
	
	portals.p2to1two:addEventListener("collision", ps.delayp2to1two)
	--========================================================
	-- ps.p1to2two
	ps.p1to2two = function()
	
		ps.entergroup2();
		ps.exitgroup1();
		
		ball.x = _W/2 - 110; ball.y = _H/2 + 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p1to2two")
	
	end
	
	ps.delayp1to2two = function()
		timer.performWithDelay(1, ps.p1to2two)
	end
	
	portals.p1to2two:addEventListener("collision", ps.delayp1to2two)
	--========================================================
	-- ps.p1to2one
	ps.p1to2one = function()
	
		ps.exitgroup1();
		ps.entergroup2();
		
		ball.x = _W/2 - 110; ball.y = _H/2 -200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p1to2one")
	
	end
	
	ps.delayp1to2one = function()
		timer.performWithDelay(1, ps.p1to2one)
	end
	
	portals.p1to2one:addEventListener("collision", ps.delayp1to2one)
	--========================================================
	-- ps.p2to1one
	ps.p2to1one = function()
	
		ps.exitgroup2();
		ps.entergroup1();
		
		ball.x = _W/2 + 110; ball.y = _H/2 -200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p2to1one")
	
	end
	
	ps.delayp2to1one = function()
		timer.performWithDelay(1, ps.p2to1one)
	end
	
	portals.p2to1one:addEventListener("collision", ps.delayp2to1one)
	--========================================================
	-- ps.p1to3one
	ps.p1to3one = function()
	
		ps.exitgroup1();
		ps.entergroup3();
		
		ball.x = _W/2 - 120; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p1to3one")
	
	end
	
	ps.delayp1to3one = function()
		timer.performWithDelay(1, ps.p1to3one)
	end
	
	portals.p1to3one:addEventListener("collision", ps.delayp1to3one)
	--========================================================
	-- ps.p3to1one
	ps.p3to1one = function()
	
		ps.exitgroup3();
		ps.entergroup1();
		
		ball.x = _W/2 - 120; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p3to1one")
	
	end
	
	ps.delayp3to1one = function()
		timer.performWithDelay(1, ps.p3to1one)
	end
	
	portals.p3to1one:addEventListener("collision", ps.delayp3to1one)
	--========================================================
	-- ps.p3to4two
	ps.p3to4two = function()
	
		ps.exitgroup3();
		ps.entergroup4();
		
		ball.x = _W/2 - 110 ; ball.y = _H/2 - 40
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p3to4two")
	
	end
	
	ps.delayp3to4two = function()
		timer.performWithDelay(1, ps.p3to4two)
	end
	
	portals.p3to4two:addEventListener("collision", ps.delayp3to4two)
	--========================================================
	-- ps.p4to3two
	ps.p4to3two = function()
	
		ps.exitgroup4();
		ps.entergroup3();
		
		ball.x = _W/2 + 110 ; ball.y = _H/2 - 40
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p4to3two")
	
	end
	
	ps.delayp4to3two = function()
		timer.performWithDelay(1, ps.p4to3two)
	end
	
	portals.p4to3two:addEventListener("collision", ps.delayp4to3two)
	--========================================================
	-- ps.p3to4one
	ps.p3to4one = function()
	
		ps.exitgroup3();
		ps.entergroup4();
		
		ball.x = _W/2 - 110 ; ball.y = _H/2 - 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p3to4one")
	
	end
	
	ps.delayp3to4one = function()
		timer.performWithDelay(1, ps.p3to4one)
	end
	
	portals.p3to4one:addEventListener("collision", ps.delayp3to4one)
	--========================================================
	-- ps.p4to3one
	ps.p4to3one = function()
	
		ps.exitgroup4();
		ps.entergroup3();
		
		ball.x = _W/2 + 110 ; ball.y = _H/2 - 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p4to3one")
	
	end
	
	ps.delayp4to3one = function()
		timer.performWithDelay(1, ps.p4to3one)
	end
	
	portals.p4to3one:addEventListener("collision", ps.delayp4to3one)
	--========================================================
	-- ps.p3to4three
	ps.p3to4three = function()
	
		ps.exitgroup3();
		ps.entergroup4();
		
		ball.x = _W/2 - 110 ; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p3to4three")
	
	end
	
	ps.delayp3to4three = function()
		timer.performWithDelay(1, ps.p3to4three)
	end
	
	portals.p3to4three:addEventListener("collision", ps.delayp3to4three)
	--========================================================
	-- ps.p4to3three
	ps.p4to3three = function()
	
		ps.exitgroup4();
		ps.entergroup3();
		
		ball.x = _W/2 + 110 ; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p4to3three")
	
	end
	
	ps.delayp4to3three = function()
		timer.performWithDelay(1, ps.p4to3three)
	end
	
	portals.p4to3three:addEventListener("collision", ps.delayp4to3three)
	--========================================================
	-- ps.p2to4one
	ps.p2to4one = function()
	
		ps.exitgroup2();
		ps.entergroup4();
		
		ball.x = _W/2 + 42 ; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p2to4one")
	
	end
	
	ps.delayp2to4one = function()
		timer.performWithDelay(1, ps.p2to4one)
	end
	
	portals.p2to4one:addEventListener("collision", ps.delayp2to4one)
	--========================================================
	-- ps.p4to2one
	ps.p4to2one = function()
	
		ps.exitgroup4();
		ps.entergroup2();
		
		ball.x = _W/2 + 42 ; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p4to2one")
	
	end
	
	ps.delayp4to2one = function()
		timer.performWithDelay(1, ps.p4to2one)
	end
	
	portals.p4to2one:addEventListener("collision", ps.delayp4to2one)
	--========================================================
	-- ps.p2to4two
	ps.p2to4two = function()
	
		ps.exitgroup2();
		ps.entergroup4();
		
		ball.x = _W/2 + 120 ; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p2to4two")
	
	end
	
	ps.delayp2to4two = function()
		timer.performWithDelay(1, ps.p2to4two)
	end
	
	portals.p2to4two:addEventListener("collision", ps.delayp2to4two)
	--========================================================
	-- ps.p4to2two
	ps.p4to2two = function()
	
		ps.exitgroup4();
		ps.entergroup2();
		
		ball.x = _W/2 + 120 ; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p4to2two")
	
	end
	
	ps.delayp4to2two = function()
		timer.performWithDelay(1, ps.p4to2two)
	end
	
	portals.p4to2two:addEventListener("collision", ps.delayp4to2two)
	--========================================================
	-- ps.p3to31
	ps.p3to31 = function()
	
		ps.exitgroup3();
		ps.entergroup31();
		
		ball.x = _W/2 + 110 ; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p3to31")
	
	end
	
	ps.delayp3to31 = function()
		timer.performWithDelay(1, ps.p3to31)
	end
	
	portals.p3to31:addEventListener("collision", ps.delayp3to31)
	--========================================================
	-- ps.p31to3
	ps.p31to3 = function()
	
		ps.exitgroup31();
		ps.entergroup3();
		
		ball.x = _W/2 - 32 ; ball.y = _H/2 + 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p31to3")
	
	end
	
	ps.delayp31to3 = function()
		timer.performWithDelay(1, ps.p31to3)
	end
	
	portals.p31to3:addEventListener("collision", ps.delayp31to3)
	--=======================================================================================================================================================
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
		ispassed.l8 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
		flag:removeEventListener("collision", flag)
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl9")
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
		storyboard.gotoScene("restartl8", "fade", 100)
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
	spikes.s3.collision = restarthtp
	
	flag:addEventListener("collision", flag)
	spikes.s3:addEventListener("collision", spikes.s3)

	group:insert(background);
	group:insert(ball)
	group:insert(groups.g1)
	group:insert(groups.g2)
	group:insert(groups.g3)
	group:insert(groups.g4)
	group:insert(groups.g31)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)
end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 8 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)

	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	spikes.s3:removeEventListener("collision", spikes.s3)
	flag:removeEventListener("collision", flag)

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