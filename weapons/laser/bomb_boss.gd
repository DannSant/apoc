extends Node2D

var velocity = Vector2()
var enrage_factor = 0
var damage=1


onready var explosion = preload("res://shared/effects/explosion.tscn")

func _ready():
	set_physics_process(true)
	pass
	

func enrage():
	enrage_factor+=5
	damage=10

func _physics_process(delta):
	
	rotate(delta*3)
	var player = get_node("/root").find_node("player",true,false)
	if player!=null:
		var motion = (player.global_position - global_position)*delta*(2.8 + enrage_factor)
		translate(motion)
	pass
	
func _on_Area2D_area_entered(area):
	var area_name = area.get_parent().get_name()
	if area.get_parent().has_method("take_enemy_damage"):
		if area_name.find("asteroid") != -1:
			area.get_parent().take_enemy_damage(damage)
			queue_free()

	pass # replace with function body


func _on_destroy_timer_timeout():
	var new_explosion = explosion.instance()
	new_explosion.set_position(get_position())
	
	get_parent().add_child(new_explosion)
	queue_free()
