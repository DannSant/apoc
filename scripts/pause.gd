extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var stage_number =0

onready var pause = $Pause
onready var pause_back = $Pause/btn_pause_back
onready var pause_lore = $Pause/btn_pause_lore
onready var pause_lore_back = $Pause/btn_pause_lore_back
onready var pause_exit = $Pause/btn_pause_exit
onready var lore_text = $Pause/lore_text
onready var game_over_label = $Pause/game_over_label



func _ready():
	lore_text.text = get_lore_text()
	pass
	
func get_lore_text():
	var text=""
	if stage_number == 1:
		text += player_globals.lore_text1
	if stage_number == 2:
		text += player_globals.lore_text2
	if stage_number == 3:
		text += player_globals.lore_text3
	if stage_number == 4:
		text += player_globals.lore_text4
	if stage_number == 5:
		text += player_globals.lore_text5
	
	return text

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func game_over():
	pause.visible=true
	pause_back.visible = false
	game_over_label.visible=true
	pause_lore.visible=false


func _on_btn_pause_lore_pressed():
	pause_back.visible = false
	pause_lore.visible = false
	pause_exit.visible = false
	pause_lore_back.visible=true
	lore_text.visible=true
	


func _on_btn_pause_lore_back_pressed():
	pause_back.visible = true
	pause_lore.visible = true
	pause_exit.visible = true
	pause_lore_back.visible=false
	lore_text.visible=false
