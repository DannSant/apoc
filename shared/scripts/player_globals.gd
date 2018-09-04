extends Node

var default_resources = 0
var default_shields = 2
var default_weapon_pu = 2
var default_hyper_velocity = 2

var resources = 0
var shields = 0
var weapon_pu = 0
var hyper_velocity = 0

var cur_stage = 0

func _ready():
	reset_attributes()
	pass

func reset_attributes():
	resources = default_resources
	shields = default_shields
	weapon_pu = default_weapon_pu
	hyper_velocity = default_hyper_velocity
	pass
	

func set_resources(value):
	resources = value
	pass

func get_resources():
	return resources

func set_shields(value):
	shields = value
	pass
	
func get_shields():
	return shields
	
func set_weapon_pu(value):
	weapon_pu = value
	pass

func get_weapon_pu():
	return weapon_pu

func set_hyper_velocity(value):
	hyper_velocity = value
	pass

func get_hyper_velocity():
	return hyper_velocity
	
func set_cur_stage(stage):
	cur_stage = stage
	pass

func get_cur_stage():
	return cur_stage
