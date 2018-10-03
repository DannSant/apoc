extends Node

var default_dificulty = 0
var dificulty = default_dificulty
var dificulty_factor = 1.1

var boss_alive = true

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
	dificulty = default_dificulty + dificulty_factor

func is_boss_alive():
	return boss_alive

func boss_is_alive():
	boss_alive = true

func boss_is_dead():
	boss_alive = false
