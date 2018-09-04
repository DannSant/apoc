extends NinePatchRect

func _ready():
	pass

func _process(delta):
	pass

func set_p1(value):
	get_node("l1").text = str(value)
	pass
	
func get_p1():
	return int(get_node("l1").text)
	
func set_p2(value):
	get_node("l2").text = str(value)
	pass

func get_p2():
	return int(get_node("l2").text)

func set_p3(value):
	get_node("l3").text = str(value)
	pass

func get_p3():
	return int(get_node("l3").text)

func _on_p1_pressed():
	if get_parent().get_parent().get_node("player") == null:
		return
	
	var value = get_p1()
	if value >= 1:
		var result = get_parent().get_parent().get_node("player").activate_shield()
		if result:
			get_node("p1_sfx").play();
			set_p1(value-1)
	pass

func _on_p2_pressed():
	if get_parent().get_parent().get_node("player") == null:
		return
		
	var value = get_p2()
	if value >= 1:
		var result = get_parent().get_parent().get_node("player").activate_weapon_pu()
		if result:
			get_node("p2_sfx").play();
			set_p2(value-1)
	pass

func _on_p3_pressed():
	if get_parent().get_parent().get_node("player") == null:
		return
		
	var value = get_p3()
	if value >= 1:
		var result = get_parent().get_parent().get_node("player").activate_hyper_velocity()
		if result:
			get_node("p3_sfx").play();
			set_p3(value-1)
	pass
