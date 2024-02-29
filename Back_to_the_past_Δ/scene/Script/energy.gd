extends Node2D


var cones = preload("res://scene/energy_cell.tscn")

func _on_timer_timeout():
	var temp_cones = cones.instantiate()
	var rnd_x = RandomNumberGenerator.new()
	var rnd_y = RandomNumberGenerator.new()
	var r_int_x = rnd_x.randi_range(3, 1118)
	var r_int_y = rnd_y.randi_range(0, 650)	
	temp_cones.position = Vector2(r_int_x, r_int_y)
	
	
	add_child(temp_cones)


func _ready():
	$lvl1.play()
