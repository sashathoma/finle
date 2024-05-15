extends Node
@export var right_door = [preload("res://rooms/rd_corner.tscn"), preload("res://rooms/rt_corner.tscn"), preload("res://rooms/start_room.tscn"),preload("res://rooms/h_hall.tscn"),preload("res://rooms/four_polls.tscn"), preload("res://rooms/collum_room.tscn"),preload("res://rooms/trd.tscn"), preload("res://rooms/tlr.tscn"),preload("res://rooms/r.tscn")]
@export var Left_door = [preload("res://rooms/lt_corner.tscn"), preload("res://rooms/start_room.tscn"), preload("res://rooms/ld_corner.tscn"),preload("res://rooms/h_hall.tscn"),preload("res://rooms/four_polls.tscn"), preload("res://rooms/collum_room.tscn"),preload("res://rooms/lt_corner.tscn"),preload("res://rooms/tld.tscn"), preload("res://rooms/tlr.tscn"),preload("res://rooms/l.tscn")]
@export var up_door = [preload("res://rooms/collum_room.tscn"), preload("res://rooms/rt_corner.tscn"), preload("res://rooms/v_hall.tscn"), preload("res://rooms/start_room.tscn"),preload("res://rooms/lt_corner.tscn"),preload("res://rooms/tld.tscn"), preload("res://rooms/tlr.tscn"),preload("res://rooms/t.tscn"),preload("res://rooms/trd.tscn")]
@export var down_door = [preload("res://rooms/rd_corner.tscn"), preload("res://rooms/shop_room.tscn"), preload("res://rooms/v_hall.tscn"), preload("res://rooms/start_room.tscn"), preload("res://rooms/ld_corner.tscn"),preload("res://rooms/four_polls.tscn"),preload("res://rooms/trd.tscn"),preload("res://rooms/tld.tscn")]

#preload("")
#uldr
var oool = []#
var oolo = []#
var ooll = []#
var oloo = []#
var olol = []#
var ollo = []#
var olll = []#
var looo = []#
var lool = []#
var lolo = []#
var loll = []#
var lloo = []#
var llol = []#
var lllo = []#
var llll = []#
#preload("")
# Called when the node enters the scene tree for the first time.
func _ready():
	for item in right_door:
		if !up_door.has(item) and !Left_door.has(item) and !down_door.has(item) and right_door.has(item):
			#0001
			oool.append(item)
			pass
		if !up_door.has(item) and !Left_door.has(item) and down_door.has(item) and right_door.has(item):
			#0011
			ooll.append(item)
			pass
		if !up_door.has(item) and Left_door.has(item) and !down_door.has(item) and right_door.has(item):
			#0101
			olol.append(item)
			pass
		if !up_door.has(item) and Left_door.has(item) and down_door.has(item) and right_door.has(item):
			#0111
			olll.append(item)
			pass
		if up_door.has(item) and !Left_door.has(item) and !down_door.has(item) and right_door.has(item):
			#1001
			lool.append(item)
			pass
		if up_door.has(item) and !Left_door.has(item) and down_door.has(item) and right_door.has(item):
			#1011
			loll.append(item)
			pass
		if up_door.has(item) and Left_door.has(item) and !down_door.has(item) and right_door.has(item):
			#1101
			llol.append(item)
			pass
		if up_door.has(item) and Left_door.has(item) and down_door.has(item) and right_door.has(item):
			#1111
			llll.append(item)
			pass
	for item in down_door:
		if !up_door.has(item) and !Left_door.has(item) and down_door.has(item) and !right_door.has(item):
			#0010
			oolo.append(item)
			pass
		if !up_door.has(item) and Left_door.has(item) and down_door.has(item) and !right_door.has(item):
			#0110
			ollo.append(item)
			pass
		if up_door.has(item) and !Left_door.has(item) and down_door.has(item) and !right_door.has(item):
			#1010
			lolo.append(item)
			pass
		if up_door.has(item) and Left_door.has(item) and down_door.has(item) and !right_door.has(item):
			#1110
			lllo.append(item)
			pass
	for item in Left_door:
		if !up_door.has(item) and Left_door.has(item) and !down_door.has(item) and !right_door.has(item):
			#0100
			oloo.append(item)
			pass
		if up_door.has(item) and Left_door.has(item) and !down_door.has(item) and !right_door.has(item):
			#1100
			lloo.append(item)
			pass
	for item in up_door:
		if up_door.has(item) and !Left_door.has(item) and !down_door.has(item) and !right_door.has(item):
			#1000
			looo.append(item)
			pass
pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func make_room(room_type, x, y):
	if room_type == 15:
		var room = llll.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 14:
		var room = lllo.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 13:
		var room = llol.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 12:
		var room = lloo.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 11:
		var room = loll.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 10:
		var room = lolo.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 9:
		var room = lool.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 8:
		var room = looo.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 7:
		var room = olll.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 6:
		var room = ollo.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 5:
		var room = olol.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 4:
		var room = oloo.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 3:
		var room = ooll.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 2:
		var room = oolo.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	elif room_type == 1:
		var room = oool.pick_random().instantiate()
		room.position.x = x * 175
		room.position.y = y * 208
		get_node("/root/Start").add_child(room)
	pass
