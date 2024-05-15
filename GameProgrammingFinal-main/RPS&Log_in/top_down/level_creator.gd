extends Node
@export var map_size = 4

var map = []
var temp = ""
#var temper =""

"""
[1   1     1     1    ]

[up  left  down  right]

0 represents a wall
1 represents a door
"""

func _ready():
	for i in map_size:
		map.append([])
		for j in map_size:
			map[i].append(null)
			
	map[map_size/2][map_size/2] = 15

	for i in map_size:
		for j in map_size:
			if map[i][j] == null:
				map[i][j] = randint(i, j) 
			
	for i in map_size:
		temp = ""
		for j in map_size:
			temp += " " + str(map[i][j])
		#print(temp)

			
func _process(_delta):
	pass

func build_world():
	for i in map_size:
		for j in map_size:
			RoomMaker.make_room(map[i][j], j, i)

func dec_to_bin(dec):
	var bin = ""
	if dec >= 8:
		bin += "1"
		dec-=8
	else:
		bin += "0"
	if dec >= 4:
		bin += "1"
		dec-=4
	else:
		bin += "0"
	if dec >= 2:
		bin += "1"
		dec-=2
	else:
		bin += "0"
	if dec >= 1:
		bin += "1"
		dec-=1
	else:
		bin += "0"
	return bin

func bin_to_dec(bin):
	return bin.bin_to_int()


#func randint():
	#var bin = ""
	#bin += str(randi_range(0, 1))
	#bin += str(randi_range(0, 1))
	#bin += str(randi_range(0, 1))
	#bin += str(randi_range(0, 1))
	#return bin_to_dec(bin)

func randint(x, y):
	var bin = ""
	if x - 1 >= 0:
		if map[x - 1][y] != null:
			#x-1 y = up
			bin += dec_to_bin(map[x - 1][y])[2]
		else:
			bin += str(randi_range(0, 1))
	else:
		bin += "0"

	if y - 1 >= 0:
		if map[x][y - 1] != null:
			# x y - 1 = left
			bin += dec_to_bin(map[x][y - 1])[3]
			#temper += "x: " + str(x) + "y: "  + str(y) + " " + dec_to_bin(map[x][y - 1])
		else:
			bin += str(randi_range(0, 1))
	else:
		bin += "0"
	if x + 1 < map[x].size():
		if map[x + 1][y] != null:
			#x+1 y = down
			bin += dec_to_bin(map[x + 1][y])[0]
		else:
			bin += str(randi_range(0, 1))
	else:
		bin += "0"
	if y + 1 < map.size():
		if map[x][y + 1] != null:
			# x  y + 1 = right
			bin += dec_to_bin(map[x][y + 1])[1]
		else:
			bin += str(randi_range(0, 1))
	else:
		bin += "0"
	return bin_to_dec(bin)
