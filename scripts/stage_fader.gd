extends Node2D


onready var tween = $Tween
onready var hud = $hud
onready var label = $finish_legend

func _ready():
	pass

func fade_out():
	tween.interpolate_property(hud,"modulate", Color(1,1,1,1), Color(1,1,1,0),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.interpolate_property(label,"modulate", Color(1,1,1,0), Color(1,1,1,1),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.interpolate_callback(self,tween.get_runtime(),"change_scene")
	tween.start()
	pass
	

func change_scene():
#	print ("change_scene")
	get_tree().change_scene("res://scenes/resources_screen.tscn")
