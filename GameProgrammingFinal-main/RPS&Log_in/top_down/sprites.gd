extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func run(flip_h):
	%face.flip_h = flip_h
	%base.flip_h = flip_h
	%base.play("run_" + str(Info.base))
	%face.play(str(Info.face) + "_run")

func idle(flip_h):
	%face.flip_h = flip_h
	%base.flip_h = flip_h
	%base.play("idle_" + str(Info.base))
	#print("idle_" + str(Info.base))
	%face.play(str(Info.face) + "_idle")
	
func loop():
	%base.stop()
	%face.stop()
