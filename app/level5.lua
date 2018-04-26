--Level5:  kinda like level 5

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata5" )
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
local group12
local group121
local group122
local block1, spikes1
local block11, spikes11
local block12, spikes12
local block121, spikes121
local block122, spikes122
local mv1101, mv1101
local mv1201, mv1202, mv1203
local mv1101cover, mv1101cover
local mv1201cover, mv1202cover, mv1203cover

--[[
local movemv1101, movemv1101two
local movemv1102, movemv1102two
	local movemv1201, movemv1201two
local movemv1203, movemv1203two
]]--


local move1102to, move1102coverto
local move1102back, move1102coverback

local move1201to, move1201coverto
local move1201back, move1201coverback

local move1203to, move1203coverto
local move1203back, move1203coverback

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
arrowdata.mvtime = 1450
arrowdata.mvtime2 = 1500

arrowdata.ah101 = nil
arrowdata.ah101 = 0

arrowdata.ah102 = nil
arrowdata.ah102 = 0

arrowdata.ah1201 = nil
arrowdata.ah1201 = 0

--==============================================================
-- Arrow functions
arrowdata.g1ad1  = nil
arrowdata.g1ad2 = nil
arrowdata.g11al1 = nil
arrowdata.g11al2 = nil

arrowdata.g121al1 = nil

arrowdata.g121ar1 = nil

arrowdata.g1ad1  = 0
arrowdata.g1ad2 = 0
arrowdata.g11al1 = 0
arrowdata.g11al2 = 0

arrowdata.g121al1 = 0

