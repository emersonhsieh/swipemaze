-- Level7:  kinda like level but 2 with tables
-- 60 UPVALUE LIMTI!!!  LUA Y U DO DIS

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata6" )
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

arrowdata.ballissmall = 0

playarrowsound = function()
    audio.play( sfx.arrowpop )
end

-- Lua Tables: Groups, Blocks, Spikes, Arrows, Portals, 
-- and Portal Switchie Functions.
local groups = {}
local blocks = {}
local spikes = {}
local arrows = {}
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
local physicsData = (require "bl7block").physicsData(scaleFactor)

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
--=============================================================================================================================================================
--=============================================================================================================================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 + 123; ball.y = _H/2 +200
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	miniball = display.newImageRect("ballsmall.png", 28, 28);
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
	
	blocks.b1 = display.newImageRect("l7block1.png", 320, 480)
	blocks.b1.x = _W/2; blocks.b1.y = _H/2
	physics.addBody( blocks.b1, "static", physicsData:get("l7block1") )
	
	portals.p1to1one = display.newImageRect("blank.png", 320, 480)
	portals.p1to1one.x = _W/2; portals.p1to1one.y = _H/2;
	physics.addBody( portals.p1to1one, "static", physicsData:get("l7portal1to1one") )
	
	portals.p1to1one2 = display.newImageRect("blank.png", 320, 480)
	portals.p1to1one2.x = _W/2; portals.p1to1one2.y = _H/2;
	physics.addBody( portals.p1to1one2, "static", physicsData:get("l7portal1to1one2") )

	portals.p1to1two = display.newImageRect("blank.png", 320, 480)
	portals.p1to1two.x = _W/2; portals.p1to1two.y = _H/2;
	physics.addBody( portals.p1to1two, "static", physicsData:get("l7portal1to1two") )
	
	portals.p1to1two2 = display.newImageRect("blank.png", 320, 480)
	portals.p1to1two2.x = _W/2; portals.p1to1two2.y = _H/2;
	physics.addBody( portals.p1to1two2, "static", physicsData:get("l7portal1to1two2") )
	
	portals.p1to1three = display.newImageRect("blank.png", 320, 480)
	portals.p1to1three.x = _W/2; portals.p1to1three.y = _H/2;
	physics.addBody( portals.p1to1three, "static", physicsData:get("l7portal1to1three") )
	
	portals.p1to1three2 = display.newImageRect("blank.png", 320, 480)
	portals.p1to1three2.x = _W/2; portals.p1to1three2.y = _H/2;
	physics.addBody( portals.p1to1three2, "static", physicsData:get("l7portal1to1three2") )
	
	portals.p1to11 = display.newImageRect("blank.png", 320, 480)
	portals.p1to11.x = _W/2; portals.p1to11.y = _H/2;
	physics.addBody( portals.p1to11, "static", physicsData:get("l7portal1to11") )
	
	portals.p1to12 = display.newImageRect("blank.png", 320, 480)
	portals.p1to12.x = _W/2; portals.p1to12.y = _H/2;
	physics.addBody( portals.p1to12, "static", physicsData:get("l7portal1to12") )
	
	groups.g1:insert(blocks.b1)
	groups.g1:insert(portals.p1to1one)
	groups.g1:insert(portals.p1to1one2)
	groups.g1:insert(portals.p1to1two)
	groups.g1:insert(portals.p1to1two2)
	groups.g1:insert(portals.p1to1three)
	groups.g1:insert(portals.p1to1three2)
	groups.g1:insert(portals.p1to11)
	groups.g1:insert(portals.p1to12)
	--========================================================
	groups.g11 = display.newGroup()
	
	blocks.b11 = display.newImageRect("l7block11.png", 320, 480)
	blocks.b11.x = _W/2; blocks.b11.y = _H/2
	
	portals.p11to1 = display.newImageRect("blank.png", 320, 480)
	portals.p11to1.x = _W/2; portals.p11to1.y = _H/2
	
	portals.p11to111 = display.newImageRect("blank.png", 320, 480)
	portals.p11to111.x = _W/2; portals.p11to111.y = _H/2
	
	s.s1101 = display.newImageRect("l7s1101.png", 320, 480)
	s.s1101.x = _W/2; s.s1101.y = _H/2
	
	s.s1102 = display.newImageRect("l7s1102.png", 320, 480)
	s.s1102.x = _W/2; s.s1102.y = _H/2
	
	s.s11012 = display.newImageRect("blank.png", 320, 480)
	s.s11012.x = _W/2; s.s11012.y = _H/2
	
	s.s11022 = display.newImageRect("blank.png", 320, 480)
	s.s11022.x = _W/2; s.s11022.y = _H/2

	groups.g11:insert(blocks.b11)	
	groups.g11:insert(portals.p11to1)
	groups.g11:insert(portals.p11to111)
	groups.g11:insert(s.s1101)
	groups.g11:insert(s.s11012)
	groups.g11:insert(s.s1102)
	groups.g11:insert(s.s11022)
	groups.g11.isVisible = false
	--========================================================
	groups.g111 = display.newGroup()
	
	blocks.b111 = display.newImageRect("l7block111.png", 320, 480)
	blocks.b111.x = _W/2; blocks.b111.y = _H/2
	
	spikes.s111 = display.newImageRect("blank.png", 320, 480)
	spikes.s111.x = _W/2; spikes.s111.y = _H/2
	
	portals.p111to11 = display.newImageRect("blank.png", 320, 480)
	portals.p111to11.x = _W/2; portals.p111to11.y = _H/2
	
	portals.p111to1111one = display.newImageRect("blank.png", 320, 480)
	portals.p111to1111one.x = _W/2; portals.p111to1111one.y = _H/2
	
	portals.p111to1111two = display.newImageRect("blank.png", 320, 480)
	portals.p111to1111two.x = _W/2; portals.p111to1111two.y = _H/2
	
	groups.g111:insert(portals.p111to1111one)
	groups.g111:insert(portals.p111to1111two)
	groups.g111:insert(portals.p111to11)
	groups.g111:insert(blocks.b111)
	groups.g111:insert(spikes.s111)
	groups.g111.isVisible = false
	--========================================================
	groups.g1111 = display.newGroup()
	
	blocks.b1111 = display.newImageRect("l7block1111.png", 320, 480)
	blocks.b1111.x = _W/2; blocks.b1111.y = _H/2
	
	portals.p1111to111one2 = display.newImageRect("blank.png", 320, 480)
	portals.p1111to111one2.x = _W/2; portals.p1111to111one2.y = _H/2
	
	portals.p1111to111two2 = display.newImageRect("blank.png", 320, 480)
	portals.p1111to111two2.x = _W/2; portals.p1111to111two2.y = _H/2

	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2+120; flag.y = _H/2-40
	
	groups.g1111:insert(portals.p1111to111one2)
	groups.g1111:insert(portals.p1111to111two2)
	groups.g1111:insert(flag)
	groups.g1111:insert(blocks.b1111)
	groups.g1111.isVisible = false
	--========================================================
	groups.g12 = display.newGroup()
	
	blocks.b12 = display.newImageRect("l7block12.png", 320, 480)
	blocks.b12.x = _W/2; blocks.b12.y = _H/2
	
	portals.p12to121 = display.newImageRect("blank.png", 320, 480)
	portals.p12to121.x = _W/2; portals.p12to121.y = _H/2
	
	portals.p12to1 = display.newImageRect("blank.png", 320, 480)
	portals.p12to1.x = _W/2; portals.p12to1.y = _H/2
	
	portals.p12to12one = display.newImageRect("blank.png", 320, 480)
	portals.p12to12one.x = _W/2; portals.p12to12one.y = _H/2
	
	portals.p12to12one2 = display.newImageRect("blank.png", 320, 480)
	portals.p12to12one2.x = _W/2; portals.p12to12one2.y = _H/2
	
	portals.p12to12two = display.newImageRect("blank.png", 320, 480)
	portals.p12to12two.x = _W/2; portals.p12to12two.y = _H/2
	
	portals.p12to12two2 = display.newImageRect("blank.png", 320, 480)
	portals.p12to12two2.x = _W/2; portals.p12to12two2.y = _H/2
	
	portals.p12to12three = display.newImageRect("blank.png", 320, 480)
	portals.p12to12three.x = _W/2; portals.p12to12three.y = _H/2
	
	portals.p12to12three2 = display.newImageRect("blank.png", 320, 480)
	portals.p12to12three2.x = _W/2; portals.p12to12three2.y = _H/2
	
	groups.g12:insert(portals.p12to121)
	groups.g12:insert(portals.p12to1)
	groups.g12:insert(portals.p12to12one)
	groups.g12:insert(portals.p12to12one2)
	groups.g12:insert(portals.p12to12two)
	groups.g12:insert(portals.p12to12two2)
	groups.g12:insert(portals.p12to12three)
	groups.g12:insert(portals.p12to12three2)
	groups.g12:insert(blocks.b12)
	groups.g12.isVisible = false
	--========================================================
	groups.g121 = display.newGroup()
	
	blocks.b121 = display.newImageRect("l7block121.png", 320, 480)
	blocks.b121.x = _W/2; blocks.b121.y = _H/2
	
	portals.p121to12 = display.newImageRect("blank.png", 320, 480)
	portals.p121to12.x = _W/2; portals.p121to12.y = _H/2
	
	groups.g121:insert(blocks.b121)
	groups.g121:insert(portals.p121to12)
	groups.g121.isVisible = false
