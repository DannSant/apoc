extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _gui_input(event):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if self.name=="new_game":
#			print("new")
			player_globals.reset_attributes()
			get_tree().change_scene("res://stages/stage01.tscn")
		else:
			get_tree().quit()
#			print("exit")
			

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