arrowdata.g121ar1 = 0
--==============================================================
	-- Group 1
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
	function cg1ad2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( 0, bf, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g1ad2 collided, g1ad2 +1")
			playarrowsound();
		arrowdata.g1ad2 = 1

		end
	end
	--Group11
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
	function cg11al2(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g11al2 collided, g11al2 +1")
			playarrowsound();
			arrowdata.g11al2 = 1

		end
	end
--==============================================================
	-- Group 121 right arrows
	function cg121ar1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g121ar1 collided, g121ar1 +1")
			playarrowsound();
			arrowdata.g121ar1 = 1

		end
	end	 
--==============================================================
	-- Group 121 left arrows
	function cg121al1(event)
	
		if ( event.phase == "began" ) then
		
			ball:applyLinearImpulse( -bf, 0, ball.x, ball.y )
	        event.target:removeSelf();
            event.target= nil;
			print("g121al1 collided, g121al1 +1")
			playarrowsound();
			arrowdata.g121al1 = 1

		end
	end

--==============================================================
--PhysicsEditor required stuff
local scaleFactor = 1.0
local physicsData = (require "bl5block").physicsData(scaleFactor)

-- CODING BEGINS
--==============================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	

	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 + 40; ball.y = _H/2+100
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

	block1 = display.newImageRect("l5block1.png", 320, 480)
	physics.addBody( block1, "static", physicsData:get("l5block1") )
	block1.x = _W/2; block1.y = _H/2

	spikes1 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( spikes1, "static", physicsData:get("l5block1spikes") )
	spikes1.x = _W/2; spikes1.y = _H/2
	
	local portal1to11 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( portal1to11, "static", physicsData:get("l5portal1to11") )
	portal1to11.x = _W/2; portal1to11.y = _H/2

	local portal1to12 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( portal1to12, "static", physicsData:get("l5portal1to12") )
	portal1to12.x = _W/2; portal1to12.y = _H/2
	
	local g1ad1 = display.newImageRect("arrowdown.png", 32, 26)
	g1ad1.x = _W/2-120; g1ad1.y = _H/2-140
	physics.addBody( g1ad1, "static", { isSensor = true } )
	g1ad1:addEventListener("collision", cg1ad1)
	
	local g1ad2 = display.newImageRect("arrowdown.png", 32, 26)
	g1ad2.x = _W/2-40; g1ad2.y = _H/2
	physics.addBody( g1ad2, "static", { isSensor = true } )
	g1ad2:addEventListener("collision", cg1ad2)
	
	-- Hidden gates
	
	local h102 = display.newImageRect("l5h1-1.png", 320, 480)
	physics.addBody( h102, "static", physicsData:get("l5h1-1") )
	h102.x = _W/2; h102.y = _H/2
	
	local h101 = display.newImageRect("l5h1-2.png", 320, 480)
	physics.addBody( h101, "static", physicsData:get("l5h1-2") )
	h101.x = _W/2; h101.y = _H/2
	
	local ah101 = display.newImageRect("blank.png", 1, 1)
	physics.addBody( ah101, "static", physicsData:get("l5ah1-1") )
	ah101.x = _W/2; ah101.y = _H/2
	
	local ah101over = display.newImageRect("l5ah1-1over.png", 320, 480)
	ah101over.x = _W/2; ah101over.y = _H/2
	ah101over.isVisible = false
	
	local dah101
	
	local cah101 = function()
		transition.to(h101, {time=3000, x=(_W/2+74), transition = easing.inQuad})
		print("h101 opened!")
		arrowdata.ah101= 1
		ah101over.isVisible = true
		dah101();
	end
	
	dah101 = function()
		ah101:removeEventListener("collision", cah101)
	end
	
	ah101:addEventListener("collision", cah101)

	group1:insert(block1);
	group1:insert(portal1to11)
	group1:insert(portal1to12)
	group1:insert(h101)
	group1:insert(h102)
	group1:insert(ah101)
	group1:insert(ah101over)
	group1:insert(g1ad1)
	group1:insert(g1ad2)
	group1:insert(spikes1)
	
	group1.isVisible = true
	--========================================================
	group11 = display.newGroup()
	
	block11 = display.newImageRect("l5block11.png", 320, 480)
	block11.x = _W/2; block11.y = _H/2
	
	spikes11 = display.newImageRect("blank.png", 1, 1)
	spikes11.x = _W/2; spikes11.y = _H/2
	
	local portal11to1 = display.newImageRect("blank.png", 1, 1)
	portal11to1.x = _W/2; portal11to1.y = _H/2
	
	local g11al1 = display.newImageRect("arrowleft.png", 28, 32)
	g11al1.x = _W/2+120; g11al1.y = _H/2+130

	local g11al2 = display.newImageRect("arrowleft.png", 28, 32)
	g11al2.x = _W/2-60; g11al2.y = _H/2+200
	
	--Group 1101
	
	mv1101 = display.newImageRect("l5mv11-1.png", 24, 142)
	mv1101.x = _W/2-34; mv1101.y = _H/2-164

	mv1101cover = display.newImageRect("blank.png", 24, 142)
	mv1101cover.x = _W/2-34; mv1101cover.y = _H/2-164

	
	movemv1101two = function()
		move1101back = transition.to(mv1101, {time=arrowdata.mvtime, y=_H/2-164})
		move1101coverback = transition.to(mv1101cover, {time=arrowdata.mvtime, y=_H/2-164})
		timer.performWithDelay(arrowdata.mvtime2, movemv1101)
	end
	
	movemv1101 = function()
		move1101to = transition.to(mv1101, {time=arrowdata.mvtime, y=_H/2+85})
		move1101coverto = transition.to(mv1101cover, {time=arrowdata.mvtime, y=_H/2+85})
		timer.performWithDelay(arrowdata.mvtime2, movemv1101two)
	end
	
	mv1102 = display.newImageRect("l5mv11-2.png", 24, 142)
	mv1102.x = _W/2-5; mv1102.y = _H/2+85
	
	mv1102cover = display.newImageRect("blank.png", 24, 142)
	mv1102cover.x = _W/2-5; mv1102cover.y = _H/2+85
	
	movemv1102two = function()
		move1102back = transition.to(mv1102, {time=arrowdata.mvtime, y=_H/2+85})
		move1102coverback = transition.to(mv1102cover, {time=arrowdata.mvtime, y=_H/2+85})
		timer.performWithDelay(arrowdata.mvtime2, movemv1102)
	end
	
	movemv1102 = function()
		move1102to = transition.to(mv1102, {time=arrowdata.mvtime, y=_H/2-164})
		move1102coverto = transition.to(mv1102cover, {time=arrowdata.mvtime, y=_H/2-164})
		timer.performWithDelay(arrowdata.mvtime2, movemv1102two)
	end
	
	movemv1101();
	movemv1102();
	
	-- Activator 102
	local ah102 = display.newImageRect("blank.png", 1, 1)
	ah102.x = _W/2; ah102.y = _H/2
	
	local ah102over = display.newImageRect("l5ah1-2over.png", 320, 480)
	ah102over.x = _W/2; ah102over.y = _H/2
	ah102over.isVisible = false
	
	local dah102
	
	local cah102 = function()
		transition.to(h102, {time=3000, y=(_H/2+74), transition = easing.inQuad})
		print("h102 opened!")
		arrowdata.ah102= 1
		ah102over.isVisible = true
		dah102();
	end
	
	dah102 = function()
		ah102:removeEventListener("collision", cah102)
	end
	
	ah102:addEventListener("collision", cah102)


	group11:insert(block11)
	group11:insert(portal11to1)
	group11:insert(ah102)
	group11:insert(ah102over)
	group11:insert(mv1101)
	group11:insert(mv1102)
	group11:insert(mv1102cover)
	group11:insert(mv1101cover)
	group11:insert(g11al1)
	group11:insert(g11al2)
	group11:insert(spikes11)

	group11.isVisible = false
	--========================================================
	group12 = display.newGroup()
	
	block12 = display.newImageRect("l5block12.png", 320, 480)
	block12.x = _W/2; block12.y = _H/2
	
	spikes12 = display.newImageRect("blank.png", 1, 1)
	spikes12.x = _W/2; spikes12.y = _H/2
	
	local portal12to1 = display.newImageRect("blank.png", 1, 1)
	portal12to1.x = _W/2; portal12to1.y = _H/2
	
	local portal12to122 = display.newImageRect("blank.png", 1, 1)
	portal12to122.x = _W/2; portal12to122.y = _H/2
	
	local portal12to121 = display.newImageRect("blank.png", 1, 1)
	portal12to121.x = _W/2; portal12to121.y = _H/2
	
	local h1201 = display.newImageRect("l5h12-1.png", 320, 480)
	h1201.x = _W/2; h1201.y = _H/2
	
	mv1201 = display.newImageRect("l5mv12.png", 87, 24)
	mv1201cover = display.newImageRect("blank.png", 87, 24)
	mv1202 = display.newImageRect("l5mv12.png", 87, 24)
	mv1202cover = display.newImageRect("blank.png", 87, 24)
	mv1203 = display.newImageRect("l5mv12.png", 87, 24)
	mv1203cover = display.newImageRect("blank.png", 87, 24)

	mv1201.x = _W/2-37; mv1201.y = _H/2+26
	mv1201cover.x = _W/2-37; mv1201cover.y = _H/2+26
	mv1202.x = _W/2+38; mv1202.y = _H/2+76
	mv1202cover.x = _W/2+38; mv1202cover.y = _H/2+76
	mv1203.x = _W/2+112; mv1203.y = _H/2+120
	mv1203cover.x = _W/2+112; mv1203cover.y = _H/2+120
	
	
	movemv1201two = function()
		move1201back = transition.to(mv1201, {time=arrowdata.mvtime, x=_W/2-37})
		move1201coverback = transition.to(mv1201cover, {time=arrowdata.mvtime, x=_W/2-37})
		timer.performWithDelay(arrowdata.mvtime2, movemv1201)
	end
	
	movemv1201 = function()
		move1201to = transition.to(mv1201, {time=arrowdata.mvtime, x=_W/2+120})
		move1201coverto = transition.to(mv1201cover, {time=arrowdata.mvtime, x=_W/2+120})
		timer.performWithDelay(arrowdata.mvtime2, movemv1201two)
	end
		
	movemv1203two = function()
		move1203back = transition.to(mv1203, {time=arrowdata.mvtime, x=_W/2+120})
		move1203coverback = transition.to(mv1203cover, {time=arrowdata.mvtime, x=_W/2+120})
		timer.performWithDelay(arrowdata.mvtime2, movemv1203)
	end
	
	movemv1203 = function()
		move1203to =  transition.to(mv1203, {time=arrowdata.mvtime, x=_W/2-37})
		move1203coverto = transition.to(mv1203cover, {time=arrowdata.mvtime, x=_W/2-37})
		timer.performWithDelay(arrowdata.mvtime2, movemv1203two)
	end
	
	movemv1201();
	movemv1203();
	
	group12:insert(block12)
	group12:insert(spikes12)
	group12:insert(portal12to1)
	group12:insert(portal12to122)
	group12:insert(portal12to121)
	group12:insert(h1201)
	group12:insert(mv1201)
	group12:insert(mv1201cover)
	group12:insert(mv1202)
	group12:insert(mv1202cover)
	group12:insert(mv1203)
	group12:insert(mv1203cover)
	group12:insert(block12)
	group12:insert(spikes12)
	
	group12.isVisible = false
	--========================================================
	group121 = display.newGroup()
	
	block121 = display.newImageRect("l5block121.png", 320, 480)
	block121.x = _W/2; block121.y = _H/2
	
	spikes121 = display.newImageRect("blank.png", 1, 1)
	spikes121.x = _W/2; spikes121.y = _H/2
	
	local portal121to12 = display.newImageRect("blank.png", 1, 1)
	portal121to12.x = _W/2; portal121to12.y = _H/2
	
	local g121al1 = display.newImageRect("arrowleft.png", 28, 32)

	local g121ar1 = display.newImageRect("arrowright.png", 28, 32)

	g121al1.x = _W/2; g121al1.y = _H/2+210
	
	g121ar1.x = _W/2; g121ar1.y = _H/2+103
	
	local ah1201 = display.newImageRect("blank.png", 1, 1)
	ah1201.x = _W/2; ah1201.y = _H/2
	
	local ah1201over = display.newImageRect("l5ah12-1over.png", 320, 480)
	ah1201over.x = _W/2; ah1201over.y = _H/2
	ah1201over.isVisible = false
	
	local dah1201
	
	local cah1201 = function()
		transition.to(h1201, {time=3000, x=(_W/2+74), transition = easing.inQuad})
		print("h1201 opened!")
		arrowdata.ah1201= 1
		ah1201over.isVisible = true
		dah1201();
	end
	
	dah1201 = function()
		ah1201:removeEventListener("collision", cah1201)
	end
	
	ah1201:addEventListener("collision", cah1201)

	group121:insert(block121)
	group121:insert(spikes121)
	group121:insert(portal121to12)
	group121:insert(ah1201)
	group121:insert(ah1201over)
	group121:insert(g121al1)
	group121:insert(g121ar1)

	group121.isVisible = false
	
	--========================================================
	group122 = display.newGroup()
	
	block122 = display.newImageRect("l5block122.png", 320, 480)
	block122.x = _W/2; block122.y = _H/2
	
	spikes122 = display.newImageRect("blank.png", 1, 1)
	spikes122.x = _W/2; spikes122.y = _H/2
	
	local portal122to12 = display.newImageRect("blank.png", 1, 1)
	portal122to12.x = _W/2; portal122to12.y = _H/2

	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2-120; flag.y = _H/2-180
	
	group122:insert(block122)
	group122:insert(spikes122)	
	group122:insert(portal122to12)
	group122:insert(flag)
	group122.isVisible = false

--============================================================
-- Les fonctions du portail switchie

arrowdata.functionscalled = 0
arrowdata.functionscalled2 = 0
	
	-- Group 1to11
	
	c1to11 = function()
	
		group1.isVisible = false
		group11.isVisible = true
	
		physics.removeBody(block1)
		physics.removeBody(spikes1)
		physics.removeBody(portal1to11)
		physics.removeBody(portal1to12)
		physics.removeBody(h101)
		physics.removeBody(h102)
		physics.removeBody(ah101)
		physics.addBody( block11, "static", physicsData:get("l5block11") )
		physics.addBody( spikes11, "static", physicsData:get("l5block11spikes") )
		physics.addBody( portal11to1, "static", physicsData:get("l5portal11to1") )
		physics.addBody( mv1101, "static", physicsData:get("l5mv11-1") )
		physics.addBody( mv1101cover, "static", physicsData:get("l5mv11-1cover") )
		physics.addBody( mv1102, "static", physicsData:get("l5mv11-2") )
		physics.addBody( mv1102cover, "static", physicsData:get("l5mv11-2cover") )
		physics.addBody( ah102, "static", physicsData:get("l5ah1-2") )
		
		ball.x = _W/2+80; ball.y = _H/2+195
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -2, 0, ball.x, ball.y )
		
		--[[
		if arrowdata.functionscalled == 0 then
			mv1101.x = _W/2-34; mv1101.y = _H/2-164
			mv1101cover.x = _W/2-34; mv1101cover.y = _H/2-164
			mv1102.x = _W/2-5; mv1102.y = _H/2+85
			mv1102cover.x = _W/2-5; mv1102cover.y = _H/2+85
			movemv1101();
			movemv1102();
			arrowdata.functionscalled = 1
			print("Function called, moving stuff in scene 11")
		elseif arrowdata.functionscalled == 1 then

		end]]--
			
		print("c1to11")
		
		if arrowdata.g1ad1==0 then
			print("removed g1ad1 physics")
			physics.removeBody( g1ad1 )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no removing physics")
		end
		
		if arrowdata.g1ad2==0 then
			print("removed g1ad2 physics")
			physics.removeBody( g1ad2 )
		elseif arrowdata.g1ad2==1 then
			print("skipped g1ad2, no removing physics")
		end
		
		if arrowdata.g11al1==0 then
			print("added g11al1 physics")
			physics.addBody( g11al1, "static", { isSensor = true} )
			g11al1:addEventListener("collision", cg11al1)
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no adding physics")
		end
		
		if arrowdata.g11al2==0 then
			print("added g11al2 physics")
			physics.addBody( g11al2, "static", { isSensor = true} )
			g11al2:addEventListener("collision", cg11al2)
		elseif arrowdata.g11al2==1 then
			print("skipped g11al2, no adding physics")
		end	
		
	end
	
	delayc1to11 = function()
		timer.performWithDelay(2, c1to11)
	end
	
	portal1to11.collision = delayc1to11
	portal1to11:addEventListener("collision", portal1to11)
	
	-- Group 11to1
	
	c11to1 = function()
	
		group1.isVisible = true
		group11.isVisible = false
	
		physics.removeBody(block11)
		physics.removeBody(spikes11)
		physics.removeBody(portal11to1)
		physics.removeBody(ah102)
		physics.removeBody(mv1101)
		physics.removeBody(mv1102)
		physics.removeBody(mv1101cover)
		physics.removeBody(mv1102cover)
		physics.addBody( block1, "static", physicsData:get("l5block1") )
		physics.addBody( spikes1, "static", physicsData:get("l5block1spikes") )
		physics.addBody( portal1to11, "static", physicsData:get("l5portal1to11") )
		physics.addBody( portal1to12, "static", physicsData:get("l5portal1to12") )
		physics.addBody( h102, "static", physicsData:get("l5h1-1") )
		physics.addBody( h101, "static", physicsData:get("l5h1-2") )
		physics.addBody( ah101, "static", physicsData:get("l5ah1-1") )
		
		ball.x = _W/2+80; ball.y = _H/2-131
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 2, 0, ball.x, ball.y )
		
		print("c11to1")
		
		if arrowdata.ah101 == 0 then
			print("y u no open h101")
		elseif arrowdata.ah101 == 1 then
			ah101over.isVisible = true
		end
		
		if arrowdata.g1ad1==0 then
			print("added g1ad1 physics")
			physics.addBody( g1ad1, "static", { isSensor = true} )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no adding physics")
		end	
		
		if arrowdata.g1ad2==0 then
			print("added g1ad2 physics")
			physics.addBody( g1ad2, "static", { isSensor = true} )
		elseif arrowdata.g1ad2==1 then
			print("skipped g1ad2, no adding physics")
		end	
		
		if arrowdata.g11al1==0 then
			print("removed g11al1 physics")
			physics.removeBody( g11al1 )
		elseif arrowdata.g11al1==1 then
			print("skipped g11al1, no removing physics")
		end
		
		if arrowdata.g11al2==0 then
			print("removed g11al2 physics")
			physics.removeBody( g11al2 )
		elseif arrowdata.g11al2==1 then
			print("skipped g11al2, no removing physics")
		end
		
	end
	
	delayc11to1 = function()
		timer.performWithDelay(2, c11to1)
	end
	
	portal11to1.collision = delayc11to1
	portal11to1:addEventListener("collision", portal11to1)
