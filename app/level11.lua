--Level11:  kinda like level 2

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata11" )
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

arrowdata.g11au1 = 0
arrowdata.g111au1 = 0
arrowdata.g111au2 = 0
arrowdata.g111al1 = 0
arrowdata.g111ad1 = 0

arrowdata.g121al1 = 0
arrowdata.g121al2 = 0
arrowdata.g121al3 = 0

arrowdata.g1211ar1 = 0	
arrowdata.g1211ar2 = 0
arrowdata.g1211ar3 = 0
arrowdata.g1212ar1 = 0
arrowdata.g1212ar2 = 0
arrowdata.g1212ar3 = 0

arrowdata.ah12101 = 0
arrowdata.ah121201 = 0
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
local physicsData = (require "bl11block").physicsData(scaleFactor)
local physicsData10 = (require "bl10block").physicsData(scaleFactor)
--=======================================================================================================================================================
-- Arrows
ca.moveballup = function()
	ball:applyLinearImpulse( 0, -4, ball.x, ball.y )
end
ca.moveballdown = function()
	ball:applyLinearImpulse( 0, 4, ball.x, ball.y )
end
ca.moveballright = function()
	ball:applyLinearImpulse( 4, 0, ball.x, ball.y )
end
ca.moveballleft = function()
	ball:applyLinearImpulse( -4, 0, ball.x, ball.y )
end
--========================================================
	ca.g11au1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballup();
	        event.target:removeSelf();
            event.target= nil;
			print("g11au1 collided, g11au1 +1")
			playarrowsound();
		arrowdata.g11au1 = 1

		end
	end
	ca.g111au1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballup();
	        event.target:removeSelf();
            event.target= nil;
			print("g111au1 collided, g111au1 +1")
			playarrowsound();
		arrowdata.g111au1 = 1

		end
	end
	ca.g111au2 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballup();
	        event.target:removeSelf();
            event.target= nil;
			print("g111au2 collided, g111au2 +1")
			playarrowsound();
		arrowdata.g111au2 = 1

		end
	end
	ca.g111al1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g111al1 collided, g111al1 +1")
			playarrowsound();
		arrowdata.g111al1 = 1

		end
	end
	ca.g111ad1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballdown();
	        event.target:removeSelf();
            event.target= nil;
			print("g111ad1 collided, g111ad1 +1")
			playarrowsound();
		arrowdata.g111ad1 = 1

		end
	end
	ca.g121al1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g121al1 collided, g121al1 +1")
			playarrowsound();
		arrowdata.g121al1 = 1

		end
	end
	ca.g121al2 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g121al2 collided, g121al2 +1")
			playarrowsound();
		arrowdata.g121al2 = 1

		end
	end
	ca.g121al3 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g121al3 collided, g121al3 +1")
			playarrowsound();
		arrowdata.g121al3 = 1

		end
	end
	ca.g1211ar1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g1211ar1 collided, g1211ar1 +1")
			playarrowsound();
		arrowdata.g1211ar1 = 1

		end
	end
	ca.g1211ar2 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g1211ar2 collided, g1211ar2 +1")
			playarrowsound();
		arrowdata.g1211ar2 = 1

		end
	end
	ca.g1211ar3 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g1211ar3 collided, g1211ar3 +1")
			playarrowsound();
		arrowdata.g1211ar3 = 1

		end
	end
	ca.g1212ar1 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g1212ar1 collided, g1212ar1 +1")
			playarrowsound();
		arrowdata.g1212ar1 = 1

		end
	end
	ca.g1212ar2 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g1212ar2 collided, g1212ar2 +1")
			playarrowsound();
		arrowdata.g1212ar2 = 1

		end
	end
	ca.g1212ar3 = function(event)

		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g1212ar3 collided, g1212ar3 +1")
			playarrowsound();
		arrowdata.g1212ar3 = 1

		end
	end
--========================================================
--=======================================================================================================================================================
ps.entergroup1 = function()
	groups.g1.isVisible = true
	physics.addBody( blocks.b1, "static", physicsData:get("l11block1") )
	physics.addBody( spikes.s1, "static", physicsData:get("l11block1spikes") )
	physics.addBody( portals.p1to11, "static", physicsData:get("l11p1to11") )
	physics.addBody( portals.p1to12, "static", physicsData:get("l11p1to12") )
end
ps.entergroup11 = function()
	groups.g11.isVisible = true
	physics.addBody( blocks.b11, "static", physicsData:get("l11block11") )
	physics.addBody( spikes.s11, "static", physicsData:get("l11block11spikes") )
	physics.addBody( portals.p11to1, "static", physicsData:get("l11p11to1") )
	physics.addBody( portals.p11to111, "static", physicsData:get("l11p11to111") )
	physics.addBody( portals.p11totr, "static", physicsData:get("l11p11totr") )
	
	if arrowdata.g11au1==0 then
		print("added g11au1 physics")
		physics.addBody( a.g11au1, "static", { isSensor = true} )
	elseif arrowdata.g11au1==1 then
		print("skipped g11au1, no adding physics")
	end
