extends Node2D

export var velocity = Vector2()

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if get_position().x+40 < 0:
		queue_free()
	
	pass
	
