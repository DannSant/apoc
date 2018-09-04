extends Node2D

export var velocity = Vector2()
export var wait_time = 0.0
export var enemy_type = 0
export var spawn_origin = ""

onready var enemy01 = preload("res://characters/enemies/enemy01.tscn")
onready var enemy02 = preload("res://characters/enemies/enemy02.tscn")
onready var enemy03 = preload("res://characters/enemies/enemy03.tscn")
onready var enemy04 = preload("res://characters/enemies/enemy04.tscn")
onready var asteroid01 = preload("res://characters/enemies/asteroid01.tscn")

onready var scene_container = get_node("scene_container")

var enemy_active
var is_enemy_active = false

func _ready():
	randomize()
	
	get_node("latency").set_wait_time(wait_time)
	set_process(true)
	pass

func _process(delta):
	if enemy_type == 3:
		if enemy_active==null:
			return
			
		var wr = weakref(enemy_active);
		if (!wr.get_ref()):
			is_enemy_active=false

	pass

func _on_latency_timeout():
	var new_enemy = null
	
	if enemy_type == 1:
		new_enemy = enemy01.instance()
	elif enemy_type==2:
		new_enemy = enemy02.instance()
	elif enemy_type==3:
		if not is_enemy_active:
			new_enemy = enemy03.instance()
			enemy_active = new_enemy
			is_enemy_active=true
	elif enemy_type==4:
		new_enemy = enemy04.instance()
	elif enemy_type==21:
		new_enemy = asteroid01.instance()
	
	if new_enemy == null:
		return
		
	if velocity.x!=0 || velocity.y!=0:
		new_enemy.velocity = velocity
	
	if spawn_origin=="" || spawn_origin=="E":
		new_enemy.set_position(Vector2(get_viewport_rect().size.x, rand_range(40,get_viewport_rect().size.y-40)))
	elif spawn_origin=="W":
		new_enemy.set_position(Vector2(-40, rand_range(40,get_viewport_rect().size.y-40)))
	elif spawn_origin=="N":
		new_enemy.set_position(Vector2(rand_range(40,get_viewport_rect().size.x-40),0))
	elif spawn_origin=="S":
		new_enemy.set_position(Vector2(rand_range(40,get_viewport_rect().size.x-40),get_viewport_rect().size.y+40))
	
	scene_container.add_child(new_enemy)
	pass
