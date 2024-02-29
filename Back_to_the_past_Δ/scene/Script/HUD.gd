extends CanvasLayer


func _ready():
	pass # Replace with function body.

func _process(delta):
	$value.text = str(Global.player_health)
	$batt_taken.text = str(Global.energy)
