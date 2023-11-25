extends CanvasLayer

# Onready Files
@onready var v_platform_top = $ParallaxBackground/V_Platform_Top
@onready var v_platform = $ParallaxBackground/V_Platform
@onready var h_platform = $ParallaxBackground/H_Platform


func _ready():
	pass 



func _process(delta):
	
	# Moves tiled parallax assets
	h_platform.motion_offset.x -= 100 *delta
	v_platform.motion_offset.x -= 200 *delta
	v_platform_top.motion_offset.x -= 75 *delta

