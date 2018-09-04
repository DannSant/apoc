extends TouchScreenButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var toggled = true

var textureOn = preload("res://ui/switch_on.png")
var textureOff=preload("res://ui/switch_off.png")

func _ready():
	if toggled:			
		normal = textureOn
	else:
		normal =textureOff
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		toggled = not toggled
		get_node("../../player").set_shooting(toggled)
		if toggled:			
			normal = textureOn
		else:
			normal =textureOff
		
	pass
	
#func _gui_input(event):
#
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
#
#		if self.name=="shoot_button":
#			toggled = not toggled
#			get_node("../../player").set_shooting(toggled)
#			if toggled:			
#				icon = textureOn
#			else:
#				icon =textureOff


func _on_shoot_button_pressed():
	toggled = not toggled
	get_node("../../player").set_shooting(toggled)
	if toggled:			
		normal = textureOn
	else:
		normal =textureOff
