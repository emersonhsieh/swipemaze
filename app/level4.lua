--Level4:  kinda like level 2

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata4" )
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

local group1
local group11
local group111
local group12
local group121
local group112
local block1, spikes1
local block11, spikes11
local block111, spikes111
local block12, spikes12
local block121, spikes121
local block112, spikes112
local portalgroup1, portalgroup11, portalgroup111
local portalgroup12, portalgroup121, portalgroup112
local activator11

playarrowsound = function()
    audio.play( sfx.arrowpop )
end

arrowdata.g12au1 = nil
arrowdata.g12au2 = nil
arrowdata.g12au3 = nil
arrowdata.g12au4 = nil
arrowdata.g12au5 = nil
arrowdata.g12au6 = nil

arrowdata.g121ad1 = nil
arrowdata.g121ad2 = nil

-- Globals for arrows
arrowdata.g1ad1 = nil

arrowdata.g11al1 = nil

arrowdata.g111ar1 = nil
arrowdata.g111ar2 = nil
arrowdata.g111ar3 = nil

arrowdata.g112al1 = nil
arrowdata.g112au1 = nil
arrowdata.g112ar1 = nil
arrowdata.g112ad1 = nil
arrowdata.g112al2 = nil
arrowdata.g112au2 = nil
arrowdata.g112ar2 = nil
arrowdata.g112ad2 = nil

arrowdata.g12al1 = nil
arrowdata.g12al2 = nil
arrowdata.g12ar1 = nil
arrowdata.g12ar2 = nil

arrowdata.g12ad1 = nil
arrowdata.g12ad2 = nil
arrowdata.g12ad3 = nil
arrowdata.g12ad4 = nil
arrowdata.g12ad5 = nil
arrowdata.g12ad6 = nil

arrowdata.g12au1 = nil
arrowdata.g12au2 = nil
arrowdata.g12au3 = nil
arrowdata.g12au4 = nil
arrowdata.g12au5 = nil
arrowdata.g12au6 = nil

arrowdata.g121ad1 = nil
arrowdata.g121ad2 = nil

arrowdata.g1ad1 = 0

arrowdata.g11al1 = 0

arrowdata.g111ar1 = 0
arrowdata.g111ar2 = 0
arrowdata.g111ar3 = 0

arrowdata.g112al1 = 0
arrowdata.g112au1 = 0
arrowdata.g112ar1 = 0
arrowdata.g112ad1 = 0
arrowdata.g112al2 = 0
arrowdata.g112au2 = 0
arrowdata.g112ar2 = 0
arrowdata.g112ad2 = 0

arrowdata.g12al1 = 0
arrowdata.g12al2 = 0
arrowdata.g12ar1 = 0
arrowdata.g12ar2 = 0

arrowdata.g12ad1 = 0
arrowdata.g12ad2 = 0
arrowdata.g12ad3 = 0
arrowdata.g12ad4 = 0
arrowdata.g12ad5 = 0
arrowdata.g12ad6 = 0

arrowdata.g12au1 = 0
arrowdata.g12au2 = 0
arrowdata.g12au3 = 0
arrowdata.g12au4 = 0
arrowdata.g12au5 = 0
arrowdata.g12au6 = 0

arrowdata.g121ad1 = 0
arrowdata.g121ad2 = 0

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
local physicsData = (require "bl4block").physicsData(scaleFactor)

