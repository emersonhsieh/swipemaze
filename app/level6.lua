-- Level 6:  kinda like level 1, 2, 3, 4, and 5.
-- Except this time I'm using tables instead of "upvalues" aka local variables
-- because of the stupid 60 upvalue limit.

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
-- Upvalues
local restarthtp, nextscene
local check3, pauseball, ball, pausebutton
local flag
local pausegroup, wingroup
local pausegame, gotomenu, resumegame
local winbackground, overlaybutton, htpwinoverlay, backtomainbtn
local htpwinoverlayg, overlaybuttong
local check3a, check3b

-- Lua Tables: Groups, Blocks, Spikes, Arrows, Portals, 
-- and Portal Switchie Functions.

local groups = {}
local blocks = {}
local spikes = {}
local portals = {}
local ps = {}
local movespikes = {}

local h = {}
local ah = {}

local a = {}
local ca = {}


playarrowsound = function()
    audio.play( sfx.arrowpop )
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
--=============================================================================================================================================================
arrowdata.ah1301 = 0
arrowdata.ah1401 = 0

arrowdata.g1al1 = 0
arrowdata.g1ar1 = 0
arrowdata.g1au1 = 0
arrowdata.g1ad1 = 0

arrowdata.g14al1 = 0
arrowdata.g14al2 = 0
arrowdata.g14al3 = 0
arrowdata.g14ar1 = 0
arrowdata.g14ar2 = 0
arrowdata.g14ar3 = 0

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
-- Group 1 ps arrow functions
ca.togroup1 = function ()
		if arrowdata.g1ad1==0 then
			print("added g1ad1 physics")
			physics.addBody( a.g1ad1, "static", { isSensor = true} )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no adding physics")
		end	
		
		if arrowdata.g1ar1==0 then
			print("added g1ar1 physics")
			physics.addBody( a.g1ar1, "static", { isSensor = true} )
		elseif arrowdata.g1ar1==1 then
			print("skipped g1ar1, no adding physics")
		end
		
		if arrowdata.g1al1==0 then
			print("added g1al1 physics")
			physics.addBody( a.g1al1, "static", { isSensor = true} )
		elseif arrowdata.g1al1==1 then
			print("skipped g1al1, no adding physics")
		end	
		
		if arrowdata.g1au1==0 then
			print("added g1au1 physics")
			physics.addBody( a.g1au1, "static", { isSensor = true} )
		elseif arrowdata.g1au1==1 then
			print("skipped g1au1, no adding physics")
		end	
end
ca.exitlevel1 = function()
		if arrowdata.g1al1==0 then
			print("removed g1al1 physics")
			physics.removeBody( a.g1al1 )
		elseif arrowdata.g1al1==1 then
			print("skipped g1al1, no removing physics")
		end
		
		if arrowdata.g1au1==0 then
			print("removed g1au1 physics")
			physics.removeBody( a.g1au1 )
		elseif arrowdata.g1au1==1 then
			print("skipped g1au1, no removing physics")
		end
		
		if arrowdata.g1ar1==0 then
			print("removed g1ar1 physics")
			physics.removeBody( a.g1ar1 )
		elseif arrowdata.g1ar1==1 then
			print("skipped g1ar1, no removing physics")
		end
		
		if arrowdata.g1ad1==0 then
			print("removed g1ad1 physics")
			physics.removeBody( a.g1ad1 )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no removing physics")
		end
end
--========================================================
-- Group 14 ps arrow functions
ca.togroup14 = function ()
		if arrowdata.g14ar1==0 then
			print("added g14ar1 physics")
			physics.addBody( a.g14ar1, "static", { isSensor = true} )
		elseif arrowdata.g14ar1==1 then
			print("skipped g14ar1, no adding physics")
		end	
		
		if arrowdata.g14ar2==0 then
			print("added g14ar2 physics")
			physics.addBody( a.g14ar2, "static", { isSensor = true} )
		elseif arrowdata.g14ar2==1 then
			print("skipped g14ar2, no adding physics")
		end
		
		if arrowdata.g14ar3==0 then
			print("added g14ar3 physics")
			physics.addBody( a.g14ar3, "static", { isSensor = true} )
		elseif arrowdata.g14ar3==1 then
			print("skipped g14ar3, no adding physics")
		end	
		
		if arrowdata.g14al1==0 then
			print("added g14al1 physics")
			physics.addBody( a.g14al1, "static", { isSensor = true} )
		elseif arrowdata.g14al1==1 then
			print("skipped g14al1, no adding physics")
		end
		if arrowdata.g14al2==0 then
			print("added g14al2 physics")
			physics.addBody( a.g14al2, "static", { isSensor = true} )
		elseif arrowdata.g14al2==1 then
			print("skipped g14al2, no adding physics")
		end	
		if arrowdata.g14al3==0 then
			print("added g14al3 physics")
			physics.addBody( a.g14al3, "static", { isSensor = true} )
		elseif arrowdata.g14al3==1 then
			print("skipped g14al3, no adding physics")
		end	
end
ca.exitlevel14 = function()
		if arrowdata.g14al1==0 then
			print("removed g14al1 physics")
			physics.removeBody( a.g14al1 )
		elseif arrowdata.g14al1==1 then
			print("skipped g14al1, no removing physics")
		end
		
		if arrowdata.g14al2==0 then
			print("removed g14al2 physics")
			physics.removeBody( a.g14al2 )
		elseif arrowdata.g14al2==1 then
			print("skipped g14al2, no removing physics")
		end
		
		if arrowdata.g14al3==0 then
			print("removed g14al3 physics")
			physics.removeBody( a.g14al3 )
		elseif arrowdata.g14al3==1 then
			print("skipped g14al3, no removing physics")
		end
		
		if arrowdata.g14ar1==0 then
			print("removed g14ar1 physics")
			physics.removeBody( a.g14ar1 )
		elseif arrowdata.g14ar1==1 then
			print("skipped g14ar1, no removing physics")
		end
		if arrowdata.g14ar2==0 then
			print("removed g14ar2 physics")
			physics.removeBody( a.g14ar2 )
		elseif arrowdata.g14ar2==1 then
			print("skipped g14ar2, no removing physics")
		end
		if arrowdata.g14ar3==0 then
			print("removed g14ar3 physics")
			physics.removeBody( a.g14ar3 )
		elseif arrowdata.g14ar3==1 then
			print("skipped g14ar3, no removing physics")
		end
