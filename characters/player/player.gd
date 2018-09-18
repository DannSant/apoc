extends Node2D

const ACTION_MARGIN_X = 80
const ACTION_MARGIN_Y = 60

export var ship_speed = 0
export var max_armor = 0

var armor = null
var speed = null
var target = null
var angle = null
var shooting_on = true
var level_finished = false

onready var laser = preload("res://weapons/laser/laser01.tscn")
onready var scene_container = get_node("scene_container")
onready var explosion = preload("res://shared/effects/explosion.tscn")
onready var tween = $Tween
onready var sprite = $Area2/Sprite


var input_states = preload("res://shared/scripts/input_states.gd")
var ui_move_to = input_states.new("ui_move_to")
var shield_activated = false

var bk_bg_offset_step = 0

func _ready():
	init_attributes()
	
	set_process(true)
	pass

func init_attributes():
	armor = max_armor
	
	get_parent().get_node("hud").set_score(player_globals.get_score())
	get_parent().get_node("hud").set_shields(player_globals.get_shields())
	get_parent().get_node("hud").set_weapon_pu(player_globals.get_weapon_pu())
	get_parent().get_node("hud").set_hyper_velocity(player_globals.get_hyper_velocity())
	get_parent().get_node("hud").set_resources(player_globals.get_resources())

	pass
	
func update_attributes():
	player_globals.set_resources(get_parent().get_node("hud").get_resources())
	player_globals.set_shields(get_parent().get_node("hud").get_shields())
	player_globals.set_weapon_pu(get_parent().get_node("hud").get_weapon_pu())
	player_globals.set_hyper_velocity(get_parent().get_node("hud").get_hyper_velocity())
	player_globals.set_score(get_parent().get_node("hud").get_score())
	
	pass
	
func _process(delta):
	move(delta)
	pass

func move(delta):
	var view_size = get_viewport_rect()
	
	var mouse_position = get_viewport().get_mouse_position() + Vector2(80,0)
	var pos_diff = (mouse_position - get_position())
	
	if abs(pos_diff.x) > 120 || abs(pos_diff.y) > 120:
		return
	
	var motion = pos_diff*delta*20
	
	if shield_activated:
		get_node("shield").rotate(delta/3)
	
	if mouse_position.x > view_size.size.x-ACTION_MARGIN_X || mouse_position.y > view_size.size.y-ACTION_MARGIN_Y || mouse_position.y < ACTION_MARGIN_Y:
		return
		
	if level_finished:
		return
	
	translate(motion)
	
	var position = get_position()
	position.x = clamp(position.x, 0+40, view_size.size.x - ACTION_MARGIN_X)
	position.y = clamp(position.y, 0+ACTION_MARGIN_Y, view_size.size.y - ACTION_MARGIN_Y)
	
	set_position(position)
			
	pass	

func _on_weapon_shoot_timeout():
	var laser_beam = null
	
	if not shooting_on:
		return
	
	laser_beam = laser.instance()
	laser_beam.set_position(Vector2(get_position().x+50, get_position().y))
	
	scene_container.add_child(laser_beam)
	get_node("laser_shooter").play()
	pass	

func _on_Area2_area_entered(area):
	#print(area.get_parent().get_name()) 
	
	if level_finished:
		return
	
	if area.get_parent().has_method("take_damage"):
		area.get_parent().take_damage(1)
	
	if not shield_activated:
		armor = armor - 1
		get_parent().get_node("hud").set_damage((max_armor - armor)*20)

	
	do_explotion()
	get_parent().get_node("bg").shake()
	
	if armor <=0:
		queue_free()
		get_parent().get_node("bg").set_offset_step(0)
		get_parent().get_node("pause_layer").game_over()
	
	pass # replace with function body
	
func set_shooting(value):
	shooting_on = value
	
func do_explotion():
	var new_explosion = explosion.instance()
	new_explosion.set_position(get_position())
	
	get_parent().add_child(new_explosion)

func activate_shield():
	if get_node("shield_deactivate").time_left > 0 || level_finished:
		return false
	
	shield_activated = true
	get_node("shield").visible = true
	get_node("shield_deactivate").start()
	return true
	
func _on_shield_deactivate_timeout():
	get_node("shield").visible = false
	shield_activated = false
	pass

func activate_weapon_pu():
	if get_node("weapon_pu_deactivate").time_left > 0 || level_finished:
		return false
		
	get_node("weapon_shoot").stop()
	get_node("weapon_shoot").wait_time = .05
	get_node("weapon_shoot").start()
	get_node("weapon_pu_deactivate").start()
	return true

func _on_weapon_pu_deactivate_timeout():
	get_node("weapon_shoot").stop()
	get_node("weapon_shoot").wait_time = .3
	get_node("weapon_shoot").start()
	pass 

func activate_hyper_velocity():
	if get_node("hyper_velocity_deactivate").time_left > 0 || level_finished:
		return false
	
	bk_bg_offset_step = get_parent().get_node("bg").get_offset_step()
	get_parent().get_node("bg").set_offset_step(bk_bg_offset_step*5)
	get_node("hyper_velocity_deactivate").start()
	return true

func _on_hyper_velocity_deactivate_timeout():
	get_parent().get_node("bg").set_offset_step(bk_bg_offset_step)
	pass
	
func warp(stage):
	player_globals.set_cur_stage(stage)
	update_attributes()
	level_finished=true
	var player = get_node(".")
	
	tween.interpolate_property(player,"position", player.position, Vector2(player.position.x + 2400,player.position.y) ,4.0,Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
	tween.interpolate_callback(self,tween.get_runtime(),"warp_finished")
	tween.start()
	#get_tree().change_scene("res://scenes/resources_screen.tscn")

func warp_finished():
	get_parent().fade_out()
	#get_tree().change_scene("res://scenes/resources_screen.tscn")
#	var blackout= get_node("blackout")
#	var label = get_node("label")
#	tween.reset_all ()
#	tween.interpolate_property(blackout,"color", Color(1,1,1,0), Color(1,1,1,1),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
#	tween.interpolate_property(label,"modulate", Color(1,1,1,0), Color(1,1,1,1),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
#	tween.interpolate_callback(self,tween.get_runtime(),"change_scene")
#	tween.start()
	pass

	
	
