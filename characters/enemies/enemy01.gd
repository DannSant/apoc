extends Node2D

export var can_damage_enemy = false
export var velocity = Vector2()
export var rotation_range = 0.0
export var armor = 0
export var resources_value = 0

export var follow_player = false
export var follow_speed=0.02

export var shoot_player = false

export var base_rotation_speed = 0.0
export var fixed_rotation_speed = false

onready var explosion = preload("res://shared/effects/explosion.tscn")
onready var laser = preload("res://weapons/laser/laser02.tscn")

var rotation_speed = 1
var rotation_direction = 1

func _ready():
	randomize()
	velocity = velocity.rotated(rand_range(rotation_range*-1,rotation_range))
	
	if base_rotation_speed > 0 && not fixed_rotation_speed:
		rotation_speed = rand_range(0,4)
		
		if rotation_speed <= 4/2:
			rotation_direction = 1
		else:
			rotation_direction = -1
	
#	print ("shoot_player",shoot_player)
	
	if shoot_player:
		get_node("shoot_interval").wait_time = .5 + rand_range(.5,1.5)
		get_node("shoot_interval").start()
	
	set_process(true)
	pass

func _process(delta):
	#Efecto de que la nave va temblando
	#translate(velocity.rotated(rand_range(-1.5,1.5)) * delta)
	
	if base_rotation_speed > 0:
		rotate(base_rotation_speed*rotation_speed*rotation_direction*delta)
	
	if follow_player:
		#print(get_node("/root").find_node("player",true,false))
		var player = get_node("/root").find_node("player",true,false)
		if player!=null:
			var motion = (player.position - get_position())*delta
			translate(motion)
	else:	
		translate(velocity * delta)
		

	if get_position().y+40 < 0 || get_position().y-40 > get_viewport_rect().size.y || get_position().x + 40 < 0:
		queue_free()

	pass
	
func take_damage(damage):
	armor = armor - damage
	
	if armor <= 0:
		#print(get_node("../../../../hud").name)
#		get_parent().get_parent().get_node("hud").add_resources(resources_value)
		if damage < 99:
			get_node("../../../../hud").add_resources(resources_value)

		do_explotion()
		queue_free()
	
	pass
	
func take_enemy_damage(damage):
	armor = armor - damage
	
	if armor <= 0:
		do_explotion()
		queue_free()
	
func do_explotion():
	var new_explosion = explosion.instance()
	new_explosion.set_position(get_position())
	
	get_parent().add_child(new_explosion)

func _on_Area2D_area_entered(area):
	if can_damage_enemy:
		if area.get_parent().has_method("take_damage"):
			area.get_parent().take_damage(99)
		
	pass # replace with function body

func _on_shoot_interval_timeout():
	if shoot_player:
		var laser_beam = laser.instance()
		laser_beam.set_position(Vector2(get_position().x-50, get_position().y))
	
		get_parent().get_parent().add_child(laser_beam)
		get_node("laser_shooter").play()
	pass 
