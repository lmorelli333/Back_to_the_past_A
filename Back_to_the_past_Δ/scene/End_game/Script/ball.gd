extends CharacterBody2D

var SPEED  = 250.0
var direction = Vector2.ZERO

func _ready():
	direction.y = [1,-1].pick_random()
	direction.x = [1,-1].pick_random()

func _physics_process(_delta):
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED).normalized()
	
	move_and_slide()

func _on_timer_timeout():
	SPEED = 400
	
