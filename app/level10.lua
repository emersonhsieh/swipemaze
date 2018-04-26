--Level10:  kinda like level 2

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
local check3a, check3b

local blinkbs, blinkbs2
local l10bs1201, l10bs1201cover
local stopbs

playarrowsound = function()
    audio.play( sfx.arrowpop )
end

-- Lua Tables: Groups, Blocks, Spikes, Portals, 
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

local bs = {}

arrowdata.ah1102= 0
arrowdata.ah1101= 0
arrowdata.ah101= 0
arrowdata.ah11101= 0
arrowdata.g111ar1 = 0
arrowdata.g111ar2 = 0
arrowdata.g12ar1 = 0
arrowdata.g12ar2 = 0
arrowdata.g12al1 = 0
arrowdata.g12al2 = 0
arrowdata.continue = 0
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
local physicsData = (require "bl10block").physicsData(scaleFactor)
--=======================================================================================================================================================
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
	ca.g111ar1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g111ar1 collided, g111ar1 +1")
			playarrowsound();
		arrowdata.g111ar1 = 1

		end
	end
	ca.g111ar2 = function(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g111ar2 collided, g111ar2 +1")
			playarrowsound();
		arrowdata.g111ar2 = 1

		end
	end
	ca.g12ar1 = function(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g12ar1 collided, g12ar1 +1")
			playarrowsound();
		arrowdata.g12ar1 = 1

		end
	end
	ca.g12ar2 = function(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g12ar2 collided, g12ar2 +1")
			playarrowsound();
		arrowdata.g12ar2 = 1

		end
	end
	ca.g12al1 = function(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g12al1 collided, g12al1 +1")
			playarrowsound();
		arrowdata.g12al1 = 1

		end
	end
	ca.g12al2 = function(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g12al2 collided, g12al2 +1")
			playarrowsound();
		arrowdata.g12al2 = 1

		end
	end
--=======================================================================================================================================================
ps.entergroup1 = function()
	groups.g1.isVisible = true
	physics.addBody( blocks.b1, "static", physicsData:get("l10block1") )
	physics.addBody( portals.p1to11, "static", physicsData:get("l10p1to11") )
	physics.addBody( portals.p1to12, "static", physicsData:get("l10p1to12") )
	physics.addBody( portals.p1to111, "static", physicsData:get("l10p1to111") )
	physics.addBody( portals.p1to12a, "static", physicsData:get("l10p1to12a") )
	physics.addBody( portals.p1to11f, "static", physicsData:get("l10p1to11f") )
	physics.addBody( portals.p1totr, "static", physicsData:get("l10p1totr") )
	physics.addBody( h.h101, "static", physicsData:get("l10h101") )
	physics.addBody( flag, "static", {bounce = 0.2})
	physics.addBody( ah.ah1102, "static", physicsData:get("l10ah1102") )
	physics.addBody( ah.ah1101, "static", physicsData:get("l10ah1101") )
end
ps.entergroup11 = function()
	groups.g11.isVisible = true
	physics.addBody( blocks.b11, "static", physicsData:get("l10block11") )
	physics.addBody( portals.p11to1, "static", physicsData:get("l10p11to1") )
	physics.addBody( portals.p11totr, "static", physicsData:get("l10p11totr") )
	physics.addBody( portals.p11to1f, "static", physicsData:get("l10p11to1f") )
	physics.addBody( portals.p11to111, "static", physicsData:get("l10p11to111") )
	physics.addBody( h.h1101, "static", physicsData:get("l10h1101") )
	physics.addBody( h.h1102, "static", physicsData:get("l10h1102") )
	physics.addBody( ah.ah101, "static", physicsData:get("l10ah101") )
end
ps.entergroup111 = function()
	groups.g111.isVisible = true
	physics.addBody( blocks.b111, "static", physicsData:get("l10block111") )
	physics.addBody( spikes.s111, "static", physicsData:get("l10block111spikes") )
	physics.addBody( portals.p111to1, "static", physicsData:get("l10p111to1") )
	physics.addBody( portals.p111to11, "static", physicsData:get("l10p111to11") )
	physics.addBody( h.h11101, "static", physicsData:get("l10h11101") )
	physics.addBody( ah.ah11101, "static", physicsData:get("l10ah11101") )
	if arrowdata.g111ar1==0 then
		print("added g111ar1 physics")
		physics.addBody( a.g111ar1, "static", { isSensor = true} )
	elseif arrowdata.g111ar1==1 then
		print("skipped g111ar1, no adding physics")
	end
	if arrowdata.g111ar2==0 then
		print("added g111ar2 physics")
		physics.addBody( a.g111ar2, "static", { isSensor = true} )
	elseif arrowdata.g111ar2==1 then
		print("skipped g111ar2, no adding physics")
	end
end
ps.entergroup12 = function()
	groups.g12.isVisible = true
	physics.addBody( blocks.b12, "static", physicsData:get("l10block12") )
	physics.addBody( spikes.s12, "static", physicsData:get("l10block12spikes") )
	physics.addBody( portals.p12to1, "static", physicsData:get("l10p12to1") )
	physics.addBody( portals.p12to1a, "static", physicsData:get("l10p12to1a") )
	if arrowdata.g12ar1==0 then
		print("added g12ar1 physics")
		physics.addBody( a.g12ar1, "static", { isSensor = true} )
	elseif arrowdata.g12ar1==1 then
		print("skipped g12ar1, no adding physics")
	end
	if arrowdata.g12ar2==0 then
		print("added g12ar2 physics")
		physics.addBody( a.g12ar2, "static", { isSensor = true} )
	elseif arrowdata.g12ar2==1 then
		print("skipped g12ar2, no adding physics")
	end
	if arrowdata.g12al1==0 then
		print("added g12al1 physics")
		physics.addBody( a.g12al1, "static", { isSensor = true} )
	elseif arrowdata.g12al1==1 then
		print("skipped g12al1, no adding physics")
	end
	if arrowdata.g12al2==0 then
		print("added g12al2 physics")
		physics.addBody( a.g12al2, "static", { isSensor = true} )
	elseif arrowdata.g12al2==1 then
		print("skipped g12al2, no adding physics")
	end
	arrowdata.continue = 1
	stopbs = function()
		physics.removeBody(l10bs1201)
		physics.removeBody(l10bs1201cover)
		blinkbs = nil
		blinkbs2 = nil
	end
	blinkbs = function()
		l10bs1201.isVisible = false
		physics.removeBody(l10bs1201)
		physics.removeBody(l10bs1201cover)
		if arrowdata.continue == 1 then
			timer.performWithDelay(500, blinkbs2)
		else
			stopbs();
		end
	end
	
	blinkbs2 = function()
		l10bs1201.isVisible = true
		physics.addBody( l10bs1201, "static", physicsData:get("l10bs1201") )
		physics.addBody( l10bs1201cover, "static", physicsData:get("l10bs1201cover") )
		if arrowdata.continue == 1 then
			timer.performWithDelay(500, blinkbs)
		else
			stopbs();
		end	
		
	end
	
	blinkbs();
	
end
ps.entergrouptr = function()
	groups.gtr.isVisible = true
	physics.addBody( blocks.btr, "static", physicsData:get("l10blocktr") )
	physics.addBody( portals.ptrto1, "static", physicsData:get("l10ptrto1") )
	physics.addBody( portals.ptrto11, "static", physicsData:get("l10ptrto11") )
	physics.addBody( portals.ptrtotrd1, "static", physicsData:get("l10ptrtotrd1") )
	physics.addBody( portals.ptrtotrd2, "static", physicsData:get("l10ptrtotrd2") )
	physics.addBody( h.htr, "static", physicsData:get("l10htr") )
	physics.addBody( ah.ahtr, "static", physicsData:get("l10ahtr") )
end
ps.entergrouptrd = function()
	groups.gtrd.isVisible = true
	physics.addBody( blocks.btrd, "static", physicsData:get("l10blocktrd") )
	physics.addBody( spikes.strd, "static", physicsData:get("l10blocktrdspikes") )
end
--========================================================
ps.exitgroup1 = function()
	groups.g1.isVisible = false
	physics.removeBody(blocks.b1)
	physics.removeBody(portals.p1to11)
	physics.removeBody(portals.p1to12)
	physics.removeBody(portals.p1to111)
	physics.removeBody(portals.p1to12a)
	physics.removeBody(portals.p1to11f)
	physics.removeBody(portals.p1totr)
	physics.removeBody(flag)
	physics.removeBody(h.h101)
	physics.removeBody(ah.ah1102)
	physics.removeBody(ah.ah1101)
end
ps.exitgroup11 = function()
	groups.g11.isVisible = false
	physics.removeBody(blocks.b11)
	physics.removeBody(portals.p11to1)
	physics.removeBody(portals.p11totr)
	physics.removeBody(portals.p11to1f)
	physics.removeBody(portals.p11to111)
	physics.removeBody(h.h1101)
	physics.removeBody(h.h1102)
	physics.removeBody(ah.ah101)
end
ps.exitgroup111 = function()
	groups.g111.isVisible = false
	physics.removeBody(blocks.b111)
	physics.removeBody(spikes.s111)
	physics.removeBody(portals.p111to1)
	physics.removeBody(portals.p111to11)
	physics.removeBody(h.h11101)
	physics.removeBody(ah.ah11101)
	if arrowdata.g111ar1==0 then
		print("removed g111ar1 physics")
		physics.removeBody( a.g111ar1 )
	elseif arrowdata.g111ar1==1 then
		print("skipped g111ar1, no removing physics")
	end
	if arrowdata.g111ar2==0 then
		print("removed g111ar2 physics")
		physics.removeBody( a.g111ar2 )
	elseif arrowdata.g111ar2==1 then
		print("skipped g111ar2, no removing physics")
	end
end
ps.exitgroup12 = function()
	groups.g12.isVisible = false
	physics.removeBody(blocks.b12)
	physics.removeBody(spikes.s12)
	physics.removeBody(portals.p12to1)
	physics.removeBody(portals.p12to1a)
	if arrowdata.g12ar1==0 then
		print("removed g12ar1 physics")
		physics.removeBody( a.g12ar1 )
	elseif arrowdata.g12ar1==1 then
		print("skipped g12ar1, no removing physics")
	end
	if arrowdata.g12ar2==0 then
		print("removed g12ar2 physics")
		physics.removeBody( a.g12ar2 )
	elseif arrowdata.g12ar2==1 then
		print("skipped g12ar2, no removing physics")
	end
	if arrowdata.g12al1==0 then
		print("removed g12al1 physics")
		physics.removeBody( a.g12al1 )
	elseif arrowdata.g12al1==1 then
		print("skipped g12al1, no removing physics")
	end
	if arrowdata.g12al2==0 then
		print("removed g12al2 physics")
		physics.removeBody( a.g12al2 )
	elseif arrowdata.g12al2==1 then
		print("skipped g12al2, no removing physics")
	end
	arrowdata.continue = 0
end
ps.exitgrouptr = function()
	groups.gtr.isVisible = false
	physics.removeBody(blocks.btr)
	physics.removeBody(portals.ptrto1)
	physics.removeBody(portals.ptrto11)
	physics.removeBody(portals.ptrtotrd1)
	physics.removeBody(portals.ptrtotrd2)
	physics.removeBody(h.htr)
	physics.removeBody(ah.ahtr)
end
ps.exitgrouptrd = function()
	groups.gtrd.isVisible = false
	physics.removeBody(blocks.btrd)
	physics.removeBody(spikes.strd)
end
--=======================================================================================================================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2-42; ball.y = _H/2-200
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
	-- Group 1
	groups.g1 = display.newGroup()
	
	blocks.b1 = display.newImageRect("l10block1.png", 320, 480)
	blocks.b1.x = _W/2; blocks.b1.y = _H/2
	physics.addBody( blocks.b1, "static", physicsData:get("l10block1") )
	
	portals.p1to11 = display.newImageRect("blank.png", 320, 480)
	portals.p1to11.x = _W/2; portals.p1to11.y = _H/2
	physics.addBody( portals.p1to11, "static", physicsData:get("l10p1to11") )
	
	portals.p1to12 = display.newImageRect("blank.png", 320, 480)
	portals.p1to12.x = _W/2; portals.p1to12.y = _H/2
	physics.addBody( portals.p1to12, "static", physicsData:get("l10p1to12") )
	
	portals.p1to111 = display.newImageRect("blank.png", 320, 480)
	portals.p1to111.x = _W/2; portals.p1to111.y = _H/2
	physics.addBody( portals.p1to111, "static", physicsData:get("l10p1to111") )
	
	portals.p1to12a = display.newImageRect("blank.png", 320, 480)
	portals.p1to12a.x = _W/2; portals.p1to12a.y = _H/2
	physics.addBody( portals.p1to12a, "static", physicsData:get("l10p1to12a") )
	
	portals.p1to11f = display.newImageRect("blank.png", 320, 480)
	portals.p1to11f.x = _W/2; portals.p1to11f.y = _H/2
	physics.addBody( portals.p1to11f, "static", physicsData:get("l10p1to11f") )
	
	portals.p1totr = display.newImageRect("blank.png", 320, 480)
	portals.p1totr.x = _W/2; portals.p1totr.y = _H/2
	physics.addBody( portals.p1totr, "static", physicsData:get("l10p1totr") )
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2-120; flag.y = _H/2+116
	physics.addBody( flag, "static", {bounce = 0.2})
	
	h.h101 = display.newImageRect("l10h101.png", 320, 480)
	h.h101.x = _W/2; h.h101.y = _H/2
	physics.addBody( h.h101, "static", physicsData:get("l10h101") )
	
	ah.ah1102 = display.newImageRect("blank.png", 320, 480)
	ah.ah1102.x = _W/2; ah.ah1102.y = _H/2
	physics.addBody( ah.ah1102, "static", physicsData:get("l10ah1102") )
	
	ah.ah1102over = display.newImageRect("l10ah1102over.png", 320, 480)
	ah.ah1102over.x = _W/2; ah.ah1102over.y = _H/2
	ah.ah1102over.isVisible = false
	
	
	local dah1102
	
	local cah1102 = function()
		transition.to(h.h1102, {time=3000, x=(_W/2+80), transition = easing.inQuad})
		print("h.h1102 opened!")
		arrowdata.ah1102= 1
		ah.ah1102over.isVisible = true
		dah1102();
	end
	
	dah1102 = function()
		ah.ah1102:removeEventListener("collision", cah1102)
	end
	
	ah.ah1102:addEventListener("collision", cah1102)
	
	
	ah.ah1101 = display.newImageRect("blank.png", 320, 480)
	ah.ah1101.x = _W/2; ah.ah1101.y = _H/2
	physics.addBody( ah.ah1101, "static", physicsData:get("l10ah1101") )

	ah.ah1101over = display.newImageRect("l10ah1101over.png", 320, 480)
	ah.ah1101over.x = _W/2; ah.ah1101over.y = _H/2
	ah.ah1101over.isVisible = false
	
	local dah1101
	
	local cah1101 = function()
		transition.to(h.h1101, {time=3000, y=(_H/2-80), transition = easing.inQuad})
		print("h.h1101 opened!")
		arrowdata.ah1101= 1
		ah.ah1101over.isVisible = true
		dah1101();
	end
	
	dah1101 = function()
		ah.ah1101:removeEventListener("collision", cah1101)
	end
	
	ah.ah1101:addEventListener("collision", cah1101)

	groups.g1:insert(flag)
	groups.g1:insert(portals.p1to11)
	groups.g1:insert(portals.p1to12)
	groups.g1:insert(portals.p1to111)
	groups.g1:insert(portals.p1to12a)
	groups.g1:insert(portals.p1to11f)
	groups.g1:insert(portals.p1totr)
	groups.g1:insert(blocks.b1)
	groups.g1:insert(h.h101)
	groups.g1:insert(ah.ah1102)
	groups.g1:insert(ah.ah1102over)
	groups.g1:insert(ah.ah1101)
	groups.g1:insert(ah.ah1101over)
	groups.g1.isVisible = true
	--========================================================
	groups.g11 = display.newGroup()
	
	blocks.b11 = display.newImageRect("l10block11.png", 320, 480)
	blocks.b11.x = _W/2; blocks.b11.y = _H/2
	
	portals.p11to1 = display.newImageRect("blank.png", 320, 480)
	portals.p11to1.x = _W/2; portals.p11to1.y = _H/2
	
	portals.p11totr = display.newImageRect("blank.png", 320, 480)
	portals.p11totr.x = _W/2; portals.p11totr.y = _H/2
	
	portals.p11to1f = display.newImageRect("blank.png", 320, 480)
	portals.p11to1f.x = _W/2; portals.p11to1f.y = _H/2
	
	portals.p11to111 = display.newImageRect("blank.png", 320, 480)
	portals.p11to111.x = _W/2; portals.p11to111.y = _H/2
	
	h.h1101 = display.newImageRect("l10h1101.png", 320, 480)
	h.h1101.x = _W/2; h.h1101.y = _H/2
	
	h.h1102 = display.newImageRect("l10h1102.png", 320, 480)
	h.h1102.x = _W/2; h.h1102.y = _H/2
	
	ah.ah101 = display.newImageRect("blank.png", 320, 480)
	ah.ah101.x = _W/2; ah.ah101.y = _H/2

	ah.ah101over = display.newImageRect("l10ah101over.png", 320, 480)
	ah.ah101over.x = _W/2; ah.ah101over.y = _H/2
	ah.ah101over.isVisible = false
	
	local dah101
	
	local cah101 = function()
		transition.to(h.h101, {time=3000, x=(_W/2+76), transition = easing.inQuad})
		print("h.h101 opened!")
		arrowdata.ah101= 1
		ah.ah101over.isVisible = true
		dah101();
	end
	
	dah101 = function()
		ah.ah101:removeEventListener("collision", cah101)
	end
	
	ah.ah101:addEventListener("collision", cah101)
	
	groups.g11:insert(blocks.b11)
	groups.g11:insert(portals.p11to1)
	groups.g11:insert(portals.p11totr)
	groups.g11:insert(portals.p11to1f)
	groups.g11:insert(portals.p11to111)
	groups.g11:insert(h.h1101)
	groups.g11:insert(h.h1102)
	groups.g11:insert(ah.ah101)
	groups.g11:insert(ah.ah101over)
	groups.g11.isVisible = false
	--========================================================
	groups.g111 = display.newGroup()
	
	blocks.b111 = display.newImageRect("l10block111.png", 320, 480)
	blocks.b111.x = _W/2; blocks.b111.y = _H/2
	
	spikes.s111 = display.newImageRect("blank.png", 1, 1)
	spikes.s111.x = _W/2; spikes.s111.y = _H/2
	
	portals.p111to11 = display.newImageRect("blank.png", 320, 480)
	portals.p111to11.x = _W/2; portals.p111to11.y = _H/2
	
	portals.p111to1 = display.newImageRect("blank.png", 320, 480)
	portals.p111to1.x = _W/2; portals.p111to1.y = _H/2
	
	h.h11101 = display.newImageRect("l10h11101.png", 320, 480)
	h.h11101.x = _W/2; h.h11101.y = _H/2
	
	ah.ah11101 = display.newImageRect("blank.png", 320, 480)
	ah.ah11101.x = _W/2; ah.ah11101.y = _H/2

	ah.ah11101over = display.newImageRect("l10ah11101over.png", 320, 480)
	ah.ah11101over.x = _W/2; ah.ah11101over.y = _H/2
	ah.ah11101over.isVisible = false
	
	local dah11101
	
	local cah11101 = function()
		transition.to(h.h11101, {time=3000, y=(_H/2+80), transition = easing.inQuad})
		print("h.h11101 opened!")
		arrowdata.ah11101= 1
		ah.ah11101over.isVisible = true
		dah11101();
	end
	
	dah11101 = function()
		ah.ah11101:removeEventListener("collision", cah11101)
	end
	
	ah.ah11101:addEventListener("collision", cah11101)
	
	a.g111ar1 = display.newImageRect("arrowright.png", 28, 32)
	a.g111ar1.x = _W/2+10; a.g111ar1.y = _H/2+200
	
	a.g111ar2 = display.newImageRect("arrowright.png", 28, 32)
	a.g111ar2.x = _W/2+60; a.g111ar2.y = _H/2+200
	
	a.g111ar1:addEventListener("collision", ca.g111ar1)
	a.g111ar2:addEventListener("collision", ca.g111ar2)
	
	groups.g111:insert(blocks.b111)
	groups.g111:insert(spikes.s111)
	groups.g111:insert(portals.p111to11)
	groups.g111:insert(portals.p111to1)
	groups.g111:insert(ah.ah11101)
	groups.g111:insert(ah.ah11101over)
	groups.g111:insert(h.h11101)
	groups.g111:insert(a.g111ar1)
	groups.g111:insert(a.g111ar2)
	groups.g111.isVisible = false
	--========================================================
	groups.g12 = display.newGroup()
	
	blocks.b12 = display.newImageRect("l10block12.png", 320, 480)
	blocks.b12.x = _W/2; blocks.b12.y = _H/2
	
	spikes.s12 = display.newImageRect("blank.png", 1, 1)
	spikes.s12.x = _W/2; spikes.s12.y = _H/2
	
	portals.p12to1 = display.newImageRect("blank.png", 320, 480)
	portals.p12to1.x = _W/2; portals.p12to1.y = _H/2
	
	portals.p12to1a = display.newImageRect("blank.png", 320, 480)
	portals.p12to1a.x = _W/2; portals.p12to1a.y = _H/2
	
	a.g12ar1 = display.newImageRect("arrowright.png", 28, 32)
	a.g12ar1.x = _W/2; a.g12ar1.y = _H/2-200
	
	a.g12ar2 = display.newImageRect("arrowright.png", 28, 32)
	a.g12ar2.x = _W/2; a.g12ar2.y = _H/2-116
	
	a.g12ar1:addEventListener("collision", ca.g12ar1)
	a.g12ar2:addEventListener("collision", ca.g12ar2)
	
	a.g12al1 = display.newImageRect("arrowleft.png", 28, 32)
	a.g12al1.x = _W/2-10; a.g12al1.y = _H/2+200
	
	a.g12al2 = display.newImageRect("arrowleft.png", 28, 32)
	a.g12al2.x = _W/2-60; a.g12al2.y = _H/2+200
	
	a.g12al1:addEventListener("collision", ca.g12al1)
	a.g12al2:addEventListener("collision", ca.g12al2)
	
	l10bs1201 = display.newImageRect("l10bs1201.png", 320, 480)
	l10bs1201.x = _W/2; l10bs1201.y = _H/2
	
	l10bs1201cover = display.newImageRect("blank.png", 320, 480)
	l10bs1201cover.x = _W/2; l10bs1201cover.y = _H/2
	
	groups.g12:insert(blocks.b12)
	groups.g12:insert(spikes.s12)
	groups.g12:insert(portals.p12to1)
	groups.g12:insert(portals.p12to1a)
	groups.g12:insert(a.g12ar1)
	groups.g12:insert(a.g12ar2)
	groups.g12:insert(a.g12al1)
	groups.g12:insert(a.g12al2)
	groups.g12:insert(l10bs1201)
	groups.g12:insert(l10bs1201cover)
	groups.g12.isVisible = false
	--========================================================
	groups.gtr = display.newGroup()
	
	blocks.btr = display.newImageRect("l10blocktr.png", 320, 480)
	blocks.btr.x = _W/2; blocks.btr.y = _H/2
	
	portals.ptrto1 = display.newImageRect("blank.png", 320, 480)
	portals.ptrto1.x = _W/2; portals.ptrto1.y = _H/2

	portals.ptrto11 = display.newImageRect("blank.png", 320, 480)
	portals.ptrto11.x = _W/2; portals.ptrto11.y = _H/2
	
	portals.ptrtotrd1 = display.newImageRect("blank.png", 320, 480)
	portals.ptrtotrd1.x = _W/2; portals.ptrtotrd1.y = _H/2
	
	portals.ptrtotrd2 = display.newImageRect("blank.png", 320, 480)
	portals.ptrtotrd2.x = _W/2; portals.ptrtotrd2.y = _H/2
	
	h.htr = display.newImageRect("l10htr.png", 320, 480)
	h.htr.x = _W/2; h.htr.y = _H/2
	
	ah.ahtr = display.newImageRect("blank.png", 320, 480)
	ah.ahtr.x = _W/2; ah.ahtr.y = _H/2

	ah.ahtrover = display.newImageRect("l10ahtrover.png", 320, 480)
	ah.ahtrover.x = _W/2; ah.ahtrover.y = _H/2
	ah.ahtrover.isVisible = false
	
	local dahtr
	
	local cahtr = function()
		transition.to(h.htr, {time=3000, x=(_W/2-80), transition = easing.inQuad})
		print("h.htr opened!")
		arrowdata.ahtr= 1
		ah.ahtrover.isVisible = true
		dahtr();
	end
	
	dahtr = function()
		ah.ahtr:removeEventListener("collision", cahtr)
	end
	
	ah.ahtr:addEventListener("collision", cahtr)
	
	groups.gtr:insert(blocks.btr)
	groups.gtr:insert(portals.ptrto1)
	groups.gtr:insert(portals.ptrto11)
	groups.gtr:insert(portals.ptrtotrd1)
	groups.gtr:insert(portals.ptrtotrd2)
	groups.gtr:insert(h.htr)
	groups.gtr:insert(ah.ahtr)
	groups.gtr:insert(ah.ahtrover)
	groups.gtr.isVisible = false
	--========================================================
	groups.gtrd = display.newGroup()
	
	blocks.btrd = display.newImageRect("l10blocktrd.png", 320, 480)
	blocks.btrd.x = _W/2; blocks.btrd.y = _H/2
	
	spikes.strd = display.newImageRect("blank.png", 1, 1)
	spikes.strd.x = _W/2; spikes.strd.y = _H/2
	
	groups.gtrd:insert(blocks.btrd)
	groups.gtrd:insert(spikes.strd)
	groups.gtrd.isVisible = false
	--========================================================
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
	-- ps.p1to11
	ps.p1to11 = function()
	
		ps.exitgroup1();
		ps.entergroup11();
		
		ball.x = _W/2 - 120; ball.y = _H/2 +190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
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
		
		ball.x = _W/2 - 120; ball.y = _H/2 -190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p11to1")
	
	end
	
	ps.delayp11to1 = function()
		timer.performWithDelay(1, ps.p11to1)
	end
	
	portals.p11to1:addEventListener("collision", ps.delayp11to1)
	--========================================================
	-- ps.p11to111
	ps.p11to111 = function()
	
		ps.exitgroup11();
		ps.entergroup111();
		
		ball.x = _W/2 + 42; ball.y = _H/2 -50
		local stopball = function()
			ball:setLinearVelocity(0, 0)
		end
		timer.performWithDelay(1, stopball)
		timer.performWithDelay(2, ps.mvballup)
		print("p11to111")
	
	end
	
	ps.delayp11to111 = function()
		timer.performWithDelay(1, ps.p11to111)
	end
	
	portals.p11to111:addEventListener("collision", ps.delayp11to111)
	--========================================================
	-- ps.p111to11
	ps.p111to11 = function()
	
		ps.exitgroup111();
		ps.entergroup11();
		
		ball.x = _W/2 + 42; ball.y = _H/2 +50
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p111to11")
	
	end
	
	ps.delayp111to11 = function()
		timer.performWithDelay(1, ps.p111to11)
	end
	
	portals.p111to11:addEventListener("collision", ps.delayp111to11)
	--========================================================
	-- ps.p1to11f
	ps.p1to11f = function()
	
		ps.exitgroup1();
		ps.entergroup11();
		
		ball.x = _W/2 + 52; ball.y = _H/2 - 42
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p1to11f")
	
	end
	
	ps.delayp1to11f = function()
		timer.performWithDelay(1, ps.p1to11f)
	end
	
	portals.p1to11f:addEventListener("collision", ps.delayp1to11f)
	--========================================================
	-- ps.p11to1f
	ps.p11to1f = function()
	
		ps.exitgroup11();
		ps.entergroup1();
		
		ball.x = _W/2 + 110; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p11to1f")
	
	end
	
	ps.delayp11to1f = function()
		timer.performWithDelay(1, ps.p11to1f)
	end
	
	portals.p11to1f:addEventListener("collision", ps.delayp11to1f)
	--========================================================
	-- ps.p111to1
	ps.p111to1 = function()
	
		ps.exitgroup111();
		ps.entergroup1();
		
		ball.x = _W/2 + 52; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p111to1")
	
	end
	
	ps.delayp111to1 = function()
		timer.performWithDelay(1, ps.p111to1)
	end
	
	portals.p111to1:addEventListener("collision", ps.delayp111to1)
	--========================================================
	-- ps.p1to111
	ps.p1to111 = function()
	
		ps.exitgroup1();
		ps.entergroup111();
		
		ball.x = _W/2 + 110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1to111")
	
	end
	
	ps.delayp1to111 = function()
		timer.performWithDelay(1, ps.p1to111)
	end
	
	portals.p1to111:addEventListener("collision", ps.delayp1to111)
	--========================================================
	-- ps.p1to12
	ps.p1to12 = function()
	
		ps.exitgroup1();
		ps.entergroup12();
		
		ball.x = _W/2 - 120; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
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
		
		ball.x = _W/2 + 120; ball.y = _H/2 + 30
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p12to1")
	
	end
	
	ps.delayp12to1 = function()
		timer.performWithDelay(1, ps.p12to1)
	end
	
	portals.p12to1:addEventListener("collision", ps.delayp12to1)
	--========================================================
	-- ps.p1to12a
	ps.p1to12a = function()
	
		ps.exitgroup1();
		ps.entergroup12();
		
		ball.x = _W/2 - 110; ball.y = _H/2 + 40
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p1to12a")
	
	end
	
	ps.delayp1to12a = function()
		timer.performWithDelay(1, ps.p1to12a)
	end
	
	portals.p1to12a:addEventListener("collision", ps.delayp1to12a)
	--========================================================
	-- ps.p12to1a
	ps.p12to1a = function()
	
		ps.exitgroup12();
		ps.entergroup1();
		
		ball.x = _W/2 + 110; ball.y = _H/2 + 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p12to1a")
	
	end
	
	ps.delayp12to1a = function()
		timer.performWithDelay(1, ps.p12to1a)
	end
	
	portals.p12to1a:addEventListener("collision", ps.delayp12to1a)
	--========================================================
	-- ps.p1totr
	ps.p1totr = function()
	
		ps.exitgroup1();
		ps.entergrouptr();
		
		ball.x = _W/2 + 100; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1totr")
	
	end
	
	ps.delayp1totr = function()
		timer.performWithDelay(1, ps.p1totr)
	end
	
	portals.p1totr:addEventListener("collision", ps.delayp1totr)
	--========================================================
	-- ps.ptrto1
	ps.ptrto1 = function()
	
		ps.exitgrouptr();
		ps.entergroup1();
		
		ball.x = _W/2 - 32; ball.y = _H/2 - 40
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("ptrto1")
	
	end
	
	ps.delayptrto1 = function()
		timer.performWithDelay(1, ps.ptrto1)
	end
	
	portals.ptrto1:addEventListener("collision", ps.delayptrto1)
	--========================================================
	-- ps.p11totr
	ps.p11totr = function()
	
		ps.exitgroup11();
		ps.entergrouptr();
		
		ball.x = _W/2 - 110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p11totr")
	
	end
	
	ps.delayp11totr = function()
		timer.performWithDelay(1, ps.p11totr)
	end
	
	portals.p11totr:addEventListener("collision", ps.delayp11totr)
	--========================================================
	-- ps.ptrto11
	ps.ptrto11 = function()
	
		ps.exitgrouptr();
		ps.entergroup11();
		
		ball.x = _W/2; ball.y = _H/2 - 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("ptrto11")
	
	end
	
	ps.delayptrto11 = function()
		timer.performWithDelay(1, ps.ptrto11)
	end
	
	portals.ptrto11:addEventListener("collision", ps.delayptrto11)
	--========================================================
	-- ps.ptrtotrd1
	ps.ptrtotrd1 = function()
	
		ps.exitgrouptr();
		ps.entergrouptrd();
		
		ball.x = _W/2 + 120; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -5, 0, ball.x, ball.y )
		print("ptrtotrd1")
	
	end
	
	ps.delayptrtotrd1 = function()
		timer.performWithDelay(1, ps.ptrtotrd1)
	end
	
	portals.ptrtotrd1:addEventListener("collision", ps.delayptrtotrd1)
	--========================================================
	-- ps.ptrtotrd2
	ps.ptrtotrd2 = function()
	
		ps.exitgrouptr();
		ps.entergrouptrd();
		
		ball.x = _W/2 + 120; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -5, 0, ball.x, ball.y )
		print("ptrtotrd2")
	
	end
	
	ps.delayptrtotrd2 = function()
		timer.performWithDelay(1, ps.ptrtotrd2)
	end
	
	portals.ptrtotrd2:addEventListener("collision", ps.delayptrtotrd2)
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
		ispassed.l10 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl11")
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
		storyboard.gotoScene("restartl10", "fade", 100)
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
	spikes.s12.collision = restarthtp
	spikes.strd.collision = restarthtp
	l10bs1201.collision = restarthtp

	flag:addEventListener("collision", flag)
	spikes.s111:addEventListener("collision", spikes.s111)
	spikes.s12:addEventListener("collision", spikes.s12)
	spikes.strd:addEventListener("collision", spikes.strd)
	l10bs1201:addEventListener("collision", l10bs1201)

	group:insert(background);
	group:insert(ball)
	group:insert(groups.g1)
	group:insert(groups.g11)
	group:insert(groups.g111)
	group:insert(groups.g12)
	group:insert(groups.gtr)
	group:insert(groups.gtrd)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)
	
end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 10 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )

	arrowdata.ah1102= 0
	arrowdata.ah1101= 0
	arrowdata.ah101= 0
	arrowdata.ah11101= 0
	arrowdata.ahtr= 0
	arrowdata.g111ar1 = 0
	arrowdata.g111ar2 = 0
	arrowdata.g12ar1 = 0
	arrowdata.g12ar2 = 0
	arrowdata.g12al1 = 0
	arrowdata.g12al2 = 0


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)

	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	spikes.s111:removeEventListener("collision", spikes.s111)
	spikes.s12:removeEventListener("collision", spikes.s12)
	spikes.strd:removeEventListener("collision", spikes.strd)
	l10bs1201:removeEventListener("collision", l10bs1201)

	arrowdata.ah1102= 0
	arrowdata.ah1101= 0
	arrowdata.ah101= 0
	arrowdata.ah11101= 0
	arrowdata.ahtr= 0
	arrowdata.g111ar1 = 0
	arrowdata.g111ar2 = 0
	arrowdata.g12ar1 = 0
	arrowdata.g12ar2 = 0
	arrowdata.g12al1 = 0
	arrowdata.g12al2 = 0
	arrowdata.continue = 0

	blinkbs = nil
	blinkbs2 = nil
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