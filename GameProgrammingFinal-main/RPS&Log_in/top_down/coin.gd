extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%AnimatedSprite2D.play("default")
	pass


func _on_body_entered(body):
	if body.get_name() == "Guy":
		Info.coin += 1
		self.queue_free()
	pass # Replace with function body.
