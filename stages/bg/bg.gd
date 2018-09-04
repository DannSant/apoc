extends Node2D

export var offset_step = 0
export var current_stage = 0
export var texture = ""

var texture_stage_01 = preload("res://stages/bg/images/st01_bg.png")
var texture_stage_02 = preload("res://stages/bg/images/st02_bg.png")
var texture_stage_03 = preload("res://stages/bg/images/st03_bg.png")
var texture_stage_04 = preload("res://stages/bg/images/st04_bg.png")
var texture_stage_05 = preload("res://stages/bg/images/st05_bg.png")

var offset = 0

var level_width = 0

var game_finished = false

func _ready():
	var textures = [texture_stage_01, texture_stage_02, texture_stage_03, texture_stage_04, texture_stage_05]
	get_node("ParallaxBackground/ParallaxLayer/Sprite").texture = textures[current_stage-1]
	level_width = (get_node("ParallaxBackground/ParallaxLayer/Sprite").texture.get_width()) - 800
	
	set_process(true)
	pass

func _process(delta):
	offset = offset + offset_step * delta
	
	var progress = (offset/level_width)*100
	#print(progress)
	get_parent().get_node("hud").add_progress(progress)
	if progress>=100:
		offset_step=0
		if !game_finished:
			game_finished=true
			get_parent().get_node("player").warp(current_stage)
		return
		
	get_node("ParallaxBackground").set_scroll_offset(Vector2(-offset,0))
	
	pass

func get_scroll_offset():
	return get_node("ParallaxBackground").get_scroll_offset()
	

func set_offset_step(offset):
	offset_step = offset
	pass
	
func get_offset_step():
	return offset_step

