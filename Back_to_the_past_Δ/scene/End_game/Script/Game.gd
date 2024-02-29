extends Node2D

signal enemy_point
signal player_point

func _on_top_body_entered(body):
	body.direction.y *= -1
	$AudioStreamPlayer2D.play()

func _on_bottom_body_entered(body):
	body.direction.y *= -1
	$AudioStreamPlayer2D.play()

func _on_left_body_entered(body):
	body.queue_free()
	emit_signal("enemy_point")
	$Timer.start()

func _on_timer_timeout():
	var restart = preload("res://scene/End_game/ball.tscn").instantiate()
	restart.global_position = Vector2(570, 320)
	add_child(restart)
	
func _on_right_body_entered(body):
	body.queue_free()
	emit_signal("player_point")
	$Timer.start()

func _ready():
	$pong.play()
