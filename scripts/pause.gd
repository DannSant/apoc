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

onready var high_score_btn = $Pause/btn_highscore
onready var high_score_name = $HighScore/txt_name
onready var high_score_label = $HighScore/lbl_score_number

onready var hud = get_node("../hud")




func _ready():
	lore_text.text = get_lore_text()
	#$Pause/game_over_label.text = $Pause/game_over_label.text + " " + str(game_globals.get_dificulty())
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
	high_score_btn.visible=true


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


func _on_btn_highscore_pressed():
	$Pause.visible=false
	$HighScore.visible=true
	high_score_label.text = str(hud.get_score())


func _on_btn_back_hs_pressed():
	$Pause.visible=true
	$HighScore.visible=false
	high_score_name.text=""


func _on_btn_save_hs_pressed():
	var name = high_score_name.text
	var score = hud.get_score()
	if name == '' or name ==null:
		return
	var url = "https://apocscores.herokuapp.com/score"
	var query = JSON.print({"name":name,"score":score})
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, false, HTTPClient.METHOD_POST, query)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	$Pause.visible=true
	$HighScore.visible=false
