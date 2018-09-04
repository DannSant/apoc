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
		text += "The apocalypse is now! Scientists on earth have discovered the advanced technology of the Neutrino Engine, which will allow you to travel to speeds beyond human imagination. But invaders from the System Tau Ceti have heard of the discovering and they are trying to steal it from us. This cannot happen or the humanity will fall. The earth is no longer safe, so you must find a way for the survivors of the earth to reach the Star Gliese 581. Outsider, the humanity relies on you."
	if stage_number == 2:
		text += "The Empire of Tau Ceti have arrived to Gliese 581. They obliterated the small human colonies in here. Why are they doing this? They were the first humans to travel to another System along the humans from Alpha Centauri, which we have not heard from a long time ago. Outsider, you must lead the earth survivors away from this system. We’ve heard reports that they board the ships and kill all civilians with no warning. Do not let anything get closer to your ship. Avoid their fleet and find a safe place, but beware, the black hole Monocerocis is nearby and it appears it would be the only way to lose our persecutors."
	if stage_number == 3:
		text += "We have to pass near the black hole called Monocerocis. This is very dangerous and not even the ships from the fleet of Tau Ceti will follow us here. But the gravitational effects of the singularity may be fatal if we get too close. Watch out with the asteroids and the few ships that dare to get close. The next stop is Calvera, a really dangerous Neutron Star. Tau Ceti has a station nearby wich extract energy from the Neutron Star, so we may have company soon. Outsider are you receiving the messages too? No? I thought so. We’ll be in touch."
	if stage_number == 4:
		text += "We are in the Calvera System now. The planets are destroyed and only the Tau Ceti fleet stands. I don’t know if the Neutron Star destroyed those planets or if the merciless fleet have arrived. We’ve been…also receiving transmissions. They talk about an offer of peace if you hand the Neutrino technology. Do not listen to them. I know it is hard, I know that the voice keeps…looping in your mind. We don’t have an explanation for this, but our scientist believe that is because of the proximity of the Star. Anyhow, we are getting close to you now, when we get out of the Milky Way we will stop to make the…necessary preparations to warp in to Andromeda, or maybe another galaxy. Slow down a bit so we can catch you. Good luck."
	if stage_number == 5:
		text += "What is the meaning of this? Outsider, you were us to keep us safe, not to doom us all. The last remains of the earth are here in the mother ship, why aren’t you stopping? We need the Neutrino Engine so we can escape. No, I will not deliver it to the people from Tau Ceti, why would you possibly think that? No, not because of the strange transmissions and messages I would change my mind and join Tau Ceti… And you know what? We hired you to protect us, but now you have betrayed us. I know you just warped so you don’t have enough energy, so we will catch you. I will remove the Neutron technology from your cold death hands if I have to. I will deliver this technology to the Tau Ceti Queen myself, and Lord Magneto will reward me. I’ll see you soon."
	
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
