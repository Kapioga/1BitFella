extends Control

@onready var credit_theme = $CreditTheme

func _ready():
	credit_theme.play()
	
func _process(delta):
	menu_back()
	
func menu_back():
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
