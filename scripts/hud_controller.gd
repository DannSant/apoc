extends Control

var resources = 0
var progress =0
var light_years =0
var score = 0

onready var label = get_node("ResourceCounter").get_node("counter_label")
onready var score_label = get_node("ScoreCounter/counter_label")
onready var bar = get_node("Bar").get_node("texture_progress_bar")
onready var label_light_years = get_node("LYCounter").get_node("counter_label")
#onready var counter_label = $ResourceCounter/counter_label
#onready var bar = $Bar/texture_progress_bar

func _ready():
#	var resource_counter = get_node("ResourceCounter")
#	var label = resource_counter.get_node("counter_label")	
	label.text = "0"
	label_light_years.text = "LY: 0"
	bar.value = 0
#	counter_label.text="0"
	pass
	
	
func _process(delta):
	pass


func set_resources(newResources):
	self.resources=newResources
	label.text =str(newResources)
	pass
	
func set_score(new_value):
	self.score=new_value
	score_label.text =str(new_value)
	pass

func get_resources():	
	return self.resources
	
func get_score():
	return self.score

func add_resources(newResources):
	self.resources+=newResources	
	label.text =str(self.resources)
	pass
	
func add_score(new_score):
	self.score+=new_score	
	score_label.text =str(self.score)
	pass
	
func add_progress(newValue):
	self.progress=newValue
	bar.value=progress
	pass
	
func add_light_years(newValue):
	self.progress+=newValue
	bar.value=progress
	pass

func set_shields(value):
	get_node("powerup_display").set_p1(value)
	pass

func get_shields():
	return get_node("powerup_display").get_p1()

func set_weapon_pu(value):
	get_node("powerup_display").set_p2(value)
	pass

func get_weapon_pu():
	return get_node("powerup_display").get_p2()
	
func set_hyper_velocity(value):
	get_node("powerup_display").set_p3(value)
	pass

func get_hyper_velocity():
	return get_node("powerup_display").get_p3()

func set_damage(damage):
	get_node("HBoxContainer/DamageBar").get_node("texture_progress_bar").value = 100 - damage

func get_damage():
	return get_node("HBoxContainer/DamageBar").get_node("texture_progress_bar").value
