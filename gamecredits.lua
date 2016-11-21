local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local utility = require( "utility" ) 

local params

local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.gotoScene("menu", { effect = "crossFade", time = 333 })
    end
end

--
-- Start the composer event handlers
--
function scene:create( event )
    local sceneGroup = self.view

    params = event.params
        
    --
    -- setup a page background, really not that important though composer
    -- crashes out if there isn't a display object in the view.
    --
    local background = display.newImageRect( "images/FirstScreen.jpg", display.contentWidth, 950)--( 0, 0, 1280, 720 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert(background)

    local title = display.newImageRect ( "images/Sobre.png", 1200 , 500)
    title.x = display.contentCenterX
    title.y = display.contentCenterY + 50
    sceneGroup:insert(title)

    -- local creditText = display.newImageRect ( "images/Sobre_tela.png", 600 , 600, native.systemFont, 100 )
    -- creditText:setFillColor( 0 )
    -- creditText.x = 500
    -- creditText.y = 500 
    -- sceneGroup:insert(creditText)

    -- http://www.freesfx.co.uk
    -- http://www.freesound.org

   local doneButton = widget.newButton{
    defaultFile="images/reload22.png",
    width=150, height=140,
    onEvent = handleButtonEvent  -- event listener function
  }
  doneButton.x = display.contentWidth *0.5
  doneButton.y = display.contentHeight - 120
  sceneGroup:insert(doneButton)


  -- restart = display.newImageRect("images/reload22.png", 191, 137)
  -- restart.anchorX = 0.5
  -- restart.anchorY = 1
  -- restart.x = display.contentCenterX 
  -- restart.y = display.contentCenterY + 300
  -- restart.alpha = 0
  -- -- local restart = display.newImageRect("images/reload22.png", 191, 137)
  --   restart.anchorX = 0.5
  --   restart.anchorY = 1
  --   restart.x = display.contentCenterX 
  --   restart.y = display.contentCenterY + 100
  --   restart.alpha = 0
  --   onEvent = handleButtonEvent
  --   sceneGroup:insert(doneButton)

    -- local doneButton = widget.newButton({
    --     id = "button1",
    --     label = "Done",
    --     width = 100,
    --     height = 32,
    --     onEvent = handleButtonEvent
    -- })
    -- doneButton.x = display.contentCenterX
    -- doneButton.y = display.contentHeight - 40
    -- sceneGroup:insert( doneButton )

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params

    if event.phase == "did" then
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    if event.phase == "will" then
    end

end

function scene:destroy( event )
    local sceneGroup = self.view
    
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