--============================================================
	
	-- Group1to12
	c1to12 = function()
	
		group1.isVisible = false
		group12.isVisible = true
	
		physics.removeBody(block1)
		physics.removeBody(spikes1)
		physics.removeBody(portal1to11)
		physics.removeBody(portal1to12)
		physics.removeBody(h101)
		physics.removeBody(h102)
		physics.removeBody(ah101)
		physics.addBody( block12, "static", physicsData:get("l5block12") )
		physics.addBody( spikes12, "static", physicsData:get("l5block12spikes") )
		physics.addBody( portal12to1, "static", physicsData:get("l5portal12to1") )
		physics.addBody( portal12to122, "static", physicsData:get("l5portal12to122") )
		physics.addBody( portal12to121, "static", physicsData:get("l5portal12to121") )
		physics.addBody( mv1201, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1202, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1203, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1201cover, "static", physicsData:get("l5mv12cover") )
		physics.addBody( mv1203cover, "static", physicsData:get("l5mv12cover") )
		physics.addBody( mv1202cover, "static", physicsData:get("l5mv12cover") )

		physics.addBody( h1201, "static", physicsData:get("l5h12-1") )
	
		ball.x = _W/2-120; ball.y = _H/2-177
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, 2, ball.x, ball.y )
		--[[
		if arrowdata.functionscalled2 == 0 then
			movemv1201();
			movemv1203();
			arrowdata.functionscalled2 = 1
		elseif arrowdata.functionscalled2 == 1 then
			mv1201cover.x = _W/2-32; mv1201cover.y = _H/2+26
			mv1202.x = _W/2+38; mv1202.y = _H/2+76
			mv1202cover.x = _W/2+38; mv1202cover.y = _H/2+76
			mv1203.x = _W/2+112; mv1203.y = _H/2+126
			mv1203cover.x = _W/2+112; mv1203cover.y = _H/2+126
		end]]--

		print("c1to11")
		if arrowdata.g1ad1==0 then
			print("removed g1ad1 physics")
			physics.removeBody( g1ad1 )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no removing physics")
		end
		
		if arrowdata.g1ad2==0 then
			print("removed g1ad2 physics")
			physics.removeBody( g1ad2 )
		elseif arrowdata.g1ad2==1 then
			print("skipped g1ad2, no removing physics")
		end
	
	end
	
	delayc1to12 = function()
		timer.performWithDelay(2, c1to12)
	end
	
	portal1to12.collision = delayc1to12
	portal1to12:addEventListener("collision", portal1to12)
	
	-- Group 12to1
	
	c12to1 = function()
	
		group1.isVisible = true
		group12.isVisible = false
	
		physics.removeBody(block12)
		physics.removeBody(spikes12)
		physics.removeBody(portal12to1)
		physics.removeBody(portal12to122)
		physics.removeBody(portal12to121)
		physics.removeBody(h1201)
		physics.removeBody(mv1201)
		physics.removeBody(mv1202)
		physics.removeBody(mv1203)
		physics.removeBody(mv1201cover)
		physics.removeBody(mv1202cover)
		physics.removeBody(mv1203cover)
		physics.addBody( block1, "static", physicsData:get("l5block1") )
		physics.addBody( spikes1, "static", physicsData:get("l5block1spikes") )
		physics.addBody( portal1to11, "static", physicsData:get("l5portal1to11") )
		physics.addBody( portal1to12, "static", physicsData:get("l5portal1to12") )
		physics.addBody( h102, "static", physicsData:get("l5h1-1") )
		physics.addBody( h101, "static", physicsData:get("l5h1-2") )
		physics.addBody( ah101, "static", physicsData:get("l5ah1-1") )

		ball.x = _W/2-120; ball.y = _H/2+177
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, -2, ball.x, ball.y )
		
		print("c12to1")
		
		if arrowdata.ah101 == 0 then
			print("y u no open h101")
		elseif arrowdata.ah101 == 1 then
			ah101over.isVisible = true
		end
		
		if arrowdata.g1ad1==0 then
			print("added g1ad1 physics")
			physics.addBody( g1ad1, "static", { isSensor = true} )
		elseif arrowdata.g1ad1==1 then
			print("skipped g1ad1, no adding physics")
		end	
		
		if arrowdata.g1ad2==0 then
			print("added g1ad2 physics")
			physics.addBody( g1ad2, "static", { isSensor = true} )
		elseif arrowdata.g1ad2==1 then
			print("skipped g1ad2, no adding physics")
		end	
		
	end
	
	delayc12to1 = function()
		timer.performWithDelay(2, c12to1)
	end
	
	portal12to1.collision = delayc12to1
	portal12to1:addEventListener("collision", portal12to1)

