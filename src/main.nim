import raylib,player

let screenWidth: int32 = 1000
let screenHeight: int32 = 1000
let character: string = "../assets/characters/1/test.png"

proc main() =
  initWindow(screenWidth, screenHeight, "Test")
  var player: Player = Player.init(Vector2(x: 10, y: 10), 20.0, character)

  try:
    setTargetFPS(120) 

    while not windowShouldClose():
      player.input() 

      beginDrawing()
      clearBackground(LIME)
      player.draw()
      endDrawing()
  finally:
    closeWindow()


when isMainModule:
  main()