-- CODING BEGINS
--==============================================================
	 function cg1ad1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g1ad1 collided, g1ad1 +1")
			playarrowsound();
		arrowdata.g1ad1 = 1

		end
	end
	--==============================================================
	-- Group11
	 function cg11al1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g11al1 collided, g11al1 +1")
			playarrowsound();

			arrowdata.g11al1 = 1

		end
	end	
	--==============================================================
	--Group111
	 function cg111ar1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g111ar1 collided, g111ar1 +1")
						playarrowsound();
			arrowdata.g111ar1 = 1

		end
	end

	 function cg111ar2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g111ar2 collided, g111ar2 +1")
			playarrowsound();
			arrowdata.g111ar2 = 1

		end
	end
	
	 function cg111ar3(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g111ar3 collided, g111ar3 +1")
			playarrowsound();
			arrowdata.g111ar3 = 1

		end
	end
	--==============================================================
	-- Group112
	 function cg112al1(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)
			ball:applyLinearImpulse( -5, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112al1 collided, g112al1 +1")
			playarrowsound();
			arrowdata.g112al1 = 1

		end
	end	
	
	 function cg112au1(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 0, -5, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112au1 collided, g112au1 +1")
			playarrowsound();
		arrowdata.g112au1 = 1

		end
	end

	 function cg112ar1(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 5, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112ar1 collided, g112ar1 +1")
			playarrowsound();
			arrowdata.g112ar1 = 1

		end
	end	
	
	 function cg112ad1(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 0, 5, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112ad1 collided, g112ad1 +1")
			playarrowsound();
			arrowdata.g112ad1 = 1

		end
	end
	
	 function cg112al2(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( -5, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112al2 collided, g112al2 +1")
			playarrowsound();
			arrowdata.g112al2 = 1

		end
	end	
	
	 function cg112au2(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 0, -5, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112au2 collided, g112au2 +1")
			playarrowsound();
			arrowdata.g112au2 = 1

		end
	end
	
	 function cg112ar2(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 5, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112ar2 collided, g112ar2 +1")
			playarrowsound();
			arrowdata.g112ar2 = 1

		end
	end	
	
	 function cg112ad2(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 0, 5, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g112ad2 collided, g112ad2 +1")
			playarrowsound();
			arrowdata.g112ad2 = 1

		end
	end	
	--==============================================================
	-- Group12
	 function cg12al1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12al1 collided, g12al1 +1")
			playarrowsound();
			arrowdata.g12al1 = 1

		end
	end	
	
	 function cg12al2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12al2 collided, g12al1 +1")
			playarrowsound();
			arrowdata.g12al2 = 1

		end
	end	
	
	 function cg12ar1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ar1 collided, g12ar1 +1")
			playarrowsound();
			arrowdata.g12ar1 = 1

		end
	end	
	
	 function cg12ar2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ar2 collided, g12ar2 +1")
			playarrowsound();
			arrowdata.g12ar2 = 1

		end
	end
	
	 function cg12ad1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ad1 collided, g12ad1 +1")
			playarrowsound();
			arrowdata.g12ad1 = 1

		end
	end	
	
	 function cg12ad2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ad2 collided, g12ad2 +1")
			playarrowsound();
			arrowdata.g12ad2 = 1

		end
	end	
	
	 function cg12ad3(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ad3 collided, g12ad3 +1")
			playarrowsound();
			arrowdata.g12ad3 = 1

		end
	end	
	
	 function cg12ad4(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ad4 collided, g12ad4 +1")
			playarrowsound();
			arrowdata.g12ad4 = 1

		end
	end	
	
	 function cg12ad5(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ad5 collided, g12ad5 +1")
			playarrowsound();
			arrowdata.g12ad5 = 1

		end
	end	
	
	 function cg12ad6(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12ad6 collided, g12ad6 +1")
			playarrowsound();
			arrowdata.g12ad6 = 1

		end
	end	
	
--==============================================================
		 function cg12au1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, -bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12au1 collided, g12au1 +1")
			playarrowsound();
			arrowdata.g12au1 = 1

		end
	end	
	
	 function cg12au2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12au2 collided, g12au2 +1")
			playarrowsound();
			arrowdata.g12au2 = 1

		end
	end	
	
	 function cg12au3(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, -bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12au3 collided, g12au3 +1")
			playarrowsound();
			arrowdata.g12au3 = 1

		end
	end	
	
	 function cg12au4(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, -bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12au4 collided, g12au4 +1")
			playarrowsound();
			arrowdata.g12au4 = 1

		end
	end	
	
	 function cg12au5(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, -bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12au5 collided, g12au5 +1")
			playarrowsound();
			arrowdata.g12au5 = 1

		end
	end	
	
	 function cg12au6(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 0, -bf, ball.x, ball.y )
	        display.remove( event.target )
            event.target= nil;
			print("g12au6 collided, g12au6 +1")
			playarrowsound();
			arrowdata.g12au6 = 1

		end
	end
	--==============================================================
	-- Group 121
	
	 function cg121ad1(event)
	
		if ( event.phase == "began" ) then
			ball:setLinearVelocity(0, 0)

			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g121ad1 collided, g121ad1 +1")
			playarrowsound();
			arrowdata.g121ad1 = 1

		end
	end	
	
--==============================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 + 123; ball.y = _H/2 +202
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	local pausebutton = widget.newButton
	{
		defaultFile = "pausebuttonbottom.png",
		overFile = "pausebuttonbottomover.png",
		width = 37,
		height = 37,
	}	pausebutton.x = 18; pausebutton.y = _H-18;
	
	--=======================================================
	group1 = display.newGroup()

	block1 = display.newImageRect("l4block1.png", 320, 480)
	physics.addBody( block1, "static", physicsData:get("l4block1") )
	block1.x = _W/2; block1.y = _H/2

	spikes1 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( spikes1, "static", physicsData:get("l4block1spikes") )
	spikes1.x = _W/2; spikes1.y = _H/2

	group1:insert(block1);
	group1:insert(spikes1)

	group1.isVisible = true
	--========================================================
	local activatorgroup = display.newGroup()
	
	activator11two = display.newImageRect("l4blocker11activator2.png", 320, 480)
	activator11two.x = _W/2; activator11two.y = _H/2
	
	activatorgroup:insert(activator11two)
	
	activatorgroup.isVisible = false
	--========================================================
	group11 = display.newGroup()
	
	block11 = display.newImageRect("l4block1-1.png", 320, 480)
	block11.x = _W/2; block11.y = _H/2
	
	spikes11 = display.newImageRect("blank.png", 1, 1)
	spikes11.x = _W/2; spikes11.y = _H/2
	
	local blocker11 = display.newImageRect("l4block11blocker.png", 320, 480)
	blocker11.x = _W/2; blocker11.y = _H/2
	
	activator11 = display.newImageRect("blank.png", 1, 1)
	activator11.x = _W/2; activator11.y = _H/2
			
	local removelistener11
	
	arrowdata.a11 = nil
	arrowdata.a11 = 0
	
	local cblocker11 = function()
		transition.to(blocker11, {time=3000, y=_W/2-65, transition = easing.inQuad})
		print("New road in group 11 opened!")
		arrowdata.a11 = 1
		removelistener11();
	end
	
	removelistener11 = function()
		activator11:removeEventListener("collision", cblocker11)
		activatorgroup.isVisible = true
	end

	group11:insert(blocker11)
	group11:insert(block11)
	group11:insert(spikes11)
	group11:insert(activator11)

	group11.isVisible = false
	--========================================================
	group12 = display.newGroup()
	
	block12 = display.newImageRect("l4block1-2.png", 320, 480)
	block12.x = _W/2; block12.y = _H/2
	
	spikes12 = display.newImageRect("blank.png", 1, 1)
	spikes12.x = _W/2; spikes12.y = _H/2

	group12:insert(block12)
	group12:insert(spikes12)
	
	group12.isVisible = false
	--========================================================
	group121 = display.newGroup()
	
	block121 = display.newImageRect("l4block1-2-1.png", 320, 480)
	block121.x = _W/2; block121.y = _H/2

	group121:insert(block121)

	group121.isVisible = false

	--========================================================
	group111 = display.newGroup()
	
	block111 = display.newImageRect("l4block1-1-1.png", 320, 480)
	block111.x = _W/2; block111.y = _H/2
	
	spikes111 = display.newImageRect("blank.png", 1, 1)
	spikes111.x = _W/2; spikes111.y = _H/2

	group111:insert(block111)
	group111:insert(spikes111)
	
	group111.isVisible = false
	--========================================================
	group112 = display.newGroup()
	
	block112 = display.newImageRect("l4block1-1-2.png", 320, 480)
	block112.x = _W/2; block112.y = _H/2
	
	spikes112 = display.newImageRect("blank.png", 1, 1)
	spikes112.x = _W/2; spikes112.y = _H/2

	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2+42; flag.y = _H/2+30
	
	group112:insert(block112)
	group112:insert(spikes112)	
	group112:insert(flag)
	group112.isVisible = false
	--========================================================

	local backgroundgroup = display.newGroup()
	
	local background2 = display.newImageRect("background.png", 320, 568);
	background2.x = _W/2; background2.y = _H/2;
	
	backgroundgroup:insert(background2)
	
	backgroundgroup.isVisible = false
	--========================================================
	-- Portal Groups
	-- Group1
	portalgroup1 = display.newGroup()
	
	 portal1to11 = display.newImageRect("blank.png", 1, 1)
	portal1to11.x = _W/2; portal1to11.y = _H/2
	physics.addBody( portal1to11, "static", physicsData:get("l4portal1to11") )
	
	 portal1to12 = display.newImage("blank.png", 1, 1)
	portal1to12.x = _W/2; portal1to12.y = _H/2
	physics.addBody( portal1to12, "static", physicsData:get("l4portal1to12") )
	
	 g1ad1 = display.newImageRect("arrowdown.png", 32, 26)
	g1ad1.x = _W/2 - 118; g1ad1.y = _H/2 + 50
	physics.addBody( g1ad1, "static", { isSensor = true} )
	g1ad1:addEventListener("collision", cg1ad1)
	
	portalgroup1:insert(portal1to11)
	portalgroup1:insert(portal1to12)
	portalgroup1:insert(g1ad1)

	portalgroup1.isVisible = true

	-- Group11
	portalgroup11 = display.newGroup()

	 portal11to1 = display.newImageRect("blank.png", 1, 1)
	portal11to1.x = _W/2; portal11to1.y = _H/2
	
	 portal11to111 = display.newImageRect("blank.png", 1, 1)
	portal11to111.x = _W/2; portal11to111.y = _H/2
	
	 portal11to112 = display.newImageRect("blank.png", 1, 1)
	portal11to112.x = _W/2; portal11to112.y = _H/2
	
	 g11al1 = display.newImageRect("arrowleft.png", 32, 32)
	g11al1.x = _W/2 + 40; g11al1.y = _H/2 - 185
	g11al1:addEventListener("collision", cg11al1)

	portalgroup11:insert(portal11to1)
	portalgroup11:insert(portal11to111)
	portalgroup11:insert(portal11to112)
	portalgroup11:insert(g11al1)
	portalgroup11.isVisible = false
	
	-- Group12
	portalgroup12 = display.newGroup()
	
	 portal12to1 = display.newImageRect("blank.png", 1, 1)
	portal12to1.x = _W/2; portal12to1.y = _H/2
	
	 portal12to121 = display.newImageRect("blank.png", 1, 1)
	portal12to121.x = _W/2; portal12to121.y = _H/2

	g12al1 = display.newImageRect("arrowleft.png", 32, 32)
	g12al1.x = _W/2+90; g12al1.y = _H/2+30
	
	g12al2 = display.newImageRect("arrowleft.png", 32, 32)
	g12al2.x = _W/2+90; g12al2.y = _H/2+80
	
	g12ar1 = display.newImageRect("arrowright.png", 32, 32)
	g12ar1.x = _W/2-90; g12ar1.y = _H/2-30
	
	g12ar2 = display.newImageRect("arrowright.png", 32, 32)
	g12ar2.x = _W/2-90; g12ar2.y = _H/2-80
	
	g12ad1 = display.newImageRect("arrowdown.png", 32, 26)
	g12ad1.x = _W/2-50; g12ad1.y = _H/2+5
	
	g12ad2 = display.newImageRect("arrowdown.png", 32, 26)
	g12ad2.x = _W/2; g12ad2.y = _H/2+5
	
	g12ad3 = display.newImageRect("arrowdown.png", 32, 26)
	g12ad3.x = _W/2+50; g12ad3.y = _H/2+5
	
	g12ad4 = display.newImageRect("arrowdown.png", 32, 26)
	g12ad4.x = _W/2-60; g12ad4.y = _H/2+55
	
	g12ad5 = display.newImageRect("arrowdown.png", 32, 26)
	g12ad5.x = _W/2-10; g12ad5.y = _H/2+55
	
	g12ad6 = display.newImageRect("arrowdown.png", 32, 26)
	g12ad6.x = _W/2+40; g12ad6.y = _H/2+55
	
	g12au1 = display.newImageRect("arrowup.png", 32, 26)
	g12au1.x = _W/2-50; g12au1.y = _H/2-55
	
	g12au2 = display.newImageRect("arrowup.png", 32, 26)
	g12au2.x = _W/2; g12au2.y = _H/2-55
	
	g12au3 = display.newImageRect("arrowup.png", 32, 26)
	g12au3.x = _W/2+50; g12au3.y = _H/2-55
	
	g12au4 = display.newImageRect("arrowup.png", 32, 26)
	g12au4.x = _W/2+60; g12au4.y = _H/2-105
	
	g12au5 = display.newImageRect("arrowup.png", 32, 26)
	g12au5.x = _W/2+10; g12au5.y = _H/2-105
	
	g12au6 = display.newImageRect("arrowup.png", 32, 26)
	g12au6.x = _W/2-40; g12au6.y = _H/2-106
	
	portalgroup12:insert(portal12to1)
	portalgroup12:insert(portal12to121)
	portalgroup12:insert(g12al1)
	portalgroup12:insert(g12al2)
	portalgroup12:insert(g12ar1)
	portalgroup12:insert(g12ar2)
	portalgroup12:insert(g12ad1)
	portalgroup12:insert(g12ad2)
	portalgroup12:insert(g12ad3)
	portalgroup12:insert(g12ad4)
	portalgroup12:insert(g12ad5)
	portalgroup12:insert(g12ad6)
	portalgroup12:insert(g12au1)
	portalgroup12:insert(g12au2)
	portalgroup12:insert(g12au3)
	portalgroup12:insert(g12au4)
	portalgroup12:insert(g12au5)
	portalgroup12:insert(g12au6)
	portalgroup12.isVisible = false
	
	-- Group121
	portalgroup121 = display.newGroup()
	
	 portal121to12 = display.newImageRect("blank.png", 1, 1)
	portal121to12.x = _W/2; portal121to12.y = _H/2
	
	 g121ad1 = display.newImageRect("arrowdown.png", 32, 26)
	g121ad1.x = _W/2-120; g121ad1.y = _H/2+100
	
	
	portalgroup121:insert(portal121to12)
	portalgroup121:insert(g121ad1)
	portalgroup121.isVisible = false
	
	-- Group111
	portalgroup111 = display.newGroup()
	
	portal111to11 = display.newImageRect("blank.png", 1, 1)
	portal111to11.x = _W/2; portal111to11.y = _H/2
	
	g111ar1 = display.newImageRect("arrowleft.png", 32, 32)
	g111ar1.x = _W/2; g111ar1.y = _H/2-200
	
	g111ar2 = display.newImageRect("arrowleft.png", 32, 32)
	g111ar2.x = _W/2-60; g111ar2.y = _H/2 - 185
	
	g111ar3 = display.newImageRect("arrowleft.png", 32, 32)
	g111ar3.x = _W/2+60; g111ar3.y = _H/2 - 185

	portalgroup111:insert(portal111to11)
	portalgroup111:insert(g111ar1)
	portalgroup111:insert(g111ar2)
	portalgroup111:insert(g111ar3)
	portalgroup111.isVisible = false
	
	-- Group112
	portalgroup112 = display.newGroup()
	
	portal112to11 = display.newImageRect("blank.png", 1, 1)
	portal112to11.x = _W/2; portal112to11.y = _H/2

	g112al1 = display.newImageRect("arrowleft.png", 32, 32)
	g112al1.x = _W/2+120; g112al1.y = _H/2+200
	
	g112au1 = display.newImageRect("arrowup.png", 32, 26)
	g112au1.x = _W/2-120; g112au1.y = _H/2+200
	
	g112ar1 = display.newImageRect("arrowright.png", 32, 32)
	g112ar1.x = _W/2-120; g112ar1.y = _H/2-200
	
	g112ad1 = display.newImageRect("arrowdown.png", 32, 26)
	g112ad1.x = _W/2+120; g112ad1.y = _H/2-200
	
	g112al2 = display.newImageRect("arrowleft.png", 32, 32)
	g112al2.x = _W/2+120; g112al2.y = _H/2+126
	
	g112au2 = display.newImageRect("arrowup.png", 32, 26)
	g112au2.x = _W/2-46; g112au2.y = _H/2 + 126
	
	g112ar2 = display.newImageRect("arrowright.png", 32, 32)
	g112ar2.x = _W/2-46; g112ar2.y = _H/2 - 126
	
	g112ad2 = display.newImageRect("arrowdown.png", 32, 26)
	g112ad2.x = _W/2+46; g112ad2.y = _H/2 - 126

	portalgroup112:insert(portal112to11)
	portalgroup112:insert(g112al1)
	portalgroup112:insert(g112au1)
	portalgroup112:insert(g112ar1)
	portalgroup112:insert(g112ad1)
	portalgroup112:insert(g112al2)
	portalgroup112:insert(g112au2)
	portalgroup112:insert(g112ar2)
	portalgroup112:insert(g112ad2)
	portalgroup112.isVisible = false

	--========================================================
	-- Portal switchie functions
	-- Portal1to11 c1to11
	local c1to11 = function()
	
		group11.isVisible = true
		portalgroup11.isVisible = true
		group1.isVisible = false
		portalgroup1.isVisible = false
		physics.addBody( block11, "static", physicsData:get("l4block11") )
		physics.addBody( activator11, "static", physicsData:get("l4blocker11activator") )
		physics.addBody( blocker11, "static", physicsData:get("l4block11blocker") )
		physics.addBody( spikes11, "static", physicsData:get("l4block11spikes") )
		physics.addBody( portal11to1, "static", physicsData:get("l4portal11to1") )
		physics.addBody( portal11to111, "static", physicsData:get("l4portal11to111") )
		physics.addBody( portal11to112, "static", physicsData:get("l4portal11to112") )
		physics.removeBody(block1)
		physics.removeBody(spikes1)
		physics.removeBody(portal1to11)
		physics.removeBody(portal1to12)
		ball.x = _W/2 - 125; ball.y = _H/2 + 202
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, -2, ball.x, ball.y )
		print("c1to11")
		
		activator11:addEventListener("collision", cblocker11)
		
		if arrowdata.a11 == 0 then
			activatorgroup.isVisible = false
		elseif arrowdata.a11 == 1 then
			activatorgroup.isVisible = true
		end
		
		if arrowdata.g1ad1==0 then
			print("removed g1ad1 physics")
			physics.removeBody( g1ad1 )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no removing physics")
		end		
		
		if arrowdata.g11al1==0 then
			print("added g11al1 physics")
			physics.addBody( g11al1, "static", { isSensor = true} )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no adding physics")
		end				

	
	end
	
	local delayc1to11 = function()
		timer.performWithDelay(2, c1to11)
	end
	
	portal1to11.collision = delayc1to11
	portal1to11:addEventListener("collision", portal1to11)
	
	-- Portal11to1 c11to1
	local c11to1 = function()
	
		group1.isVisible = true
		portalgroup1.isVisible = true
		group11.isVisible = false
		portalgroup11.isVisible = false
		physics.addBody( block1, "static", physicsData:get("l4block1") )
		physics.addBody( spikes1, "static", physicsData:get("l4block1spikes") )
		physics.addBody( portal1to11, "static", physicsData:get("l4portal1to11") )
		physics.addBody( portal1to12, "static", physicsData:get("l4portal1to12") )
		physics.removeBody(block11)
		physics.removeBody(activator11)
		physics.removeBody(blocker11)
		physics.removeBody(spikes11)
		physics.removeBody(portal11to1)
		physics.removeBody(portal11to111)
		physics.removeBody(portal11to112)
		ball.x = _W/2-40; ball.y = _H/2-100
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, 2, ball.x, ball.y )
		print("c11to1")
			activatorgroup.isVisible = false

		
		if arrowdata.g1ad1==0 then
			print("added g1ad1 physics")
			physics.addBody( g1ad1, "static", { isSensor = true} )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no adding physics")
		end
		
		if arrowdata.g11al1==0 then
			print("removed g11al1 physics")
			physics.removeBody( g11al1 )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no removing physics")
		end		

	
	end
	
	local delayc11to1 = function()
		timer.performWithDelay(2, c11to1)
	end
	
	portal11to1.collision = delayc11to1
	portal11to1:addEventListener("collision", portal11to1)
	
	--========================================================
	-- Portal 11to111 c11to111
	local c11to111 = function()
	
		group111.isVisible = true
		portalgroup111.isVisible = true
		group11.isVisible = false
		portalgroup11.isVisible = false
		physics.addBody( block111, "static", physicsData:get("l4block111") )
		physics.addBody( spikes111, "static", physicsData:get("l4block111spikes") )
		physics.addBody( portal111to11, "static", physicsData:get("l4portal111to11") )
		physics.removeBody(block11)
		physics.removeBody(activator11)
		physics.removeBody(blocker11)
		physics.removeBody(spikes11)
		physics.removeBody(portal11to1)
		physics.removeBody(portal11to111)
		physics.removeBody(portal11to112)
		ball.x = _W/2+90; ball.y = _H/2-200
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -2, 0, ball.x, ball.y )
		print("c11to111")
		
			activatorgroup.isVisible = false

		
		if arrowdata.g11al1==0 then
			print("removed g11al1 physics")
			physics.removeBody( g11al1 )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no removing physics")
		end
		
		if arrowdata.g111ar1==0 then
			print("added g111ar1 physics")
			physics.addBody( g111ar1, "static", { isSensor = true} )
			g111ar1:addEventListener("collision", cg111ar1)
		elseif arrowdata.g111ar1==1 then
			print("skipped g111ar1, no adding physics")
		end
		
		if arrowdata.g111ar2==0 then
			print("added g111ar2 physics")
			physics.addBody( g111ar2, "static", { isSensor = true} )
			g111ar2:addEventListener("collision", cg111ar2)
		elseif arrowdata.g111ar2==1 then
			print("skipped g111ar2, no adding physics")
		end		
		
		if arrowdata.g111ar3==0 then
			print("added g111ar3 physics")
			physics.addBody( g111ar3, "static", { isSensor = true} )
			g111ar3:addEventListener("collision", cg111ar3)
		elseif arrowdata.g111ar3==1 then
			print("skipped g111ar3, no adding physics")
		end	
	
	
	end
	
	local delayc11to111 = function()
		timer.performWithDelay(2, c11to111)
	end
	
	portal11to111.collision = delayc11to111
	portal11to111:addEventListener("collision", portal11to111)
	
	-- Portal 111to11 c111to11
	local c111to11 = function()
	
		group111.isVisible = false
		portalgroup111.isVisible = false
		group11.isVisible = true
		portalgroup11.isVisible = true
		physics.addBody( block11, "static", physicsData:get("l4block11") )
		physics.addBody( activator11, "static", physicsData:get("l4blocker11activator") )
		physics.addBody( blocker11, "static", physicsData:get("l4block11blocker") )
		physics.addBody( spikes11, "static", physicsData:get("l4block11spikes") )
		physics.addBody( portal11to1, "static", physicsData:get("l4portal11to1") )
		physics.addBody( portal11to111, "static", physicsData:get("l4portal11to111") )
		physics.addBody( portal11to112, "static", physicsData:get("l4portal11to112") )
		physics.removeBody(block111)
		physics.removeBody(spikes111)
		physics.removeBody(portal111to11)
		ball.x = _W/2-30; ball.y = _H/2+50
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 2, 0, ball.x, ball.y )
		print("c111to11")
		
		if arrowdata.a11 == 0 then
			activatorgroup.isVisible = false
		elseif arrowdata.a11 == 1 then
			activatorgroup.isVisible = true
		end
		
		if arrowdata.g11al1==0 then
			print("added g11al1 physics")
			physics.addBody( g11al1, "static", { isSensor = true} )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no adding physics")
		end		
		
		if arrowdata.g111ar1==0 then
			print("removed g111ar1 physics")
			physics.removeBody( g111ar1 )
		elseif arrowdata.g111ar1==1 then
			print("skipped g111ar1, no removing physics")
		end
		
		if arrowdata.g111ar2==0 then
			print("removed g111ar2 physics")
			physics.removeBody( g111ar2 )
		elseif arrowdata.g111ar2==1 then
			print("skipped g111ar2, no removing physics")
		end
		
		if arrowdata.g111ar3==0 then
			print("removed g111ar3 physics")
			physics.removeBody( g111ar3 )
		elseif arrowdata.g111ar3==1 then
			print("skipped g111ar3, no removing physics")
		end


	
	end
	
	local delayc111to11 = function()
		timer.performWithDelay(2, c111to11)
	end
	
	portal111to11.collision = delayc111to11
	portal111to11:addEventListener("collision", portal111to11)
		--========================================================
	-- Portal 11to112 c11to112
	local c11to112 = function()
	
		group112.isVisible = true
		portalgroup112.isVisible = true
		group11.isVisible = false
		portalgroup11.isVisible = false
		physics.addBody( block112, "static", physicsData:get("l4block112") )
		physics.addBody( portal112to11, "static", physicsData:get("l4portal112to11") )
		physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1 } )
		physics.removeBody(block11)
		physics.removeBody(activator11)
		physics.removeBody(blocker11)
		physics.removeBody(spikes11)
		physics.removeBody(portal11to1)
		physics.removeBody(portal11to111)
		physics.removeBody(portal11to112)
		ball.x = _W/2+90; ball.y = _H/2+200
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -2, 0, ball.x, ball.y )
			activatorgroup.isVisible = false

		print("c11to112")
		
		if arrowdata.g11al1==0 then
			print("removed g11al1 physics")
			physics.removeBody( g11al1 )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no removing physics")
		end
		
		if arrowdata.g112al1==0 then
			print("added g112al1 physics")
			physics.addBody( g112al1, "static", physicsData:get("arrowleft") )
			g112al1:addEventListener("collision", cg112al1)

		elseif arrowdata.g112al1==1 then
			print("skipped g112al1, no adding physics")
		end
		
		if arrowdata.g112au1==0 then
			print("added g112au1 physics")
			physics.addBody( g112au1, "static", physicsData:get("arrowup") )
			g112au1:addEventListener("collision", cg112au1)
		elseif arrowdata.g112au1==1 then
			print("skipped g112au1, no adding physics")
		end
		
		if arrowdata.g112ar1==0 then
			print("added g112ar1 physics")
			physics.addBody( g112ar1, "static", physicsData:get("arrowright") )
			g112ar1:addEventListener("collision", cg112ar1)
		elseif arrowdata.g112ar1==1 then
			print("skipped g112ar1, no adding physics")
		end
		
		if arrowdata.g112ad1==0 then
			print("added g112ad1 physics")
			physics.addBody( g112ad1, "static", physicsData:get("arrowdown") )
			g112ad1:addEventListener("collision", cg112ad1)
		elseif arrowdata.g112ad1==1 then
			print("skipped g112ad1, no adding physics")
		end
		
		if arrowdata.g112al2==0 then
			print("added g112al2 physics")
			physics.addBody( g112al2, "static", physicsData:get("arrowleft") )
			g112al2:addEventListener("collision", cg112al2)
		elseif arrowdata.g112al2==1 then
			print("skipped g112al2, no adding physics")
		end
		
		if arrowdata.g112au2==0 then
			print("added g112au2 physics")
			physics.addBody( g112au2, "static", physicsData:get("arrowup") )
			g112au2:addEventListener("collision", cg112au2)
		elseif arrowdata.g112au2==1 then
			print("skipped g112au2, no adding physics")
		end
		
		if arrowdata.g112ar2==0 then
			print("added g112ar2 physics")
			physics.addBody( g112ar2, "static", physicsData:get("arrowright") )
			g112ar2:addEventListener("collision", cg112ar2)
		elseif arrowdata.g112ar2==1 then
			print("skipped g112ar2, no adding physics")
		end
		
		if arrowdata.g112ad2==0 then
			print("added g112ad2 physics")
			physics.addBody( g112ad2, "static", physicsData:get("arrowdown") )
			g112ad2:addEventListener("collision", cg112ad2)
		elseif arrowdata.g112ad2==1 then
			print("skipped g112ad2, no adding physics")
		end
	
	end
	
	local delayc11to112 = function()
		timer.performWithDelay(2, c11to112)
	end
	
	portal11to112.collision = delayc11to112
	portal11to112:addEventListener("collision", portal11to112)
	
	-- Portal 112to11 c112to11
	local c112to11 = function()
	
		group112.isVisible = false
		portalgroup112.isVisible = false
		group11.isVisible = true
		portalgroup11.isVisible = true
		physics.addBody( block11, "static", physicsData:get("l4block11") )
		physics.addBody( activator11, "static", physicsData:get("l4blocker11activator") )
		physics.addBody( blocker11, "static", physicsData:get("l4block11blocker") )
		physics.addBody( spikes11, "static", physicsData:get("l4block11spikes") )
		physics.addBody( portal11to1, "static", physicsData:get("l4portal11to1") )
		physics.addBody( portal11to111, "static", physicsData:get("l4portal11to111") )
		physics.addBody( portal11to112, "static", physicsData:get("l4portal11to112") )
		physics.removeBody(block112)
		physics.removeBody(flag)
		physics.removeBody(portal112to11)
		ball.x = _W/2-30; ball.y = _H/2+120
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 2, 0, ball.x, ball.y )
		print("c112to11")
		
		if arrowdata.a11 == 0 then
			activatorgroup.isVisible = false
		elseif arrowdata.a11 == 1 then
			activatorgroup.isVisible = true
		end
		
		if arrowdata.g11al1==0 then
			print("added g11al1 physics")
			physics.addBody( g11al1, "static", { isSensor = true} )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no adding physics")
		end	
		
		if arrowdata.g112al1==0 then
			print("removed g112al1 physics")
			physics.removeBody( g112al1 )
		elseif arrowdata.g112al1==1 then
			print("skipped g112al1, no removing physics")
		end
		
		if arrowdata.g112au1==0 then
			print("removed g112au1 physics")
			physics.removeBody( g112au1 )
		elseif arrowdata.g112au1==1 then
			print("skipped g112au1, no removing physics")
		end
		
		if arrowdata.g112ar1==0 then
			print("removed g112ar1 physics")
			physics.removeBody( g112ar1 )
		elseif arrowdata.g112ar1==1 then
			print("skipped g112ar1, no removing physics")
		end
		
		if arrowdata.g112ad1==0 then
			print("removed g112ad1 physics")
			physics.removeBody( g112ad1 )
		elseif arrowdata.g112ad1==1 then
			print("skipped g112ad1, no removing physics")
		end
		
		if arrowdata.g112al2==0 then
			print("removed g112al2 physics")
			physics.removeBody( g112al2 )
		elseif arrowdata.g112al2==1 then
			print("skipped g112al2, no removing physics")
		end
		
		if arrowdata.g112au2==0 then
			print("removed g112au2 physics")
			physics.removeBody( g112au2 )
		elseif arrowdata.g112au2==1 then
			print("skipped g112au2, no removing physics")
		end
		
		if arrowdata.g112ar2==0 then
			print("removed g112ar2 physics")
			physics.removeBody( g112ar2 )
		elseif arrowdata.g112ar2==1 then
			print("skipped g112ar2, no removing physics")
		end
		
		if arrowdata.g112ad2==0 then
			print("removed g112ad2 physics")
			physics.removeBody( g112ad2 )
		elseif arrowdata.g112ad2==1 then
			print("skipped g112ad2, no removing physics")
		end
	
	end
	
	local delayc112to11 = function()
		timer.performWithDelay(2, c112to11)
	end
	
	portal112to11.collision = delayc112to11
	portal112to11:addEventListener("collision", portal112to11)
	--========================================================
	-- Portal 1to12 c1to12
	local c1to12 = function()
		
		group12.isVisible = true
		portalgroup12.isVisible = true
		group1.isVisible = false
		portalgroup1.isVisible = false
		physics.addBody( block12, "static", physicsData:get("l4block12") )
		physics.addBody( spikes12, "static", physicsData:get("l4block12spikes") )
		physics.addBody( portal12to121, "static", physicsData:get("l4portal12to121") )
		physics.addBody( portal12to1, "static", physicsData:get("l4portal12to1") )
		physics.removeBody(block1)
		physics.removeBody(spikes1)
		physics.removeBody(portal1to11)
		physics.removeBody(portal1to12)
		ball.x = _W/2 + 123; ball.y = _H/2 +190
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, -2, ball.x, ball.y )
		print("c1to12")

		if arrowdata.g12al1==0 then
			print("added g12al1 physics")
			physics.addBody( g12al1, "static", { isSensor = true} )
			g12al1:addEventListener("collision", cg12al1)
		elseif arrowdata.g12al1==1 then
			print("skipped g12al1, no adding physics")
		end	
		
		if arrowdata.g12al2==0 then
			print("added g12al2 physics")
			physics.addBody( g12al2, "static", { isSensor = true} )
			g12al2:addEventListener("collision", cg12al2)
		elseif arrowdata.g12al2==1 then
			print("skipped g12al2, no adding physics")
		end	
		
		if arrowdata.g12ar1==0 then
			print("added g12ar1 physics")
			physics.addBody( g12ar1, "static", { isSensor = true} )
			g12ar1:addEventListener("collision", cg12ar1)
		elseif arrowdata.g12ar1==1 then
			print("skipped g12ar1, no adding physics")
		end	
		
		if arrowdata.g12ar2==0 then
			print("added g12ar2 physics")
			physics.addBody( g12ar2, "static", { isSensor = true} )
			g12ar2:addEventListener("collision", cg12ar2)
		elseif arrowdata.g12ar2==1 then
			print("skipped g12ar2, no adding physics")
		end	
		
		if arrowdata.g12ad1==0 then
			print("added g12ad1 physics")
			physics.addBody( g12ad1, "static", { isSensor = true} )
			g12ad1:addEventListener("collision", cg12ad1)
		elseif arrowdata.g12ad1==1 then
			print("skipped g12ad1, no adding physics")
		end	
		
		if arrowdata.g12ad2==0 then
			print("added g12ad2 physics")
			physics.addBody( g12ad2, "static", { isSensor = true} )
			g12ad2:addEventListener("collision", cg12ad2)
		elseif arrowdata.g12ad2==1 then
			print("skipped g12ad2, no adding physics")
		end	
		
		if arrowdata.g12ad3==0 then
			print("added g12ad3 physics")
			physics.addBody( g12ad3, "static", { isSensor = true} )
			g12ad3:addEventListener("collision", cg12ad3)
		elseif arrowdata.g12ad3==1 then
			print("skipped g12ad3, no adding physics")
		end	
		
		if arrowdata.g12ad4==0 then
			print("added g12ad4 physics")
			physics.addBody( g12ad4, "static", { isSensor = true} )
			g12ad4:addEventListener("collision", cg12ad4)
		elseif arrowdata.g12ad4==1 then
			print("skipped g12ad4, no adding physics")
		end	
		
		if arrowdata.g12ad5==0 then
			print("added g12ad5 physics")
			physics.addBody( g12ad5, "static", { isSensor = true} )
			g12ad5:addEventListener("collision", cg12ad5)
		elseif arrowdata.g12ad5==1 then
			print("skipped g12ad5, no adding physics")
		end	
		
		if arrowdata.g12ad6==0 then
			print("added g12ad6 physics")
			physics.addBody( g12ad6, "static", { isSensor = true} )
			g12ad6:addEventListener("collision", cg12ad6)
		elseif arrowdata.g12ad6==1 then
			print("skipped g12ad6, no adding physics")
		end	
		
		if arrowdata.g12au1==0 then
			print("added g12au1 physics")
			physics.addBody( g12au1, "static", { isSensor = true} )
			g12au1:addEventListener("collision", cg12au1)
		elseif arrowdata.g12au1==1 then
			print("skipped g12au1, no adding physics")
		end	
		
		if arrowdata.g12au2==0 then
			print("added g12au2 physics")
			physics.addBody( g12au2, "static", { isSensor = true} )
			g12au2:addEventListener("collision", cg12au2)
		elseif arrowdata.g12au2==1 then
			print("skipped g12au2, no adding physics")
		end	
		
		if arrowdata.g12au3==0 then
			print("added g12au3 physics")
			physics.addBody( g12au3, "static", { isSensor = true} )
			g12au3:addEventListener("collision", cg12au3)
		elseif arrowdata.g12au3==1 then
			print("skipped g12au3, no adding physics")
		end	
		
		if arrowdata.g12au4==0 then
			print("added g12au4 physics")
			physics.addBody( g12au4, "static", { isSensor = true} )
			g12au4:addEventListener("collision", cg12au4)
		elseif arrowdata.g12au4==1 then
			print("skipped g12au4, no adding physics")
		end	
		
		if arrowdata.g12au5==0 then
			print("added g12au5 physics")
			physics.addBody( g12au5, "static", { isSensor = true} )
			g12au5:addEventListener("collision", cg12au5)
		elseif arrowdata.g12au5==1 then
			print("skipped g12au5, no adding physics")
		end	
		
		if arrowdata.g12au6==0 then
			print("added g12au6 physics")
			physics.addBody( g12au6, "static", { isSensor = true} )
			g12au6:addEventListener("collision", cg12au6)
		elseif arrowdata.g12au6==1 then
			print("skipped g12au6, no adding physics")
		end
		
	end
	
	local delayc1to12 = function()
		timer.performWithDelay(2, c1to12)
	end

	portal1to12.collision = delayc1to12
	portal1to12:addEventListener("collision", portall1to12)
	
	-- Portal 12to1 c12to1
	local c12to1 = function()
		
		group12.isVisible = false
		portalgroup12.isVisible = false
		group1.isVisible = true
		portalgroup1.isVisible = true
		physics.addBody( block1, "static", physicsData:get("l4block1") )
		physics.addBody( spikes1, "static", physicsData:get("l4block1spikes") )
		physics.addBody( portal1to11, "static", physicsData:get("l4portal1to11") )
		physics.addBody( portal1to12, "static", physicsData:get("l4portal1to12") )
		physics.removeBody(block12)
		physics.removeBody(spikes12)
		physics.removeBody(portal12to1)
		physics.removeBody(portal12to121)
		ball.x = _W/2+40; ball.y = _H/2-100
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, 2, ball.x, ball.y )
		print("c12to1")

		if arrowdata.g12ad1==0 then
			print("removed g12ad1 physics")
			physics.removeBody( g12ad1 )
		elseif arrowdata.g12ad1==1 then
			print("skipped g12ad1, no removing physics")
		end
		
		if arrowdata.g12ad2==0 then
			print("removed g12ad2 physics")
			physics.removeBody( g12ad2 )
		elseif arrowdata.g12ad2==1 then
			print("skipped g12ad2, no removing physics")
		end
		
		if arrowdata.g12ad3==0 then
			print("removed g12ad3 physics")
			physics.removeBody( g12ad3 )
		elseif arrowdata.g12ad3==1 then
			print("skipped g12ad3, no removing physics")
		end
		
		if arrowdata.g12ad4==0 then
			print("removed g12ad4 physics")
			physics.removeBody( g12ad4 )
		elseif arrowdata.g12ad4==1 then
			print("skipped g12ad4, no removing physics")
		end
		
		if arrowdata.g12ad5==0 then
			print("removed g12ad5 physics")
			physics.removeBody( g12ad5 )
		elseif arrowdata.g12ad5==1 then
			print("skipped g12ad5, no removing physics")
		end
		
		if arrowdata.g12ad6==0 then
			print("removed g12ad6 physics")
			physics.removeBody( g12ad6 )
		elseif arrowdata.g12ad6==1 then
			print("skipped g12ad6, no removing physics")
		end
		
		if arrowdata.g12au1==0 then
			print("removed g12au1 physics")
			physics.removeBody( g12au1 )
		elseif arrowdata.g12au1==1 then
			print("skipped g12au1, no removing physics")
		end
		
		if arrowdata.g12au2==0 then
			print("removed g12au2 physics")
			physics.removeBody( g12au2 )
		elseif arrowdata.g12au2==1 then
			print("skipped g12au2, no removing physics")
		end
		
		if arrowdata.g12au3==0 then
			print("removed g12au3 physics")
			physics.removeBody( g12au3 )
		elseif arrowdata.g12au3==1 then
			print("skipped g12au3, no removing physics")
		end
		
		if arrowdata.g12au4==0 then
			print("removed g12au4 physics")
			physics.removeBody( g12au4 )
		elseif arrowdata.g12au4==1 then
			print("skipped g12au4, no removing physics")
		end
		
		if arrowdata.g12au5==0 then
			print("removed g12au5 physics")
			physics.removeBody( g12au5 )
		elseif arrowdata.g12au5==1 then
			print("skipped g12au5, no removing physics")
		end
		
		if arrowdata.g12au6==0 then
			print("removed g12au6 physics")
			physics.removeBody( g12au6 )
		elseif arrowdata.g12au6==1 then
			print("skipped g12au6, no removing physics")
		end
		
		if arrowdata.g12al1==0 then
			print("removed g12al1 physics")
			physics.removeBody( g12al1 )
		elseif arrowdata.g12al1==1 then
			print("skipped g12al1, no removing physics")
		end
		
		if arrowdata.g12al2==0 then
			print("removed g12al2 physics")
			physics.removeBody( g12al2 )
		elseif arrowdata.g12al2==1 then
			print("skipped g12al2, no removing physics")
		end
		
		if arrowdata.g12ar1==0 then
			print("removed g12ar1 physics")
			physics.removeBody( g12ar1 )
		elseif arrowdata.g12ar1==1 then
			print("skipped g12ar1, no removing physics")
		end
		
		if arrowdata.g12ar2==0 then
			print("removed g12ar2 physics")
			physics.removeBody( g12ar2 )
		elseif arrowdata.g12ar2==1 then
			print("skipped g12ar2, no removing physics")
		end
		
	end
	
	local delayc12to1 = function()
		timer.performWithDelay(2, c12to1)
	end

	portal12to1.collision = delayc12to1
	portal12to1:addEventListener("collision", portal12to1)
	
	--========================================================
	--========================================================
	-- Portal 12to121 c12to121
	local c12to121 = function()
		
		group12.isVisible = false
		portalgroup12.isVisible = false
		group121.isVisible = true
		portalgroup121.isVisible = true
		physics.addBody( block121, "static", physicsData:get("l4block121") )
		physics.addBody( portal121to12, "static", physicsData:get("l4portal121to12") )
		physics.removeBody(block12)
		physics.removeBody(spikes12)
		physics.removeBody(portal12to1)
		physics.removeBody(portal12to121)
		ball.x = _W/2 - 115; ball.y = _H/2 + 190
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, -2, ball.x, ball.y )
		print("c12to121")
		
		if arrowdata.g121ad1==0 then
			print("added g121ad1 physics")
			physics.addBody( g121ad1, "static", { isSensor = true} )
			g121ad1:addEventListener("collision", cg121ad1)

		elseif arrowdata.g121ad1==1 then
			print("skipped g121ad1, no adding physics")
		end
		
		if arrowdata.g12ad1==0 then
			print("removed g12ad1 physics")
			physics.removeBody( g12ad1 )
		elseif arrowdata.g12ad1==1 then
			print("skipped g12ad1, no removing physics")
		end
		
		if arrowdata.g12ad2==0 then
			print("removed g12ad2 physics")
			physics.removeBody( g12ad2 )
		elseif arrowdata.g12ad2==1 then
			print("skipped g12ad2, no removing physics")
		end
		
		if arrowdata.g12ad3==0 then
			print("removed g12ad3 physics")
			physics.removeBody( g12ad3 )
		elseif arrowdata.g12ad3==1 then
			print("skipped g12ad3, no removing physics")
		end
		
		if arrowdata.g12ad4==0 then
			print("removed g12ad4 physics")
			physics.removeBody( g12ad4 )
		elseif arrowdata.g12ad4==1 then
			print("skipped g12ad4, no removing physics")
		end
		
		if arrowdata.g12ad5==0 then
			print("removed g12ad5 physics")
			physics.removeBody( g12ad5 )
		elseif arrowdata.g12ad5==1 then
			print("skipped g12ad5, no removing physics")
		end
		
		if arrowdata.g12ad6==0 then
			print("removed g12ad6 physics")
			physics.removeBody( g12ad6 )
		elseif arrowdata.g12ad6==1 then
			print("skipped g12ad6, no removing physics")
		end
		
		if arrowdata.g12au1==0 then
			print("removed g12au1 physics")
			physics.removeBody( g12au1 )
		elseif arrowdata.g12au1==1 then
			print("skipped g12au1, no removing physics")
		end
		
		if arrowdata.g12au2==0 then
			print("removed g12au2 physics")
			physics.removeBody( g12au2 )
		elseif arrowdata.g12au2==1 then
			print("skipped g12au2, no removing physics")
		end
		
		if arrowdata.g12au3==0 then
			print("removed g12au3 physics")
			physics.removeBody( g12au3 )
		elseif arrowdata.g12au3==1 then
			print("skipped g12au3, no removing physics")
		end
		
		if arrowdata.g12au4==0 then
			print("removed g12au4 physics")
			physics.removeBody( g12au4 )
		elseif arrowdata.g12au4==1 then
			print("skipped g12au4, no removing physics")
		end
		
		if arrowdata.g12au5==0 then
			print("removed g12au5 physics")
			physics.removeBody( g12au5 )
		elseif arrowdata.g12au5==1 then
			print("skipped g12au5, no removing physics")
		end
		
		if arrowdata.g12au6==0 then
			print("removed g12au6 physics")
			physics.removeBody( g12au6 )
		elseif arrowdata.g12au6==1 then
			print("skipped g12au6, no removing physics")
		end
		
		if arrowdata.g12al1==0 then
			print("removed g12al1 physics")
			physics.removeBody( g12al1 )
		elseif arrowdata.g12al1==1 then
			print("skipped g12al1, no removing physics")
		end
		
		if arrowdata.g12al2==0 then
			print("removed g12al2 physics")
			physics.removeBody( g12al2 )
		elseif arrowdata.g12al2==1 then
			print("skipped g12al2, no removing physics")
		end
		
		if arrowdata.g12ar1==0 then
			print("removed g12ar1 physics")
			physics.removeBody( g12ar1 )
		elseif arrowdata.g12ar1==1 then
			print("skipped g12ar1, no removing physics")
		end
		
		if arrowdata.g12ar2==0 then
			print("removed g12ar2 physics")
			physics.removeBody( g12ar2 )
		elseif arrowdata.g12ar2==1 then
			print("skipped g12ar2, no removing physics")
		end

	end
	
	local delayc12to121 = function()
		timer.performWithDelay(2, c12to121)
	end

	portal12to121.collision = delayc12to121
	portal12to121:addEventListener("collision", portal12to121)

	-- Portal 121to12 c121to12
	local c121to12 = function()
		
		group12.isVisible = true
		portalgroup12.isVisible = true
		group121.isVisible = false
		portalgroup121.isVisible = false
		physics.addBody( block12, "static", physicsData:get("l4block12") )
		physics.addBody( spikes12, "static", physicsData:get("l4block12spikes") )
		physics.addBody( portal12to121, "static", physicsData:get("l4portal12to121") )
		physics.addBody( portal12to1, "static", physicsData:get("l4portal12to1") )
		physics.removeBody(block121)
		physics.removeBody(portal121to12)
		ball.x = _W/2-118; ball.y = _H/2-190
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, 2, ball.x, ball.y )
		print("c121to12")

		if arrowdata.g121ad1==0 then
			print("removed g121ad1 physics")
			physics.removeBody( g121ad1 )
		elseif arrowdata.g121ad1==1 then
			print("skipped g121ad1, no removing physics")
		end
		
			if arrowdata.g12al1==0 then
			print("added g12al1 physics")
			physics.addBody( g12al1, "static", { isSensor = true} )
			g12al1:addEventListener("collision", cg12al1)
		elseif arrowdata.g12al1==1 then
			print("skipped g12al1, no adding physics")
		end	
		
		if arrowdata.g12al2==0 then
			print("added g12al2 physics")
			physics.addBody( g12al2, "static", { isSensor = true} )
			g12al2:addEventListener("collision", cg12al2)
		elseif arrowdata.g12al2==1 then
			print("skipped g12al2, no adding physics")
		end	
		
		if arrowdata.g12ar1==0 then
			print("added g12ar1 physics")
			physics.addBody( g12ar1, "static", { isSensor = true} )
			g12ar1:addEventListener("collision", cg12ar1)
		elseif arrowdata.g12ar1==1 then
			print("skipped g12ar1, no adding physics")
		end	
		
		if arrowdata.g12ar2==0 then
			print("added g12ar2 physics")
			physics.addBody( g12ar2, "static", { isSensor = true} )
			g12ar2:addEventListener("collision", cg12ar2)
		elseif arrowdata.g12ar2==1 then
			print("skipped g12ar2, no adding physics")
		end	
		
		if arrowdata.g12ad1==0 then
			print("added g12ad1 physics")
			physics.addBody( g12ad1, "static", { isSensor = true} )
			g12ad1:addEventListener("collision", cg12ad1)
		elseif arrowdata.g12ad1==1 then
			print("skipped g12ad1, no adding physics")
		end	
		
		if arrowdata.g12ad2==0 then
			print("added g12ad2 physics")
			physics.addBody( g12ad2, "static", { isSensor = true} )
			g12ad2:addEventListener("collision", cg12ad2)
		elseif arrowdata.g12ad2==1 then
			print("skipped g12ad2, no adding physics")
		end	
		
		if arrowdata.g12ad3==0 then
			print("added g12ad3 physics")
			physics.addBody( g12ad3, "static", { isSensor = true} )
			g12ad3:addEventListener("collision", cg12ad3)
		elseif arrowdata.g12ad3==1 then
			print("skipped g12ad3, no adding physics")
		end	
		
		if arrowdata.g12ad4==0 then
			print("added g12ad4 physics")
			physics.addBody( g12ad4, "static", { isSensor = true} )
			g12ad4:addEventListener("collision", cg12ad4)
		elseif arrowdata.g12ad4==1 then
			print("skipped g12ad4, no adding physics")
		end	
		
		if arrowdata.g12ad5==0 then
			print("added g12ad5 physics")
			physics.addBody( g12ad5, "static", { isSensor = true} )
			g12ad5:addEventListener("collision", cg12ad5)
		elseif arrowdata.g12ad5==1 then
			print("skipped g12ad5, no adding physics")
		end	
		
		if arrowdata.g12ad6==0 then
			print("added g12ad6 physics")
			physics.addBody( g12ad6, "static", { isSensor = true} )
			g12ad6:addEventListener("collision", cg12ad6)
		elseif arrowdata.g12ad6==1 then
			print("skipped g12ad6, no adding physics")
		end	
		
		if arrowdata.g12au1==0 then
			print("added g12au1 physics")
			physics.addBody( g12au1, "static", { isSensor = true} )
			g12au1:addEventListener("collision", cg12au1)
		elseif arrowdata.g12au1==1 then
			print("skipped g12au1, no adding physics")
		end	
		
		if arrowdata.g12au2==0 then
			print("added g12au2 physics")
			physics.addBody( g12au2, "static", { isSensor = true} )
			g12au2:addEventListener("collision", cg12au2)
		elseif arrowdata.g12au2==1 then
			print("skipped g12au2, no adding physics")
		end	
		
		if arrowdata.g12au3==0 then
			print("added g12au3 physics")
			physics.addBody( g12au3, "static", { isSensor = true} )
			g12au3:addEventListener("collision", cg12au3)
		elseif arrowdata.g12au3==1 then
			print("skipped g12au3, no adding physics")
		end	
		
		if arrowdata.g12au4==0 then
			print("added g12au4 physics")
			physics.addBody( g12au4, "static", { isSensor = true} )
			g12au4:addEventListener("collision", cg12au4)
		elseif arrowdata.g12au4==1 then
			print("skipped g12au4, no adding physics")
		end	
		
		if arrowdata.g12au5==0 then
			print("added g12au5 physics")
			physics.addBody( g12au5, "static", { isSensor = true} )
			g12au5:addEventListener("collision", cg12au5)
		elseif arrowdata.g12au5==1 then
			print("skipped g12au5, no adding physics")
		end	
		
		if arrowdata.g12au6==0 then
			print("added g12au6 physics")
			physics.addBody( g12au6, "static", { isSensor = true} )
			g12au6:addEventListener("collision", cg12au6)
		elseif arrowdata.g12au6==1 then
			print("skipped g12au6, no adding physics")
		end	
		
	end
	
	local delayc121to12 = function()
		timer.performWithDelay(2, c121to12)
	end

	portal121to12.collision = delayc121to12
	portal121to12:addEventListener("collision", portal121to12)
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
		ispassed.l4 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl5")
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
		storyboard.gotoScene("restartl4", "fade", 100)
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
	spikes1.collision = restarthtp
	spikes11.collision = restarthtp
	spikes12.collision = restarthtp
	spikes111.collision = restarthtp
	spikes112.collision = restarthtp


	
	flag:addEventListener("collision", flag)
	spikes1:addEventListener("collision", spikes1)
	spikes11:addEventListener("collision", spikes11)
	spikes111:addEventListener("collision", spikes111)
	spikes112:addEventListener("collision", spikes112)
	spikes12:addEventListener("collision", spikes12)



	group:insert(background);
	group:insert(ball)
	group:insert(group1)
	group:insert(group11)
	group:insert(group12)
	group:insert(group121)
	group:insert(group111)
	group:insert(group112)
	group:insert(portalgroup1)
	group:insert(portalgroup11)
	group:insert(portalgroup111)
	group:insert(portalgroup12)
	group:insert(portalgroup121)
	group:insert(portalgroup112)
	group:insert(activatorgroup)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(backgroundgroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 4 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)
	spikes1:removeEventListener("collision", spikes1)
	spikes11:removeEventListener("collision", spikes11)
	spikes111:removeEventListener("collision", spikes111)
	spikes112:removeEventListener("collision", spikes112)
	spikes12:removeEventListener("collision", spikes12)
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);

	storyboard.purgeAll()

display.remove( g1ad1 )
display.remove( g11al1 )

display.remove( g111ar1 )
display.remove( g111ar2 )
display.remove( g111ar3 )

display.remove( g112al1 )
display.remove( g112au1 )
display.remove( g112ar1 )
display.remove( g112al2 )
display.remove( g112ad1 )
display.remove( g112au2 )
display.remove( g112ad2 )
display.remove( g112ar2 )

display.remove( g12al1 )
display.remove( g12al2 )
display.remove( g12ar1 )
display.remove( g12ar2 )


display.remove( g12ad1 )
display.remove( g12ad2 )
display.remove( g12ad3 )
display.remove( g12ad4 )
display.remove( g12ad5 )
display.remove( g12ad6 )

display.remove( g12au1 )
display.remove( g12au2 )
display.remove( g12au3 )
display.remove( g12au5 )
display.remove( g12au4 )
display.remove( g12au6 )

display.remove( g121ad1 )
display.remove( g121ad2 )

g1ad1 = nil

g11al1 = nil

g111ar1 = nil
g111ar2 = nil
g111ar3 = nil

g112al1 = nil
g112au1 = nil
g112ar1 = nil
g112ad1 = nil
g112al2 = nil
g112au2 = nil
g112ar2 = nil
g112ad2 = nil

g12al1 = nil
g12al2 = nil
g12ar1 = nil
g12ar2 = nil

g12ad1 = nil
g12ad2 = nil
g12ad3 = nil
g12ad4 = nil
g12ad5 = nil
g12ad6 = nil

g12au1 = nil
g12au2 = nil
g12au3 = nil
g12au4 = nil
g12au5 = nil
g12au6 = nil

g121ad1 = nil
g121ad2 = nil
	
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