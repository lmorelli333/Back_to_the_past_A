extends Node2D

func _on_play_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://first_level.tscn")


func _on_back_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://scene/main.tscn")

func _on_full_screen_pressed():
	$button.play()
	Global.fullscreen_pressed()
	$Full_screen.set_pressed_no_signal(Global.fullscreen_flag)

func _on_texture_button_pressed():
	pass # Replace with function body.
