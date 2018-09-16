extends Node

var default_resources = 0
var default_shields = 4
var default_weapon_pu = 4
var default_hyper_velocity = 4

var resources = 0
var shields = 0
var weapon_pu = 0
var hyper_velocity = 0

var cur_stage = 0

var score = 0


var lore_text1 = "The apocalypse is now! Scientists on earth have discovered the advanced technology of the Neutrino Engine, which will allow you to travel to speeds beyond human imagination. But invaders from the System Tau Ceti have heard of the discovering and they are trying to steal it from us. This cannot happen or the humanity will fall. \n\nThe earth is no longer safe, so you must find a way for the survivors of the earth to reach the Star Gliese 581.\n\nOutsider, the humanity relies on you."

var lore_text2 = "The Empire of Tau Ceti have arrived to Gliese 581. They obliterated the small human colonies in here. Why are they doing this? They were the first humans to travel to another System along the humans from Alpha Centauri, which we have not heard from a long time ago.\n\nOutsider, you must lead the earth survivors away from this system. We have heard reports that they board the ships and kill all civilians with no warning. \n\nDo not let anything get closer to your ship. Avoid their fleet and find a safe place, but beware, the black hole Monocerocis is nearby and it appears it would be the only way to lose our persecutors."

var lore_text3 = "We have to pass near the black hole called Monocerocis. This is very dangerous and not even the ships from the fleet of Tau Ceti will follow us here. \n\nBut the gravitational effects of the singularity may be fatal if we get too close. Watch out with the asteroids and the few ships that dare to get close. \n\nThe next stop is Calvera, a really dangerous Neutron Star. Tau Ceti has a station nearby which extracts energy from the Neutron Star, so we may have company soon. \n\nOutsider are you receiving the strange messages too? No? I thought so. We'll be in touch."

var lore_text4 = "We are in the Calvera System now. The planets are destroyed and only the Tau Ceti fleet stands. I don't know if the Neutron Star destroyed those planets or if the merciless fleet have arrived. \n\nWe have been…also receiving transmissions. They talk about an offer of peace if you hand the Neutrino technology. Do not listen to them. I know it is hard, I know that the voice keeps…looping in your mind. We don't have an explanation for this, but our scientist believe that is because of the proximity of the Star. \n\nAnyhow, we are getting close to you now, when we get out of the Milky Way we will stop to make the…necessary preparations to warp into Andromeda, or maybe another galaxy. \n\n Slow down a bit so we can catch you. Good luck."
	
var lore_text5 =  "What is the meaning of this? Outsider, you were us to keep us safe, not to doom us all. The last remains of the earth are here in the mothership, why aren't you stopping? We need the Neutrino Engine so we can escape. No, I will not deliver it to the people from Tau Ceti, why would you possibly think that? No, not because of the strange transmissions and messages I would change my mind and join Tau Ceti \n\nYou know what? We hired you to protect us, but now you have betrayed us. I know you just warped so you don't have enough energy, so we will catch you. I will remove the Neutron technology from your cold death hands if I have to. I will deliver this technology to the Tau Ceti Queen myself, and Lord Magneto will reward me. I'll see you soon."

var help_text = "Welcome to Apoc \n\n Here a few things you might want to know: \n\n-In this screen you can buy and trade your resources for power ups. All power ups last a few seconds and will be saved between stages (so you don't lose them when you finish a stage) \n-Attack power up makes you attack super fast \n-Armor power up makes you invunlerable to all damage \n-Speed power up makes you go faster, this will allow you to get to the end of the level a bit faster \n\nAs soon as you start playing you will see the icons of each power up in the bottom right of the screen, tap one to activate it "
	

func _ready():
	reset_attributes()
	pass

func reset_attributes():
	randomize()
	
	resources = default_resources+ceil(rand_range(200,600))
	shields = default_shields
	weapon_pu = default_weapon_pu
	hyper_velocity = default_hyper_velocity
	pass
	

func set_resources(value):
	resources = value
	pass

func get_resources():
	return resources

func set_shields(value):
	shields = value
	pass
	
func get_shields():
	return shields
	
func set_weapon_pu(value):
	weapon_pu = value
	pass

func get_weapon_pu():
	return weapon_pu

func set_hyper_velocity(value):
	hyper_velocity = value
	pass

func get_hyper_velocity():
	return hyper_velocity
	
func set_cur_stage(stage):
	cur_stage = stage
	pass

func get_cur_stage():
	return cur_stage

func set_score(value):
	score = value
	pass

func get_score():
	return score
	