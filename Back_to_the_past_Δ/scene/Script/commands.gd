extends Node2D

func _on_play_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://first_level.tscn")

func _on_back_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://scene/main.tscn")

