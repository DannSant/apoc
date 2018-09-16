extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func set_name(name):
	$lbl_name.text=name
	
func set_score(score):
	$lbl_score.text=str(score)
	
	
func set_position(pos):
	$lbl_position.text=str(pos )+".-"

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
