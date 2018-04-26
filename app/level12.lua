--Level6:  kinda like level 2

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local scene = storyboard.newScene()

local physics = require("physics");
local arrowdata = require( "arrowdata12" )
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

physics.setDrawMode( "hybrid" )

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
local physicsData = (require "bl12block").physicsData(scaleFactor)
--=======================================================================================================================================================

--=======================================================================================================================================================
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	
	local background = display.newImage("background.png", 320, 568);
	background.x = _W/2; background.y = _H/2;
	
	ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2 +42; ball.y = _H/2-40
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
	
	blocks.b1 = display.newImageRect("l12block1.png", 320, 480)
	blocks.b1.x = _W/2; blocks.b1.y = _H/2
	physics.addBody( blocks.b1, "static", physicsData:get("l12block1") )
	
	groups.g1:insert(blocks.b1)
	--========================================================
	-- Group 11
	groups.g11 = display.newGroup()
	groups.g11.isVisible = false
	
	blocks.b11 = display.newImageRect("l12block11.png", 320, 480)
	blocks.b11.x = _W/2; blocks.b11.y = _H/2
	
	spikes.s11 = display.newImageRect("blank.png", 320, 480)
	spikes.s11.x = _W/2; spikes.s11.y = _H/2
	
	groups.g11:insert(blocks.b11)
	groups.g11:insert(spikes.s11)
	--========================================================
	-- Group 111
	groups.g111 = display.newGroup()
	groups.g111.isVisible = false
	
	blocks.b111 = display.newImageRect("l12block111.png", 320, 480)
	blocks.b111.x = _W/2; blocks.b111.y = _H/2
	
	spikes.s111 = display.newImageRect("blank.png", 320, 480)
	spikes.s111.x = _W/2; spikes.s111.y = _H/2
	
	groups.g111:insert(blocks.b111)
	groups.g111:insert(spikes.s111)
	--========================================================
	-- Group 112
	groups.g112 = display.newGroup()
	groups.g112.isVisible = false
	
	blocks.b112 = display.newImageRect("l12block112.png", 320, 480)
	blocks.b112.x = _W/2; blocks.b112.y = _H/2
	
	groups.g112:insert(blocks.b112)
	--========================================================
	-- Group 12
	groups.g12 = display.newGroup()
	groups.g12.isVisible = false
	
	blocks.b12 = display.newImageRect("l12block12.png", 320, 480)
	blocks.b12.x = _W/2; blocks.b12.y = _H/2
	
	spikes.s12 = display.newImageRect("blank.png", 320, 480)
	spikes.s12.x = _W/2; spikes.s12.y = _H/2
	
	groups.g12:insert(blocks.b12)
	groups.g12:insert(spikes.s12)
	--========================================================
	-- Group 121
	groups.g121 = display.newGroup()
	groups.g121.isVisible = false
	
	blocks.b121 = display.newImageRect("l12block121.png", 320, 480)
	blocks.b121.x = _W/2; blocks.b121.y = _H/2
	
	spikes.s121 = display.newImageRect("blank.png", 320, 480)
	spikes.s121.x = _W/2; spikes.s121.y = _H/2
	
	groups.g121:insert(blocks.b121)
	groups.g121:insert(spikes.s121)
	--========================================================
	-- Group 1211
	groups.g1211 = display.newGroup()
	groups.g1211.isVisible = false
	
	blocks.b1211 = display.newImageRect("l12block1211.png", 320, 480)
	blocks.b1211.x = _W/2; blocks.b1211.y = _H/2
	
	groups.g1211:insert(blocks.b1211)
	--========================================================
	-- Group 122
	groups.g122 = display.newGroup()
	groups.g122.isVisible = false
	
	blocks.b122 = display.newImageRect("l12block122.png", 320, 480)
	blocks.b122.x = _W/2; blocks.b122.y = _H/2
	
	spikes.s122 = display.newImageRect("blank.png", 320, 480)
	spikes.s122.x = _W/2; spikes.s122.y = _H/2
	
	groups.g122:insert(blocks.b122)
	groups.g122:insert(spikes.s122)
	--========================================================
	-- Group 13
	groups.g13 = display.newGroup()
	groups.g13.isVisible = false
	
	blocks.b13 = display.newImageRect("l12block13.png", 320, 480)
	blocks.b13.x = _W/2; blocks.b13.y = _H/2
	
	groups.g13:insert(blocks.b13)
	groups.g13:insert(flag)
	--========================================================
	-- Group 14
	groups.g14 = display.newGroup()
	groups.g14.isVisible = false
	
	blocks.b14 = display.newImageRect("l12block14.png", 320, 480)
	blocks.b14.x = _W/2; blocks.b14.y = _H/2
	
	groups.g14:insert(blocks.b14)
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
		ispassed.l12 = 1
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
		storyboard.gotoScene("restartl12", "fade", 100)
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
	spikes.s11.collision = nextscene
	spikes.s111.collision = nextscene
	spikes.s12.collision = nextscene
	spikes.s121.collision = nextscene
	spikes.s122.collision = nextscene
	blocks.b112.collision = nextscene
	blocks.b1211.collision = nextscene
	blocks.b14.collision = nextscene

	flag:addEventListener("collision", flag)
	spikes.s11:addEventListener("collision", spikes.s11)
	spikes.s111:addEventListener("collision", spikes.s111)
	spikes.s12:addEventListener("collision", spikes.s12)
	spikes.s121:addEventListener("collision", spikes.s121)
	spikes.s122:addEventListener("collision", spikes.s122)
	blocks.b112:addEventListener("collision", blocks.b112)
	blocks.b1211:addEventListener("collision", blocks.b1211)
	blocks.b14:addEventListener("collision", blocks.b14)

	group:insert(background);
	group:insert(ball)
	group:insert(groups.g1)
	group:insert(groups.g11)
	group:insert(groups.g111)
	group:insert(groups.g112)
	group:insert(groups.g12)
	group:insert(groups.g121)
	group:insert(groups.g1211)
	group:insert(groups.g122)
	group:insert(groups.g13)
	group:insert(groups.g14)
	group:insert(pausebutton)
	group:insert(wingroup)
	group:insert(pausegroup)

end
	

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Level 12 calling");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )


end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	flag:removeEventListener("collision", flag)
	spikes.s11:removeEventListener("collision", spikes.s11)
	spikes.s111:removeEventListener("collision", spikes.s111)
	spikes.s12:removeEventListener("collision", spikes.s12)
	spikes.s121:removeEventListener("collision", spikes.s121)
	spikes.s122:removeEventListener("collision", spikes.s122)
	blocks.b112:removeEventListener("collision", blocks.b112)
	blocks.b1211:removeEventListener("collision", blocks.b1211)
	blocks.b14:removeEventListener("collision", blocks.b14)

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