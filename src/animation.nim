import raylib as ray
import raymath as mat

type 
    Animation* = object
        texture*: ray.Texture2D
        source*: ray.Rectangle

        scale*: float32
        width*: float32
        height*: float32

        update_time*: float32
        running_time*: float32

        frame*: int32
        total_frames*: int32

        current_frame_started*: bool


# proc init(path: string, init_scale: int32, init_updateTime: float32, total_frames: int32): Animation =
#     var animation: Animation = Animation()
#     animation.texture = ray.loadTexture(path)

#     var frame_width: float32 = 
#     return Animation