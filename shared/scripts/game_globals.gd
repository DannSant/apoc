extends Node

var default_dificulty = 0
var dificulty = default_dificulty
var dificulty_factor = 1.1

func _ready():
	pass

func set_dificulty(value):
	dificulty = value
	pass
	
func get_dificulty():
	return dificulty
	
func increase_dificulty():
	dificulty = dificulty + dificulty_factor
	
func reset_attributes():
	dificulty = default_dificulty
