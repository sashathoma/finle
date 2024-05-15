extends Node2D
var x_pos_limit = 88
var x_neg_limit = -x_pos_limit
var y_pos_limit = 88
var y_neg_limit = -120


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if %Guy.position.x > x_pos_limit:
		var tween=create_tween()
		tween.tween_property(self,"position:x",position.x + 175,0)
		x_pos_limit+=175
		x_neg_limit+=175
		
		
		pass
	if %Guy.position.x < x_neg_limit:
		var tween=create_tween()
		tween.tween_property(self,"position:x",position.x - 175,0)
		x_pos_limit-=175
		x_neg_limit-=175
		
		pass
	if %Guy.position.y > y_pos_limit:
		var tween=create_tween()
		tween.tween_property(self,"position:y",position.y + 208,0)
		y_pos_limit+=208
		y_neg_limit+=208
		
		pass
	if %Guy.position.y < y_neg_limit:
		var tween=create_tween()
		tween.tween_property(self,"position:y",position.y - 208,0)
		y_pos_limit-=208
		y_neg_limit-=208
		
		pass
	
	pass