end
--========================================================
-- Arrow collision functions

	-- Group1
	function ca.g1al1(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g1al1 collided, g1al1 +1")
			playarrowsound();
		arrowdata.g1al1 = 1

		end
	end
	function ca.g1ar1(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g1ar1 collided, g1ar1 +1")
			playarrowsound();
		arrowdata.g1ar1 = 1

		end
	end
	function ca.g1au1(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballup();
	        event.target:removeSelf();
            event.target= nil;
			print("g1au1 collided, g1au1 +1")
			playarrowsound();
		arrowdata.g1au1 = 1

		end
	end
	function ca.g1ad1(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballdown();
	        event.target:removeSelf();
            event.target= nil;
			print("g1ad1 collided, g1ad1 +1")
			playarrowsound();
		arrowdata.g1ad1 = 1

		end
	end
	--========================================================
	-- Group14
	function ca.g14al1(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g14al1 collided, g14al1 +1")
			playarrowsound();
		arrowdata.g14al1 = 1

		end
	end
	function ca.g14al2(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g14al2 collided, g14al2 +1")
			playarrowsound();
		arrowdata.g14al2 = 1

		end
	end
	function ca.g14al3(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballleft();
	        event.target:removeSelf();
            event.target= nil;
			print("g14al3 collided, g14al3 +1")
			playarrowsound();
		arrowdata.g14al3 = 1

		end
	end
	function ca.g14ar1(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g14ar1 collided, g14ar1 +1")
			playarrowsound();
		arrowdata.g14ar1 = 1

		end
	end
	function ca.g14ar2(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g14ar2 collided, g14ar2 +1")
			playarrowsound();
		arrowdata.g14ar2 = 1

		end
	end
	function ca.g14ar3(event)
	
		if ( event.phase == "began" ) then
		
			ca.moveballright();
	        event.target:removeSelf();
            event.target= nil;
			print("g14ar3 collided, g14ar3 +1")
			playarrowsound();
		arrowdata.g14ar3 = 1

		end
	end
--=============================================================================================================================================================
--PhysicsEditor required stuff
local scaleFactor = 1.0
local physicsData = (require "bl6block").physicsData(scaleFactor)
local physicsData5 = (require "bl5block").physicsData(scaleFactor)
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2; ball.y = _H/2
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	local pausebutton = widget.newButton
	{
		defaultFile = "pausebuttonbottom.png",
		overFile = "pausebuttonbottomover.png",
		width = 37,
		height = 37,
	}	pausebutton.x = 18; pausebutton.y = _H-18;
	
	--========================================================
	groups.g1 = display.newGroup()
	
	blocks.b1 = display.newImageRect("l6block1.png", 320, 480)
	physics.addBody( blocks.b1, "static", physicsData:get("l6block1") )
	blocks.b1.x = _W/2; blocks.b1.y = _H/2
	
	portals.p1to11 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( portals.p1to11, "static", physicsData:get("l6portal1to11") )
	portals.p1to11.x = _W/2; portals.p1to11.y = _H/2
	
	portals.p1to12 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( portals.p1to12, "static", physicsData:get("l6portal1to12") )
	portals.p1to12.x = _W/2; portals.p1to12.y = _H/2
	
	portals.p1to13 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( portals.p1to13, "static", physicsData:get("l6portal1to13") )
	portals.p1to13.x = _W/2; portals.p1to13.y = _H/2
	
	portals.p1to14 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( portals.p1to14, "static", physicsData:get("l6portal1to14") )
	portals.p1to14.x = _W/2; portals.p1to14.y = _H/2
	
	a.g1al1 = display.newImageRect("arrowleft.png", 28, 32)
	a.g1al1.x = _W/2-90; a.g1al1.y = _H/2
	physics.addBody( a.g1al1, "static", { isSensor = true } )
	a.g1al1:addEventListener("collision", ca.g1al1)
	
	a.g1ad1 = display.newImageRect("arrowdown.png", 32, 26)
	a.g1ad1.x = _W/2; a.g1ad1.y = _H/2+90
	physics.addBody( a.g1ad1, "static", { isSensor = true } )
	a.g1ad1:addEventListener("collision", ca.g1ad1)
	
	a.g1ar1 = display.newImageRect("arrowright.png", 28, 32)
	a.g1ar1.x = _W/2+90; a.g1ar1.y = _H/2
	physics.addBody( a.g1ar1, "static", { isSensor = true } )
	a.g1ar1:addEventListener("collision", ca.g1ar1)
	
	a.g1au1 = display.newImageRect("arrowup.png", 32, 26)
	a.g1au1.x = _W/2; a.g1au1.y = _H/2-90
	physics.addBody( a.g1au1, "static", { isSensor = true } )
	a.g1au1:addEventListener("collision", ca.g1au1)
	
	groups.g1:insert(portals.p1to11)
	groups.g1:insert(portals.p1to12)
	groups.g1:insert(portals.p1to13)
	groups.g1:insert(portals.p1to14)
	groups.g1:insert(blocks.b1)
	
	groups.g1:insert(a.g1al1)
	groups.g1:insert(a.g1ar1)
	groups.g1:insert(a.g1au1)
	groups.g1:insert(a.g1ad1)
	--========================================================
	groups.g11 = display.newGroup()
	
	blocks.b11 = display.newImageRect("l6block11.png", 320, 480)
	blocks.b11.x = _W/2; blocks.b11.y = _H/2
	
	portals.p11to1 = display.newImageRect("blank.png", 1, 1)
	portals.p11to1.x = _W/2; portals.p11to1.y = _H/2
	
	portals.p11to11one = display.newImageRect("blank.png", 1, 1)
	portals.p11to11one.x = _W/2; portals.p11to11one.y = _H/2
	
	portals.p11to11two = display.newImageRect("blank.png", 1, 1)
	portals.p11to11two.x = _W/2; portals.p11to11two.y = _H/2
	
	portals.p11to111 = display.newImageRect("blank.png", 1, 1)
	portals.p11to111.x = _W/2; portals.p11to111.y = _H/2
	
	groups.g11:insert(portals.p11to1)
	groups.g11:insert(portals.p11to11one)
	groups.g11:insert(portals.p11to11two)
	groups.g11:insert(portals.p11to111)
	groups.g11:insert(blocks.b11)
	groups.g11.isVisible = false
	--========================================================
	groups.g111 = display.newGroup()
	
	blocks.b111 = display.newImageRect("l6block111.png", 320, 480)
	blocks.b111.x = _W/2; blocks.b111.y = _H/2
	
	spikes.s111 = display.newImageRect("blank.png", 1, 1)
	spikes.s111.x = _W/2; spikes.s111.y = _H/2
	
	portals.p111to11 = display.newImageRect("blank.png", 1, 1)
	portals.p111to11.x = _W/2; portals.p111to11.y = _H/2
	
	portals.p111to13 = display.newImageRect("blank.png", 1, 1)
	portals.p111to13.x = _W/2; portals.p111to13.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2+30; flag.y = _H/2+30
	
	ah.ah1301 = display.newImageRect("blank.png", 1, 1)
	ah.ah1301.x = _W/2; ah.ah1301.y = _H/2
	
	ah.ah1301over = display.newImageRect("l6ah1301over.png", 320, 480)
	ah.ah1301over.x = _W/2; ah.ah1301over.y = _H/2
	ah.ah1301over.isVisible = false
	
	local dah1301
	
	local cah1301 = function()
		transition.to(h.h1301, {time=3000, x=(_W/2-74), transition = easing.inQuad})
		print("h.h1301 opened!")
		arrowdata.ah1301= 1
		ah.ah1301over.isVisible = true
		dah1301();
	end
	
	dah1301 = function()
		ah.ah1301:removeEventListener("collision", cah1301)
	end
	
	ah.ah1301:addEventListener("collision", cah1301)
	
	groups.g111:insert(blocks.b111)
	groups.g111:insert(ah.ah1301)
	groups.g111:insert(ah.ah1301over)
	groups.g111:insert(portals.p111to11)
	groups.g111:insert(portals.p111to13)
	groups.g111:insert(spikes.s111)
	groups.g111:insert(flag)
	groups.g111.isVisible = false
	--========================================================
	groups.g12 = display.newGroup()
	
	blocks.b12 = display.newImageRect("l6block12.png", 320, 480)
	blocks.b12.x = _W/2; blocks.b12.y = _H/2
	
	spikes.s12 = display.newImageRect("blank.png", 1, 1)
	spikes.s12.x = _W/2; spikes.s12.y = _H/2
	
	portals.p12to1 = display.newImageRect("blank.png", 1, 1)
	portals.p12to1.x = _W/2; portals.p12to1.y = _H/2
	
	portals.p12to121 = display.newImageRect("blank.png", 1, 1)
	portals.p12to121.x = _W/2; portals.p12to121.y = _H/2
	
	-- Moving spikes in Group 12
	arrowdata.mvtime = 900
	arrowdata.mvright = _W/2+110
	arrowdata.mvleft = _W/2-10
	
	spikes.mv1201 = display.newImageRect("l5mv12.png", 87, 24)
	spikes.mv1201cover = display.newImageRect("blank.png", 87, 24)
	spikes.mv1202 = display.newImageRect("l6mv12.png", 144, 24)
	spikes.mv1202cover = display.newImageRect("blank.png", 87, 24)
	spikes.mv1203 = display.newImageRect("l6mv11.png", 87, 24)
	spikes.mv1203cover = display.newImageRect("blank.png", 87, 24)

	spikes.mv1201.x = arrowdata.mvleft; spikes.mv1201.y = _H/2-120
	spikes.mv1201cover.x = arrowdata.mvleft; spikes.mv1201cover.y = _H/2-120
	spikes.mv1202.x = _W/2+83; spikes.mv1202.y = _H/2
	spikes.mv1202cover.x = _W/2+83; spikes.mv1202cover.y = _H/2
	spikes.mv1203.x = arrowdata.mvright; spikes.mv1203.y = _H/2+120
	spikes.mv1203cover.x = arrowdata.mvright; spikes.mv1203cover.y = _H/2+120
	
	spikes.mv1201right = function()--[[
		spikes.mv1201.x = arrowdata.mvright
		spikes.mv1201cover.x = arrowdata.mvright]]--
	end
	
	spikes.mv1201left = function()--[[
		spikes.mv1201.x = arrowdata.mvleft
		spikes.mv1201cover.x = arrowdata.mvleft]]--
	end
	
	spikes.mv1203right = function()--[[
		spikes.mv1203.x = arrowdata.mvright
		spikes.mv1203cover.x = arrowdata.mvright]]--
	end
	
	spikes.mv1203left = function()--[[
		spikes.mv1203.x = arrowdata.mvleft
		spikes.mv1203cover.x = arrowdata.mvleft]]--
	end
	
	movespikes.mv1201two = function()
		spikes.move1201back = transition.to(spikes.mv1201, {time=arrowdata.mvtime, x=arrowdata.mvleft})
		spikes.move1201coverback = transition.to(spikes.mv1201cover, {time=arrowdata.mvtime, x=arrowdata.mvleft})
		timer.performWithDelay(arrowdata.mvtime, movespikes.mv1201)
		timer.performWithDelay(arrowdata.mvtime, spikes.mv1201left)
	end
	
	movespikes.mv1201 = function()
		spikes.move1201to = transition.to(spikes.mv1201, {time=arrowdata.mvtime, x=arrowdata.mvright})
		spikes.move1201coverto = transition.to(spikes.mv1201cover, {time=arrowdata.mvtime, x=arrowdata.mvright})
		timer.performWithDelay(arrowdata.mvtime, movespikes.mv1201two)
		timer.performWithDelay(arrowdata.mvtime, spikes.mv1201right)
	end
		
	movespikes.mv1203two = function()
		spikes.move1203back = transition.to(spikes.mv1203, {time=arrowdata.mvtime, x=arrowdata.mvright})
		spikes.move1203coverback = transition.to(spikes.mv1203cover, {time=arrowdata.mvtime, x=arrowdata.mvright})
		timer.performWithDelay(arrowdata.mvtime, movespikes.mv1203)
		timer.performWithDelay(arrowdata.mvtime, spikes.mv1203right)
	end
	
	movespikes.mv1203 = function()
		spikes.move1203to =  transition.to(spikes.mv1203, {time=arrowdata.mvtime, x=arrowdata.mvleft})
		spikes.move1203coverto = transition.to(spikes.mv1203cover, {time=arrowdata.mvtime, x=arrowdata.mvleft})
		timer.performWithDelay(arrowdata.mvtime, movespikes.mv1203two)
		timer.performWithDelay(arrowdata.mvtime, spikes.mv1203left)
	end
	
	movespikes.mv1201();
	movespikes.mv1203();

	groups.g12:insert(spikes.mv1201)
	groups.g12:insert(spikes.mv1202)
	groups.g12:insert(spikes.mv1203)
	
	groups.g12:insert(portals.p12to1)
	groups.g12:insert(portals.p12to121)
	groups.g12:insert(blocks.b12)
	groups.g12:insert(spikes.s12)
	groups.g12.isVisible = false
	--========================================================
	groups.g121 = display.newGroup()
	
	blocks.b121 = display.newImageRect("l6block121.png", 320, 480)
	blocks.b121.x = _W/2; blocks.b121.y = _H/2
	
	spikes.s121 = display.newImageRect("blank.png", 1, 1)
	spikes.s121.x = _W/2; spikes.s121.y = _H/2
	
	portals.p121to12 = display.newImageRect("blank.png", 1, 1)
	portals.p121to12.x = _W/2; portals.p121to12.y = _H/2
	
	ah.ah1401 = display.newImageRect("blank.png", 1, 1)
	ah.ah1401.x = _W/2; ah.ah1401.y = _H/2
	
	ah.ah1401over = display.newImageRect("l6ah1401over.png", 320, 480)
	ah.ah1401over.x = _W/2; ah.ah1401over.y = _H/2
	ah.ah1401over.isVisible = false
	
	local dah1401
	
	local cah1401 = function()
		transition.to(h.h1401, {time=3000, y=(_H/2+74), transition = easing.inQuad})
		print("h.h1401 opened!")
		arrowdata.ah1401= 1
		ah.ah1401over.isVisible = true
		dah1401();
	end
	
	dah1401 = function()
		ah.ah1401:removeEventListener("collision", cah1401)
	end
	
	ah.ah1401:addEventListener("collision", cah1401)

	groups.g121:insert(blocks.b121)
	groups.g121:insert(ah.ah1401)
	groups.g121:insert(ah.ah1401over)
	groups.g121:insert(portals.p121to12)
	groups.g121:insert(spikes.s121)
	groups.g121.isVisible = false
	--========================================================
	groups.g13 = display.newGroup()
	
	blocks.b13 = display.newImageRect("l6block13.png", 320, 480)
	blocks.b13.x = _W/2; blocks.b13.y = _H/2
	
	spikes.s13 = display.newImageRect("blank.png", 1, 1)
	spikes.s13.x = _W/2; spikes.s13.y = _H/2
	
	portals.p13to1 = display.newImageRect("blank.png", 1, 1)
	portals.p13to1.x = _W/2; portals.p13to1.y = _H/2
	
	portals.p13to111 = display.newImageRect("blank.png", 1, 1)
	portals.p13to111.x = _W/2; portals.p13to111.y = _H/2
	
	h.h1301 = display.newImageRect("l6h1301.png", 320, 480)
	h.h1301.x = _W/2; h.h1301.y = _H/2
	
	groups.g13:insert(blocks.b13)
	groups.g13:insert(h.h1301)
	groups.g13:insert(portals.p13to1)
	groups.g13:insert(portals.p13to111)
	groups.g13:insert(spikes.s13)
	groups.g13.isVisible = false
	--========================================================
	groups.g14 = display.newGroup()
	
	blocks.b14 = display.newImageRect("l6block14.png", 320, 480)
	blocks.b14.x = _W/2; blocks.b14.y = _H/2
	
	spikes.s14 = display.newImageRect("blank.png", 1, 1)
	spikes.s14.x = _W/2; spikes.s14.y = _H/2
	
	portals.p14to1 = display.newImageRect("blank.png", 1, 1)
	portals.p14to1.x = _W/2; portals.p14to1.y = _H/2
	
	portals.p14to141 = display.newImageRect("blank.png", 1, 1)
	portals.p14to141.x = _W/2; portals.p14to141.y = _H/2
	
	h.h1401 = display.newImageRect("l6h1401.png", 320, 480)
	h.h1401.x = _W/2; h.h1401.y = _H/2
	
	a.g14al1 = display.newImageRect("arrowleft.png", 28, 32)
	a.g14al1.x = _W/2+40; a.g14al1.y = _H/2-70
	a.g14al1:addEventListener("collision", ca.g14al1)
	
	a.g14al2 = display.newImageRect("arrowleft.png", 28, 32)
	a.g14al2.x = _W/2-20; a.g14al2.y = _H/2-140
	a.g14al2:addEventListener("collision", ca.g14al2)
	
	a.g14al3 = display.newImageRect("arrowleft.png", 28, 32)
	a.g14al3.x = _W/2-20; a.g14al3.y = _H/2
	a.g14al3:addEventListener("collision", ca.g14al3)
	
	a.g14ar1 = display.newImageRect("arrowright.png", 28, 32)
	a.g14ar1.x = _W/2+40; a.g14ar1.y = _H/2+70
	a.g14ar1:addEventListener("collision", ca.g14ar1)
	
	a.g14ar2 = display.newImageRect("arrowright.png", 28, 32)
	a.g14ar2.x = _W/2+100; a.g14ar2.y = _H/2
	a.g14ar2:addEventListener("collision", ca.g14ar2)
	
	a.g14ar3 = display.newImageRect("arrowright.png", 28, 32)
	a.g14ar3.x = _W/2+100; a.g14ar3.y = _H/2+140
	a.g14ar3:addEventListener("collision", ca.g14ar3)
	
	groups.g14:insert(h.h1401)
	groups.g14:insert(portals.p14to1)
	groups.g14:insert(portals.p14to141)
	groups.g14:insert(blocks.b14)
	groups.g14:insert(spikes.s14)
	
	groups.g14:insert(a.g14al1)
	groups.g14:insert(a.g14al2)
	groups.g14:insert(a.g14al3)
	groups.g14:insert(a.g14ar1)
	groups.g14:insert(a.g14ar2)
	groups.g14:insert(a.g14ar3)
	
	groups.g14.isVisible = false
	--========================================================
	groups.g141 = display.newGroup()
	
	blocks.b141 = display.newImageRect("l6block141.png", 320, 480)
	blocks.b141.x = _W/2; blocks.b141.y = _H/2
	
	portals.p141to14 = display.newImageRect("blank.png", 1, 1)
	portals.p141to14.x = _W/2; portals.p141to14.y = _H/2
	
	groups.g141:insert(portals.p141to14)
	groups.g141:insert(blocks.b141)
	groups.g141.isVisible = false
--=============================================================================================================================================================
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
	-- Le fonctions du portal switchie.
	-- PortalSwitchie.portal1to11
	ps.p1to11 = function()
	
		groups.g1.isVisible = false
		groups.g11.isVisible = true
		
		physics.removeBody(blocks.b1)
		physics.removeBody(portals.p1to11)
		physics.removeBody(portals.p1to12)
		physics.removeBody(portals.p1to13)
		physics.removeBody(portals.p1to14)
		
		physics.addBody( blocks.b11, "static", physicsData:get("l6block11") )
		physics.addBody( portals.p11to1, "static", physicsData:get("l6portal11to1") )
		physics.addBody( portals.p11to11one, "static", physicsData:get("l6portal11to11one") )
		physics.addBody( portals.p11to11two, "static", physicsData:get("l6portal11to11two") )
		physics.addBody( portals.p11to111, "static", physicsData:get("l6portal11to111") )
	
		ball.x = _W/2 - 110; ball.y = _H/2 + 202
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p1to11")
		
		ca.exitlevel1();
	
	end
	
	ps.delayp1to11 = function()
		timer.performWithDelay(1, ps.p1to11)
	end
	
	portals.p1to11:addEventListener("collision", ps.delayp1to11)
	
	--========================================================
	-- PortalSwitchie.portal11to1

	ps.p11to1 = function()
	
		groups.g1.isVisible = true
		groups.g11.isVisible = false
		
		physics.removeBody(blocks.b11)
		physics.removeBody(portals.p11to1)
		physics.removeBody(portals.p11to11one)
		physics.removeBody(portals.p11to11two)
		physics.removeBody(portals.p11to111)
		
		physics.addBody( blocks.b1, "static", physicsData:get("l6block1") )
		physics.addBody( portals.p1to11, "static", physicsData:get("l6portal1to11") )
		physics.addBody( portals.p1to12, "static", physicsData:get("l6portal1to12") )
		physics.addBody( portals.p1to13, "static", physicsData:get("l6portal1to13") )
		physics.addBody( portals.p1to14, "static", physicsData:get("l6portal1to14") )
	
		ball.x = _W/2 + 110; ball.y = _H/2
		ball:setLinearVelocity(0, 0)
		print("p11to1")
		timer.performWithDelay(1, ps.mvballleft)
		
		ca.togroup1();
		
	end
	
	ps.delayp11to1 = function()
		timer.performWithDelay(1, ps.p11to1)
	end
	
	portals.p11to1:addEventListener("collision", ps.delayp11to1)
	--========================================================
	-- PortalSwitchie.portal11to11one

	ps.p11to11one = function()

		portals.p11to11one:removeEventListener("collision", ps.delayp11to11one)
		ball.x = _W/2 + 117; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		print("p11to11one")
		ps.mvballdown()
	
	end
	
	ps.delayp11to11one = function()
		portals.p11to11two:addEventListener("collision", ps.delayp11to11two)
		timer.performWithDelay(1, ps.p11to11one)
	end
	
	portals.p11to11one:addEventListener("collision", ps.delayp11to11one)
	--========================================================
	-- PortalSwitchie.portal11to11two

	ps.p11to11two = function()

		portals.p11to11two:removeEventListener("collision", ps.delayp11to11two)
		ball.x = _W/2 - 117; ball.y = _H/2 + 100
		ball:setLinearVelocity(0, 0)
		print("p11to11two")
		ps.mvballup()
	
	end
	
	ps.delayp11to11two = function()
		portals.p11to11one:addEventListener("collision", ps.delayp11to11one)
		timer.performWithDelay(1, ps.p11to11two)
	end
	
	portals.p11to11two:addEventListener("collision", ps.delayp11to11two)
	--========================================================
	-- PortalSwitchie.portal11to111

	ps.p11to111 = function()
	
		groups.g111.isVisible = true
		groups.g11.isVisible = false
		
		physics.removeBody(blocks.b11)
		physics.removeBody(portals.p11to1)
		physics.removeBody(portals.p11to11one)
		physics.removeBody(portals.p11to11two)
		physics.removeBody(portals.p11to111)
		
		physics.addBody( blocks.b111, "static", physicsData:get("l6block111") )
		physics.addBody( spikes.s111, "static", physicsData:get("l6block111spikes") )
		physics.addBody( portals.p111to11, "static", physicsData:get("l6portal111to11") )
		physics.addBody( portals.p111to13, "static", physicsData:get("l6portal111to13") )
		physics.addBody( ah.ah1301, "static", physicsData:get("l6ah1301") )
		physics.addBody( flag, "static", {bounce = 0.2} )
	
		ball.x = _W/2 - 113; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
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
		physics.removeBody(spikes.s111)
		physics.removeBody(portals.p111to11)
		physics.removeBody(portals.p111to13)
		physics.removeBody(ah.ah1301)
		physics.removeBody(flag)
		
		physics.addBody( blocks.b11, "static", physicsData:get("l6block11") )
		physics.addBody( portals.p11to1, "static", physicsData:get("l6portal11to1") )
		physics.addBody( portals.p11to11two, "static", physicsData:get("l6portal11to11two") )
		physics.addBody( portals.p11to11one, "static", physicsData:get("l6portal11to11one") )
		physics.addBody( portals.p11to111, "static", physicsData:get("l6portal11to111") )
	
		ball.x = _W/2 + 41; ball.y = _H/2 - 190
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p111to11")
	
	end
	
	ps.delayp111to11 = function()
		timer.performWithDelay(1, ps.p111to11)
	end
	
	portals.p111to11:addEventListener("collision", ps.delayp111to11)
	--========================================================
	-- PortalSwitchie.portal1to12
	ps.p1to12 = function()
	
		groups.g1.isVisible = false
		groups.g12.isVisible = true
		
		physics.removeBody(blocks.b1)
		physics.removeBody(portals.p1to11)
		physics.removeBody(portals.p1to12)
		physics.removeBody(portals.p1to13)
		physics.removeBody(portals.p1to14)
		
		physics.addBody( blocks.b12, "static", physicsData:get("l6block12") )
		physics.addBody( spikes.s12, "static", physicsData:get("l6block12spikes") )
		physics.addBody( portals.p12to1, "static", physicsData:get("l6portal12to1") )
		physics.addBody( portals.p12to121, "static", physicsData:get("l6portal12to121") )
		physics.addBody( spikes.mv1201, "static", physicsData5:get("l5mv12") )
		physics.addBody( spikes.mv1202, "static", physicsData:get("l6mv12") )
		physics.addBody( spikes.mv1203, "static", physicsData:get("l6mv13") )
		physics.addBody( spikes.mv1201cover, "static", physicsData5:get("l5mv12cover") )
		physics.addBody( spikes.mv1203cover, "static", physicsData:get("l6mv13cover") )
		physics.addBody( spikes.mv1202cover, "static", physicsData:get("l6mv12cover") )
	
		ball.x = _W/2 - 117; ball.y = _H/2 - 105
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p1to12")
		
		ca.exitlevel1();
	
	end
	
	ps.delayp1to12 = function()
		timer.performWithDelay(1, ps.p1to12)
	end
	
	portals.p1to12:addEventListener("collision", ps.delayp1to12)
	--========================================================
	-- PortalSwitchie.portal12to1
	ps.p12to1 = function()
	
		groups.g1.isVisible = true
		groups.g12.isVisible = false
		
		physics.removeBody(blocks.b12)
		physics.removeBody(spikes.s12)
		physics.removeBody(portals.p12to1)
		physics.removeBody(portals.p12to121)
		physics.removeBody(spikes.mv1201)
		physics.removeBody(spikes.mv1202)
		physics.removeBody(spikes.mv1203)
		physics.removeBody(spikes.mv1201cover)
		physics.removeBody(spikes.mv1202cover)
		physics.removeBody(spikes.mv1203cover)
		
		physics.addBody( blocks.b1, "static", physicsData:get("l6block1") )
		physics.addBody( portals.p1to11, "static", physicsData:get("l6portal1to11") )
		physics.addBody( portals.p1to12, "static", physicsData:get("l6portal1to12") )
		physics.addBody( portals.p1to13, "static", physicsData:get("l6portal1to13") )
		physics.addBody( portals.p1to14, "static", physicsData:get("l6portal1to14") )
	
		ball.x = _W/2; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		print("p12to1")
		timer.performWithDelay(1, ps.mvballup)
		
		ca.togroup1();
	
	end
	
	ps.delayp12to1 = function()
		timer.performWithDelay(1, ps.p12to1)
	end
	
	portals.p12to1:addEventListener("collision", ps.delayp12to1)
	--========================================================
	-- PortalSwitchie.portal12to121
	ps.p12to121 = function()
	
		groups.g121.isVisible = true
		groups.g12.isVisible = false
		
		physics.removeBody(blocks.b12)
		physics.removeBody(spikes.s12)
		physics.removeBody(portals.p12to1)
		physics.removeBody(portals.p12to121)
		physics.removeBody(spikes.mv1201)
		physics.removeBody(spikes.mv1202)
		physics.removeBody(spikes.mv1203)
		physics.removeBody(spikes.mv1201cover)
		physics.removeBody(spikes.mv1202cover)
		physics.removeBody(spikes.mv1203cover)
		
		physics.addBody( blocks.b121, "static", physicsData:get("l6block121") )
		physics.addBody( spikes.s121, "static", physicsData:get("l6block121spikes") )
		physics.addBody( portals.p121to12, "static", physicsData:get("l6portal121to12") )
		physics.addBody( ah.ah1401, "static", physicsData:get("l6ah1401") )
	
		ball.x = _W/2+42; ball.y = _H/2+55
		ball:setLinearVelocity(0, 0)
		print("p12to121")
		timer.performWithDelay(1, ps.mvballup)
		
		if arrowdata.ah1401 == 1 then
			ah.ah1401over.isVisible = true
		elseif arrowdata.ah1401 == 0 then
		
		end
	
	end
	
	ps.delayp12to121 = function()
		timer.performWithDelay(1, ps.p12to121)
	end
	
	portals.p12to121:addEventListener("collision", ps.delayp12to121)
	--========================================================
	-- PortalSwitchie.portal121to12
	ps.p121to12 = function()
	
		groups.g12.isVisible = true
		groups.g121.isVisible = false
		
		physics.removeBody(blocks.b121)
		physics.removeBody(spikes.s121)
		physics.removeBody(portals.p121to12)
		physics.removeBody(ah.ah1401)
		
		physics.addBody( blocks.b12, "static", physicsData:get("l6block12") )
		physics.addBody( spikes.s12, "static", physicsData:get("l6block12spikes") )
		physics.addBody( portals.p12to1, "static", physicsData:get("l6portal12to1") )
		physics.addBody( portals.p12to121, "static", physicsData:get("l6portal12to121") )
		physics.addBody( spikes.mv1201, "static", physicsData5:get("l5mv12") )
		physics.addBody( spikes.mv1202, "static", physicsData:get("l6mv12") )
		physics.addBody( spikes.mv1203, "static", physicsData:get("l6mv13") )
		physics.addBody( spikes.mv1201cover, "static", physicsData5:get("l5mv12cover") )
		physics.addBody( spikes.mv1203cover, "static", physicsData:get("l6mv13cover") )
		physics.addBody( spikes.mv1202cover, "static", physicsData:get("l6mv12cover") )
	
		ball.x = _W/2 - 105; ball.y = _H/2 - 197
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p121to12")
	
	end
	
	ps.delayp121to12 = function()
		timer.performWithDelay(1, ps.p121to12)
	end
	
	portals.p121to12:addEventListener("collision", ps.delayp121to12)
	--========================================================
	-- PortalSwitchie.portal1to13
	ps.p1to13 = function()
	
		groups.g1.isVisible = false
		groups.g13.isVisible = true
		
		physics.removeBody(blocks.b1)
		physics.removeBody(portals.p1to11)
		physics.removeBody(portals.p1to12)
		physics.removeBody(portals.p1to13)
		physics.removeBody(portals.p1to14)
		
		physics.addBody( blocks.b13, "static", physicsData:get("l6block13") )
		physics.addBody( spikes.s13, "static", physicsData:get("l6block13spikes") )
		physics.addBody( portals.p13to1, "static", physicsData:get("l6portal13to1") )
		physics.addBody( portals.p13to111, "static", physicsData:get("l6portal13to111") )
		physics.addBody( h.h1301, "static", physicsData:get("l6h1301") )
	
		ball.x = _W/2 + 110; ball.y = _H/2 + 202
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballleft)
		print("p1to13")
		
		ca.exitlevel1();
	
	end
	
	ps.delayp1to13 = function()
		timer.performWithDelay(1, ps.p1to13)
	end
	
	portals.p1to13:addEventListener("collision", ps.delayp1to13)
	--========================================================
	-- PortalSwitchie.portal13to1
	ps.p13to1 = function()
	
		groups.g1.isVisible = true
		groups.g13.isVisible = false
		
		physics.removeBody(blocks.b13)
		physics.removeBody(spikes.s13)
		physics.removeBody(portals.p13to1)
		physics.removeBody(portals.p13to111)
		physics.removeBody(h.h1301)
		
		physics.addBody( blocks.b1, "static", physicsData:get("l6block1") )
		physics.addBody( portals.p1to11, "static", physicsData:get("l6portal1to11") )
		physics.addBody( portals.p1to12, "static", physicsData:get("l6portal1to12") )
		physics.addBody( portals.p1to13, "static", physicsData:get("l6portal1to13") )
		physics.addBody( portals.p1to14, "static", physicsData:get("l6portal1to14") )
	
		ball.x = _W/2 - 110; ball.y = _H/2
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p13to1")
		
		ca.togroup1();
	
	end
	
	ps.delayp13to1 = function()
		timer.performWithDelay(1, ps.p13to1)
	end
	
	portals.p13to1:addEventListener("collision", ps.delayp13to1)
	--========================================================
	-- PortalSwitchie.portal13to111
	ps.p13to111 = function()
	
		groups.g111.isVisible = true
		groups.g13.isVisible = false
		
		physics.removeBody(blocks.b13)
		physics.removeBody(spikes.s13)
		physics.removeBody(portals.p13to1)
		physics.removeBody(portals.p13to111)
		physics.removeBody(h.h1301)
		
		physics.addBody( blocks.b111, "static", physicsData:get("l6block111") )
		physics.addBody( spikes.s111, "static", physicsData:get("l6block111spikes") )
		physics.addBody( portals.p111to11, "static", physicsData:get("l6portal111to11") )
		physics.addBody( portals.p111to13, "static", physicsData:get("l6portal111to13") )
		physics.addBody( flag, "static", {bounce = 0.2} )
	
		ball.x = _W/2+42; ball.y = _H/2-105
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballdown)
		print("p13to111")
	
	end
	
	ps.delayp13to111 = function()
		timer.performWithDelay(1, ps.p13to111)
	end
	
	portals.p13to111:addEventListener("collision", ps.delayp13to111)
	--========================================================
	-- PortalSwitchie.portal111to13
	ps.p111to13 = function()
	
		groups.g111.isVisible = false
		groups.g13.isVisible = true
		
		physics.removeBody(blocks.b111)
		physics.removeBody(spikes.s111)
		physics.removeBody(portals.p111to11)
		physics.removeBody(portals.p111to13)
		physics.removeBody(flag)
		
		physics.addBody( blocks.b13, "static", physicsData:get("l6block13") )
		physics.addBody( spikes.s13, "static", physicsData:get("l6block13spikes") )
		physics.addBody( portals.p13to1, "static", physicsData:get("l6portal13to1") )
		physics.addBody( portals.p13to111, "static", physicsData:get("l6portal13to111") )
		physics.addBody( h.h1301, "static", physicsData:get("l6h1301") )
	
		ball.x = _W/2+42; ball.y = _H/2
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p111to13")
	
	end
	
	ps.delayp111to13 = function()
		timer.performWithDelay(1, ps.p111to13)
	end
	
	portals.p111to13:addEventListener("collision", ps.delayp111to13)
	
	--========================================================
	-- PortalSwitchie.portal1to14
	ps.p1to14 = function()
	
		groups.g1.isVisible = false
		groups.g14.isVisible = true
		
		physics.removeBody(blocks.b1)
		physics.removeBody(portals.p1to11)
		physics.removeBody(portals.p1to12)
		physics.removeBody(portals.p1to13)
		physics.removeBody(portals.p1to14)
		
		physics.addBody( blocks.b14, "static", physicsData:get("l6block14") )
		physics.addBody( spikes.s14, "static", physicsData:get("l6block14spikes") )
		physics.addBody( portals.p14to1, "static", physicsData:get("l6portal14to1") )
		physics.addBody( portals.p14to141, "static", physicsData:get("l6portal14to141") )
		physics.addBody( h.h1401, "static", physicsData:get("l6h1401") )

	
		ball.x = _W/2 - 117; ball.y = _H/2 + 185
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballup)
		print("p1to14")
		
		ca.exitlevel1();
		ca.togroup14();
	
	end
	
	ps.delayp1to14 = function()
		timer.performWithDelay(1, ps.p1to14)
	end
	
	portals.p1to14:addEventListener("collision", ps.delayp1to14)
	--========================================================
	-- PortalSwitchie.portal14to1

	ps.p14to1 = function()
	
		groups.g1.isVisible = true
		groups.g14.isVisible = false
		
		physics.removeBody(blocks.b14)
		physics.removeBody(spikes.s14)
		physics.removeBody(portals.p14to1)
		physics.removeBody(portals.p14to141)
		physics.removeBody(h.h1401)
		
		physics.addBody( blocks.b1, "static", physicsData:get("l6block1") )
		physics.addBody( portals.p1to11, "static", physicsData:get("l6portal1to11") )
		physics.addBody( portals.p1to12, "static", physicsData:get("l6portal1to12") )
		physics.addBody( portals.p1to13, "static", physicsData:get("l6portal1to13") )
		physics.addBody( portals.p1to14, "static", physicsData:get("l6portal1to14") )
	
		ball.x = _W/2; ball.y = _H/2-190
		ball:setLinearVelocity(0, 0)
		print("p14to1")
		timer.performWithDelay(1, ps.mvballdown)
		
		ca.togroup1();
		ca.exitlevel14();
	
	end
	
	ps.delayp14to1 = function()
		timer.performWithDelay(1, ps.p14to1)
	end
	
	portals.p14to1:addEventListener("collision", ps.delayp14to1)
	--========================================================
	-- PortalSwitchie.portal141to14

	ps.p14to141 = function()
	
		groups.g14.isVisible = false
		groups.g141.isVisible = true
		
		physics.removeBody(blocks.b14)
		physics.removeBody(spikes.s14)
		physics.removeBody(portals.p14to1)
		physics.removeBody(portals.p14to141)
		physics.removeBody(h.h1401)
		
		physics.addBody( blocks.b141, "static", physicsData:get("l6block141") )
		physics.addBody( portals.p141to14, "static", physicsData:get("l6portal141to14") )
	
		ball.x = _W/2+110; ball.y = _H/2-202
		ball:setLinearVelocity(0, 0)
		print("p14to141")
		timer.performWithDelay(1, ps.mvballleft)
		
		ca.exitlevel14();
	
	end
	
	ps.delayp14to141 = function()
		timer.performWithDelay(1, ps.p14to141)
	end
	
	portals.p14to141:addEventListener("collision", ps.delayp14to141)
	--========================================================
	-- PortalSwitchie.portal141to14
	ps.p141to14 = function()
	
		groups.g141.isVisible = false
		groups.g14.isVisible = true
		
		physics.removeBody(blocks.b141)
		physics.removeBody(portals.p141to14)
		
		physics.addBody( blocks.b14, "static", physicsData:get("l6block14") )
		physics.addBody( spikes.s14, "static", physicsData:get("l6block14spikes") )
		physics.addBody( portals.p14to1, "static", physicsData:get("l6portal14to1") )
		physics.addBody( portals.p14to141, "static", physicsData:get("l6portal14to141") )
		physics.addBody( h.h1401, "static", physicsData:get("l6h1401") )
	
		ball.x = _W/2 - 30; ball.y = _H/2 + 200
		ball:setLinearVelocity(0, 0)
		timer.performWithDelay(1, ps.mvballright)
		print("p141to14")
		
		ca.togroup14();
	
	end
	
	ps.delayp141to14 = function()
		timer.performWithDelay(1, ps.p141to14)
	end
	
	portals.p141to14:addEventListener("collision", ps.delayp141to14)
	--=======================================================================================================================================================
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
		ispassed.l6 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl7")
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
		storyboard.gotoScene("restartl6", "fade", 100)
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
	-- Spikes = die.
	flag.collision = nextscene
	spikes.s111.collision = restarthtp
	spikes.s12.collision = restarthtp
	spikes.s121.collision = restarthtp
	spikes.s13.collision = restarthtp
	spikes.s14.collision = restarthtp
	spikes.mv1201.collision = restarthtp
	spikes.mv1202.collision = restarthtp
	spikes.mv1203.collision = restarthtp

	flag:addEventListener("collision", flag)
	spikes.s14:addEventListener("collision", spikes.s14)
	spikes.s13:addEventListener("collision", spikes.s13)
	spikes.s121:addEventListener("collision", spikes.s121)
	spikes.s12:addEventListener("collision", spikes.s12)
	spikes.s111:addEventListener("collision", spikes.s111)
	spikes.mv1201:addEventListener("collision", spikes.mv1201)
	spikes.mv1202:addEventListener("collision", spikes.mv1202)
	spikes.mv1203:addEventListener("collision", spikes.mv1203)


	group:insert(background);
	group:insert(ball)
	group:insert(groups.g1)
	group:insert(groups.g11)
	group:insert(groups.g111)
	group:insert(groups.g12)
	group:insert(groups.g121)
	group:insert(groups.g13)
	group:insert(groups.g14)
	group:insert(groups.g141)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 6 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)
	spikes.s14:removeEventListener("collision", spikes.s14)
	spikes.s13:removeEventListener("collision", spikes.s13)
	spikes.s121:removeEventListener("collision", spikes.s121)
	spikes.s12:removeEventListener("collision", spikes.s12)
	spikes.s111:removeEventListener("collision", spikes.s111)
	
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	
	display.remove(spikes.mv1201)
	display.remove(spikes.mv1202)
	display.remove(spikes.mv1203)
	display.remove(spikes.mv1201cover)
	display.remove(spikes.mv1202cover)
	display.remove(spikes.mv1203cover)
	
	transition.cancel(spikes.move1201to)
	transition.cancel(spikes.move1201back)
	transition.cancel(spikes.move1201coverto)
	transition.cancel(spikes.move1201coverback)
	transition.cancel(spikes.move1203to)
	transition.cancel(spikes.move1203back)
	transition.cancel(spikes.move1203coverto)
	transition.cancel(spikes.move1203coverback)
	
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