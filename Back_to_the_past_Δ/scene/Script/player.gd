extends CharacterBody2D


@export var move_speed : float = 100
@export var start_dir : Vector2 = Vector2(0, 1)
@onready var delorean = $"../Delorean"
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@export var speed_acceleration  = 1.0
var reload = false
var stamina_value = 100

func _ready():
	update_animation(start_dir)

func player():
	pass

	
func _physics_process(_delta):
	if Global.pause == false:
		var input_dir = Vector2(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
		Global.menu()
		update_animation(input_dir)
		velocity = input_dir * (move_speed * speed_acceleration)
		move_and_slide()
		pick_new_state()
		if Global.lv_counter == 0:
			if Input.is_action_just_pressed("run"):
				speed_acceleration = 1.5
				reload = false
			if Input.is_action_pressed("run"):
				if input_dir != Vector2.ZERO:
					stamina_value -= 1
				if stamina_value <= 0:
					speed_acceleration = 1
				if stamina_value > 0:
					speed_acceleration = 1.5
				if stamina_value < 0:
					stamina_value = 0
				if stamina_value == 0:
					speed_acceleration = 0.2
			if Input.is_action_just_released("run"):
				speed_acceleration = 1
				reload = false
			update_stamina()
	if Global.player_health <= 0:
		get_tree().change_scene_to_file("res://scene/GameOver.tscn")		
			
func update_stamina():
	var stamina = $stamina
	stamina.value = stamina_value
	if stamina_value >= 100:
		stamina.visible = false
	else:
		stamina.visible = true

func update_animation(move_input : Vector2):
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/walk/blend_position", move_input)
		animation_tree.set("parameters/idle/blend_position", move_input)


func pick_new_state():
	if (velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")


func _on_hurtbox_body_entered(body):
	if body.name == "enemy":
		Global.player_health -= 1
	


func _on_charger_timeout():
	if reload == false and Global.pause == false:
		if stamina_value < 100:
			stamina_value += 2
		if stamina_value > 100:
			stamina_value = 100
	if stamina_value < 0:
		stamina_value = 0


func _on_area_2d_body_entered(body):
	if body.name == "player":
		if Global.energy >= 5:
			Global.lv_counter = 1
			delorean.play("default")

