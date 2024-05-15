extends AnimatedSprite2D
var chestable
var chesting = false
@onready var item = randi_range(1,3)
var guy
# Called when the node enters the scene tree for the first time.
func _ready():
	%wpon.scale = Vector2(0,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if chestable and !chesting and Input.is_action_just_pressed("ui_open"):
		chesting = true
		play("default")
		#print(str(randi_range(1,3)))
		%weapon.play(str(item))
		await get_tree().create_timer(.5).timeout
		var tween = get_tree().create_tween()
		tween.tween_property($wpon, "scale", Vector2(1,1), 1)
		guy.w_choice(item)
		await get_tree().create_timer(1.5).timeout
		%wpon.queue_free()
	pass





func _on_area_2d_body_entered(body):
	if body.get_name() == "Guy":
		guy = body
		chestable = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.get_name() == "Guy":
		chestable = false
	pass # Replace with function body.
