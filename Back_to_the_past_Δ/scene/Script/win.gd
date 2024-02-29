extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()

func _on_restart_pressed():
	$button.play()
	await $button.finished
	get_tree().change_scene_to_file("res://first_level.tscn")
	if Global.lv_counter == 1:
		Global.pong_time = 120
		Global.pong_enemy = 0
		Global.pong_player = 0
		get_tree().change_scene_to_file("res://scene/End_game/main.tscn")

func _on_quit_pressed():
	$button.play()
	await $button.finished
	get_tree().quit()
