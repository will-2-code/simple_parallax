import raylib as ray
import raymath as mat
import camera as cam

type
    BackTexture* = object
        texture: ray.Texture2D
        pos: ray.Vector2
        shift: float32

type
    BackScroll* = object
        back_ground*: BackTexture
        mid_ground*: BackTexture
        fore_ground*: BackTexture

proc init*(): BackScroll =
    return BackScroll(back_ground: BackTexture(texture: ray.loadTexture("src/assets/cyberpunk_street_background.png"), pos: ray.Vector2(x: 0, y: 0), shift: 0.1),
                    mid_ground: BackTexture(texture: ray.loadTexture("src/assets/cyberpunk_street_midground.png"), pos: ray.Vector2(x: 0, y: 0), shift: 0.3),
                    fore_ground: BackTexture(texture: ray.loadTexture("src/assets/cyberpunk_street_foreground.png"), pos: ray.Vector2(x: 0, y: 0), shift: 1))


proc draw_text*(back_text: var BackTexture, game_cam: cam.Camera): void =
    var width: float32 = float32(back_text.texture.width)

    if back_text.pos.x > game_cam.pos.x * back_text.shift:
        back_text.pos.x -= width
    elif back_text.pos.x + width < game_cam.pos.x * back_text.shift:
        back_text.pos.x += width

    ray.drawTexture(back_text.texture, int32(back_text.pos.x - width - (game_cam.pos.x * back_text.shift)), int32(back_text.pos.y - game_cam.pos.y), ray.White)
    ray.drawTexture(back_text.texture, int32(back_text.pos.x - (game_cam.pos.x * back_text.shift)), int32(back_text.pos.y - game_cam.pos.y), ray.White)
    ray.drawTexture(back_text.texture, int32(back_text.pos.x + width - (game_cam.pos.x * back_text.shift)), int32(back_text.pos.y - game_cam.pos.y), ray.White)
    ray.drawTexture(back_text.texture, int32(back_text.pos.x + (width * 2) - (game_cam.pos.x * back_text.shift)), int32(back_text.pos.y - game_cam.pos.y), ray.White)



proc draw*(background: var BackScroll, camera: cam.Camera): void = 
    background.back_ground.draw_text(camera)
    background.mid_ground.draw_text(camera)
    background.fore_ground.draw_text(camera)