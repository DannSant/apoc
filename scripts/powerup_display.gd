extends NinePatchRect

func _ready():
	set_process(true)
	pass

func _process(delta):
	check_key_pressed()
	pass

func check_key_pressed():
	if Input.is_key_pressed(KEY_A):
		_on_p1_pressed()
	elif Input.is_key_pressed(KEY_S):
		_on_p2_pressed()
	elif Input.is_key_pressed(KEY_D):
		_on_p3_pressed()
		
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
	var player = get_parent().get_parent().get_node("player")
	
	if player == null:
		return
	
	var value = get_p1()
	if value >= 1:
		if player.activate_shield():
			get_node("p1_sfx").play();
			set_p1(value-1)
	pass

func _on_p2_pressed():
	var player = get_parent().get_parent().get_node("player")
	
	if player == null:
		return
		
	var value = get_p2()
	if value >= 1:
		if player.activate_weapon_pu():
			get_node("p2_sfx").play();
			set_p2(value-1)
	pass

func _on_p3_pressed():
	var player = get_parent().get_parent().get_node("player")
	
	if player == null:
		return
		
	var value = get_p3()
	if value >= 1:
		if player.activate_hyper_velocity():
			get_node("p3_sfx").play();
			set_p3(value-1)
	pass
