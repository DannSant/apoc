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
			player_globals.set_cur_stage(0)
			get_tree().change_scene("res://scenes/resources_screen.tscn")
		elif self.name=="exit":
			get_tree().change_scene("res://scenes/highscore_screen.tscn")
#			print("exit")
			

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
