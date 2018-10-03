extends Node2D

export var velocity = Vector2()
export var rotation_range = 0.0
export var armor = 0
export var resources_value = 0
export var follow_player = false
export var follow_speed=0.002

const ACTION_MARGIN_X = 160
const ACTION_MARGIN_Y = 60

onready var explosion = preload("res://shared/effects/explosion.tscn")
#onready var laser = preload("res://weapons/laser/laser_boss.tscn")

func _ready():
	#randomize()
	#velocity = velocity.rotated(rand_range(rotation_range*-1,rotation_range))
	
	set_process(true)
	pass

func _process(delta):
	var motion = Vector2(velocity.x,rand_range(-50,50))
	translate(motion*delta)
	var view_size = get_viewport_rect()
	var position = get_position()
	position.x = clamp(position.x, -500, view_size.size.x - ACTION_MARGIN_X)
	position.y = clamp(position.y, 0+ACTION_MARGIN_Y, view_size.size.y - ACTION_MARGIN_Y)
	
	set_position(position)
	
	pass
	
func take_damage(damage):
	armor = armor - damage
	do_explotion()
	if armor <= 0:
		#print(get_node("../../../../hud").name)
		get_parent().get_node("hud").add_resources(resources_value)
		get_parent().get_node("hud").add_score(resources_value)
		#get_node("../../../../hud").add_resources(resources_value)

		do_explotion()
		game_globals.boss_is_dead()
		queue_free()
	
	var bg_offset_step = get_parent().get_node("bg").get_offset_step()
	if (bg_offset_step <=0):
		enrage()
	
	pass
	
func enrage():
	$boss_bomb_shooter1.enrage()
	$boss_bomb_shooter2.enrage()
	$boss_bomb_shooter3.enrage()
	pass
	
func do_explotion():
	var new_explosion = explosion.instance()
	new_explosion.set_position(get_position())
	
	get_parent().add_child(new_explosion)

func _on_shoot_timer_timeout():
	
#	#obtener posicion del jugador
#	var player_position = get_parent().get_node("player").position
#
#	#instanciar el disparo
#	var new_laser = laser.instance()
#	new_laser.position = get_node("laser_spawn").position
#	get_parent().add_child(new_laser)
#	#posicionar el disparo apuntando al jugador
#	var angle = (position.y - player_position.y)/(position.x-player_position.x)
#
#	var directional_force = Vector2(cos(deg2rad(angle)),sin(deg2rad(angle)))*500
#	new_laser.translate(directional_force)
	pass
