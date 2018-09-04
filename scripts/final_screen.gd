extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


onready var ui = get_node("ui")
onready var tween = get_node("tween")

func _ready():
	tween.interpolate_property(ui,"modulate", Color(1,1,1,0), Color(1,1,1,1),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_new_game_pressed():
	get_tree().change_scene("res://scenes/main_screen.tscn")
