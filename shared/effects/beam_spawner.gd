extends Node2D

onready var beam = preload("res://shared/effects/beam.tscn")
onready var scene_container = get_node("scene_container")

func _ready():
	randomize()
	get_node("latency").stop()
	pass

#func _process(delta):
#	pass

func _on_latency_timeout():
	var new_beam = beam.instance()
	new_beam.set_position(Vector2(get_viewport_rect().size.x+100, rand_range(0,get_viewport_rect().size.y)))
	scene_container.add_child(new_beam)
	pass

func start():
	get_node("latency").start()
	
func stop():
	get_node("latency").stop()
	