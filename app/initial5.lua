--htp2

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require( "widget" )
local physics = require("physics");
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

physics.setDrawMode( "normal" )

local sfx = require( "sfx" )
local json = require("json")

-- Forward declaring stuff because if I don't do this stuff goes wrong
local flag
local ball
local pauseball
local restarthtp
local block, spikes
local check3
local check3a, check3b

--PhysicsEditor required stuff
local scaleFactor = 1.0
local physicsData = (require "binitial5block").physicsData(scaleFactor)
--========================================================
local chkm = loadTable("chkm.json")

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
--========================================================
-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	local ball = display.newImageRect("ball.png", 60, 60);
	ball.x = _W/2+115; ball.y = _H/2+200
	ball.gravityScale = 0
	physics.addBody( ball, "dynamic", { density=0.9, friction=0.5, bounce=0.1, radius=30 } )
	
	block = display.newImageRect("initial5block.png", 320, 480)
	physics.addBody( block, "static", physicsData:get("initial5block") )
	block.x = _W/2; block.y = _H/2
	
	spikes = display.newImageRect("blank.png", 320, 480)
	physics.addBody( spikes, "static", physicsData:get("initial5blockspikes") )
	spikes.x = _W/2; spikes.y = _H/2
	
	flag = display.newImageRect("flag.png", 56, 61)
	flag.x = _W/2-120; flag.y = _H/2 -115
	physics.addBody( flag, "static", { density=0.9, friction=0.5, bounce=0.1} )
	
	local initialtip = display.newImageRect("initial5tip.png", 320, 480)
	initialtip.x = _W/2; initialtip.y = _H/2
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
		ball:setLinearVelocity(0, 0)
		Runtime:removeEventListener("tap", pauseball);
		Runtime:removeEventListener("touch", check3);
	end
	
	wingameatlast = function(event)
	
		if sfx.bm == 0 then
				storyboard.gotoScene("loadingl1")
				sfx.backgroundplay = 0
				audio.pause( sfx.background )
		elseif sfx.bm == 1 then
				storyboard.gotoScene("level select", "fade", 300)
		end
	end
	gotomenu = function(event)
		storyboard.gotoScene("level select", "fade", 300)
	end
	
	restarthtp = function(event)
		-- No more a bunch of stuff because I stuffed it into exitscene
		storyboard.gotoScene("restartinitial5", "fade", 100)
		print("collided!")
	end
	
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
	flag:addEventListener("collision", flag)
	spikes:addEventListener("collision", spikes)
	
	group:insert(ball);
	group:insert(flag);
	group:insert(block)
	group:insert(spikes)
	group:insert(wingroup)
	group:insert(initialtip)
	
end

function scene:enterScene( event )

end
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("Initial5");
	
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )

end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	flag:removeEventListener("collision", flag)
	spikes:removeEventListener("collision", spikes)
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