-- SWIPE MAZE!
-- Yay so I'm using storyboard this time instead of director
-- because it has the ability to set the transition time.

-- Hidden Status Bar
display.setStatusBar( display.HiddenStatusBar )

-- DONT CHANGE THESE
-- DETECTS SCREEN HEIGHT AND WIDTH
-- THESE VARIABLES ARE USED IN ALMOST EVERY SCENE
-- SO NO TOUCHIE OR ELSE THE GAME WONT WORK
_W = display.contentWidth;
_H = display.contentHeight;

-- Decided to put RevMob ads
-- Because I need money
-- Lots and lots of it
local RevMob = require("revmob")
local REVMOB_IDS = { ["Android"] = "52800afa770ab6198f000003", ["iPhone OS"] = "52800af00920afd6b3000003" }
RevMob.startSession(REVMOB_IDS)

--RevMob.setTestingMode(RevMob.TEST_WITH_ADS)
--RevMob.setTestingMode(RevMob.TEST_WITHOUT_ADS)
--RevMob.setTestingMode(RevMob.TEST_DISABLED)
RevMob.printEnvironmentInformation(REVMOB_IDS)

-- Boost Factor
-- For the arrows
bf = 2

-- Background CCCC
display.setDefault( "background", 240, 235, 239 )

-- Physics Stuff
local physics = require("physics");
physics.start();

physics.setScale( 60 ) 
physics.setGravity( 0, 0 )

-- YAY STORYBOARD
local storyboard = require "storyboard"
storyboard.gotoScene( "chkftlscene", "fade", 50 )

--==================================================================
-- ChartBoost
-- ADS ADS ADS = MONEY MONEY MONEY
-- No really.

cb = require "ChartboostSDK.chartboost"
local device = system.getInfo( "model" )
local appId, appSignature
if (device == "iPhone" or device == "iPad") then
		appId = ("52846f7316ba476356000026")
		appSignature = ("37d4400f26962260f23ee6d3c378889914523402")

else
		appId = ("5288180a17ba478d0a000028")
		appSignature = ("05c93d856858a183eb28d360825149af13b957c7")
end
appBundle = "com.geogamez.swipemaze"

delegate = {
    shouldRequestInterstitial = function(location) print("Chartboost: shouldRequestInterstitial " .. location .. "?"); return true end,
    shouldDisplayInterstitial = function(location) print("Chartboost: shouldDisplayInterstitial " .. location .. "?"); return true end,
    didCacheInterstitial = function(location) print("Chartboost: didCacheInterstitial " .. location); return end,
    didFailToLoadInterstitial = function(location, error) print("Chartboost: didFailToLoadInterstitial " .. location)
                    if error then print("    Error: " .. error) end end,
    didDismissInterstitial = function(location) print("Chartboost: didDismissInterstitial " .. location); return end,
    didCloseInterstitial = function(location) print("Chartboost: didCloseInterstitial " .. location); return end,
    didClickInterstitial = function(location) print("Chartboost: didClickInterstitial " .. location); return end,
    didShowInterstitial = function(location) print("Chartboost: didShowInterstitial " .. location); return end,
    shouldDisplayLoadingViewForMoreApps = function() return true end,
    shouldRequestMoreApps = function() print("Chartboost: shouldRequestMoreApps"); return true end,
    shouldDisplayMoreApps = function() print("Chartboost: shouldDisplayMoreApps"); return true end,
    didCacheMoreApps = function(error) print("Chartboost: didCacheMoreApps")
                    if error then print("    Error: " .. error) end end,
    didFailToLoadMoreApps = function(error) print("Chartboost: didFailToLoadMoreApps: " .. error); return end,
    didDismissMoreApps = function() print("Chartboost: didDismissMoreApps"); return end,
    didCloseMoreApps = function() print("Chartboost: didCloseMoreApps"); return end,
    didClickMoreApps = function() print("Chartboost: didClickMoreApps"); return end,
    didShowMoreApps = function() print("Chartboost: didShowMoreApps"); return end,
    shouldRequestInterstitialsInFirstSession = function() return true end,
    didFailToLoadUrl = function(url, error) print("Chartboost:didFailToLoadUrl: " .. tostring(url))
                    if error then print("    Error: " .. error) end end
}
cb.create{appId = appId,
    appSignature = appSignature,
    delegate = delegate,
    appBundle = "com.geogamez.swipemaze"}
cb.startSession()
--==================================================================
--Garbage Collection

timer.performWithDelay(1, function() collectgarbage("collect") end)


local monitorMem = function()

    collectgarbage()
    --print( "MemUsage: " .. collectgarbage("count") )

    local textMem = system.getInfo( "textureMemoryUsed" ) / 1000000
    --print( "TexMem:   " .. textMem )
end

Runtime:addEventListener( "enterFrame", monitorMem )

--=================================================================
-- JSON stuff, used to detect First-time Launch.

local json = require("json")


--=================================================================
-- END OF CODE