extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var wait_time=0

var enable_shooting = false
var enrage = false

onready var bomb = preload("res://weapons/laser/bomb_boss.tscn")

func _ready():
	$shoot_timer.wait_time=wait_time
	$shoot_timer.start()
	pass

func _process(delta):
	var player = get_node("/root").find_node("player",true,false)
	if player!=null:
		if player.position.x>global_position.x and !enrage:
			enable_shooting=false
		else:
			enable_shooting=true
	else:
		enable_shooting=false
	pass
	
func enrage():
	enrage=true


func _on_shoot_timer_timeout():
	shoot()
	
func shoot():
	if !enable_shooting:
		return
	$sfx.play()
	var new_bomb = bomb.instance()
	if enrage:
		new_bomb.enrage()
	add_child(new_bomb)
	
	pass
