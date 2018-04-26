--Menu

local storyboard = require( "storyboard" )
local widget = require( "widget" )
local sfx = require( "sfx" )

local arrowdata = require("arrowdata")

local scene = storyboard.newScene()

--Forward Declaring stuff 
local backbtn, background
local l1btn, l2btn, l3btn, l4btn
local l5btn, l6btn, l7btn, l8btn
local l9btn, l10btn, l11btn, l12btn
local l13btn, l14btn, l15btn, l16btn
local l17btn, l18btn, l19btn, l20btn
local exitlevelselect
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
-- Level Functions
-- T stands for transition
local stopbackground = function()
	sfx.backgroundplay = 0
	audio.pause( sfx.background )
end
local level1 = function()
	stopbackground();
	storyboard.gotoScene("loadingl1")
end

local level2 = function()
	stopbackground();
	storyboard.gotoScene("loadingl2")
end

local level3 = function()
	stopbackground();
	storyboard.gotoScene("loadingl3")
end

local level4 = function()
	stopbackground();
	storyboard.gotoScene("loadingl4")
end

local level5 = function()
	stopbackground();
	storyboard.gotoScene("loadingl5")
end

local level6 = function()
	stopbackground();
	storyboard.gotoScene("loadingl6")
end

local level7 = function()
	stopbackground();
	storyboard.gotoScene("loadingl7")
end

local level8 = function()
	stopbackground();
	storyboard.gotoScene("loadingl8")
end

local level9 = function()
	stopbackground();
	storyboard.gotoScene("loadingl9")
end

local level10 = function()
	stopbackground();
	storyboard.gotoScene("loadingl10")
end

local level11 = function()
	stopbackground();
	storyboard.gotoScene("loadingl11")
end

local level12 = function()
	stopbackground();
	storyboard.gotoScene("loadingl12")
end
--==================================================================
local l1btn
local l2btn
local l3btn
local l4btn
local l5btn
local l6btn
local l7btn
local l8btn
local l9btn
local l10btn
local l11btn
local l12btn
local l13btn
local l14btn
local l15btn
local l16btn
local l17btn
local l18btn
local l19btn
local l20btn
--==================================================================
-- See lsbackground.png for the layout
--[[
local row1 = _H/2-96
local row2 = _H/2-26
local row3 = _H/2+44
local row4 = _H/2+114
local row5 = _H/2+160

local column1 = _W/2-105
local column2 = _W/2-35
local column3 = _W/2+35
local column4 = _W/2+105
]]--

local row1 = _H/2-96
local row2 = _H/2-32
local row3 = _H/2+32
local row4 = _H/2+96
local row5 = _H/2+160

local column1 = _W/2-105
local column2 = _W/2-35
local column3 = _W/2+35
local column4 = _W/2+105

--==================================================================
--A bunch of functions
local backtomain = function()
	storyboard.gotoScene("menu", "slideRight", 300)
