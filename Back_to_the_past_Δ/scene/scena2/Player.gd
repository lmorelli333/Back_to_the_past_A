extends CharacterBody2D

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var acceleration = 1
var speed = 2
var jump_speed = 0
var time_flag = false
@onready var starting_point = $".".position.x
@export var direction = -1


func _ready():
	starting_point = $".".global_position.x

func _physics_process(delta):
	if $".".position.x < (starting_point - 120) and $".".position.x != starting_point:
		direction = 1
		$AnimatedSprite2D.play("right")
	elif $".".position.x > starting_point:
		direction = -1
		$AnimatedSprite2D.play("left")
	#if $".".is_on_floor():
	#	velocity.y = jump_speed
	#	print("jump")
	#	$jump2.play()
	#else:
	#	velocity.y = gravity * delta * -1
	#	print("fall")
	#	print(position)
	velocity.x = acceleration * direction * speed
		
	move_and_collide(velocity)


func _on_area_2d_body_entered(body):
	if body.name == "player":
		if time_flag == false:
			Global.player_health -= 5
		elif time_flag == true:
			Global.player_health -= 10
			#get_tree().change_scene_to_file("res://scene/scena2/lvl_1.tscn")


func _on_timer_timeout():
	time_flag = !time_flag
