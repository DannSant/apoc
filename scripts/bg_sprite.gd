extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var ui = get_parent().get_node("ui")
onready var tween = get_parent().get_node("tween")
onready var credits = get_parent().get_node("ui/credits_bg")

func _ready():
	if get_tree().paused:
		get_tree().paused=false
	
	tween.interpolate_property(ui,"modulate", Color(1,1,1,0), Color(1,1,1,.75),3.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	tween.start()
	pass

func _process(delta):
	rotate(deg2rad(1*delta))
	pass


func _on_extras_pressed():
	var new_state = not credits.visible
	credits.visible = new_state
	credits.modulate = Color(1,1,1,1)
