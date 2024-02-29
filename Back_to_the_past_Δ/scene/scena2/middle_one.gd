extends CharacterBody2D

var start_point = $".".position.x
var direction = 1
var speed = 2


func _physics_process(_delta):
	print(position)
	if $".".position.x > (start_point + 450) and $".".position.x != start_point:
		direction = -1
	elif $".".position.x < start_point:
		direction = 1
	velocity.x = speed * direction
	move_and_collide(velocity)
