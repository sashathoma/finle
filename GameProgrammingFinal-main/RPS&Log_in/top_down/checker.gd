extends Node2D
var room_type = ""


func check():
	print("hello")
	return room_type


func up_door(area):
	if area.get_parent().get_name() == "door":
		room_type+= "t"
	pass # Replace with function body.


func down_door(area):
	if area.get_parent().get_name() == "door":
		room_type+= "d"
	pass # Replace with function body.


func right_door(area):
	if area.get_parent().get_name() == "door":
		room_type+= "r"
	pass # Replace with function body.


func left_door(area):
	if area.get_parent().get_name() == "door":
		room_type+= "l"
	pass # Replace with function body.
