extends Node2D

@onready var lay_1_background = $ParallaxBackground/Lay1Background
@onready var lay_2_background = $ParallaxBackground/Lay2Background
@onready var extras = $ParallaxBackground/Extras


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lay_1_background.motion_offset.x -= 200 *delta
	lay_2_background.motion_offset.x -= 50 *delta
	extras.motion_offset.x -= 10 *delta
