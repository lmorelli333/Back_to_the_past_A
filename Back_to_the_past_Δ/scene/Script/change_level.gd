extends Node2D

var speed : float = 400
@onready var car = get_node("ParallaxBackground2")
@onready var delor = get_node("ParallaxBackground2/ParallaxLayer2")


func _ready():
	$AudioStreamPlayer2D.play()

func _process(delta):
	car.scroll_base_offset.x += speed * delta
	if delor.position.x > 1152:
		next_level()
	Global.energy = 0
	Global.player_health = 100

func next_level():
	if Global.lv_counter == 1:
		get_tree().change_scene_to_file("res://scene/scena2/lvl_1.tscn")
	if Global.lv_counter == 2:
		get_tree().change_scene_to_file("res://scene/End_game/main.tscn")
