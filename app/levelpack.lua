--Menu

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )
local arrowdata = require("arrowdata")

local scene = storyboard.newScene()

--Forward Declaring stuff 
local backbtn, background
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

isavailable = loadTable("chkftl2.json")
--==================================================================
-- Level Functions
-- T stands for transition
local stopbackground = function()
	sfx.backgroundplay = 0
	audio.pause( sfx.background )
end
--==================================================================
--A bunch of functions
local backtomain = function()
	storyboard.gotoScene("menu", "slideRight", 300)
end
--==================================================================
-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	-- Level Select
	
	lsbackground = display.newImageRect("lsbackground.png", 227, 42)
	lsbackground.x = _W/2; lsbackground.y = -700
	
	local backbtn = widget.newButton
	{
		defaultFile = "backtomainbottom.png",
		overFile = "backtomainbottomover.png",
		width = 37,
		height = 37,
	}	backbtn.x = 18; backbtn.y = _H+300;
	
	local levelpack1 = widget.newButton
	{
		defaultFile = "levelpack1btn.png",
		overFile = "levelpack1btnover.png",
		width = 195,
		height = 47,
	}	levelpack1.x = _W/2; levelpack1.y = _H+300;

	--=============================================================
	
	--=============================================================
	
	local transitiontime = 1000

	local tolevelselect = function()
	
		local transitionto5 = function()

		end
	
		local transitionto4 = function()

			timer.performWithDelay(100, transitionto5)
		end
		
		local transitionto3 = function()

			timer.performWithDelay(100, transitionto4)		
		end
		
		local transitionto2 = function()

			timer.performWithDelay(100, transitionto3)		
		end

		local transitionto = function()
			
			transition.to(levelpack1, {time=transitiontime, y=_H/2-94, transition = easing.inOutExpo})
			transition.to(backbtn, {time=transitiontime, y=_H-18, transition = easing.inOutExpo})
			transition.to(lsbackground, {time=transitiontime, y=65, transition = easing.inOutExpo})

			timer.performWithDelay(100, transitionto2)
		end
		
		transitionto();
		
		print("tolevelselect")
	end
	
	tolevelselect();
	
	transitiontime2 = 300
	
	exitlevelselect = function()
	
		transition.to(levelpack1, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
		transition.to(backbtn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
		transition.to(lsbackground, {time=transitiontime2, y=-700, transition = easing.inOutExpo})
			
		
		print("exit level select, to main menu")
		
	end
	
	local tomenu = function()
		exitlevelselect()
		
		local transitionto = function()
			storyboard.gotoScene("menu")
		end
		
		timer.performWithDelay(250, transitionto)	
	end
	backbtn:addEventListener("tap", tomenu);
	
	local tolevelpack1 = function()
		exitlevelselect()
		
		local transitionto = function()
			storyboard.gotoScene("level select")
		end
		
		timer.performWithDelay(250, transitionto)	
	end
	levelpack1:addEventListener("tap", tolevelpack1);

	--=============================================================
	group:insert(lsbackground)
	group:insert(backbtn)
	group:insert(levelpack1)
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )	
	print("level select");
	if sfx.backgroundplay == 0 then
		sfx.backgroundplay = 1
		audio.play( sfx.background, {loops=-1}  )
	elseif sfx.backgroundplay == 1 then
		
	end

	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	storyboard.purgeAll() 
	
    Runtime:removeEventListener( "key", onBackButtonPressed );


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