extends Control

# Onready Files
@onready var button_sound_d = $MarginContainer/VBoxContainer/Play/ButtonSoundD
@onready var main_theme = $MainTheme

func _ready():
	main_theme.play()

# PLAY button
func _on_play_pressed():
	button_sound_d.play()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

# QUIT Button
func _on_quit_pressed():
	button_sound_d.play()
	get_tree().quit()

# CREDIT Button
func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/credit_menu.tscn")
