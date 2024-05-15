extends Area2D
var fightable = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		self.on_click()

func on_click():
	PlayerStats.Battle(get_parent().ID)
	pass


func _on_area_2d_body_entered(body):
	if (body.name == "self"):
		fightable = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if (body.name == "self"):
		fightable = false
	pass # Replace with function body.
