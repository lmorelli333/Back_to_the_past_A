extends Node2D


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		self.visible = true
		$"../player".visible = false
		$"../player/Camera2D".visible = false
		$ParallaxBackground.visible = true
		$"../enemy".visible = false
		$"../HUD".visible = false
		Global.pause = true

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")

func _on_restart_pressed():
	self.visible = false
	$ParallaxBackground.visible = false
	$"..".visible = true
	$"../player".visible = true
	$"../player/Camera2D".visible = true
	$"../player".input_pickable = true
	$"../enemy".visible = true
	$"../HUD".visible = true	
	Global.pause = false
