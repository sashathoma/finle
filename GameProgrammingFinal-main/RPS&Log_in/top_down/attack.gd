extends Node2D
var time = .2


# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func attack():
	if self.get_name() != "sabre":
		if self.get_name() == "axe":
			time = .35
		else:
			time = .25
		scale.x = 0.4
		var tween=create_tween()
		tween.tween_property(self,"rotation_degrees", 45, 0)
		tween.tween_property(self,"rotation_degrees", 135, time).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(time).timeout
		scale.x = 0
	else:
		time = .25
		scale.x = 0.4
		var tween=create_tween()
		tween.tween_property(self,"position:x", 5, time)
		tween.tween_property(self,"position:x", 0, time).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(time*2).timeout
		scale.x = 0
		
func special_attack():
	if self.get_name() == "sabre":
		time = .25
		scale.x = 0.4
		var tween=create_tween()
		tween.tween_property(self,"position:x", 5, time)
		tween.tween_property(self,"position:x", 0, time).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(time*2).timeout
		scale.x = 0
	if self.get_name() == "sword":
		time = .30
		scale.x = 0.4
		var tween=create_tween()
		tween.tween_property(self,"rotation_degrees", 45, 0)
		tween.tween_property(self,"rotation_degrees", 405, time).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(time).timeout
		scale.x = 0
		return time
	if self.get_name() == "axe":
		for i in 3:
			var axe = load("res://axe_throw.tscn").instantiate()
			axe.position = position
			axe.position.x += 5
			axe.rotation_degrees = %weapon.rotation + 90
			add_sibling(axe)
			await get_tree().create_timer(.15).timeout
		return 1.70
	pass
