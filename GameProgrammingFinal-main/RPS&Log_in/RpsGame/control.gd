extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	#$HTTPSet.request("rock"/PlayerStats.ID/PlayerStats.Opp)
	get_tree().root.remove_child(self)
	pass 


func _on_button_2_pressed():
	#$HTTPSet.request("paper"/PlayerStats.ID/PlayerStats.Opp)
	get_tree().root.remove_child(self)
	pass


func _on_button_3_pressed():
	#$HTTPSet.request("scissors"/PlayerStats.ID/PlayerStats.Opp)
	get_tree().root.remove_child(self)
	pass
