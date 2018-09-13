extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var wait_time=0

var enable_shooting = true

onready var laser = preload("res://weapons/laser/laser_boss.tscn")

func _ready():
	$shoot_timer.wait_time=wait_time
	$shoot_timer.start()
	pass

func _process(delta):
	var player = get_node("/root").find_node("player",true,false)
	if player!=null:
		if player.position.x<global_position.x:
			enable_shooting=false
		else:
			enable_shooting=true
	else:
		enable_shooting=false
	pass


func _on_shoot_timer_timeout():
	shoot()
	
func shoot():
	if !enable_shooting:
		return
	$sfx.play()
	var new_laser = laser.instance()
	add_child(new_laser)
	
	var pos = global_position
	var player = get_parent().get_parent().get_node("player")
	if player!=null:
		new_laser.start_at(player,pos)
	else:
		enable_shooting=false
	
	
	pass
