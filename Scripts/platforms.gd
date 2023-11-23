extends CanvasLayer

@onready var main_plat = $ParallaxBackground/Main_Plat
@onready var h_platforms = $ParallaxBackground/ParallaxLayer/H_Platforms
@onready var v_platforms = $ParallaxBackground/ParallaxLayer/V_Platforms

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	main_plat.motion_offset.x -= 100 *delta