end
--==================================================================--[[
--[[
local function onKeyEvent( event )
    local keyname = event.keyName;
    if (event.phase == "up" and (event.keyName=="back" or event.keyName=="menu")) then
            if keyname == "back" then
            	exitlevelselect();
            end
	end
    return true;
end
 --add the runtime event listener
if system.getInfo( "platformName" ) == "Android" then  Runtime:addEventListener( "key", onKeyEvent ) end
]]--
--==================================================================]]--
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
		
	if ispassed.l1 == 0 then
		l1btn = widget.newButton
		{
			defaultFile = "l1btn.png",
			overFile = "l1btnover.png",
			width = 50,
			height = 50,
		}
		l1btn.x = column1; l1btn.y = _H+300
	elseif ispassed.l1 == 1 then
		l1btn = widget.newButton
		{
			defaultFile = "l1btnpassed.png",
			overFile = "l1btnpassedover.png",
			width = 50,
			height = 50,
		}
		l1btn.x = column1; l1btn.y = _H+300
	end
	
	if ispassed.l2 == 0 then
		l2btn = widget.newButton
		{
			defaultFile = "l2btn.png",
			overFile = "l2btnover.png",
			width = 50,
			height = 50,
		}
		l2btn.x = column2; l2btn.y = _H+300
	elseif ispassed.l2 == 1 then
		l2btn = widget.newButton
		{
			defaultFile = "l2btnpassed.png",
			overFile = "l2btnpassedover.png",
			width = 50,
			height = 50,
		}
		l2btn.x = column2; l2btn.y = _H+300
	end
	
	if ispassed.l3 == 0 then
		l3btn = widget.newButton
		{
			defaultFile = "l3btn.png",
			overFile = "l3btnover.png",
			width = 50,
			height = 50,
		}
		l3btn.x = column3; l3btn.y = _H+300	
	elseif ispassed.l3 == 1 then
		l3btn = widget.newButton
		{
			defaultFile = "l3btnpassed.png",
			overFile = "l3btnpassedover.png",
			width = 50,
			height = 50,
		}
		l3btn.x = column3; l3btn.y = _H+300	
	end

	if ispassed.l4 == 0 then
		l4btn = widget.newButton
		{
			defaultFile = "l4btn.png",
			overFile = "l4btnover.png",
			width = 50,
			height = 50,
		}
		l4btn.x = column4; l4btn.y = _H+300
	elseif ispassed.l4 == 1 then
		l4btn = widget.newButton
		{
			defaultFile = "l4btnpassed.png",
			overFile = "l4btnpassedover.png",
			width = 50,
			height = 50,
		}
		l4btn.x = column4; l4btn.y = _H+300
	end
	
	if ispassed.l5 == 0 then
		l5btn = widget.newButton
		{
			defaultFile = "l5btn.png",
			overFile = "l5btnover.png",
			width = 50,
			height = 50,
		}
		l5btn.x = column1; l5btn.y = _H+300
	elseif ispassed.l5 == 1 then
		l5btn = widget.newButton
		{
			defaultFile = "l5btnpassed.png",
			overFile = "l5btnpassedover.png",
			width = 50,
			height = 50,
		}
		l5btn.x = column1; l5btn.y = _H+300
	end

	if ispassed.l6 == 0 then
		l6btn = widget.newButton
		{
			defaultFile = "l6btn.png",
			overFile = "l6btnover.png",
			width = 50,
			height = 50,
		}
		l6btn.x = column2; l6btn.y = _H+300
	elseif ispassed.l6 == 1 then
		l6btn = widget.newButton
		{
			defaultFile = "l6btnpassed.png",
			overFile = "l6btnpassedover.png",
			width = 50,
			height = 50,
		}
		l6btn.x = column2; l6btn.y = _H+300
	end
	
	if ispassed.l7 == 0 then
		l7btn = widget.newButton
		{
			defaultFile = "l7btn.png",
			overFile = "l7btnover.png",
			width = 50,
			height = 50,
		}
		l7btn.x = column3; l7btn.y = _H+300
	elseif ispassed.l7 == 1 then
		l7btn = widget.newButton
		{
			defaultFile = "l7btnpassed.png",
			overFile = "l7btnpassedover.png",
			width = 50,
			height = 50,
		}
		l7btn.x = column3; l7btn.y = _H+300
	end

	if ispassed.l8 == 0 then
		l8btn = widget.newButton
		{
			defaultFile = "l8btn.png",
			overFile = "l8btnover.png",
			width = 50,
			height = 50,
		}
		l8btn.x = column4; l8btn.y = _H+300
	elseif ispassed.l8 == 1 then
		l8btn = widget.newButton
		{
			defaultFile = "l8btnpassed.png",
			overFile = "l8btnpassedover.png",
			width = 50,
			height = 50,
		}
		l8btn.x = column4; l8btn.y = _H+300
	end
	if ispassed.l9 == 0 then
		l9btn = widget.newButton
		{
			defaultFile = "l9btn.png",
			overFile = "l9btnover.png",
			width = 50,
			height = 50,
		}
		l9btn.x = column1; l9btn.y = _H+300
	elseif ispassed.l9 == 1 then
		l9btn = widget.newButton
		{
			defaultFile = "l9btnpassed.png",
			overFile = "l9btnpassedover.png",
			width = 50,
			height = 50,
		}
		l9btn.x = column1; l9btn.y = _H+300
	end

	if ispassed.l10 == 0 then
		l10btn = widget.newButton
		{
			defaultFile = "l10btn.png",
			overFile = "l10btnover.png",
			width = 50,
			height = 50,
		}
		l10btn.x = column2; l10btn.y = _H+300
	elseif ispassed.l10 == 1 then
		l10btn = widget.newButton
		{
			defaultFile = "l10btnpassed.png",
			overFile = "l10btnpassedover.png",
			width = 50,
			height = 50,
		}
		l10btn.x = column2; l10btn.y = _H+300
	end
	
	if ispassed.l11 == 0 then
		l11btn = widget.newButton
		{
			defaultFile = "l11btn.png",
			overFile = "l11btnover.png",
			width = 50,
			height = 50,
		}
		l11btn.x = column3; l11btn.y = _H+300
	elseif ispassed.l11 == 1 then
		l11btn = widget.newButton
		{
			defaultFile = "l11btnpassed.png",
			overFile = "l11btnpassedover.png",
			width = 50,
			height = 50,
		}
		l11btn.x = column3; l11btn.y = _H+300
	end

	if ispassed.l12 == 0 then
		l12btn = widget.newButton
		{
			defaultFile = "l12btn.png",
			overFile = "l12btnover.png",
			width = 50,
			height = 50,
		}
		l12btn.x = column4; l12btn.y = _H+300
	elseif ispassed.l12 == 1 then
		l12btn = widget.newButton
		{
			defaultFile = "l12btnpassed.png",
			overFile = "l12btnpassedover.png",
			width = 50,
			height = 50,
		}
		l12btn.x = column4; l12btn.y = _H+300
	end
	if ispassed.l13 == 0 then
		l13btn = widget.newButton
		{
			defaultFile = "l13btn.png",
			overFile = "l13btnover.png",
			width = 50,
			height = 50,
		}
		l13btn.x = column1; l13btn.y = _H+300
	elseif ispassed.l13 == 1 then
		l13btn = widget.newButton
		{
			defaultFile = "l13btnpassed.png",
			overFile = "l13btnpassedover.png",
			width = 50,
			height = 50,
		}
		l13btn.x = column1; l13btn.y = _H+300
	end

	if ispassed.l14 == 0 then
		l14btn = widget.newButton
		{
			defaultFile = "l14btn.png",
			overFile = "l14btnover.png",
			width = 50,
			height = 50,
		}
		l14btn.x = column2; l14btn.y = _H+300
	elseif ispassed.l14 == 1 then
		l14btn = widget.newButton
		{
			defaultFile = "l14btnpassed.png",
			overFile = "l14btnpassedover.png",
			width = 50,
			height = 50,
		}
		l14btn.x = column2; l14btn.y = _H+300
	end
	
	if ispassed.l15 == 0 then
		l15btn = widget.newButton
		{
			defaultFile = "l15btn.png",
			overFile = "l15btnover.png",
			width = 50,
			height = 50,
		}
		l15btn.x = column3; l15btn.y = _H+300
	elseif ispassed.l15 == 1 then
		l15btn = widget.newButton
		{
			defaultFile = "l15btnpassed.png",
			overFile = "l15btnpassedover.png",
			width = 50,
			height = 50,
		}
		l15btn.x = column3; l15btn.y = _H+300
	end

	if ispassed.l16 == 0 then
		l16btn = widget.newButton
		{
			defaultFile = "l16btn.png",
			overFile = "l16btnover.png",
			width = 50,
			height = 50,
		}
		l16btn.x = column4; l16btn.y = _H+300
	elseif ispassed.l16 == 1 then
		l16btn = widget.newButton
		{
			defaultFile = "l16btnpassed.png",
			overFile = "l16btnpassedover.png",
			width = 50,
			height = 50,
		}
		l16btn.x = column4; l16btn.y = _H+300
	end
	if ispassed.l17 == 0 then
		l17btn = widget.newButton
		{
			defaultFile = "l17btn.png",
			overFile = "l17btnover.png",
			width = 50,
			height = 50,
		}
		l17btn.x = column1; l17btn.y = _H+300
	elseif ispassed.l17 == 1 then
		l17btn = widget.newButton
		{
			defaultFile = "l17btnpassed.png",
			overFile = "l17btnpassedover.png",
			width = 50,
			height = 50,
		}
		l17btn.x = column1; l17btn.y = _H+300
	end

	if ispassed.l18 == 0 then
		l18btn = widget.newButton
		{
			defaultFile = "l18btn.png",
			overFile = "l18btnover.png",
			width = 50,
			height = 50,
		}
		l18btn.x = column2; l18btn.y = _H+300
	elseif ispassed.l18 == 1 then
		l18btn = widget.newButton
		{
			defaultFile = "l18btnpassed.png",
			overFile = "l18btnpassedover.png",
			width = 50,
			height = 50,
		}
		l18btn.x = column2; l18btn.y = _H+300
	end
	
	if ispassed.l19 == 0 then
		l19btn = widget.newButton
		{
			defaultFile = "l19btn.png",
			overFile = "l19btnover.png",
			width = 50,
			height = 50,
		}
		l19btn.x = column3; l19btn.y = _H+300
	elseif ispassed.l19 == 1 then
		l19btn = widget.newButton
		{
			defaultFile = "l19btnpassed.png",
			overFile = "l19btnpassedover.png",
			width = 50,
			height = 50,
		}
		l19btn.x = column3; l19btn.y = _H+300
	end

	if ispassed.l20 == 0 then
		l20btn = widget.newButton
		{
			defaultFile = "l20btn.png",
			overFile = "l20btnover.png",
			width = 50,
			height = 50,
		}
		l20btn.x = column4; l20btn.y = _H+300
	elseif ispassed.l20 == 1 then
		l20btn = widget.newButton
		{
			defaultFile = "l20btnpassed.png",
			overFile = "l20btnpassedover.png",
			width = 50,
			height = 50,
		}
		l20btn.x = column4; l20btn.y = _H+300
	end
	
	--=============================================================
	-- Change Scene Listeners
	l1btn:addEventListener("tap", level1)
	l2btn:addEventListener("tap", level2)
	l3btn:addEventListener("tap", level3)
	l4btn:addEventListener("tap", level4)
	l5btn:addEventListener("tap", level5)
	l6btn:addEventListener("tap", level6)
	l7btn:addEventListener("tap", level7)
	l8btn:addEventListener("tap", level8)
	l9btn:addEventListener("tap", level9)
	l10btn:addEventListener("tap", level10)
	l11btn:addEventListener("tap", level11)
	l12btn:addEventListener("tap", level12)
	--=============================================================
	
	local transitiontime = 750	

	local tolevelselect = function()
	
		local transitionto5 = function()
			transition.to(l17btn, {time=transitiontime, y=row5, transition = easing.inOutExpo})
			transition.to(l18btn, {time=transitiontime, y=row5, transition = easing.inOutExpo})
			transition.to(l19btn, {time=transitiontime, y=row5, transition = easing.inOutExpo})
			transition.to(l20btn, {time=transitiontime, y=row5, transition = easing.inOutExpo})
		end
	
		local transitionto4 = function()
			transition.to(l13btn, {time=transitiontime, y=row4, transition = easing.inOutExpo})
			transition.to(l14btn, {time=transitiontime, y=row4, transition = easing.inOutExpo})
			transition.to(l15btn, {time=transitiontime, y=row4, transition = easing.inOutExpo})
			transition.to(l16btn, {time=transitiontime, y=row4, transition = easing.inOutExpo})
			timer.performWithDelay(100, transitionto5)
		end
		
		local transitionto3 = function()
			transition.to(l9btn, {time=transitiontime, y=row3, transition = easing.inOutExpo})
			transition.to(l10btn, {time=transitiontime, y=row3, transition = easing.inOutExpo})
			transition.to(l11btn, {time=transitiontime, y=row3, transition = easing.inOutExpo})
			transition.to(l12btn, {time=transitiontime, y=row3, transition = easing.inOutExpo})
			timer.performWithDelay(100, transitionto4)		
		end
		
		local transitionto2 = function()
			transition.to(l5btn, {time=transitiontime, y=row2, transition = easing.inOutExpo})
			transition.to(l6btn, {time=transitiontime, y=row2, transition = easing.inOutExpo})
			transition.to(l7btn, {time=transitiontime, y=row2, transition = easing.inOutExpo})
			transition.to(l8btn, {time=transitiontime, y=row2, transition = easing.inOutExpo})
			timer.performWithDelay(100, transitionto3)		
		end

		local transitionto = function()
			transition.to(l1btn, {time=transitiontime, y=row1, transition = easing.inOutExpo})
			transition.to(l2btn, {time=transitiontime, y=row1, transition = easing.inOutExpo})
			transition.to(l3btn, {time=transitiontime, y=row1, transition = easing.inOutExpo})
			transition.to(l4btn, {time=transitiontime, y=row1, transition = easing.inOutExpo})
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
	
			local transitionto = function()
				storyboard.gotoScene("levelpack")
			end
			
			transition.to(l17btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l18btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l19btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l20btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
	
			transition.to(l13btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l14btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l15btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l16btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
		
			transition.to(l9btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l10btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l11btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l12btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
		
			transition.to(l5btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l6btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l7btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l8btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})

			transition.to(l1btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l2btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l3btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(l4btn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(backbtn, {time=transitiontime2, y=_H+300, transition = easing.inOutExpo})
			transition.to(lsbackground, {time=transitiontime2, y=-700, transition = easing.inOutExpo})
			
		timer.performWithDelay(250, transitionto)	
		
		print("exit level select, to levelpack")
		
	end
	
	backbtn:addEventListener("tap", exitlevelselect);

	--=============================================================
	group:insert(lsbackground)
	group:insert(backbtn)
	group:insert(l1btn)
	group:insert(l2btn)
	group:insert(l3btn)
	group:insert(l4btn)
	group:insert(l5btn)
	group:insert(l6btn)
	group:insert(l7btn)
	group:insert(l8btn)
	group:insert(l9btn)
	group:insert(l10btn)
	group:insert(l11btn)
	group:insert(l12btn)
	group:insert(l13btn)
	group:insert(l14btn)
	group:insert(l15btn)
	group:insert(l16btn)
	group:insert(l17btn)
	group:insert(l18btn)
	group:insert(l19btn)
	group:insert(l20btn)
	
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
	
-- For ads
if arrowdata.adcount2 == 1 then
	cb.showInterstitial()
	arrowdata.adcount2 = 0
	print("Ad shown")
	print("%f", arrowdata.adcount2)
elseif arrowdata.adcount2 < 4 then
	arrowdata.adcount2 = arrowdata.adcount2 + 1
	print("adcount2+1, ad not shown")
	print("%f", arrowdata.adcount2)
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