extends ParallaxBackground


@onready var speed_rolling = 150
@onready var bgpic = get_node("ParallaxLayer/Sprite2D/BkJam1")

func _process(delta):
	scroll_base_offset.x -= speed_rolling * delta
