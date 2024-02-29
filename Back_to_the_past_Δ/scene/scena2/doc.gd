extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var delorean = $"../Delorean"
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	Global.last_position = global_position
	if not is_on_floor():
		velocity.y += gravity * delta
	Global.menu()
	if Global.player_health <= 0:
			get_tree().change_scene_to_file("res://scene/GameOver.tscn")
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$jump.play()
	var direction = Input.get_axis("ui_left", "ui_right")

	
	if velocity.x < 0:
		$AnimatedSprite2D.play("left")
	else:
		$AnimatedSprite2D.play("front")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x > 0:
		$AnimatedSprite2D.play("right")

	move_and_slide()


func _on_morte_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://scene/scena2/lvl_1.tscn")
		body.global_position = Global.last_position
		Global.energy = 0
		Global.player_health -= 10
		

func _on_area_2d_body_entered(body):
	if body.name == "player":
		if Global.energy >= 5:
			Global.lv_counter = 2
			delorean.play("default")
