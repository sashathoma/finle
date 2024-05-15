extends CharacterBody2D
var stop = false
const speed = 20
@onready var player = get_node("/root/Start/The_Guy/Guy")
@onready var nav_agent := %NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float):
	if !stop:
		var dir = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * speed
	else:
		velocity = Vector2(0,0)
	move_and_slide()
	


func make_path():
	nav_agent.target_position = player.global_position


func _on_timer_timeout():
	make_path()
