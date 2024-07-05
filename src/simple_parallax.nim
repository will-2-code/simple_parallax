import raylib as ray
import raymath as mat
import camera as cam
import backscroll as scroll


const
    SCREEN_WIDTH: int32 = 800
    SCREEN_HEIGHT: int32 = 450

let
    WIDTH: float32 = float32(SCREEN_WIDTH)
    HEIGHT: float32 = float32(SCREEN_HEIGHT)


proc main: void =
    # --- Init Window, Defer Close
    ray.initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Naylib - Simple Parallax")
    defer: ray.closeWindow()
    # --- Init Window, Defer Close

    ray.setTargetFPS(30)

    var camera: cam.Camera = cam.init()

    var back_scroll = scroll.init()

    # --- Program Loop
    while not ray.windowShouldClose():
        var delta: float32 = ray.getFrameTime()

        # --- Game Logic
        camera.take_input(delta, Vector2(x: WIDTH, y: HEIGHT))
        # --- Game Logic


        # --- Begin Draw ---
        ray.beginDrawing()
        # --- Begin Draw ---

        # --- Clear Background, always use first
        ray.clearBackground(Black)
        back_scroll.draw(camera)
        
        # --- End Draw ---
        ray.endDrawing()
        # --- End Draw ---
    # --- Program Loop

main()