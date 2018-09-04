extends Node2D

func _ready():
	get_node("Particles2D").set_emitting(true)
	pass

func _on_Timer_timeout():
#	print("libere explosion")
	queue_free()
	pass 
