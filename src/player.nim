import raylib,classes,raymath

type
  MovementState = enum
    Idle,Walking
  Direction = enum 
    North,South,East,West

classes.class Player:
  var pos: Vector2
  var speed: float32
  var state: MovementState = MovementState.Idle
  var direction: Direction = Direction.South
  var texture: Texture2D
  var velocity: Vector2
  var canInput: bool = true

  method init(pos: Vector2,speed: float32, texture: string) =
    this.pos = pos
    this.speed = speed
    this.texture = loadTexture(texture)
  
  method draw() =
    drawTexture(
      this.texture, # Texture to draw
      this.pos, # Position of texture
      0, # Rotation of texture
      1, # Scale of texture
      WHITE # Tint of texture
    )
  
  method input() =
    if this.canInput:
      this.velocity = Vector2(x: 0, y: 0)

      if isKeyDown(KeyboardKey.D): this.velocity.x += 1.0
      if isKeyDown(KeyboardKey.A): this.velocity.x -= 1.0
      if isKeyDown(KeyboardKey.W): this.velocity.y -= 1.0
      if isKeyDown(KeyboardKey.S): this.velocity.y += 1.0

      if this.velocity.x != 0 and this.velocity.y != 0:
        this.velocity = normalize(this.velocity)

      let deltaTime: float32 = getFrameTime()
      this.pos = lerp(this.pos, add(this.pos, scale(this.velocity, this.speed)), 0.1)

      if this.velocity.x != 0 or this.velocity.y != 0:
        this.state = MovementState.Walking
      else:
        this.state = MovementState.Idle


export Player