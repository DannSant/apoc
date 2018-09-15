extends Node2D

export var magnitude = 5

func _ready():
	randomize()
	pass

func _process(delta):
	pass
	
func shake():
#	print ("shake",get_node("stop_shaking").is_stopped())
	
	if not get_node("stop_shaking").is_stopped():
		return
		
	get_node("shaking_interval").start()
	get_node("stop_shaking").start()

func _on_shaking_interval_timeout():
	var pos = Vector2()
	
	pos.x = rand_range(-magnitude,magnitude)
	pos.y = rand_range(-magnitude,magnitude)
	
#	print ("shake",pos)
	
	set_position(pos)
	pass 

func _on_stop_shaking_timeout():
	get_node("shaking_interval").stop()
	set_position(Vector2(0,0))
	pass 
