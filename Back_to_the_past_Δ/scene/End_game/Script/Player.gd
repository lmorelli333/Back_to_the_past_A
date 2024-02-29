extends CharacterBody2D

const SPEED = 800.0

func _physics_process(_delta):
	var direction
#
	direction = get_axis(KEY_W, KEY_S, KEY_UP, KEY_DOWN)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	Global.menu()
	move_and_slide()

func get_axis(up, down, alt_up, alt_down):
	if Input.is_key_pressed(up) or Input.is_key_pressed(alt_up): return -1
	elif Input.is_key_pressed(down) or Input.is_key_pressed(alt_down): return 1

func _on_area_2d_body_entered(body):
	body.direction.x *= -1
	$Area2D/AudioStreamPlayer2D.play()
