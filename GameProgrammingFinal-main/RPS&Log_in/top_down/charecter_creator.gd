extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	%sprite.idle(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene_to_file("res://start.tscn")
	if Input.is_action_just_pressed("base"):
		Info.add_base()
		%sprite.loop()
		%sprite.idle(false)
		pass
	if Input.is_action_just_pressed("face"):
		Info.add_face()
		%sprite.loop()
		%sprite.idle(false)
		pass
	pass
