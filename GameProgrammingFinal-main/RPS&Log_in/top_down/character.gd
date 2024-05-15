extends CharacterBody2D
var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
var input_lr = Input.get_axis("ui_left", "ui_right")
var input_ud = Input.get_axis("ui_up", "ui_down")
var dash_ud = 0
var dash_lr = 0
var facing = 0
var speed = 5000.0
var coolDown = false
var ScoolDown = false
var sword
var sabre
var axe
var sabre_coolDown = false
var flip_h = false
var oldModulate = self.modulate
var hurtcooldown = false

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):
	if input_lr < 0 and input_lr != 0 and !coolDown:
		%weapon.scale.x = -1
		%weapon.rotation_degrees = 0
		flip_h = true
		dash_lr = -1
		dash_ud = 0
	elif input_lr > 0 and input_lr != 0 and !coolDown:
		%weapon.rotation_degrees = 0
		%weapon.scale.x = 1
		flip_h = false
		dash_lr = 1
		dash_ud = 0
	if input_ud < 0 and input_ud != 0 and !coolDown:
		%weapon.scale.x = 1
		%weapon.rotation_degrees = 270
		dash_ud = -1
		dash_lr = 0
	elif input_ud > 0 and input_ud != 0 and !coolDown:
		%weapon.scale.x = 1
		%weapon.rotation_degrees = 90
		dash_ud = 1
		dash_lr = 0
	if !ScoolDown and input_direction :
		input_lr = Input.get_axis("ui_left", "ui_right")
		input_ud = Input.get_axis("ui_up", "ui_down")
		%sprite.run(flip_h)
	else:
		%sprite.idle(flip_h)
	
	if Input.is_action_just_pressed("ui_attack") and !coolDown:
		cool_down()
		if sword:
			%sword.attack()
		if axe:
			%axe.attack()
		if sabre and !sabre_coolDown:
			coolDown = false
			sabreCoolDown()
			%sabre.attack()
		pass
	if Input.is_action_just_pressed("ui_special") and !coolDown and !ScoolDown:
		cool_down()
		if sword:
			cool_down_time(.30)
			await %sword.special_attack()
		if axe:
			cool_down_time(1.70)
			await %axe.special_attack()
		if sabre:
			sabreCoolDown_time(.5)
			%sabre.special_attack()
			velocity = Vector2(dash_lr,dash_ud) * speed * delta * 2
		pass
		
	if !ScoolDown:
		input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
		velocity = input_direction * speed * delta
	elif !sabre_coolDown:
		velocity = Vector2(0,0)

	move_and_slide()
	
func cool_down():
	coolDown = true
	await get_tree().create_timer(.5).timeout
	coolDown = false
	
func sabreCoolDown():
	sabre_coolDown = true
	await get_tree().create_timer(.5).timeout
	sabre_coolDown  = false
	
func sabreCoolDown_time(time):
	sabre_coolDown = true
	ScoolDown = true
	await get_tree().create_timer(time).timeout
	ScoolDown = false
	sabre_coolDown  = false
	
func cool_down_time(time):
	coolDown = true
	ScoolDown = true
	await get_tree().create_timer(time).timeout
	ScoolDown = false
	coolDown = false
func w_choice(num):
	if num == 3:
		sword = true
		%swords.monitoring = true
		sabre = false
		%sabres.monitoring = false
		axe = false
		%axes.monitoring = false
	if num == 2:
		sword = false
		%swords.monitoring = false
		sabre = true
		%sabres.monitoring = true
		axe = false
		%axes.monitoring = false
	if num == 1:
		sword = false
		%swords.monitoring = false
		sabre = false
		%sabres.monitoring = false
		axe = true
		%axes.monitoring = true
	
func reset():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0,0), 1)
	tween.tween_property(self, "scale", Vector2(1,1), 0)
	cool_down_time(1)
	await get_tree().create_timer(1).timeout
	position = %cam_control.position
func collum_reset():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0,0), 1)
	tween.tween_property(self, "scale", Vector2(1,1), 0)
	cool_down_time(1)
	await get_tree().create_timer(1).timeout
	position.y = %cam_control.position.y
	position.x = %cam_control.position.x + 64

func hurt_cooldown():
	hurtcooldown = true
	await get_tree().create_timer(2).timeout
	hurtcooldown = false

func hurt():
	if !hurtcooldown:
		hurt_cooldown()
		Info.life -= 1
		var tween = create_tween().set_loops(2)
		tween.tween_property(self, "modulate", Color.RED, 0.5)
		tween.tween_property(self, "modulate", oldModulate, 0.5)
	pass
	
