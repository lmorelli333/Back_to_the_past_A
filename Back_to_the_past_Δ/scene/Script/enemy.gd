extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null
var flag = 1
@onready var animation = $AnimatedSprite2D
var health = 100
var player_inattack_zone = false
@onready var doc = $"../player"
@onready var animation_tree = $animazione_nemico
@onready var state_machine = animation_tree.get("parameters/playback")
@export var start_dir : Vector2 = Vector2(0, 0)

func _ready():
	update(start_dir)


func _physics_process(_delta):
	if Global.pause == false:
		if player_chase and player_inattack_zone == false:
			position += (player.position - position)/speed * flag
		pick_new_state()
		update(doc.position - self.position)
		move_and_slide()
	
func update(move_input : Vector2):
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/BlendSpace2D/blend_position", move_input)

func pick_new_state():
	if (velocity != Vector2.ZERO):
		state_machine.travel("BlendSpace2D")
		
func _on_enemy_area_body_entered(body):
	player = body
	player_chase = true
	
			
func _on_enemy_area_body_exited(_body):
	player = null
	player_chase = false




func _on_death_zone_body_entered(body):
	if body.name == "player":
		Global.player_health -= 5
		flag = -1
		if Global.player_health == 0:
			get_tree().change_scene_to_file("res://scene/main.tscn")
		player_inattack_zone = true


func _on_death_zone_body_exited(body):
	if body.has_method("player"):
		flag = 1
		player_inattack_zone = false

