extends CanvasLayer


@onready var timer_label : Label = $Label as Label

var enemy_score = 0
var player_score = 0
var time = 150

func _process(delta):
	time -= delta
	var secs = fmod(time,60)
	var mins = fmod(time, 60*60) / 60
	var time_passed = "%02d : %02d" % [mins,secs]
	timer_label.text = str(time_passed)
	if time <= 0:
		get_tree().change_scene_to_file("res://scene/GameOver.tscn")
