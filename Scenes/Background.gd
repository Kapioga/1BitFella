extends Node2D

# Onready Files
@onready var lay_1_background = $ParallaxBackground/Lay1Background
@onready var lay_2_background = $ParallaxBackground/Lay2Background
@onready var extras = $ParallaxBackground/Extras


func _ready():
	pass 


func _process(delta):
	
	# Moves Tiled parallax assets
	lay_1_background.motion_offset.x -= 200 *delta
	lay_2_background.motion_offset.x -= 50 *delta
	extras.motion_offset.x -= 10 *delta