--============================================================

	-- Group 12to122
	
	c12to122 = function()
	
		group122.isVisible = true
		group12.isVisible = false
	
		physics.removeBody(block12)
		physics.removeBody(spikes12)
		physics.removeBody(portal12to1)
		physics.removeBody(portal12to122)
		physics.removeBody(portal12to121)
		physics.removeBody(h1201)
		physics.removeBody(mv1201)
		physics.removeBody(mv1202)
		physics.removeBody(mv1203)
		physics.removeBody(mv1201cover)
		physics.removeBody(mv1202cover)
		physics.removeBody(mv1203cover)
		physics.addBody( block122, "static", physicsData:get("l5block122") )
		physics.addBody( portal122to12, "static", physicsData:get("l5portal122to12") )
		physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1} )
	
		ball.x = _W/2-120; ball.y = _H/2+177
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, -2, ball.x, ball.y )
	
		print("c12to122")
	
	end
	
	delayc12to122 = function()
		timer.performWithDelay(2, c12to122)
	end
	
	portal12to122.collision = delayc12to122
	portal12to122:addEventListener("collision", portal12to122)
	
	-- Group122to12
	c122to12 = function()
	
		group122.isVisible = false
		group12.isVisible = true
	
		physics.removeBody(block122)
		physics.removeBody(portal122to12)
		physics.removeBody(flag)
		physics.addBody( block12, "static", physicsData:get("l5block12") )
		physics.addBody( spikes12, "static", physicsData:get("l5block12spikes") )
		physics.addBody( portal12to1, "static", physicsData:get("l5portal12to1") )
		physics.addBody( portal12to122, "static", physicsData:get("l5portal12to122") )
		physics.addBody( portal12to121, "static", physicsData:get("l5portal12to121") )
		physics.addBody( h1201, "static", physicsData:get("l5h12-1") )
		physics.addBody( mv1201, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1202, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1203, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1201cover, "static", physicsData:get("l5mv12cover") )
		physics.addBody( mv1203cover, "static", physicsData:get("l5mv12cover") )
		physics.addBody( mv1202cover, "static", physicsData:get("l5mv12cover") )
	
		ball.x = _W/2-120; ball.y = _H/2+70
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 0, 2, ball.x, ball.y )
	
		print("c122to12")
	
	end
	
	delayc122to12 = function()
		timer.performWithDelay(2, c122to12)
	end
	
	portal122to12.collision = delayc122to12
	portal122to12:addEventListener("collision", portal122to12)

