extends Node2D
var time = 1.25

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween=create_tween().set_parallel(true)
	var tween_2=create_tween().set_parallel(true)
	tween_2.tween_property(%rotation,"rotation_degrees", 360*2, time)
	tween.tween_property(%arc,"rotation_degrees", 360, time)
	await get_tree().create_timer(time).timeout
	queue_free()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
