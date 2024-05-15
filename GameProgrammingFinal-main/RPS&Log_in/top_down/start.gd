extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	LevelCreator.build_world();
	%The_Guy.position.x = (LevelCreator.map_size/2)*175
	%The_Guy.position.y = (LevelCreator.map_size/2)*208
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
