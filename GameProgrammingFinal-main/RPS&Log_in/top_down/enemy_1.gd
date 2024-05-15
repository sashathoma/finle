extends Node2D
@onready var player = get_node("/root/Start/The_Guy/Guy")
var attacking = false
var inside = false
var hurtcooldown = false
var life = 3
var oldModulate = self.modulate
var coin = preload("res://coin.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!attacking):
		%dude.play("run")
		pass
	pass


func _on_attack_range_body_entered(body):
	%enemy_pathfinding.stop = true
	inside = true
	%dude.play("attack")
	attacking = true
	await get_tree().create_timer(.5).timeout
	if inside:
		player.hurt()
	await get_tree().create_timer(.5).timeout
	attacking = false
	%enemy_pathfinding.stop = false


func _on_attack_range_body_exited(body):
	inside = false
	

func hurt():
	if !hurtcooldown:
			hurt_cooldown()
			life -= 1
			var tween = create_tween().set_loops(2)
			tween.tween_property(self, "modulate", Color.RED, 0.5)
			tween.tween_property(self, "modulate", oldModulate, 0.5)
			if life == 0:
				kill()

	pass


func hurt_cooldown():
	hurtcooldown = true
	await get_tree().create_timer(2).timeout
	hurtcooldown = false
	
func kill():
	var tween = create_tween()
	tween.tween_property(self, "rotate", 180, 0.5)
	for x in randi_range(1,3):
		var coins = coin.instantiate()
		coins.position = %enemy_pathfinding.position
		coins.position.y += randi_range(-3,3)
		coins.position.x += randi_range(-3,3)
		add_sibling(coins)
	await get_tree().create_timer(.5).timeout
	dead()
	
func dead():
	self.queue_free()
	
