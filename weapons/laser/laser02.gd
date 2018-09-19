extends Node2D

export var velocity = Vector2()

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if get_position().y+40 < 0 || get_position().y-40 > get_viewport_rect().size.y || get_position().x - 40 > get_viewport_rect().size.x || get_position().x+40 < 0:
		queue_free()
	
	pass
	
func _on_Area2D_area_entered(area):
	var area_name = area.get_parent().get_name()
	if area.get_parent().has_method("take_enemy_damage"):
		if area_name.find("asteroid") != -1:
			area.get_parent().take_enemy_damage(1)
			queue_free()
	
	pass # replace with function body
