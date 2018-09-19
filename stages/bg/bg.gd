extends Node2D

export var offset_step = 0
export var current_stage = 0
export var texture = ""
export var boss_level = false


var texture_stage_01 = preload("res://stages/bg/images/st01_bg.png")
var texture_stage_02 = preload("res://stages/bg/images/st02_bg.png")
var texture_stage_03 = preload("res://stages/bg/images/st03_bg.png")
var texture_stage_04 = preload("res://stages/bg/images/st04_bg.png")
var texture_stage_05 = preload("res://stages/bg/images/st05_bg.png")

var offset = 0

var level_width = 0

var game_finished = false

var boss


func _ready():
	var textures = [texture_stage_01, texture_stage_02, texture_stage_03, texture_stage_04, texture_stage_05]
	get_node("ParallaxBackground/ParallaxLayer/Sprite").texture = textures[current_stage-1]
	level_width = (get_node("ParallaxBackground/ParallaxLayer/Sprite").texture.get_width()) - 800
	boss = get_parent().get_node("enemy_boss")
	set_process(true)
	pass

func _process(delta):
	offset = offset + offset_step * delta
	
#	print ("offset_step" + str(offset_step) +  ". offset: " + str(offset),". level_width: " + str(level_width))
#	if (offset < level_width+(offset_step*2)):
	get_node("ParallaxBackground").set_scroll_offset(Vector2(-offset,0))
	
	var wr = weakref(boss);
	var progress = (offset/level_width)*100

	#print(progress)
	get_parent().get_node("hud").add_progress(progress)
	
	if progress>=100 and !boss_level:
		offset_step=0
		if !game_finished:
			game_finished=true
			get_parent().get_node("player").warp(current_stage)
		return
	
	if boss_level:
		if progress>=100:
			offset_step=0
		
		if str(boss) == "[Deleted Object]":
			if !game_finished:
				game_finished=true
				get_parent().get_node("player").warp(current_stage)
				
		return

#	if progress>=100 and boss_level:
#		offset_step=0
#		if str(boss) != "[Deleted Object]":
#			boss.enrage()
#		else:
#			game_finished=true
#			get_parent().get_node("player").warp(current_stage)
#		return
		
#	if progress<100 and boss_level and !wr.get_ref():		
#		offset_step=0
#		if !game_finished:
#			game_finished=true
#			get_parent().get_node("player").warp(current_stage)
		
	pass
	
func shake():
	get_node("shaking").shake()
	pass

func start_hyper_velocity():
	get_node("hyper_velocity_effect/beam_spawner_01").start()
	get_node("hyper_velocity_effect/beam_spawner_02").start()
	get_node("hyper_velocity_effect/beam_spawner_03").start()
	get_node("hyper_velocity_effect/beam_spawner_04").start()
	get_node("hyper_velocity_effect/beam_spawner_05").start()
	get_node("hyper_velocity_effect/beam_spawner_06").start()
	get_node("hyper_velocity_effect/beam_spawner_07").start()
	get_node("hyper_velocity_effect/beam_spawner_08").start()
	get_node("hyper_velocity_effect/beam_spawner_09").start()
	get_node("hyper_velocity_effect/beam_spawner_10").start()

func end_hyper_velocity():
	get_node("hyper_velocity_effect/beam_spawner_01").stop()
	get_node("hyper_velocity_effect/beam_spawner_02").stop()
	get_node("hyper_velocity_effect/beam_spawner_03").stop()
	get_node("hyper_velocity_effect/beam_spawner_04").stop()
	get_node("hyper_velocity_effect/beam_spawner_05").stop()
	get_node("hyper_velocity_effect/beam_spawner_06").stop()
	get_node("hyper_velocity_effect/beam_spawner_07").stop()
	get_node("hyper_velocity_effect/beam_spawner_08").stop()
	get_node("hyper_velocity_effect/beam_spawner_09").stop()
	get_node("hyper_velocity_effect/beam_spawner_10").stop()

func get_scroll_offset():
	return get_node("ParallaxBackground").get_scroll_offset()
	

func set_offset_step(offset):
	offset_step = offset
	pass
	
func get_offset_step():
	return offset_step

