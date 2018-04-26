-- chkftl2scene
-- This initial scene checks the first time launch.
local json = require("json")

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local arrowdata = require("arrowdata")

local gotomain = function()
	storyboard.gotoScene("menu", "fade", 300)
end

local gotohtp = function()
	storyboard.gotoScene("initial1", "fade", 300)
end

arrowdata.adcount = 0
arrowdata.adcount2 = 0
--===================================================================
local sfx = require( "sfx" )

sfx.arrowpop = audio.loadSound( "popsound.mp3" )
sfx.background = audio.loadSound( "Wallpaper2.mp3" )
sfx.levelbackground = audio.loadSound("Wallpaper3.mp3")

-- Menu Background music set in Channel 1
sfx.backgroundplay = 0
audio.setVolume( 0.75, { channel=1 } )

-- Level Background music set in Channel 2
sfx.levelbgplay = 0
audio.setVolume( 0.75, { channel=2 } )

if sfx.backgroundplay == 0 then
	sfx.backgroundplay = 1
	audio.play( sfx.background, { channel=1, loops=-1}  )
elseif sfx.backgroundplay == 1 then

end
sfx.bm = 0
--===================================================================
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
--===================================================================

-- SUDDENLY A WILD CODE BLOCK APPEARS
-- I have to put some stuff in the json file in order for it to work.
function scene:createScene( event )
	local group = self.view

	local image = display.newImageRect("loadinglogo.png", 320, 480)
	image.x = _W/2; image.y = _H/2
	
	local chkftl2 = loadTable("chkftl2.json")
	
	print("Checking first time launch...");

	if chkftl2==nil then
		ispassed = {}
		ispassed.sentence = "This proves that you played this game before."
		ispassed.l1 = 0
		ispassed.l2 = 0
		ispassed.l3 = 0
		ispassed.l4 = 0
		ispassed.l5 = 0
		ispassed.l6 = 0
		ispassed.l7 = 0
		ispassed.l8 = 0
		ispassed.l9 = 0
		ispassed.l10 = 0
		ispassed.l11 = 0
		ispassed.l12 = 0
		ispassed.l13 = 0
		ispassed.l14 = 0
		ispassed.l15 = 0
		ispassed.l16 = 0
		ispassed.l17 = 0
		ispassed.l18 = 0
		ispassed.l19 = 0
		ispassed.l20 = 0
		saveTable(ispassed, "chkftl2.json")
		print("Welcome to Swipe Maze!")
		timer.performWithDelay(300, gotohtp)
		
	else
		print("You played this game before!")
		timer.performWithDelay(300, gotomain)
	end
	
	group:insert(image)
	
end

--========================================================

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
		print("Opening this app...");

		local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
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