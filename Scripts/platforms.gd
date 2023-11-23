extends CanvasLayer

@onready var v_platform_top = $ParallaxBackground/V_Platform_Top
@onready var v_platform = $ParallaxBackground/V_Platform
@onready var h_platform = $ParallaxBackground/H_Platform



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	h_platform.motion_offset.x -= 100 *delta
	v_platform.motion_offset.x -= 200 *delta
	v_platform_top.motion_offset.x -= 75 *delta

