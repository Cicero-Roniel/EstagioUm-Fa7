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

local credBtn

local selectSound = audio.loadStream("sounds/crow_cawing.mp3")
local backgroundMusic = audio.loadStream( "sounds/outdoor_bird_ambience.mp3" )
local totalTime = audio.getDuration( backgroundMusic )

print( totalTime )

-- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
local backgroundMusicChannel = audio.play( backgroundMusic, { channel=2, loops=-1, fadein=5000 } )


local function onPlayBtnRelease()
  
  -- go to game.lua scene [ joguim rodando]
  audio.play(selectSound, {channel=4, loops = 1})
  composer.gotoScene( "game", "fade", 100 )
  composer.removeHidden()
  
  return true 
end

function scene:create( event )
  local sceneGroup = self.view

  local background = display.newImageRect( "images/FirstScreen.jpg", display.contentWidth, 950 )
  background.anchorX = 0
  background.anchorY = 0
  background.x, background.y = 0, - 100
  

  

  local avoaLogo = display.newImage( "images/bt_logo.png" )
  avoaLogo:scale( 2, 2)
  avoaLogo.x = display.contentWidth * 0.50
  avoaLogo.y = 150


  
  -- create a widget button (which will loads game.lua on release)
  playBtn = widget.newButton{
    defaultFile="images/bt_play.png",
    width=300, height=100,
    onRelease = onPlayBtnRelease  
  }
  playBtn.x = display.contentWidth*0.5
  playBtn.y = display.contentHeight - 350

  -- create a widget button (which will loads recordes.lua on release)
  recBtn = widget.newButton{
    defaultFile="images/bt_recordes.png",
    width=254, height=60,
    onRelease = onRecBtnRelease  -- event listener function
  }
  recBtn.x = display.contentWidth*0.5
  recBtn.y = display.contentHeight - 250

      -- create a widget button (which will loads sobre.lua on release)
  sobreBtn = widget.newButton{
    defaultFile="images/bt_sobre.png",
    width=254, height=60,
    onRelease = onSobreBtnRelease  -- event listener function
  }
  sobreBtn.x = display.contentWidth*0.5
  sobreBtn.y = display.contentHeight - 150
  
 
  sceneGroup:insert( background )
  sceneGroup:insert( avoaLogo )
  sceneGroup:insert( sobreBtn )
  sceneGroup:insert( playBtn )
  sceneGroup:insert( recBtn )
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