end
ps.entergroup111 = function()
	groups.g111.isVisible = true
	physics.addBody( blocks.b111, "static", physicsData:get("l11block111") )
	physics.addBody( spikes.s111, "static", physicsData:get("l11block111spikes") )
	physics.addBody( portals.p111to11, "static", physicsData:get("l11p111to11") )
	physics.addBody( portals.p111to12, "static", physicsData:get("l11p111to12") )
	if arrowdata.g111au1==0 then
		print("added g111au1 physics")
		physics.addBody( a.g111au1, "static", { isSensor = true} )
	elseif arrowdata.g111au1==1 then
		print("skipped g111au1, no adding physics")
	end
	if arrowdata.g111au2==0 then
		print("added g111au2 physics")
		physics.addBody( a.g111au2, "static", { isSensor = true} )
	elseif arrowdata.g111au2==1 then
		print("skipped g111au2, no adding physics")
	end
	if arrowdata.g111al1==0 then
		print("added g111al1 physics")
		physics.addBody( a.g111al1, "static", { isSensor = true} )
	elseif arrowdata.g111al1==1 then
		print("skipped g111al1, no adding physics")
	end
	if arrowdata.g111ad1==0 then
		print("added g111ad1 physics")
		physics.addBody( a.g111ad1, "static", { isSensor = true} )
	elseif arrowdata.g111ad1==1 then
		print("skipped g111ad1, no adding physics")
	end
end
ps.entergroup12 = function()
	groups.g12.isVisible = true
	physics.addBody( blocks.b12, "static", physicsData:get("l11block12") )
	physics.addBody( portals.p12to1, "static", physicsData:get("l11p12to1") )
	physics.addBody( portals.p12to121, "static", physicsData:get("l11p12to121") )
	physics.addBody( portals.p12to111, "static", physicsData:get("l11p12to111") )
	physics.addBody( flag, "static", {bounce = 0.2})

end
ps.entergroup121 = function()
	groups.g121.isVisible = true
	physics.addBody( blocks.b121, "static", physicsData:get("l11block121") )
	physics.addBody( spikes.s121, "static", physicsData:get("l11block121spikes") )
	physics.addBody( portals.p121to12, "static", physicsData:get("l11p121to12") )
	physics.addBody( portals.p121to1211, "static", physicsData:get("l11p121to1211") )
	physics.addBody( portals.p121to1212, "static", physicsData:get("l11p121to1212") )
	physics.addBody( h.h12101, "static", physicsData:get("l11h12101") )
	physics.addBody( ah.ah12101, "static", physicsData:get("l11ah12101") )
	if arrowdata.g121al1==0 then
		print("added g121al1 physics")
		physics.addBody( a.g121al1, "static", { isSensor = true} )
	elseif arrowdata.g121al1==1 then
		print("skipped g121al1, no adding physics")
	end
	if arrowdata.g121al2==0 then
		print("added g121al2 physics")
		physics.addBody( a.g121al2, "static", { isSensor = true} )
	elseif arrowdata.g121al2==1 then
		print("skipped g121al2, no adding physics")
	end
	if arrowdata.g121al3==0 then
		print("added g121al3 physics")
		physics.addBody( a.g121al3, "static", { isSensor = true} )
	elseif arrowdata.g121al3==1 then
		print("skipped g121al3, no adding physics")
	end
end
ps.entergroup1211 = function()
	groups.g1211.isVisible = true
	physics.addBody( blocks.b1211, "static", physicsData:get("l11block1211") )
	physics.addBody( spikes.s1211, "static", physicsData:get("l11block1211spikes") )
	physics.addBody( portals.p1211to121, "static", physicsData:get("l11p1211to121") )
	physics.addBody( portals.p1211totr, "static", physicsData:get("l11p1211totr") )
	if arrowdata.g1211ar1==0 then
		print("added g1211ar1 physics")
		physics.addBody( a.g1211ar1, "static", { isSensor = true} )
	elseif arrowdata.g1211ar1==1 then
		print("skipped g1211ar1, no adding physics")
	end
	if arrowdata.g1211ar2==0 then
		print("added g1211ar2 physics")
		physics.addBody( a.g1211ar2, "static", { isSensor = true} )
	elseif arrowdata.g1211ar2==1 then
		print("skipped g1211ar2, no adding physics")
	end
	if arrowdata.g1211ar3==0 then
		print("added g1211ar3 physics")
		physics.addBody( a.g1211ar3, "static", { isSensor = true} )
	elseif arrowdata.g1211ar3==1 then
		print("skipped g1211ar3, no adding physics")
	end
end
ps.entergroup1212 = function()
	groups.g1212.isVisible = true
	physics.addBody( blocks.b1212, "static", physicsData:get("l11block1212") )
	physics.addBody( spikes.s1212, "static", physicsData:get("l11block1212spikes") )
	physics.addBody( portals.p1212to121, "static", physicsData:get("l11p1212to121") )
	physics.addBody( portals.p1212totr, "static", physicsData:get("l11p1212totr") )
	physics.addBody( h.h121201, "static", physicsData:get("l11h121201") )
	physics.addBody( ah.ah121201, "static", physicsData:get("l11ah121201") )
	if arrowdata.g1212ar1==0 then
		print("added g1212ar1 physics")
		physics.addBody( a.g1212ar1, "static", { isSensor = true} )
	elseif arrowdata.g1212ar1==1 then
		print("skipped g1212ar1, no adding physics")
	end
	if arrowdata.g1212ar2==0 then
		print("added g1212ar2 physics")
		physics.addBody( a.g1212ar2, "static", { isSensor = true} )
	elseif arrowdata.g1212ar2==1 then
		print("skipped g1212ar2, no adding physics")
	end
	if arrowdata.g1212ar3==0 then
		print("added g1212ar3 physics")
		physics.addBody( a.g1212ar3, "static", { isSensor = true} )
	elseif arrowdata.g1212ar3==1 then
		print("skipped g1212ar3, no adding physics")
	end
end
ps.entergrouptr = function()
	groups.gtr.isVisible = true
	physics.addBody( blocks.btr, "static", physicsData10:get("l10blocktrd") )
	physics.addBody( spikes.str, "static", physicsData10:get("l10blocktrdspikes") )
end
--========================================================
ps.exitgroup1 = function()
	groups.g1.isVisible = false
	physics.removeBody(blocks.b1)
	physics.removeBody(spikes.s1)
	physics.removeBody(portals.p1to11)
	physics.removeBody(portals.p1to12)
end
ps.exitgroup11 = function()
	groups.g11.isVisible = false
	physics.removeBody(blocks.b11)
	physics.removeBody(spikes.s11)
	physics.removeBody(portals.p11to1)
	physics.removeBody(portals.p11to111)
	physics.removeBody(portals.p11totr)
	if arrowdata.g11au1==0 then
		print("removed g11au1 physics")
		physics.removeBody( a.g11au1 )
	elseif arrowdata.g11au1==1 then
		print("skipped g11au1, no removing physics")
	end
end
ps.exitgroup111 = function()
	groups.g111.isVisible = false
	physics.removeBody(blocks.b111)
	physics.removeBody(spikes.s111)
	physics.removeBody(portals.p111to11)
	physics.removeBody(portals.p111to12)
	if arrowdata.g111au1==0 then
		print("removed g111au1 physics")
		physics.removeBody( a.g111au1 )
	elseif arrowdata.g111au1==1 then
		print("skipped g111au1, no removing physics")
	end
	if arrowdata.g111au2==0 then
		print("removed g111au2 physics")
		physics.removeBody( a.g111au2 )
	elseif arrowdata.g111au2==1 then
		print("skipped g111au2, no removing physics")
	end
	if arrowdata.g111al1==0 then
		print("removed g111al1 physics")
		physics.removeBody( a.g111al1 )
	elseif arrowdata.g111al1==1 then
		print("skipped g111al1, no removing physics")
	end
	if arrowdata.g111ad1==0 then
		print("removed g111ad1 physics")
		physics.removeBody( a.g111ad1 )
	elseif arrowdata.g111ad1==1 then
		print("skipped g111ad1, no removing physics")
	end
end
ps.exitgroup12 = function()
	groups.g12.isVisible = false
	physics.removeBody(blocks.b12)
	physics.removeBody(portals.p12to1)
	physics.removeBody(portals.p12to121)
	physics.removeBody(portals.p12to111)
	physics.removeBody(flag)
end
ps.exitgroup121 = function()
	groups.g121.isVisible = false
	physics.removeBody(blocks.b121)
	physics.removeBody(spikes.s121)
	physics.removeBody(portals.p121to12)
	physics.removeBody(portals.p121to1211)
	physics.removeBody(portals.p121to1212)
	physics.removeBody(h.h12101)
	physics.removeBody(ah.ah12101)
	if arrowdata.g121al1==0 then
		print("removed g121al1 physics")
		physics.removeBody( a.g121al1 )
	elseif arrowdata.g121al1==1 then
		print("skipped g121al1, no removing physics")
	end
	if arrowdata.g121al2==0 then
		print("removed g121al2 physics")
		physics.removeBody( a.g121al2 )
	elseif arrowdata.g121al2==1 then
		print("skipped g121al2, no removing physics")
	end
	if arrowdata.g121al3==0 then
		print("removed g121al3 physics")
		physics.removeBody( a.g121al3 )
	elseif arrowdata.g121al3==1 then
		print("skipped g121al3, no removing physics")
	end
