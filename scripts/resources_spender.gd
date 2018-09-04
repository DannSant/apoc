extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var parent_node = get_node("../../../..")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:		
		if self.name=="attack_plus":
			parent_node.update_attack(true)
		if self.name=="attack_minus":
			parent_node.update_attack(false)
		if self.name=="armor_plus":
			parent_node.update_armor(true)
		if self.name=="armor_minus":
			parent_node.update_armor(false)
		if self.name=="speed_plus":
			parent_node.update_speed(true)
		if self.name=="speed_minus":
			parent_node.update_speed(false)
		if self.name=="next_stage_btn":
			get_node("../../..").load_next_scene()
		if self.name=="exit_btn":
			get_node("../../..").exit_to_title()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
