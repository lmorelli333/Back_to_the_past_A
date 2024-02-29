extends CharacterBody2D

var speed = 10.0
var ball_chase = false
var ball = null

var enemy_score = 0

func _physics_process(_delta):
		
		if ball_chase:
			position.y += (ball.position.y - position.y) / speed
			
func _on_area_2d_body_entered(body):
		ball = body
		ball_chase = true
		
func _on_area_2d_body_exited(_body):
		ball = null
		ball_chase = false


func _on_collision_area_body_entered(body):
	body.direction.x *= -1
	$collision_area/AudioStreamPlayer2D.play()
	
func _on_timer_timeout():
	speed = 10.0

func _on_error_timeout():
	speed = 5.0
	
