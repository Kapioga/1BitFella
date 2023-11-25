extends Node2D

# Onready Files
@onready var game_theme = $GameTheme


func _ready():
	game_theme.play()



func _process(delta):
	exit_game()

# Button to exit game
func exit_game():
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

