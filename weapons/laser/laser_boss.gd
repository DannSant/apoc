extends Node2D

var velocity = Vector2()
var speed = 2500

func _ready():
	set_physics_process(true)
	pass
	
func start_at(player,pos):
	#look_at(player.position)
	
	var steering_angle = player.global_position.angle_to_point(global_position) 
	var direction = (steering_angle)
	look_at(player.global_position)
	
	
	velocity=Vector2(speed,0).rotated(direction)
	

func _physics_process(delta):
	translate(velocity *delta)	
	pass
	
func _on_Area2D_area_entered(area):
	var area_name = area.get_parent().get_name()
	if area.get_parent().has_method("take_enemy_damage"):
		if area_name.find("asteroid") != -1:
			area.get_parent().take_enemy_damage(1)
			queue_free()

	pass # replace with function body


func _on_destroy_timer_timeout():
	queue_free()
