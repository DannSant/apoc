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
		
		if self.name=="btn_pause_back":
			var new_pause_state = not get_tree().paused 
			get_tree().paused=new_pause_state
			get_node("..").visible = new_pause_state
		elif self.name=="btn_pause_exit":
			var new_pause_state = not get_tree().paused 
			get_tree().paused=new_pause_state
			get_node("..").visible = new_pause_state
			get_tree().change_scene("res://scenes/main_screen.tscn")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
