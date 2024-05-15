extends Node2D

var skins = ["COWBOY",'seward','BIGG']
var number_of_skins = len(skins)

func _process(delta):
	get_node('Skins').play(skins[Game.SkinSelect])
	
	if Game.SkinSelect > number_of_skins-2:
		get_node('SkinsRight').play(skins[0])
	else:
		get_node('SkinsRight').play(skins[Game.SkinSelect+1])
	
	if Game.SkinSelect <= 0:
		get_node('SkinsLeft').play(skins[number_of_skins-1])
	else:
		get_node('SkinsLeft').play(skins[Game.SkinSelect-1])
		
	if Input.is_action_just_pressed("ui_accept"):
		Game.PlayerSkin = skins[Game.SkinSelect]
		print(Game.PlayerSkin)
		print(get_tree())
		#get_node("Dude.tscn").set_texture("BIGG") #THIS IS AN ISSUE?
		get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
		print("Still standing")

func _on_left_btn_pressed():
	print('left')
	if Game.SkinSelect > 0:
		Game.SkinSelect -= 1
	else:
		Game.SkinSelect = number_of_skins-1

func _on_rigth_btn_pressed():
	print('right')
	if Game.SkinSelect < number_of_skins-1:
		Game.SkinSelect += 1
	else:
		Game.SkinSelect = 0
