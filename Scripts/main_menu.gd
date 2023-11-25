extends Control

@onready var button_sound_d = $MarginContainer/VBoxContainer/Play/ButtonSoundD


func _on_play_pressed():
	button_sound_d.play()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_quit_pressed():
	button_sound_d.play()
	get_tree().quit()
