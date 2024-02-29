extends Control


func _ready():
	$gameover_music.play()

func _on_texture_button_pressed():
	$button.play()
	await $button.finished
	get_tree().quit()

func _on_reload_pressed():
	if Global.lv_counter == 0:
		Global.player_health = 100
		Global.energy = 0
		$button.play()
		await $button.finished
		get_tree().change_scene_to_file("res://first_level.tscn")
	if Global.lv_counter == 1:
		Global.energy = 0
		$button.play()
		await $button.finished
		get_tree().change_scene_to_file("res://scene/scena2/lvl_1.tscn")
	if Global.lv_counter == 2:
		Global.pong_time = 120
		Global.pong_enemy = 0
		Global.pong_player = 0
		$button.play()
		await $button.finished
		get_tree().change_scene_to_file("res://scene/End_game/main.tscn")
