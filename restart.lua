local composer = require( "composer" )
local scene = composer.newScene()

local mydata = require("mydata")
-- local score = require ("score")

-- local widget = require "widget"


function showGameOver()
  fadeTransition = transition.to(gameOver,{time=600, alpha=1,onComplete=showStart})
end

function showStart()
  startTransition = transition.to(restart,{time=200, alpha=1})

  -- scoreTransition = transition.to(scoreText,{time 600, alpha=1})
  -- scoreTextTransition = transition.to(bestText,{time 600, alpha=1})
end

function restartGame(event)
  if event.phase == "ended" then
    -- saveScore()
    composer.gotoScene("game")
  end
end


local function handButtonEvent( event )

  if event.phase == "ended" then
    -- saveScore()
    composer.gotoScene("menu")
  end

    -- if ( "ended" == event.phase ) then
    --     composer.gotoScene("menu", { effect = "crossFade", time = 333 })
    -- end
end

-- function loadScore( )
--   local prevScore = score.load()
--   if prevScore ~= nil then
--     if prevScore <= mydata.score then
--       score.set(mydata.score)
--     else
--       score.set(prevScore)
--     end
--   else
--     score.set(mydata.score)
--   end
-- end

-- function saveScore( )
--   score.save()
--   -- body
-- end

function scene:create( event )
  
  gameStarted = false
  local sceneGroup = self.view
  skySpeed = .2
  backgroundSpeed = 4
  groundSpeed = 10
  backgroundSize = display.contentWidth

  
  background1 = display.newImageRect('images/sky_dune001.png', display.contentWidth,550)
  background1.anchorX = 0
  background1.anchorY = 1
  background1.x = 1
  background1.y = display.contentHeight - 190
  background1.speed = backgroundSpeed
  sceneGroup:insert(background1)

  background2 = display.newImageRect('images/sky_dune001.png',display.contentWidth ,550)
  background2.anchorX = 0
  background2.anchorY = 1
  background2.x = backgroundSize
  background2.y = display.contentHeight - 190
  background2.speed = backgroundSpeed
  sceneGroup:insert(background2)

  ground1 = display.newImageRect("images/ground.png", groundSize, 220 )
  ground1.anchorX = 0
  ground1.anchorY = 1
  ground1.x = 0
  ground1.y = 750
  ground1.speed = groundSpeed
  sceneGroup:insert(ground1)

  ground2 = display.newImageRect("images/ground.png", groundSize, 220 )
  ground2.anchorX = 0
  ground2.anchorY = 1
  ground2.x = backgroundSize
  ground2.y = 750
  ground2.speed = groundSpeed
  sceneGroup:insert(ground2)

  gameOver = display.newImageRect("images/GAMEOVER007.png",400,100)
  gameOver.anchorX = 0.5
  gameOver.anchorY = 0.5
  gameOver.x = display.contentCenterX
  gameOver.y = display.contentCenterY - 200
  gameOver.alpha = 0
  sceneGroup:insert(gameOver)

  restart = display.newImageRect("images/reload22.png", 150, 140)
  restart.anchorX = 0.6
  restart.anchorY = 1
  restart.x = display.contentCenterX + 200
  restart.y = display.contentCenterY + 310
  restart.alpha = 0
  sceneGroup:insert(restart)


  menuButton = display.newImageRect("images/Botao_men.png", 150, 140)
  menuButton.anchorX = 0.6
  menuButton.anchorY = 1
  menuButton.x = display.contentCenterX - 150
  menuButton.y = display.contentCenterY + 310
  sceneGroup:insert(menuButton)

  -- menuButton = widget.newButton{="images/botao_men.png",
  --   width=150, height=140,
  --   onEvent = handButtonEvent  -- event listener function
  -- }
  -- menuButton.x = display.contentWidth *0.4
  -- menuButton.y = display.contentHeight - 120
  -- sceneGroup:insert(menuButton)


  -- somaTexto = display.newText('' .. SomaTexto, display.contentCenterX + 200, display.contentCenterY + 240,  110)
  -- somaTexto:setFillColor( 0, 0, 0 )
  -- sceneGroup:insert(somaTexto)


  scoreText = display.newText("Seu score é: " .. mydata.score   ,  display.contentCenterX , display.contentCenterY , "Comic Sans MS", 100)

  scoreText:setFillColor (0,0,0)
  score.alpha = 0
  sceneGroup:insert(scoreText)

  
  -- bestText = score.init({
  --   fontsize = 50,
  --   font = "Helvetica",
  --   x = display.contentCenterX + 70,
  --   y = display.contentCenterY + 85,
  --   maxDigits = 8,
  --   leadingZeros = false,
  --   filename = "scorefile.txt"
  --   })  
  -- bestScore = score.get()
  -- bestText.text = bestScore 
  -- bestText.alpha = 0
  -- bestText:setFillColor(0,0,0)
  -- sceneGroup:insert(bestText)

end

function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   elseif ( phase == "did" ) then
    composer.removeScene("game")
    composer.removeScene("menu")
    showGameOver()
    restart:addEventListener("touch", restartGame)
    menuButton:addEventListener("touch", handButtonEvent)
    
   end
end

function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
    restart:removeEventListener("touch", restartGame)
    menuButton:removeEventListener("touch", handButtonEvent)
    transition.cancel(fadeTransition)
    transition.cancel(scoreTransition)
    transition.cancel(scoreTextTransition)
    transition.cancel(startTransition)
   end
end

function scene:destroy( event )
   local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

  return scene