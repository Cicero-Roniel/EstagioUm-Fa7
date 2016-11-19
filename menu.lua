-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


local widget = require "widget"

--------------------------------------------

local playBtn



local selectSound = audio.loadStream("sounds/crow_cawing.mp3")
local backgroundMusic = audio.loadStream( "sounds/outdoor_bird_ambience.mp3" )
local totalTime = audio.getDuration( backgroundMusic )

print( totalTime )

-- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
local backgroundMusicChannel = audio.play( backgroundMusic, { channel=2, loops=-1, fadein=5000 } )


local function handlePlayButtonEvent()
  
  -- go to game.lua scene [ joguim rodando]
  audio.play(selectSound, {channel=4, loops = 1})
  composer.gotoScene( "game", "fade", 100 )
  composer.removeHidden()
  
  return true 
end

local function handleSettingsButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("gamesettings", { effect = "crossFade", time = 333 })
    end
end


local function handleCreditsButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("gamecredits", { effect = "crossFade", time = 333 })
    end
end

-- local function handleHelpButtonEvent( event )
--     if ( "ended" == event.phase ) then
--         composer.gotoScene("help", { effect = "crossFade", time = 333, isModal = true })
--     end
-- end

-- local function handleCreditsButtonEvent( event )

--     if ( "ended" == event.phase ) then
--         composer.gotoScene("gamecredits", { effect = "crossFade", time = 333 })
--     end
-- end

-- local function handleSettingsButtonEvent( event )

--     if ( "ended" == event.phase ) then
--         composer.gotoScene("gamesettings", { effect = "crossFade", time = 333 })
--     end
-- end


function scene:create( event )
  local sceneGroup = self.view

  local background = display.newImageRect( "images/FirstScreen.jpg", display.contentWidth, 950 )
  -- background.anchorX = 0
  -- background.anchorY = 0
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  

  local avoaLogo = display.newImage( "images/bt_logo3.png" )
  avoaLogo:scale( 0.5, 0.5)
  avoaLogo.x = display.contentWidth * 0.50
  avoaLogo.y = 150

  
  -- create a widget button (which will loads game.lua on release)
  playBtn = widget.newButton{
    defaultFile="images/bt_play2.png",
    width=300, height=100,
    onEvent = handlePlayButtonEvent  
  }
  playBtn.x = display.contentWidth*0.5
  playBtn.y = display.contentHeight - 340

  -- create a widget button (which will loads recordes.lua on release)
  recBtn = widget.newButton{
    defaultFile="images/bt_recordes2.png",
    width=254, height=60,
    onEvent = handleSettingsButtonEvent  -- event listener function
  }
  recBtn.x = display.contentWidth*0.5
  recBtn.y = display.contentHeight - 220

      -- create a widget button (which will loads sobre.lua on release)

  sobreBtn = widget.newButton{
    defaultFile="images/bt_sobre2.png",
    width=254, height=60,
    onEvent = handleCreditsButtonEvent  -- event listener function
  }
  sobreBtn.x = display.contentWidth*0.5
  sobreBtn.y = display.contentHeight - 120


  -- sobreBtn = widget.newButton{
  --   defaultFile="images/bt_sobre2.png",
  --   width=254, height=60,
  --   onEvent = onSobreBtnRelease  -- event listener function
  -- }
  -- sobreBtn.x = display.contentWidth*0.5
  -- sobreBtn.y = display.contentHeight - 120
  
  --   volumeBtn = widget.newButton{
  --   defaultFile="images/b_Music_prata.png",
  --   width=100, height=100,
  --   onRelease = onVolumeBtnRelease  -- event listener function
  -- }
  -- volumeBtn.x = display.contentWidth* 0.10
  -- volumeBtn.y = display.contentHeight - 80

  -- somBtn = widget.newButton{
  --   defaultFile="images/b_Sound1_prata.png",
  --   width=100, height=100,
  --   onRelease = onSomBtnRelease  -- event listener function
  -- }
  -- somBtn.x = display.contentWidth*  0.20
  -- somBtn.y = display.contentHeight - 80
 
  
  sceneGroup:insert( background )
  sceneGroup:insert( avoaLogo )
  sceneGroup:insert( sobreBtn )
  sceneGroup:insert( playBtn )
  sceneGroup:insert( recBtn )
  -- sceneGroup:insert( volumeBtn )
  -- sceneGroup:insert( somBtn )
  
  --sceneGroup:insert( volumeBtn )
end

function scene:show( event )
  local sceneGroup = self.view
  local phase = event.phase
  
  if phase == "will" then
 
  elseif phase == "did" then
  
  end 
end

function scene:hide( event )
  local sceneGroup = self.view
  local phase = event.phase
  
  if event.phase == "will" then
   
  elseif phase == "did" then
 
  end 
end

function scene:destroy( event )
  local sceneGroup = self.view
  

  
  if playBtn then
    playBtn:removeSelf()  -- widgets must be manually removed
    playBtn = nil
  end

  if credBtn then
    credBtn:removeSelf()  -- widgets must be manually removed
    credBtn = nil
  end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene