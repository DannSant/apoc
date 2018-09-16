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
	elif progress>=100 and boss_level:
		#kill player
		offset_step=0
		var boss_ref = weakref(boss)
		if boss_ref.get_ref():
			boss.enrage()
		return
		pass
	elif progress<100 and boss_level and !wr.get_ref():		
		offset_step=0
		if !game_finished:
			game_finished=true
			get_parent().get_node("player").warp(current_stage)
		return
	
		
	get_node("ParallaxBackground").set_scroll_offset(Vector2(-offset,0))
	
	pass
	
func shake():
	get_node("shaking").shake()
	pass


func get_scroll_offset():
	return get_node("ParallaxBackground").get_scroll_offset()
	

func set_offset_step(offset):
	offset_step = offset
	pass
	
func get_offset_step():
	return offset_step

