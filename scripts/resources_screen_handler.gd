extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var resources = 0
var attack_attr = 1
var armor_attr = 1
var speed_attr= 1

var attack_cost = 100
var armor_cost = 300
var speed_cost = 200

var next_scene = "res://stages/stage02/stage02.tscn"
var next_stage_number =0

var scenes = [
	"res://stages/stage01.tscn",
	"res://stages/stage02.tscn",
	"res://stages/stage03.tscn",
	"res://stages/stage04.tscn",
	"res://stages/stage05.tscn",
]

onready var map1 = preload("res://ui/map_01.png")
onready var map2 = preload("res://ui/map_02.png")
onready var map3 = preload("res://ui/map_03.png")
onready var map4 = preload("res://ui/map_04.png")
onready var map5 = preload("res://ui/map_05.png")



onready var resources_label = $resources_ui/controls_ui/resources_node/resources_label
onready var attack_label = $resources_ui/controls_ui/attack_node/attack_text
onready var armor_label = $resources_ui/controls_ui/armor_node/armor_text
onready var speed_label = $resources_ui/controls_ui/speed_node/speed_text

onready var attack_cost_lbl = $resources_ui/controls_ui/attack_cost
onready var armor_cost_lbl = $resources_ui/controls_ui/armor_cost
onready var speed_cost_lbl = $resources_ui/controls_ui/speed_cost

onready var dialog = $resources_ui/resources_dialog
onready var tween = $tween
onready var ui = $resources_ui
onready var map = $map_ui
onready var dialog_popup = $dialog
onready var dialog_text = $dialog/dialog_text

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	tween.interpolate_property(ui,"modulate", Color(1,1,1,0), Color(1,1,1,.75),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.interpolate_property($map_ui,"modulate", Color(1,1,1,0), Color(1,1,1,.75),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	
	attack_cost_lbl.text = str(attack_cost)
	armor_cost_lbl.text = str(armor_cost)
	speed_cost_lbl.text = str(speed_cost)
	
	resources=player_globals.get_resources()
	armor_attr=player_globals.get_shields()
	attack_attr=player_globals.get_weapon_pu()
	speed_attr=player_globals.get_hyper_velocity()
	
	update_armor_attr_ui()
	update_attack_attr_ui()
	update_speed_attr_ui()
	update_resources_ui()
	var current_stage = player_globals.get_cur_stage()	
	set_next_scene(current_stage)
	set_stage_map(current_stage)
	if next_stage_number<=5:
		_on_lore_button_pressed()
	print ("Current Stage", player_globals.get_cur_stage())
	pass
	
func set_next_scene(current_stage):
	next_stage_number = current_stage + 1
	if next_stage_number>5:
		player_globals.set_cur_stage(0)
		get_tree().change_scene("res://scenes/final_screen.tscn")
	else:
		next_scene=scenes[next_stage_number-1]
	
func set_stage_map(current_stage):
	if next_stage_number==1:
		map.texture = map1
	if next_stage_number==2:
		map.texture = map2
	if next_stage_number==3:
		map.texture = map3
	if next_stage_number==4:
		map.texture = map4
	if next_stage_number==5:
		map.texture = map5
	
func set_resources(new_value):
	resources = new_value
	update_resources_ui()
	
func get_resources():
	return resources
	
func update_resources_ui():
	resources_label.text = "Resources: " + str(resources)
	
func set_attack_attr(new_value):
	attack_attr = new_value
	update_attack_attr_ui()
	
func get_attack_attr():
	return attack_attr
	
func update_attack(is_increment):
	if is_increment:
		if resources >= attack_cost:
			resources = resources - attack_cost
			attack_attr = attack_attr +1
		else:
			dialog.dialog_text  = "Not enough resources man! You are not trying to steal from us, aren't you?"
			dialog.show()
	else:
		if attack_attr>0:
			resources = resources + attack_cost
			attack_attr = attack_attr -1
		else:
			dialog.dialog_text="You don't have attack power to sell!"
			dialog.show()
	
	update_attack_attr_ui()
	update_resources_ui()
	
func update_attack_attr_ui():
	attack_label.text = str(attack_attr)
	
func set_armor_attr(new_value):
	armor_attr = new_value
	update_armor_attr_ui()
	
func get_armor_attr():
	return armor_attr
	
func update_armor(is_increment):
	if is_increment:
		if resources >= armor_cost:
			resources = resources - armor_cost
			armor_attr = armor_attr +1
		else:
			dialog.dialog_text  = "Not enough resources man! You are not trying to steal from us, aren't you?"
			dialog.show()
	else:
		if armor_attr>0:
			resources = resources + armor_cost
			armor_attr = armor_attr -1
		else:
			dialog.dialog_text="You don't have attack power to sell!"
			dialog.show()
	
	update_armor_attr_ui()
	update_resources_ui()
	
func update_armor_attr_ui():
	armor_label.text = str(armor_attr)
	
func set_speed_attr(new_value):
	speed_attr = new_value
	update_speed_attr_ui()
	
func get_speed_attr():
	return speed_attr
	
func update_speed(is_increment):
	if is_increment:
		if resources >= speed_cost:
			resources = resources - speed_cost
			speed_attr = speed_attr +1
		else:
			dialog.dialog_text  = "Not enough resources man! You are not trying to steal from us, aren't you?"
			dialog.show()
	else:
		if speed_attr>0:
			resources = resources + speed_cost
			speed_attr = speed_attr -1
		else:
			dialog.dialog_text="You don't have attack power to sell!"
			dialog.show()
	
	update_speed_attr_ui()
	update_resources_ui()
	
func update_speed_attr_ui():
	speed_label.text = str(speed_attr)
	
func load_next_scene():
	player_globals.set_resources(resources)
	player_globals.set_shields(armor_attr)
	player_globals.set_weapon_pu(attack_attr)
	player_globals.set_hyper_velocity(speed_attr)
	get_tree().change_scene(next_scene)
#	get_tree().change_scene("res://stages/stage01/stage01.tscn")
	pass
	
func exit_to_title():
	get_tree().change_scene("res://scenes/main_screen.tscn")
	pass


func _on_lore_button_pressed():
	if next_stage_number==1:
		dialog_text.text = "Transmission incomig... \n\n" + player_globals.lore_text1
		#dialog_text.add_text("Transmission incomig... \n\n" + player_globals.lore_text1)
	if next_stage_number==2:
		dialog_text.text = "Transmission incomig... \n\n" + player_globals.lore_text2
	if next_stage_number==3:
		dialog_text.text = "Transmission incomig... \n\n" + player_globals.lore_text3
	if next_stage_number==4:
		dialog_text.text = "Transmission incomig... \n\n" + player_globals.lore_text4
	if next_stage_number==5:
		dialog_text.text = "Transmission incomig... \n\n" + player_globals.lore_text5
		
	dialog_popup.visible=true
	get_tree().paused=true
	pass # replace with function body


func _on_help_button_pressed():
	dialog_text.text = player_globals.help_text
	dialog_popup.visible=true
	get_tree().paused=true
	pass # replace with function body


func _on_ok_dialog_btn_pressed():
	dialog_text.text = ""
	dialog_popup.visible=false
	get_tree().paused=false
	pass # replace with function body
