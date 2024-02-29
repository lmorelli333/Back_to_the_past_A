extends CanvasLayer

@onready var enemy_label : Label = $"Control/enemy" as Label
@onready var player_label : Label = $"Control/player" as Label
@onready var timer_label : Label = $"Control/timer_label" as Label

func _process(delta):
	Global.pong_time -= delta
	var secs = fmod(Global.pong_time,60)
	var mins = fmod(Global.pong_time, 60*60) / 60
	var time_passed = "%02d : %02d" % [mins,secs]
	timer_label.text = str(time_passed)
	if Global.pong_time <= 0:
		if Global.pong_enemy > Global.pong_player:
			get_tree().change_scene_to_file("res://scene/GameOver.tscn")
		elif Global.pong_enemy < Global.pong_player:
			get_tree().change_scene_to_file("res://scene/win.tscn")


func _on_game_enemy_point():
	Global.pong_enemy += 1
	enemy_label.text = str(Global.pong_enemy)
	$Control/left.play()

func _on_game_player_point():
	Global.pong_player += 1
	player_label.text = str(Global.pong_player)
	$Control/right.play()