--============================================================
	-- Group 12to121
	
	c12to121 = function()
	
		group121.isVisible = true
		group12.isVisible = false
	
		physics.removeBody(block12)
		physics.removeBody(spikes12)
		physics.removeBody(portal12to1)
		physics.removeBody(portal12to122)
		physics.removeBody(portal12to121)
		physics.removeBody(h1201)
		physics.removeBody(mv1201)
		physics.removeBody(mv1202)
		physics.removeBody(mv1203)
		physics.removeBody(mv1201cover)
		physics.removeBody(mv1202cover)
		physics.removeBody(mv1203cover)
		physics.addBody( block121, "static", physicsData:get("l5block121") )
		physics.addBody( spikes121, "static", physicsData:get("l5block121spikes") )
		physics.addBody( portal121to12, "static", physicsData:get("l5portal121to12") )
		physics.addBody( ah1201, "static", physicsData:get("l5ah12-1") )
	
		ball.x = _W/2+80; ball.y = _H/2+195
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( -2, 0, ball.x, ball.y )
	
		print("c12to121")
		
		if arrowdata.ah1201 == 0 then
			print("y u no open h1201")
		elseif arrowdata.ah1201 == 1 then
			ah1201over.isVisible = true
		end
		
		if arrowdata.g121al1==0 then
			print("added g121al1 physics")
			physics.addBody( g121al1, "static", { isSensor = true} )
			g121al1:addEventListener("collision", cg121al1)
		elseif arrowdata.g121al1==1 then
			print("skipped g121al1, no adding physics")
		end	

		
		if arrowdata.g121ar1==0 then
			print("added g121ar1 physics")
			physics.addBody( g121ar1, "static", { isSensor = true} )
			g121ar1:addEventListener("collision", cg121ar1)
		elseif arrowdata.g121ar1==1 then
			print("skipped g121ar1, no adding physics")
		end	

	
	end
	
	delayc12to121 = function()
		timer.performWithDelay(2, c12to121)
	end
	
	portal12to121.collision = delayc12to121
	portal12to121:addEventListener("collision", portal12to121)
	
	-- Group121to12
	c121to12 = function()
	
		group121.isVisible = false
		group12.isVisible = true
	
		physics.removeBody(block121)
		physics.removeBody(portal121to12)
		physics.removeBody(spikes121)
		physics.removeBody(ah1201)
		physics.addBody( block12, "static", physicsData:get("l5block12") )
		physics.addBody( spikes12, "static", physicsData:get("l5block12spikes") )
		physics.addBody( portal12to1, "static", physicsData:get("l5portal12to1") )
		physics.addBody( portal12to122, "static", physicsData:get("l5portal12to122") )
		physics.addBody( portal12to121, "static", physicsData:get("l5portal12to121") )
		physics.addBody( h1201, "static", physicsData:get("l5h12-1") )
		physics.addBody( mv1201, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1202, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1203, "static", physicsData:get("l5mv12") )
		physics.addBody( mv1201cover, "static", physicsData:get("l5mv12cover") )
		physics.addBody( mv1203cover, "static", physicsData:get("l5mv12cover") )
		physics.addBody( mv1202cover, "static", physicsData:get("l5mv12cover") )

		ball.x = _W/2-20; ball.y = _H/2-200
		ball:setLinearVelocity(0, 0)
		ball:applyLinearImpulse( 2, 0, ball.x, ball.y )
	
		print("c121to12")
		
		if arrowdata.g121ar1==0 then
			print("removed g121ar1 physics")
			physics.removeBody( g121ar1 )
		elseif arrowdata.g121ar1==1 then
			print("skipped g121ar1, no removing physics")
		end

		
		if arrowdata.g121al1==0 then
			print("removed g121al1 physics")
			physics.removeBody( g121al1 )
		elseif arrowdata.g121al1==1 then
			print("skipped g121al1, no removing physics")
		end

	
	end
	
	delayc121to12 = function()
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
		ispassed.l5 = 1
		saveTable(ispassed, "chkftl2.json")
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
		pausebutton:removeEventListener("tap", pausegame);
	end
	
	wingameatlast = function(event)
		storyboard.gotoScene("loadingl6")
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
		Runtime:addEventListener( "key", onBackButtonPressed );
	end
	gotomenu = function(event)
		storyboard.gotoScene("level select", "fade", 300)
		sfx.levelbgplay = 0
		audio.pause( sfx.levelbackground )
	end
	
	restarthtp = function(event)
		-- No more a bunch of stuff because I stuffed it into exitscene
		storyboard.gotoScene("restartl5", "fade", 100)
		print("collided!")
	end
	
	--========================================================
	--[[
	local downPress = false
	local onBackButtonPressed
	function onBackButtonPressed(e)
    local keyname = event.keyName;

		if (e.phase == "down" and e.keyName == "back") then
			downPress = true
			return true
		else
			if (e.phase == "up" and e.keyName == "back" and downPress) then
				pausegame();
				Runtime:removeEventListener( "key", onBackButtonPressed );
				return true
			end
		end
		return false; --THE LINE YOU REALLY NEED IS THIS ONE!!!
	end

	--add the key callback
	Runtime:addEventListener( "key", onBackButtonPressed );
	]]--
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
	spikes121.collision = restarthtp
	mv1101.collision = restarthtp
	mv1102.collision = restarthtp
	mv1201.collision = restarthtp
	mv1202.collision = restarthtp
	mv1203.collision = restarthtp
	
	flag:addEventListener("collision", flag)
	spikes1:addEventListener("collision", spikes1)
	spikes11:addEventListener("collision", spikes11)
	spikes121:addEventListener("collision", spikes121)
	spikes12:addEventListener("collision", spikes12)
	mv1101:addEventListener("collision", mv1101)
	mv1102:addEventListener("collision", mv1102)
	mv1201:addEventListener("collision", mv1201)
	mv1202:addEventListener("collision", mv1202)
	mv1203:addEventListener("collision", mv1203)
	
	group:insert(background);
	group:insert(ball)
	group:insert(group1)
	group:insert(group11)
	group:insert(group12)
	group:insert(group121)
	group:insert(group122)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

	movemv1101();
	movemv1102();
	movemv1201();
	movemv1203();

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 5 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)
	spikes1:removeEventListener("collision", spikes1)
	spikes11:removeEventListener("collision", spikes11)
	spikes121:removeEventListener("collision", spikes121)
	spikes12:removeEventListener("collision", spikes12)
	mv1201:removeEventListener("collision", mv1201)
	mv1202:removeEventListener("collision", mv1202)
	mv1203:removeEventListener("collision", mv1203)
	mv1101:removeEventListener("collision", mv1101)
	mv1102:removeEventListener("collision", mv1102)
	Runtime:removeEventListener("tap", pauseball);
	Runtime:removeEventListener("touch", check3);
	ball:setLinearVelocity(0, 0)

	storyboard.purgeAll()
	storyboard.purgeAll()
	storyboard.purgeAll()
	storyboard.purgeAll()

	arrowdata.ah101 = nil
	arrowdata.ah101 = 0

	arrowdata.ah102 = nil
	arrowdata.ah102 = 0

	arrowdata.ah1201 = nil
	arrowdata.ah1201 = 0
	
	arrowdata.g1ad1  = nil
	arrowdata.g1ad2 = nil
	arrowdata.g11al1 = nil
	arrowdata.g11al2 = nil

	arrowdata.g121al1 = nil

	arrowdata.g121ar1 = nil

	arrowdata.g1ad1  = 0
	arrowdata.g1ad2 = 0
	arrowdata.g11al1 = 0
	arrowdata.g11al2 = 0

	arrowdata.g121al1 = 0

	arrowdata.g121ar1 = 0
	
	arrowdata.g11al1 = nil
	arrowdata.g11al2 = nil
	arrowdata.g11al1 = 0
	arrowdata.g11al2 = 0
	
	local function moveobjects()

		transition.cancel(move1101to)
		transition.cancel(move1101coverto)
		transition.cancel(move1102back)
		transition.cancel(move1102coverback)
		
		transition.cancel(move1201to)
		transition.cancel(move1201back)
		transition.cancel(move1201coverto)
		transition.cancel(move1201coverback)
		transition.cancel(move1203to)
		transition.cancel(move1203back)
		transition.cancel(move1203coverto)
		transition.cancel(move1203coverback)

	end
	
	timer.performWithDelay(2, moveobjects)
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