extends CharacterBody2D

var start_point = $".".position.y
var direction = -1
var speed = 2


func _physics_process(_delta):
	print(position)
	if $".".position.y < (start_point - 320) and $".".position.y != start_point:
		direction = 1
	elif $".".position.y > start_point:
		direction = -1
	velocity.y = speed * direction
	move_and_collide(velocity)