--=============================================================================================================================================================
	ps.mvminiballright = function()
		miniball:applyLinearImpulse( 1, 0, miniball.x, miniball.y )
	end
	ps.mvminiballleft = function()
		miniball:applyLinearImpulse( -1, 0, miniball.x, miniball.y )
	end
	--========================================================
	-- Shrinkers
	cs.s1101small = function()
		ball.isVisible = false
		miniball.isVisible = true
		
		physics.removeBody(ball)
		physics.addBody( miniball, "dynamic", { density=1.5, friction=0.5, bounce=0.1, radius=14 } )
		miniball.x = _W/2-60; miniball.y = _H/2-200
		ps.mvminiballleft();
		
		arrowdata.ballissmall = 1
		print("Ball becoming smaller!")

	end
	dcs.s1101small = function()
		timer.performWithDelay(100, cs.s1101small)
	end
	s.s1101:addEventListener("collision", dcs.s1101small)
	--========================================================
	cs.s1101big = function()
		ball.isVisible = true
		miniball.isVisible = false
		
		physics.removeBody(miniball)
		physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		ball.x = _W/2+70; ball.y = _H/2-200
		ps.mvballright();

	arrowdata.ballissmall = 0
	
	print("Ball becoming bigger!")
		
	end
	dcs.s1101big = function()
		timer.performWithDelay(100, cs.s1101big)
	end
	s.s11012:addEventListener("collision", dcs.s1101big)
	--========================================================
	-- Shrinkers 2
	cs.s1102small = function()
		ball.isVisible = false
		miniball.isVisible = true
		
		physics.removeBody(ball)
		physics.addBody( miniball, "dynamic", { density=1.5, friction=0.5, bounce=0.1, radius=14 } )
		miniball.x = _W/2+60; miniball.y = _H/2+200
		ps.mvminiballright();
		
		arrowdata.ballissmall = 1
		print("Ball becoming smaller!")

	end
	dcs.s1102small = function()
		timer.performWithDelay(100, cs.s1102small)
	end
	s.s1102:addEventListener("collision", dcs.s1102small)
	--========================================================
	cs.s1102big = function()
		ball.isVisible = true
		miniball.isVisible = false
		
		physics.removeBody(miniball)
		physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		ball.x = _W/2-70; ball.y = _H/2+200
		ps.mvballleft();

	arrowdata.ballissmall = 0
	
	print("Ball becoming bigger!")
		
	end
	dcs.s1102big = function()
		timer.performWithDelay(100, cs.s1102big)
	end
	s.s11022:addEventListener("collision", dcs.s1102big)