end
ps.exitgroup1211 = function()
	groups.g1211.isVisible = false
	physics.removeBody(blocks.b1211)
	physics.removeBody(spikes.s1211)
	physics.removeBody(portals.p1211to121)
	physics.removeBody(portals.p1211totr)
	if arrowdata.g1211ar1==0 then
		print("removed g1211ar1 physics")
		physics.removeBody( a.g1211ar1 )
	elseif arrowdata.g1211ar1==1 then
		print("skipped g1211ar1, no removing physics")
	end
	if arrowdata.g1211ar2==0 then
		print("removed g1211ar2 physics")
		physics.removeBody( a.g1211ar2 )
	elseif arrowdata.g1211ar2==1 then
		print("skipped g1211ar2, no removing physics")
	end
	if arrowdata.g1211ar3==0 then
		print("removed g1211ar3 physics")
		physics.removeBody( a.g1211ar3 )
	elseif arrowdata.g1211ar3==1 then
		print("skipped g1211ar3, no removing physics")
	end
end
ps.exitgroup1212 = function()
	groups.g1212.isVisible = false
	physics.removeBody(blocks.b1212)
	physics.removeBody(spikes.s1212)
	physics.removeBody(portals.p1212to121)
	physics.removeBody(portals.p1212totr)
	physics.removeBody(h.h121201)
	physics.removeBody(ah.ah121201)
	if arrowdata.g1212ar1==0 then
		print("removed g1212ar1 physics")
		physics.removeBody( a.g1212ar1 )
	elseif arrowdata.g1212ar1==1 then
		print("skipped g1212ar1, no removing physics")
	end
	if arrowdata.g1212ar2==0 then
		print("removed g1212ar2 physics")
		physics.removeBody( a.g1212ar2 )
	elseif arrowdata.g1212ar2==1 then
		print("skipped g1212ar2, no removing physics")
	end
	if arrowdata.g1212ar3==0 then
		print("removed g1212ar3 physics")
		physics.removeBody( a.g1212ar3 )
	elseif arrowdata.g1212ar3==1 then
		print("skipped g1212ar3, no removing physics")
	end
end
ps.exitgrouptr = function()
	groups.gtr.isVisible = false
	physics.removeBody(blocks.btr)
	physics.removeBody(spikes.str)
