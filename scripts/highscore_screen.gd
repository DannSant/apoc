extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var row = preload("res://scenes/highscore_row.tscn")

func _ready():
	load_data()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func load_data():
	var url = "https://apocscores.herokuapp.com/score"
	var headers = ["Content-Type: application/json"]
	var query = JSON.print({})
	$HTTPRequest.request(url, headers, false, HTTPClient.METHOD_GET, query)
	pass


func _on_btn_back_pressed():
	get_tree().change_scene("res://scenes/main_screen.tscn")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	#var data = [{"name":"Dann","score":"200"},{"name":"Cicis","score":"100"}]
	var data = json.result.data
	var position=1
	for record in data:
		var row_i = row.instance()
		row_i.rect_position = Vector2(160,25 + (position*40))
		row_i.set_position(position)
		row_i.set_name(record.name)
		row_i.set_score(record.score)
		$ladder.add_child(row_i)
		position = position +  1