--=============================================================================================================================================================
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
	--========================================================
	-- PortalSwitchie.portal1to1one

	ps.p1to1one = function()
		portals.p1to1one2:addEventListener("collision", ps.delayp1to1one2)	
		ball.x = _W/2 + 110; ball.y = _H/2 + 116
		ball:setLinearVelocity(0, 0)
		print("p1to1one")
		ps.mvballleft()
	
	end
	
	ps.delayp1to1one = function()
		portals.p1to1one:removeEventListener("collision", ps.delayp1to1one)
		timer.performWithDelay(1, ps.p1to1one)
	end
	
	portals.p1to1one:addEventListener("collision", ps.delayp1to1one)
	--========================================================
	-- PortalSwitchie.portal1to1one2
	ps.p1to1one2 = function()
	
		portals.p1to1one:addEventListener("collision", ps.delayp1to1one)
		ball.x = _W/2 + 50; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		print("p1to1one2")
		ps.mvballright()
	
	end
	
	ps.delayp1to1one2 = function()
		portals.p1to1one2:removeEventListener("collision", ps.delayp1to1one2)	
		timer.performWithDelay(1, ps.p1to1one2)
	end
	
	portals.p1to1one2:addEventListener("collision", ps.delayp1to1one2)
	--========================================================
	-- PortalSwitchie.portal1to1two

	ps.p1to1two = function()
		portals.p1to1two2:addEventListener("collision", ps.delayp1to1two2)	
		ball.x = _W/2 - 120; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		print("p1to1two")
		ps.mvballdown()
	
	end
	
	ps.delayp1to1two = function()
		portals.p1to1two:removeEventListener("collision", ps.delayp1to1two)
		timer.performWithDelay(1, ps.p1to1two)
	end
	
	portals.p1to1two:addEventListener("collision", ps.delayp1to1two)
	--========================================================
	-- PortalSwitchie.portal1to1two2
	ps.p1to1two2 = function()
	
		portals.p1to1two:addEventListener("collision", ps.delayp1to1two)
		ball.x = _W/2 - 42; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		print("p1to1two2")
		ps.mvballup()
	
	end
	
	ps.delayp1to1two2 = function()
		portals.p1to1two2:removeEventListener("collision", ps.delayp1to1two2)	
		timer.performWithDelay(1, ps.p1to1two2)
	end
	
	portals.p1to1two2:addEventListener("collision", ps.delayp1to1two2)
	--========================================================
	-- PortalSwitchie.portal1to1three

	ps.p1to1three = function()
		portals.p1to1three2:addEventListener("collision", ps.delayp1to1three2)	
		ball.x = _W/2 - 120; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		print("p1to1three")
		ps.mvballup()
	
	end
	
	ps.delayp1to1three = function()
		portals.p1to1three:removeEventListener("collision", ps.delayp1to1three)
		timer.performWithDelay(1, ps.p1to1three)
	end
	
	portals.p1to1three:addEventListener("collision", ps.delayp1to1three)
	--========================================================
	-- PortalSwitchie.portal1to1three2
	ps.p1to1three2 = function()
	
		portals.p1to1three:addEventListener("collision", ps.delayp1to1three)
		ball.x = _W/2 - 42; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		print("p1to1three2")
		ps.mvballdown()
	
	end
	
	ps.delayp1to1three2 = function()
		portals.p1to1three2:removeEventListener("collision", ps.delayp1to1three2)	
		timer.performWithDelay(1, ps.p1to1three2)
	end
	
	portals.p1to1three2:addEventListener("collision", ps.delayp1to1three2)
	--========================================================
	-- PortalSwitchie.portal1to11

	ps.p1to11 = function()
	
		groups.g11.isVisible = true
		groups.g1.isVisible = false
		
		physics.removeBody(blocks.b1)
		physics.removeBody(portals.p1to1one)
		physics.removeBody(portals.p1to1one2)
		physics.removeBody(portals.p1to1two)
		physics.removeBody(portals.p1to1two2)
		physics.removeBody(portals.p1to1three)
		physics.removeBody(portals.p1to1three2)
		physics.removeBody(portals.p1to11)
		physics.removeBody(portals.p1to12)

		physics.addBody( blocks.b11, "static", physicsData:get("l7block11") )
		physics.addBody( portals.p11to1, "static", physicsData:get("l7portal11to1") )
		physics.addBody( portals.p11to111, "static", physicsData:get("l7portal11to111") )
		physics.addBody( s.s1101, "static", physicsData:get("l7s1101small") )
		physics.addBody( s.s11012, "static", physicsData:get("l7s1101big") )
		physics.addBody( s.s1102, "static", physicsData:get("l7s1102small") )
		physics.addBody( s.s11022, "static", physicsData:get("l7s1102big") )
		
		ball.x = _W/2 + 110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1to11")
	
	end
	
	ps.delayp1to11 = function()
		timer.performWithDelay(1, ps.p1to11)
	end
	
	portals.p1to11:addEventListener("collision", ps.delayp1to11)
	--========================================================
	-- PortalSwitchie.portal11to1

	ps.p11to1 = function()
	
		groups.g11.isVisible = false
		groups.g1.isVisible = true
		
		physics.removeBody(blocks.b11)
		physics.removeBody(portals.p11to1)
		physics.removeBody(portals.p11to111)
		physics.removeBody(s.s1101)
		physics.removeBody(s.s1102)
		physics.removeBody(s.s11012)
		physics.removeBody(s.s11022)

		physics.addBody( blocks.b1, "static", physicsData:get("l7block1") )
		physics.addBody( portals.p1to1one, "static", physicsData:get("l7portal1to1one") )
		physics.addBody( portals.p1to1one2, "static", physicsData:get("l7portal1to1one2") )
		physics.addBody( portals.p1to1two, "static", physicsData:get("l7portal1to1two") )
		physics.addBody( portals.p1to1two2, "static", physicsData:get("l7portal1to1two2") )
		physics.addBody( portals.p1to1three, "static", physicsData:get("l7portal1to1three") )
		physics.addBody( portals.p1to1three2, "static", physicsData:get("l7portal1to1three2") )
		physics.addBody( portals.p1to11, "static", physicsData:get("l7portal1to11") )
		physics.addBody( portals.p1to12, "static", physicsData:get("l7portal1to12") )
	
		ball.x = _W/2 + 50; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p11to1")
	
	end
	
	ps.delayp11to1 = function()
		timer.performWithDelay(1, ps.p11to1)
	end
	
	portals.p11to1:addEventListener("collision", ps.delayp11to1)
	--========================================================
	-- PortalSwitchie.portal1to12

	ps.p1to12 = function()
	
		groups.g12.isVisible = true
		groups.g1.isVisible = false
		
		physics.removeBody(blocks.b1)
		physics.removeBody(portals.p1to1one)
		physics.removeBody(portals.p1to1one2)
		physics.removeBody(portals.p1to1two)
		physics.removeBody(portals.p1to1two2)
		physics.removeBody(portals.p1to1three)
		physics.removeBody(portals.p1to1three2)
		physics.removeBody(portals.p1to11)
		physics.removeBody(portals.p1to12)

		physics.addBody( blocks.b12, "static", physicsData:get("l7block12") )
		physics.addBody( portals.p12to12one, "static", physicsData:get("l7portal12to12one") )
		physics.addBody( portals.p12to12one2, "static", physicsData:get("l7portal12to12one2") )
		physics.addBody( portals.p12to12two, "static", physicsData:get("l7portal12to12two") )
		physics.addBody( portals.p12to12two2, "static", physicsData:get("l7portal12to12two2") )
		physics.addBody( portals.p12to12three, "static", physicsData:get("l7portal12to12three") )
		physics.addBody( portals.p12to12three2, "static", physicsData:get("l7portal12to12three2") )
		physics.addBody( portals.p12to121, "static", physicsData:get("l7portal12to121") )
		physics.addBody( portals.p12to1, "static", physicsData:get("l7portal121to12") )
	
		ball.x = _W/2 - 120; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p1to12")
	
	end
	
	ps.delayp1to12 = function()
		timer.performWithDelay(1, ps.p1to12)
	end
	
	portals.p1to12:addEventListener("collision", ps.delayp1to12)
	--========================================================
	-- PortalSwitchie.portal12to1

	ps.p12to1 = function()
	
		groups.g12.isVisible = false
		groups.g1.isVisible = true
		
		physics.removeBody(blocks.b12)
		physics.removeBody(portals.p12to12one)
		physics.removeBody(portals.p12to12one2)
		physics.removeBody(portals.p12to12two)
		physics.removeBody(portals.p12to12two2)
		physics.removeBody(portals.p12to12three)
		physics.removeBody(portals.p12to12three2)
		physics.removeBody(portals.p12to1)
		physics.removeBody(portals.p12to121)

		physics.addBody( blocks.b1, "static", physicsData:get("l7block1") )
		physics.addBody( portals.p1to1one, "static", physicsData:get("l7portal1to1one") )
		physics.addBody( portals.p1to1one2, "static", physicsData:get("l7portal1to1one2") )
		physics.addBody( portals.p1to1two, "static", physicsData:get("l7portal1to1two") )
		physics.addBody( portals.p1to1two2, "static", physicsData:get("l7portal1to1two2") )
		physics.addBody( portals.p1to1three, "static", physicsData:get("l7portal1to1three") )
		physics.addBody( portals.p1to1three2, "static", physicsData:get("l7portal1to1three2") )
		physics.addBody( portals.p1to11, "static", physicsData:get("l7portal1to11") )
		physics.addBody( portals.p1to12, "static", physicsData:get("l7portal1to12") )
	
		ball.x = _W/2 + 110; ball.y = _H/2 + 40
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p12to1")
	
	end
	
	ps.delayp12to1 = function()
		timer.performWithDelay(1, ps.p12to1)
	end
	
	portals.p12to1:addEventListener("collision", ps.delayp12to1)
	--========================================================
	-- PortalSwitchie.portal12to12one

	ps.p12to12one = function()
		portals.p12to12one2:addEventListener("collision", ps.delayp12to12one2)	
		ball.x = _W/2 - 42; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		print("p12to12one")
		ps.mvballup()
	
	end
	
	ps.delayp12to12one = function()
		portals.p12to12one:removeEventListener("collision", ps.delayp12to12one)
		timer.performWithDelay(1, ps.p12to12one)
	end
	
	portals.p12to12one:addEventListener("collision", ps.delayp12to12one)
	--========================================================
	-- PortalSwitchie.portal12to12one2
	ps.p12to12one2 = function()
	
		portals.p12to12one:addEventListener("collision", ps.delayp12to12one)
		ball.x = _W/2 - 120; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		print("p12to12one2")
		ps.mvballdown()
	
	end
	
	ps.delayp12to12one2 = function()
		portals.p12to12one2:removeEventListener("collision", ps.delayp12to12one2)	
		timer.performWithDelay(1, ps.p12to12one2)
	end
	
	portals.p12to12one2:addEventListener("collision", ps.delayp12to12one2)
	--========================================================
	-- PortalSwitchie.portal12to12two

	ps.p12to12two = function()
		portals.p12to12two2:addEventListener("collision", ps.delayp12to12two2)	
		ball.x = _W/2 + 42; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		print("p12to12two")
		ps.mvballup()
	
	end
	
	ps.delayp12to12two = function()
		portals.p12to12two:removeEventListener("collision", ps.delayp12to12two)
		timer.performWithDelay(1, ps.p12to12two)
	end
	
	portals.p12to12two:addEventListener("collision", ps.delayp12to12two)
	--========================================================
	-- PortalSwitchie.portal12to12two2
	ps.p12to12two2 = function()
	
		portals.p12to12two:addEventListener("collision", ps.delayp12to12two)
		ball.x = _W/2 - 42; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		print("p12to12two2")
		ps.mvballdown()
	
	end
	
	ps.delayp12to12two2 = function()
		portals.p12to12two2:removeEventListener("collision", ps.delayp12to12two2)	
		timer.performWithDelay(1, ps.p12to12two2)
	end
	
	portals.p12to12two2:addEventListener("collision", ps.delayp12to12two2)
	--========================================================
	-- PortalSwitchie.portal12to12three

	ps.p12to12three = function()
		portals.p12to12three2:addEventListener("collision", ps.delayp12to12three2)	
		ball.x = _W/2 + 120; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		print("p12to12three")
		ps.mvballup()
	
	end
	
	ps.delayp12to12three = function()
		portals.p12to12three:removeEventListener("collision", ps.delayp12to12three)
		timer.performWithDelay(1, ps.p12to12three)
	end
	
	portals.p12to12three:addEventListener("collision", ps.delayp12to12three)
	--========================================================
	-- PortalSwitchie.portal12to12three2
	ps.p12to12three2 = function()
	
		portals.p12to12three:addEventListener("collision", ps.delayp12to12three)
		ball.x = _W/2 + 42; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		print("p12to12three2")
		ps.mvballdown()
	
	end
	
	ps.delayp12to12three2 = function()
		portals.p12to12three2:removeEventListener("collision", ps.delayp12to12three2)	
		timer.performWithDelay(1, ps.p12to12three2)
	end
	
	portals.p12to12three2:addEventListener("collision", ps.delayp12to12three2)
	--========================================================
	-- PortalSwitchie.portal12to121

	ps.p12to121 = function()
	
		groups.g12.isVisible = false
		groups.g121.isVisible = true
		
		physics.removeBody(blocks.b12)
		physics.removeBody(portals.p12to12one)
		physics.removeBody(portals.p12to12one2)
		physics.removeBody(portals.p12to12two)
		physics.removeBody(portals.p12to12two2)
		physics.removeBody(portals.p12to12three)
		physics.removeBody(portals.p12to12three2)
		physics.removeBody(portals.p12to1)
		physics.removeBody(portals.p12to121)

		physics.addBody( blocks.b121, "static", physicsData:get("l7block121") )
		physics.addBody( portals.p121to12, "static", physicsData:get("l7portal121to12") )
	
		ball.x = _W/2 - 120; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p12to121")
	
	end
	
	ps.delayp12to121 = function()
		timer.performWithDelay(1, ps.p12to121)
	end
	
	portals.p12to121:addEventListener("collision", ps.delayp12to121)
	--========================================================
	-- PortalSwitchie.portal1to12

	ps.p121to12 = function()
	
		groups.g12.isVisible = true
		groups.g121.isVisible = false
		
		physics.removeBody(blocks.b121)
		physics.removeBody(portals.p121to12)

		physics.addBody( blocks.b12, "static", physicsData:get("l7block12") )
		physics.addBody( portals.p12to12one, "static", physicsData:get("l7portal12to12one") )
		physics.addBody( portals.p12to12one2, "static", physicsData:get("l7portal12to12one2") )
		physics.addBody( portals.p12to12two, "static", physicsData:get("l7portal12to12two") )
		physics.addBody( portals.p12to12two2, "static", physicsData:get("l7portal12to12two2") )
		physics.addBody( portals.p12to12three, "static", physicsData:get("l7portal12to12three") )
		physics.addBody( portals.p12to12three2, "static", physicsData:get("l7portal12to12three2") )
		physics.addBody( portals.p12to121, "static", physicsData:get("l7portal12to121") )
		physics.addBody( portals.p12to1, "static", physicsData:get("l7portal121to12") )
	
		ball.x = _W/2 + 120; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p121to12")
	
	end
	
	ps.delayp121to12 = function()
		timer.performWithDelay(1, ps.p121to12)
	end
	
	portals.p121to12:addEventListener("collision", ps.delayp121to12)
	--========================================================
	-- PortalSwitchie.portal11to111

	ps.p11to111 = function()
	
		groups.g11.isVisible = false
		groups.g111.isVisible = true
		
		physics.removeBody(blocks.b11)
		physics.removeBody(portals.p11to1)
		physics.removeBody(portals.p11to111)
		physics.removeBody(s.s1101)
		physics.removeBody(s.s1102)
		physics.removeBody(s.s11012)
		physics.removeBody(s.s11022)

		physics.addBody( blocks.b111, "static", physicsData:get("l7block111") )
		physics.addBody( spikes.s111, "static", physicsData:get("l7block111spikes") )
		physics.addBody( portals.p111to11, "static", physicsData:get("l7portal111to11") )
		physics.addBody( portals.p111to1111one, "static", physicsData:get("l7portal111to1111one") )
		physics.addBody( portals.p111to1111two, "static", physicsData:get("l7portal111to1111two") )
	
		ball.x = _W/2 + 110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p11to111")
	
	end
	
	ps.delayp11to111 = function()
		timer.performWithDelay(1, ps.p11to111)
	end
	
	portals.p11to111:addEventListener("collision", ps.delayp11to111)
	--========================================================
	-- PortalSwitchie.portal111to11

	ps.p111to11 = function()
	
		groups.g11.isVisible = true
		groups.g111.isVisible = false
		
		physics.removeBody(blocks.b111)
		physics.removeBody(portals.p111to11)
		physics.removeBody(portals.p111to1111one)
		physics.removeBody(portals.p111to1111two)
		physics.removeBody(spikes.s111)

		physics.addBody( blocks.b11, "static", physicsData:get("l7block11") )
		physics.addBody( portals.p11to1, "static", physicsData:get("l7portal11to1") )
		physics.addBody( portals.p11to111, "static", physicsData:get("l7portal11to111") )
		physics.addBody( s.s1101, "static", physicsData:get("l7s1101small") )
		physics.addBody( s.s11012, "static", physicsData:get("l7s1101big") )
		physics.addBody( s.s1102, "static", physicsData:get("l7s1102small") )
		physics.addBody( s.s11022, "static", physicsData:get("l7s1102big") )
		
		ball.x = _W/2 - 110; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p111to11")
	
	end
	
	ps.delayp111to11 = function()
		timer.performWithDelay(1, ps.p111to11)
	end
	
	portals.p111to11:addEventListener("collision", ps.delayp111to11)
	--========================================================
	-- PortalSwitchie.portal111to1111one

	ps.p111to1111one = function()
	
		groups.g111.isVisible = false
		groups.g1111.isVisible = true
		
		physics.removeBody(blocks.b111)
		physics.removeBody(portals.p111to11)
		physics.removeBody(portals.p111to1111one)
		physics.removeBody(portals.p111to1111two)
		physics.removeBody(spikes.s111)

		physics.addBody( blocks.b1111, "static", physicsData:get("l7block1111") )
		physics.addBody( portals.p1111to111one2, "static", physicsData:get("l7portal1111to111one2") )
		physics.addBody( portals.p1111to111two2, "static", physicsData:get("l7portal1111to111two2") )
		physics.addBody( flag, "static", {bounce = 0.2} )
	
		ball.x = _W/2 - 110; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p111to1111one")
	
	end
	
	ps.delayp111to1111one = function()
		timer.performWithDelay(1, ps.p111to1111one)
	end
	
	portals.p111to1111one:addEventListener("collision", ps.delayp111to1111one)
	--========================================================
	-- PortalSwitchie.portal1111to111one2

	ps.p1111to111one2 = function()
	
		groups.g111.isVisible = true
		groups.g1111.isVisible = false
		
		physics.removeBody(blocks.b1111)
		physics.removeBody(portals.p1111to111one2)
		physics.removeBody(portals.p1111to111two2)
		physics.removeBody(flag, "static")

		physics.addBody( blocks.b111, "static", physicsData:get("l7block111") )
		physics.addBody( spikes.s111, "static", physicsData:get("l7block111spikes") )
		physics.addBody( portals.p111to11, "static", physicsData:get("l7portal111to11") )
		physics.addBody( portals.p111to1111one, "static", physicsData:get("l7portal111to1111one") )
		physics.addBody( portals.p111to1111two, "static", physicsData:get("l7portal111to1111two") )
	
		
		ball.x = _W/2 - 42; ball.y = _H/2 + 110
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p1111to111one2")
	
	end
	
	ps.delayp1111to111one2 = function()
		timer.performWithDelay(1, ps.p1111to111one2)
	end
	
	portals.p1111to111one2:addEventListener("collision", ps.delayp1111to111one2)
	--========================================================
	-- PortalSwitchie.portal111to1111one

	ps.p111to1111two = function()
	
		groups.g111.isVisible = false
		groups.g1111.isVisible = true
		
		physics.removeBody(blocks.b111)
		physics.removeBody(portals.p111to11)
		physics.removeBody(portals.p111to1111one)
		physics.removeBody(portals.p111to1111two)
		physics.removeBody(spikes.s111)

		physics.addBody( blocks.b1111, "static", physicsData:get("l7block1111") )
		physics.addBody( portals.p1111to111one2, "static", physicsData:get("l7portal1111to111one2") )
		physics.addBody( portals.p1111to111two2, "static", physicsData:get("l7portal1111to111two2") )
		physics.addBody( flag, "static", {bounce = 0.2} )
	
		ball.x = _W/2 + 42; ball.y = _H/2 - 106
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p111to1111two")
	
	end
	
	ps.delayp111to1111two = function()
		timer.performWithDelay(1, ps.p111to1111two)
	end
	
	portals.p111to1111two:addEventListener("collision", ps.delayp111to1111two)
	--========================================================
	-- PortalSwitchie.portal1111to111one2

	ps.p1111to111two2 = function()
	
		groups.g111.isVisible = true
		groups.g1111.isVisible = false
		
		physics.removeBody(blocks.b1111)
		physics.removeBody(portals.p1111to111one2)
		physics.removeBody(portals.p1111to111two2)
		physics.removeBody(flag, "static")

		physics.addBody( blocks.b111, "static", physicsData:get("l7block111") )
		physics.addBody( spikes.s111, "static", physicsData:get("l7block111spikes") )
		physics.addBody( portals.p111to11, "static", physicsData:get("l7portal111to11") )
		physics.addBody( portals.p111to1111one, "static", physicsData:get("l7portal111to1111one") )
		physics.addBody( portals.p111to1111two, "static", physicsData:get("l7portal111to1111two") )
	
		
		ball.x = _W/2 + 42; ball.y = _H/2 + 110
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p1111to111two2")
	
	end
	
	ps.delayp1111to111two2 = function()
		timer.performWithDelay(1, ps.p1111to111two2)
	end
	
	portals.p1111to111two2:addEventListener("collision", ps.delayp1111to111two2)
--=============================================================================================================================================================	
	--========================================================
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
		ispassed.l7 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl8")
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
		storyboard.gotoScene("restartl7", "fade", 100)
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
	spikes.s111.collision = restarthtp
	
	flag:addEventListener("collision",	flag)
	spikes.s111:addEventListener("collision", spikes.s111)
	
	group:insert(background);
	group:insert(ball)
	group:insert(miniball)
	group:insert(groups.g1)
	group:insert(groups.g11)
	group:insert(groups.g111)
	group:insert(groups.g1111)
	group:insert(groups.g12)
	group:insert(groups.g121)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 7 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	spikes.s111:removeEventListener("collision", spikes.s111)
	arrowdata.ballissmall = 0
	
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