extends Node2D

func _on_play_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://first_level.tscn")
	Global.player_health = 100
	Global.energy = 0

func _on_commands_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://scene/commands.tscn")

func _on_settings_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://scene/Options.tscn")


func _on_quit_pressed():
	get_tree().quit()
