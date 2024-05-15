extends Node
var base = 1
var face = 0
var life = 6
var coin = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_base():
	base += 1
	if base > 30:
		base = 1 
	pass
func add_face():
	face += 1
	#print(face)
	if face > 7:
		face = 0
	pass
