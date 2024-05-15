extends Control

var rng = RandomNumberGenerator.new()
var user_choice = null

# 1 = rok
# 2 = paper
# 3 = scis

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.ui = self
	$Panel/a.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func do():
	var random_num = rng.randi_range(1,3)
	$Panel/a.visible=false
	# 1 = rok
	# 2 = paper
	# 3 = scis
	
	if user_choice == random_num:
		$Panel/TIE.visible = true
	elif user_choice == 1: # user pick rock
		if random_num == 2:
			$Panel/LOSS.visible = true
		elif random_num == 3:
			$Panel/WIN.visible = true
	elif user_choice == 2: # user picks paper
		if random_num == 1: 
			$Panel/WIN.visible = true
		elif random_num == 3:
			$Panel/LOSS.visible = true
	elif user_choice == 3: # user picks scissors
		if random_num == 1:
			$Panel/LOSS.visible = true
		elif random_num == 2:
			$Panel/WIN.visible = true
	
	var things = ["rock","paper","scissors"]
		
	$Panel/tc/choice.play(things[random_num-1])
	$Panel/yc/choice.play(things[user_choice-1])
	
	$Panel/tc.visible = true
	$Panel/yc.visible = true
		
	user_choice = null
	
	await get_tree().create_timer(1.5).timeout
	
	$Panel/TIE.visible = false
	$Panel/WIN.visible = false
	$Panel/LOSS.visible = false
	$Panel/a.visible = true
	self.visible = false
	$Panel/tc.visible = false
	$Panel/yc.visible = false

func _on_rock_b_pressed():
	user_choice = 1
	do()

func _on_paper_b_pressed():
	user_choice = 2
	do()

func _on_scissors_b_pressed():
	user_choice = 3
	do()
