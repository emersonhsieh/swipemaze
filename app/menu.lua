--Menu
local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )
local json = require("json")
local RevMob = require("revmob")
local arrowdata = require("arrowdata")

local ad = RevMob.createAdLink(revmobListener)

local openad = function()
	ad:open()
end

local scene = storyboard.newScene()

scenenum = "menu"

sfx.bm = 1

--==================================================================
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
--==================================================================

--==================================================================

local toinfo, exitmenu;

-- CODING BEGINS
-- Called when the scene's view does not exist: 315
function scene:createScene( event )
	local group = self.view
	
	-- Music credits.
	
	local musiccredits = display.newImageRect("musiccredits.png", 320, 480);
	musiccredits.x = _W/2; musiccredits.y = _H+300
	
	local infobtn3 = widget.newButton
	{
		defaultFile = "backtomaintop.png",
		overFile = "backtomaintopover.png",
		width = 37,
		height = 37,
	}	infobtn3.x = 18; infobtn3.y = -900;
	
	local tomusic = function()
	
		scenenum = "music"

		local transitionto2 = function()
			transition.to(musiccredits, {time=1000, y=_H/2, transition = easing.inOutExpo})
			timer.performWithDelay(100, transitionto3)
		end

		local transitionto = function()
			transition.to(infobtn3, {time=500, y=18, transition = easing.inOutExpo})
			timer.performWithDelay(100, transitionto2)
		end
		
		transitionto();

	end
	
	local exitmusic = function()

	end
	
	--=======================================================================
	-- Info Scene
	local info2 = display.newImageRect("infologo.png", 66, 66);
	info2.x = _W/2; info2.y = -700;
	
	local info = display.newImageRect("info3.png", 320, 568);
	info.x = _W/2; info.y = _H+300;

	local infobtn2 = widget.newButton
	{
		defaultFile = "backtomaintop.png",
		overFile = "backtomaintopover.png",
		width = 37,
		height = 37,
	}	infobtn2.x = 18; infobtn2.y = -900;
	
	local musicbtn = widget.newButton
	{
		defaultFile = "musicbtn.png",
		overFile = "musicbtnover.png",
		width = 190,
		height = 47,
	}	musicbtn.x = _W/2; musicbtn.y = _H+300;
	
	local revmobbtn = widget.newButton
	{
		defaultFile = "revmobinfobtn.png",
		overFile = "revmobinfobtnover.png",
		width = 195,
		height = 47,
	}	revmobbtn.x = _W/2; revmobbtn.y = _H+300;
	
	local toinfo = function()
	
		scenenum = "info"
		
		local transitionto5 = function()
			transition.to(revmobbtn, {time=1000, y=_H/2+190, transition = easing.inOutExpo})
		end
	
		local transitionto4 = function()
			transition.to(musicbtn, {time=1000, y=_H/2+120, transition = easing.inOutExpo})
			timer.performWithDelay(150, transitionto5)
		end
	
		local transitionto3 = function()
			transition.to(info2, {time=750, y=65, transition = easing.inOutExpo})
			timer.performWithDelay(150, transitionto4)
		end
		
		local transitionto2 = function()
			transition.to(info, {time=1000, y=_H/2-10, transition = easing.inOutExpo})
			timer.performWithDelay(100, transitionto3)
		end

		local transitionto = function()
			transition.to(infobtn2, {time=1000, y=18, transition = easing.inOutExpo})
			timer.performWithDelay(100, transitionto2)
		end
		
		transitionto();
	end
	
	--=======================================================================
	-- Menu scene
	
	local title = display.newImageRect("title4.png", 163, 110);
	title.x = _W/2-2; title.y = -900;
	
	local startbtn = widget.newButton
	{
		defaultFile = "startbtn.png",
		overFile = "startbtnover.png",
		width = 175,
		height = 47,
	}
	startbtn.x = _W/2; startbtn.y = _H+300
	
	local htpbtn = widget.newButton
	{
		defaultFile = "htpbtn.png",
		overFile = "htpbtnover.png",
		width = 175,
		height = 47,
	}
	htpbtn.x = _W/2; htpbtn.y = _H+300;
	
	local infobtn = widget.newButton
	{
		defaultFile = "infobtn.png",
		overFile = "infobtnover.png",
		width = 37,
		height = 37,
	}
	infobtn.x = 18; infobtn.y = _H+300;
	
	local tomainmenu = function()
	
		scenenum = "menu"
	
		local transitionto4 = function()
			transition.to(infobtn, {time=800, y=_H-18, transition = easing.inOutExpo})
		end
		
		local transitionto3 = function()
			transition.to(htpbtn, {time=800, y=_H/2+90, transition = easing.inOutExpo})
			timer.performWithDelay(150, transitionto4)		
		end
		
		local transitionto2 = function()
			transition.to(startbtn, {time=800, y=_H/2+20, transition = easing.inOutExpo})
			timer.performWithDelay(150, transitionto3)		
		end

		local transitionto = function()
			transition.to(title, {time=1000, y=110, transition = easing.inOutExpo})
			timer.performWithDelay(150, transitionto2)
		end
		
		transitionto();
		
		print("tomainmenu")
	end
	
	tomainmenu();
	
	
	--=======================================================================
	local exitmenutoinfo = function()
	
		scenenum = "info"
	
		info2.x = _W/2; info2.y = -700;
		info.x = _W/2; info.y = _H+300;
		infobtn2.x = 18; infobtn2.y = -900;
		musicbtn.x = _W/2; musicbtn.y = _H+300;
		revmobbtn.x = _W/2; revmobbtn.y = _H+300;
	
		transition.to(infobtn, {time=750, y=_H+300, transition = easing.inOutExpo})
		transition.to(htpbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(startbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(title, {time=750, y=_H-700, transition = easing.inOutExpo})
		
		toinfo();
		
		print("exitmenu, going to info")
	
	end
	
	local exitmenutohtp = function()
	
		scenenum = "htp"
	
		transition.to(infobtn, {time=750, y=_H+300, transition = easing.inOutExpo})
		transition.to(htpbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(startbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(title, {time=400, y=_H-700, transition = easing.inOutExpo})
				
		print("exitmenu, going to htp")
	
	end
	
	local exitinfotomusic = function()
	
		scenenum = "music"
	
		transition.to(revmobbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(musicbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(info2, {time=500, y=-700, transition = easing.inOutExpo})
		transition.to(info, {time=750, y=_H+300, transition = easing.inOutExpo})
		transition.to(infobtn2, {time=750, y=-700, transition = easing.inOutExpo})
		
		timer.performWithDelay(500, tomusic);
	
	end
	
	musicbtn:addEventListener("tap", exitinfotomusic);
	revmobbtn:addEventListener("tap", openad);
	
	local exitmusictoinfo = function()
	
		scenenum = "info"
		
		transition.to(musiccredits, {time=750, y=_H+300, transition = easing.inOutExpo})
		transition.to(infobtn3, {time=1000, y=-900, transition = easing.inOutExpo})
		
		toinfo();
		
	end
	
	infobtn3:addEventListener("tap", exitmusictoinfo);
	
	local exitinfotomenu = function()
	
		scenenum = "menu"
	
		transition.to(revmobbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(musicbtn, {time=500, y=_H+300, transition = easing.inOutExpo})
		transition.to(info2, {time=500, y=-700, transition = easing.inOutExpo})
		transition.to(info, {time=750, y=_H+300, transition = easing.inOutExpo})
		transition.to(infobtn2, {time=750, y=-700, transition = easing.inOutExpo})
			
		timer.performWithDelay(200, tomainmenu);
	end
	
	infobtn2:addEventListener("tap", exitinfotomenu);
	infobtn:addEventListener("tap", exitmenutoinfo);

	local htp = function()
	
		scenenum = "htp"
		
		local transitionto = function()
			storyboard.gotoScene( "initial1", "fade", 200 )
		end
		exitmenutohtp();
		
		timer.performWithDelay(500, transitionto)
	end

	htpbtn:addEventListener("tap", htp);
	
	--============================================================
	-- Level Select
	
	local startgame = function()
		local transitionto = function()
			storyboard.gotoScene("levelpack")
		end
		exitmenutohtp();
		
		timer.performWithDelay(400, transitionto)
	end
	
	startbtn:addEventListener("tap", startgame);

	
	group:insert(startbtn);
	group:insert(htpbtn);
	group:insert(infobtn);
	group:insert(title);
	group:insert(info)
	group:insert(info2)
	group:insert(musicbtn)
	group:insert(revmobbtn)
	group:insert(musiccredits)
	group:insert(infobtn2)
	group:insert(infobtn3)

end

--==================================================================
--[[
local downPress = false
local function onBackButtonPressed(e)
    local keyname = event.keyName;
    if (e.phase == "down" and e.keyName == "back") then
        downPress = true
        return true
    else
        if (e.phase == "up" and e.keyName == "back" and downPress) then
			if scenenum == "menu" then
				native.requestExit()
			elseif scenenum == 	"info" then
				exitinfotomenu();
			elseif scenenum == "music" then
				exitmusictoinfo();
			end
            return true
        end
    end
    return false; --THE LINE YOU REALLY NEED IS THIS ONE!!!
end

--add the key callback
Runtime:addEventListener( "key", onBackButtonPressed );
]]--
--==================================================================


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
local fullscreen = RevMob.createFullscreen()

-- For ads
if arrowdata.adcount == 1 then
	cb.showInterstitial()
	arrowdata.adcount = 0
	print("Ad shown")
	print("%f", arrowdata.adcount)
elseif arrowdata.adcount < 3 then
	arrowdata.adcount = arrowdata.adcount + 1
	print("Adcount+1, ad not shown")
	print("%f", arrowdata.adcount)
end
	
	print("Menu scene!");
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
storyboard.purgeAll()
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
Runtime:removeEventListener( "key", onBackButtonPressed );

storyboard.purgeAll() 


end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )

	
end

--===============================================================================

scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )

scene:addEventListener( "destroyScene", scene )

return scene