extends Node

onready var root_node = get_tree().get_root()

func _ready():
	pass

func get_main_node():
	return root_node.get_child(root_node.get_child_count()-1)

func get_viewport_scale():
	var viewport_scale = 600/root_node.get_child(1).get_viewport_rect().size.y;
	return viewport_scale

