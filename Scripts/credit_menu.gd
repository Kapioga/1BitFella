extends Control

# Onready Files
@onready var credit_theme = $CreditTheme


func _ready():
	# Plays Credit Music
	credit_theme.play()
	
func _process(delta):
	menu_back()

# Button to change to Main menu
func menu_back():
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
