local composer = require( "composer" )
local scene = composer.newScene()

function showGameOver()
  fadeTransition = transition.to(gameOver,{time=600, alpha=1,onComplete=showStart})
end

function showStart()
  startTransition = transition.to(restart,{time=200, alpha=1})
end

function restartGame(event)
  if event.phase == "ended" then
    composer.gotoScene("game")
  end
end



function scene:create( event )
  
  gameStarted = false
  local sceneGroup = self.view
  skySpeed = .2
  backgroundSpeed = 4
  groundSpeed = 10
  backgroundSize = display.contentWidth

  background1 = display.newImageRect('images/sky_dune001.png', backgroundSize,550)
  background1.anchorX = 0
  background1.anchorY = 1
  background1.x = 0
  background1.y = display.contentHeight - 200
  background1.speed = backgroundSpeed
  sceneGroup:insert(background1)

  background2 = display.newImageRect('images/sky_dune001.png',backgroundSize ,550)
  background2.anchorX = 0
  background2.anchorY = 1
  background2.x = backgroundSize
  background2.y = display.contentHeight - 200
  background2.speed = backgroundSpeed
  sceneGroup:insert(background2)

  ground1 = display.newImageRect("images/ground.png", display.contentWidth, 220 )
  ground1.anchorX = 0
  ground1.anchorY = 1
  ground1.x = 0
  ground1.y = display.contentHeight
  ground1.speed = groundSpeed
  physics.addBody(ground1, "static", {density=.1, bounce=0.1, friction=.2})
  sceneGroup:insert(ground1)

  ground2 = display.newImageRect("images/ground.png", display.contentWidth, 220 )
  ground2.anchorX = 0
  ground2.anchorY = 1
  ground2.x = backgroundSize
  ground2.y = display.contentHeight
  ground2.speed = groundSpeed
  sceneGroup:insert(ground2)

  gameOver = display.newImageRect("images/GAMEOVER007.png",500,100)
  gameOver.anchorX = 0.5
  gameOver.anchorY = 0.5
  gameOver.x = display.contentCenterX
  gameOver.y = display.contentCenterY - 200
  gameOver.alpha = 0
  sceneGroup:insert(gameOver)

  restart = display.newImageRect("images/reload22.png", 191, 137)
  restart.anchorX = 0.5
  restart.anchorY = 1
  restart.x = display.contentCenterX
  restart.y = display.contentCenterY + 100
  restart.alpha = 0
  sceneGroup:insert(restart)

end

function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
   elseif ( phase == "did" ) then
    composer.removeScene("game")
    showGameOver()
    restart:addEventListener("touch", restartGame)
   end
end

function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
    restart:removeEventListener("touch", restartGame)
    transition.cancel(fadeTransition)
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