end
--=======================================================================================================================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 + 120; ball.y = _H/2 - 200
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2 - 42; flag.y = _H/2 - 116
	
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

	blocks.b1 = display.newImageRect("l11block1.png", 320, 480)
	blocks.b1.x = _W/2; blocks.b1.y = _H/2
	physics.addBody( blocks.b1, "static", physicsData:get("l11block1") )
	
	spikes.s1 = display.newImageRect("blank.png", 320, 480)
	spikes.s1.x = _W/2; spikes.s1.y = _H/2
	physics.addBody( spikes.s1, "static", physicsData:get("l11block1spikes") )
	
	portals.p1to11 = display.newImageRect("l11p1to11.png", 320, 480)
	portals.p1to11.x = _W/2; portals.p1to11.y = _H/2
	physics.addBody( portals.p1to11, "static", physicsData:get("l11p1to11") )
	
	portals.p1to12 = display.newImageRect("l11p1to12.png", 320, 480)
	portals.p1to12.x = _W/2; portals.p1to12.y = _H/2
	physics.addBody( portals.p1to12, "static", physicsData:get("l11p1to12") )
	
	groups.g1:insert(portals.p1to11)
	groups.g1:insert(portals.p1to12)
	groups.g1:insert(blocks.b1)
	groups.g1:insert(spikes.s1)
	--========================================================
	-- Group 11
	groups.g11 = display.newGroup()
	groups.g11.isVisible = false
	
	blocks.b11 = display.newImageRect("l11block11.png", 320, 480)
	blocks.b11.x = _W/2; blocks.b11.y = _H/2
	
	spikes.s11 = display.newImageRect("blank.png", 320, 480)
	spikes.s11.x = _W/2; spikes.s11.y = _H/2
	
	portals.p11to1 = display.newImageRect("l11p11to1.png", 320, 480)
	portals.p11to1.x = _W/2; portals.p11to1.y = _H/2
	
	portals.p11to111 = display.newImageRect("l11p11to111.png", 320, 480)
	portals.p11to111.x = _W/2; portals.p11to111.y = _H/2
	
	portals.p11totr = display.newImageRect("l11p11totr.png", 320, 480)
	portals.p11totr.x = _W/2; portals.p11totr.y = _H/2
	
	a.g11au1 = display.newImageRect("arrowup.png", 32, 26)
	a.g11au1.x = _W/2-120; a.g11au1.y = _H/2
	a.g11au1:addEventListener("collision", ca.g11au1)

	groups.g11:insert(portals.p11to1)
	groups.g11:insert(portals.p11to111)
	groups.g11:insert(portals.p11totr)
	groups.g11:insert(blocks.b11)
	groups.g11:insert(spikes.s11)
	groups.g11:insert(a.g11au1)
	--========================================================
	-- Group 111
	groups.g111 = display.newGroup()
	groups.g111.isVisible = false
	
	blocks.b111 = display.newImageRect("l11block111.png", 320, 480)
	blocks.b111.x = _W/2; blocks.b111.y = _H/2
	
	spikes.s111 = display.newImageRect("blank.png", 320, 480)
	spikes.s111.x = _W/2; spikes.s111.y = _H/2
	
	portals.p111to12 = display.newImageRect("l11p111to12.png", 320, 480)
	portals.p111to12.x = _W/2; portals.p111to12.y = _H/2
	
	portals.p111to11 = display.newImageRect("l11p111to11.png", 320, 480)
	portals.p111to11.x = _W/2; portals.p111to11.y = _H/2
	
	a.g111au1 = display.newImageRect("arrowup.png", 32, 26)
	a.g111au1.x = _W/2-120; a.g111au1.y = _H/2- 130
	a.g111au1:addEventListener("collision", ca.g111au1)
	
	a.g111au2 = display.newImageRect("arrowup.png", 32, 26)
	a.g111au2.x = _W/2+42; a.g111au2.y = _H/2- 130
	a.g111au2:addEventListener("collision", ca.g111au2)
	
	a.g111al1 = display.newImageRect("arrowleft.png", 28, 32)
	a.g111al1.x = _W/2; a.g111al1.y = _H/2-22
	a.g111al1:addEventListener("collision", ca.g111al1)
	
	a.g111ad1 = display.newImageRect("arrowdown.png", 32, 26)
	a.g111ad1.x = _W/2+120; a.g111ad1.y = _H/2+130
	a.g111ad1:addEventListener("collision", ca.g111ad1)
	
	groups.g111:insert(portals.p111to12)
	groups.g111:insert(portals.p111to11)
	groups.g111:insert(blocks.b111)
	groups.g111:insert(spikes.s111)
	groups.g111:insert(a.g111au1)
	groups.g111:insert(a.g111au2)
	groups.g111:insert(a.g111al1)
	groups.g111:insert(a.g111ad1)
	--========================================================
	-- Group 12
	groups.g12 = display.newGroup()
	groups.g12.isVisible = false

	blocks.b12 = display.newImageRect("l11block12.png", 320, 480)
	blocks.b12.x = _W/2; blocks.b12.y = _H/2
	
	portals.p12to1 = display.newImageRect("l11p12to1.png", 320, 480)
	portals.p12to1.x = _W/2; portals.p12to1.y = _H/2

	portals.p12to111 = display.newImageRect("l11p12to111.png", 320, 480)
	portals.p12to111.x = _W/2; portals.p12to111.y = _H/2

	portals.p12to121 = display.newImageRect("l11p12to121.png", 320, 480)
	portals.p12to121.x = _W/2; portals.p12to121.y = _H/2
	
	groups.g12:insert(portals.p12to1)
	groups.g12:insert(portals.p12to111)
	groups.g12:insert(portals.p12to121)
	groups.g12:insert(blocks.b12)
	groups.g12:insert(flag)
	--========================================================
	-- Group 121
	groups.g121 = display.newGroup()
	groups.g121.isVisible = false

	blocks.b121 = display.newImageRect("l11block121.png", 320, 480)
	blocks.b121.x = _W/2; blocks.b121.y = _H/2
	
	spikes.s121 = display.newImageRect("blank.png", 320, 480)
	spikes.s121.x = _W/2; spikes.s121.y = _H/2
	
	portals.p121to12 = display.newImageRect("l11p121to12.png", 320, 480)
	portals.p121to12.x = _W/2; portals.p121to12.y = _H/2

	portals.p121to1211 = display.newImageRect("l11p121to1211.png", 320, 480)
	portals.p121to1211.x = _W/2; portals.p121to1211.y = _H/2
	
	portals.p121to1212 = display.newImageRect("l11p121to1212.png", 320, 480)
	portals.p121to1212.x = _W/2; portals.p121to1212.y = _H/2
	
	h.h12101 = display.newImageRect("l11h12101.png", 320, 480)
	h.h12101.x = _W/2; h.h12101.y = _H/2
	
	ah.ah12101 = display.newImageRect("l11ah12101.png", 320, 480)
	ah.ah12101.x = _W/2; ah.ah12101.y = _H/2
	
	ah.ah12101over = display.newImageRect("l11ah12101over.png", 320, 480)
	ah.ah12101over.x = _W/2; ah.ah12101over.y = _H/2
	ah.ah12101over.isVisible = false
	
	local dah12101
	
	local cah12101 = function()
		transition.to(h.h12101, {time=3000, y=(_H/2-80), transition = easing.inQuad})
		print("h.h12101 opened!")
		arrowdata.ah12101= 1
		ah.ah12101over.isVisible = true
		dah12101();
	end
	
	dah12101 = function()
		ah.ah12101:removeEventListener("collision", cah12101)
	end
	
	ah.ah12101:addEventListener("collision", cah12101)
	
	a.g121al1 = display.newImageRect("arrowleft.png", 28, 32)
	a.g121al1.x = _W/2-100; a.g121al1.y = _H/2+200
	a.g121al1:addEventListener("collision", ca.g121al1)
	
	a.g121al2 = display.newImageRect("arrowleft.png", 28, 32)
	a.g121al2.x = _W/2-40; a.g121al2.y = _H/2+200
	a.g121al2:addEventListener("collision", ca.g121al2)
	
	a.g121al3 = display.newImageRect("arrowleft.png", 28, 32)
	a.g121al3.x = _W/2-100; a.g121al3.y = _H/2+116
	a.g121al3:addEventListener("collision", ca.g121al3)
	
	groups.g121:insert(portals.p121to12)
	groups.g121:insert(portals.p121to1211)
	groups.g121:insert(portals.p121to1212)
	groups.g121:insert(blocks.b121)
	groups.g121:insert(spikes.s121)
	groups.g121:insert(h.h12101)
	groups.g121:insert(ah.ah12101)
	groups.g121:insert(ah.ah12101over)
	groups.g121:insert(a.g121al1)
	groups.g121:insert(a.g121al2)
	groups.g121:insert(a.g121al3)
	--========================================================
	-- Group 1211
	groups.g1211 = display.newGroup()
	groups.g1211.isVisible = false

	blocks.b1211 = display.newImageRect("l11block1211.png", 320, 480)
	blocks.b1211.x = _W/2; blocks.b1211.y = _H/2
	
	spikes.s1211 = display.newImageRect("blank.png", 320, 480)
	spikes.s1211.x = _W/2; spikes.s1211.y = _H/2
	
	portals.p1211to121 = display.newImageRect("l11p1211to121.png", 320, 480)
	portals.p1211to121.x = _W/2; portals.p1211to121.y = _H/2
	
	portals.p1211totr = display.newImageRect("l11p1211totr.png", 320, 480)
	portals.p1211totr.x = _W/2; portals.p1211totr.y = _H/2
	
	a.g1211ar1 = display.newImageRect("arrowright.png", 28, 32)
	a.g1211ar1.x = _W/2+35; a.g1211ar1.y = _H/2+5
	a.g1211ar1:addEventListener("collision", ca.g1211ar1)
	
	a.g1211ar2 = display.newImageRect("arrowright.png", 28, 32)
	a.g1211ar2.x = _W/2+65; a.g1211ar2.y = _H/2+55
	a.g1211ar2:addEventListener("collision", ca.g1211ar2)
	
	a.g1211ar3 = display.newImageRect("arrowright.png", 28, 32)
	a.g1211ar3.x = _W/2+95; a.g1211ar3.y = _H/2+105
	a.g1211ar3:addEventListener("collision", ca.g1211ar3)
	
	groups.g1211:insert(portals.p1211to121)
	groups.g1211:insert(portals.p1211totr)
	groups.g1211:insert(blocks.b1211)
	groups.g1211:insert(spikes.s1211)
	groups.g1211:insert(a.g1211ar1)
	groups.g1211:insert(a.g1211ar2)
	groups.g1211:insert(a.g1211ar3)
	--========================================================
	-- Group 1212
	groups.g1212 = display.newGroup()
	groups.g1212.isVisible = false

	blocks.b1212 = display.newImageRect("l11block1212.png", 320, 480)
	blocks.b1212.x = _W/2; blocks.b1212.y = _H/2
	
	spikes.s1212 = display.newImageRect("blank.png", 320, 480)
	spikes.s1212.x = _W/2; spikes.s1212.y = _H/2
	
	portals.p1212to121 = display.newImageRect("l11p1212to121.png", 320, 480)
	portals.p1212to121.x = _W/2; portals.p1212to121.y = _H/2
	
	portals.p1212totr = display.newImageRect("l11p1212totr.png", 320, 480)
	portals.p1212totr.x = _W/2; portals.p1212totr.y = _H/2
	
	h.h121201 = display.newImageRect("l11h121201.png", 320, 480)
	h.h121201.x = _W/2; h.h121201.y = _H/2
	
	ah.ah121201 = display.newImageRect("l11ah121201.png", 320, 480)
	ah.ah121201.x = _W/2; ah.ah121201.y = _H/2
	
	ah.ah121201over = display.newImageRect("l11ah121201over.png", 320, 480)
	ah.ah121201over.x = _W/2; ah.ah121201over.y = _H/2
	ah.ah121201over.isVisible = false
	
	local dah121201
	
	local cah121201 = function()
		transition.to(h.h121201, {time=3000, y=(_H/2+80), transition = easing.inQuad})
		print("h.h121201 opened!")
		arrowdata.ah121201= 1
		ah.ah121201over.isVisible = true
		dah121201();
	end
	
	dah121201 = function()
		ah.ah121201:removeEventListener("collision", cah121201)
	end
	
	ah.ah121201:addEventListener("collision", cah121201)
	
	a.g1212ar1 = display.newImageRect("arrowright.png", 28, 32)
	a.g1212ar1.x = _W/2+35; a.g1212ar1.y = _H/2+25
	a.g1212ar1:addEventListener("collision", ca.g1212ar1)
	
	a.g1212ar2 = display.newImageRect("arrowright.png", 28, 32)
	a.g1212ar2.x = _W/2+65; a.g1212ar2.y = _H/2+75
	a.g1212ar2:addEventListener("collision", ca.g1212ar2)
	
	a.g1212ar3 = display.newImageRect("arrowright.png", 28, 32)
	a.g1212ar3.x = _W/2+95; a.g1212ar3.y = _H/2+125
	a.g1212ar3:addEventListener("collision", ca.g1212ar3)
	
	groups.g1212:insert(portals.p1212to121)
	groups.g1212:insert(portals.p1212totr)
	groups.g1212:insert(blocks.b1212)
	groups.g1212:insert(spikes.s1212)
	groups.g1212:insert(h.h121201)
	groups.g1212:insert(ah.ah121201)
	groups.g1212:insert(ah.ah121201over)
	groups.g1212:insert(a.g1212ar1)
	groups.g1212:insert(a.g1212ar2)
	groups.g1212:insert(a.g1212ar3)
	--=======================================================
	-- Group tr
	groups.gtr = display.newGroup()
	groups.gtr.isVisible = false

	blocks.btr = display.newImageRect("l10blocktrd.png", 320, 480)
	blocks.btr.x = _W/2; blocks.btr.y = _H/2
	
	spikes.str = display.newImageRect("blank.png", 320, 480)
	spikes.str.x = _W/2; spikes.str.y = _H/2
	
	groups.gtr:insert(blocks.btr)
	groups.gtr:insert(spikes.str)
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
		
		ball.x = _W/2 - 110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
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
		
		ball.x = _W/2 + 32; ball.y = _H/2 + 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
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
		
		ball.x = _W/2 - 120; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
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

		print("p111to11")
		
		physics.removeBody(ball)
		physics.removeBody(blocks.b11)
		
		ball.x = _W/2 + 42; ball.y = _H/2 + 90
		
		local function addphysics()
			physics.addBody( blocks.b11, "static", physicsData:get("l11block11") )
			physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		end
		timer.performWithDelay(0.25, addphysics)
		
		timer.performWithDelay(1, ps.mvballdown)
	
	end
	
	ps.delayp111to11 = function()
		timer.performWithDelay(1, ps.p111to11)
	end
	
	portals.p111to11:addEventListener("collision", ps.delayp111to11)
	--========================================================
	-- ps.p1to12
	ps.p1to12 = function()
	
		ps.exitgroup1();
		ps.entergroup12();
		
		ball.x = _W/2 - 32; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
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
		
		ball.x = _W/2 - 52; ball.y = _H/2 - 116
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p12to1")
	
	end
	
	ps.delayp12to1 = function()
		timer.performWithDelay(1, ps.p12to1)
	end
	
	portals.p12to1:addEventListener("collision", ps.delayp12to1)
	--========================================================
	-- ps.p12to121
	ps.p12to121 = function()
	
		ps.exitgroup12();
		ps.entergroup121();
		
		ball.x = _W/2 - 120; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p12to121")
		
	end
	
	ps.delayp12to121 = function()
		timer.performWithDelay(1, ps.p12to121)
	end
	
	portals.p12to121:addEventListener("collision", ps.delayp12to121)
	--========================================================
	-- ps.p121to12
	ps.p121to12 = function()
	
		ps.exitgroup121();
		ps.entergroup12();

		print("p121to12")
		
		physics.removeBody(ball)
		physics.removeBody(blocks.b12)
		
		ball.x = _W/2 - 120; ball.y = _H/2 + 190
		
		local function addphysics()
			physics.addBody( blocks.b12, "static", physicsData:get("l11block12") )
			physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		end
		timer.performWithDelay(0.25, addphysics)
		
		timer.performWithDelay(1, ps.mvballup)
	
	
	end
	
	ps.delayp121to12 = function()
		timer.performWithDelay(1, ps.p121to12)
	end
	
	portals.p121to12:addEventListener("collision", ps.delayp121to12)
	--========================================================
	-- ps.p111to12
	ps.p111to12 = function()
	
		ps.exitgroup111();
		ps.entergroup12();
		
		ball.x = _W/2 - 42; ball.y = _H/2 - 30
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p111to12")
	
	end
	
	ps.delayp111to12 = function()
		timer.performWithDelay(1, ps.p111to12)
	end
	
	portals.p111to12:addEventListener("collision", ps.delayp111to12)
	--========================================================
	-- ps.p12to111
	ps.p12to111 = function()
	
		ps.exitgroup12();
		ps.entergroup111();
		
		ball.x = _W/2 - 42; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p12to111")
	
	end
	
	ps.delayp12to111 = function()
		timer.performWithDelay(1, ps.p12to111)
	end
	
	portals.p12to111:addEventListener("collision", ps.delayp12to111)
	--========================================================
	-- ps.p121to1211
	ps.p121to1211 = function()
	
		ps.exitgroup121();
		ps.entergroup1211();
		
		ball.x = _W/2 + 110; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p121to1211")
	
	end
	
	ps.delayp121to1211 = function()
		timer.performWithDelay(1, ps.p121to1211)
	end
	
	portals.p121to1211:addEventListener("collision", ps.delayp121to1211)
	--========================================================
	-- ps.p1211to121
	ps.p1211to121 = function()
	
		ps.exitgroup1211();
		ps.entergroup121();
		
		ball.x = _W/2 - 110; ball.y = _H/2 - 42
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p1211to121")
	
	end
	
	ps.delayp1211to121 = function()
		timer.performWithDelay(1, ps.p1211to121)
	end
	
	portals.p1211to121:addEventListener("collision", ps.delayp1211to121)
	--========================================================
	-- ps.p121to1212
	ps.p121to1212 = function()
	
		ps.exitgroup121();
		ps.entergroup1212();
		
		ball:setLinearVelocity(0, 0)
		print("p121to1212")
		
		physics.removeBody(ball)
		physics.removeBody(blocks.b1212)
		
		ball.x = _W/2 - 120; ball.y = _H/2 + 106
		
		local function addphysics()
			physics.addBody( blocks.b1212, "static", physicsData:get("l11block1212") )
			physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		end
		timer.performWithDelay(0.25, addphysics)
		
		timer.performWithDelay(1, ps.mvballup)

	end
	
	ps.delayp121to1212 = function()
		timer.performWithDelay(1, ps.p121to1212)
	end
	
	portals.p121to1212:addEventListener("collision", ps.delayp121to1212)
	--========================================================
	-- ps.p1212to121
	ps.p1212to121 = function()
	
		ps.exitgroup1212();
		ps.entergroup121();
		
		ball:setLinearVelocity(0, 0)
		print("p1212to121")
		
		physics.removeBody(ball)
		physics.removeBody(blocks.b1212)
		
		ball.x = _W/2 + 42; ball.y = _H/2 - 106
		
		local function addphysics()
			physics.addBody( blocks.b121, "static", physicsData:get("l11block121") )
			physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
		end
		timer.performWithDelay(0.25, addphysics)
		
		timer.performWithDelay(1, ps.mvballdown)
	
	end
	
	ps.delayp1212to121 = function()
		timer.performWithDelay(1, ps.p1212to121)
	end
	
	portals.p1212to121:addEventListener("collision", ps.delayp1212to121)
	--========================================================
	-- ps.p11totr
	ps.p11totr = function()
	
		ps.exitgroup11();
		ps.entergrouptr();
		
		ball.x = _W/2 + 100; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p11totr")
	
	end
	
	ps.delayp11totr = function()
		timer.performWithDelay(1, ps.p11totr)
	end
	
	portals.p11totr:addEventListener("collision", ps.delayp11totr)
	--========================================================
	-- ps.p1211totr
	ps.p1211totr = function()
	
		ps.exitgroup1211();
		ps.entergrouptr();
		
		ball.x = _W/2 + 100; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1211totr")
	
	end
	
	ps.delayp1211totr = function()
		timer.performWithDelay(1, ps.p1211totr)
	end
	
	portals.p1211totr:addEventListener("collision", ps.delayp1211totr)
	--========================================================
	-- ps.p1212totr
	ps.p1212totr = function()
	
		ps.exitgroup1212();
		ps.entergrouptr();
		
		ball.x = _W/2 + 100; ball.y = _H/2 - 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1212totr")
	
	end
	
	ps.delayp1212totr = function()
		timer.performWithDelay(1, ps.p1212totr)
	end
	
	portals.p1212totr:addEventListener("collision", ps.delayp1212totr)
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
		ispassed.l11 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("level select")
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
		storyboard.gotoScene("restartl11", "fade", 100)
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
	spikes.s1.collision = restarthtp
	spikes.s11.collision = restarthtp
	spikes.s111.collision = restarthtp
	spikes.s121.collision = restarthtp
	spikes.s1211.collision = restarthtp
	spikes.s1212.collision = restarthtp
	spikes.str.collision = restarthtp
	
	flag:addEventListener("collision", flag)
	spikes.s1:addEventListener("collision", spikes.s1)
	spikes.s11:addEventListener("collision", spikes.s11)
	spikes.s111:addEventListener("collision", spikes.s111)
	spikes.s121:addEventListener("collision", spikes.s121)
	spikes.s1211:addEventListener("collision", spikes.s1211)
	spikes.s1212:addEventListener("collision", spikes.s1212)
	spikes.str:addEventListener("collision", spikes.str)

	group:insert(background);
	group:insert(ball)
	group:insert(groups.g1)
	group:insert(groups.g11)
	group:insert(groups.g111)
	group:insert(groups.g12)
	group:insert(groups.g121)
	group:insert(groups.g1211)
	group:insert(groups.g1212)
	group:insert(groups.gtr)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 11 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)

	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);

	spikes.s1:removeEventListener("collision", spikes.s1)
	spikes.s11:removeEventListener("collision", spikes.s11)
	spikes.s111:removeEventListener("collision", spikes.s111)
	spikes.s121:removeEventListener("collision", spikes.s121)
	spikes.s1211:removeEventListener("collision", spikes.s1211)
	spikes.s1212:removeEventListener("collision", spikes.s1212)
	spikes.str:removeEventListener("collision", spikes.str)
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