extends Node2D

var dude_texture=preload("res://Assets/icon.svg")
var otherDudeTscn = preload("res://Scenes/other_dude.tscn")
var textures = {"BIGG":preload("res://Assets/characters/BIGG_stetson.png"),"cowboy":preload("res://Assets/characters/cowboystickman.png"),"seward":preload("res://Assets/characters/SewardSheriff.png")}
var skins = ["BIGG","cowboy","seward"]
var rng = RandomNumberGenerator.new()
var rpsGUI = preload("res://fakerps.tscn")
var dudes={}
var uuid
var nonce
func refresh_positions():
	$HTTPRequest.request("https://thethes.pythonanywhere.com/get_positions?unique_id=%s&nonce=%s"%[uuid,nonce])


func _ready():
	$HTTPRequest.request_completed.connect(self._on_request_completed)
	$HTTPConnect.request_completed.connect(self._on_connect)
	$HTTPConnect.request("https://thethes.pythonanywhere.com/connect")

	# Configure the HTTPRequest node
	

func _on_connect(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	uuid=json["unique_id"]
	nonce=json["nonce"]
	var x=json["x"]
	var y=json["y"]
	$dude.position=Vector2(x,y);
	refresh_positions();
	

func update_my_position(x,y):
	$HTTPSet.request("https://thethes.pythonanywhere.com/set_position?x=%d&y=%d&unique_id=%s&nonce=%s"%[x,y,uuid,nonce])
	#$dude.position=Vector2(x,y)

func _on_request_completed(result, response_code, headers, body):
	#print(body.get_string_from_utf8())
	#print('----')
	var json = JSON.parse_string(body.get_string_from_utf8())
	if not json:
		return
	
	for unique_id in json:
		#print(unique_id)
		var item=json[unique_id]
		#print(item)
		var x = item["x"]
		var y = item["y"]
		var skin = item["skin"]

		# Check if the unique_id already exists in the dictionary
		if unique_id==uuid:
			$Dude.position=Vector2(x, y)
		elif dudes.has(unique_id):
			# Update the object's position
			var obj = dudes[unique_id]
			obj.position = Vector2(x, y)
		else:
			# Create a new object, set its position, and add it to the dictionary
			var new_obj = get_circle(x,y,skin)
			dudes[unique_id] = new_obj
			
		var to_delete=[]
		for uuid in dudes:
			if uuid not in json:
				to_delete.append(uuid)
		for uuid in to_delete:
			remove_child(dudes[uuid])
			dudes.erase(uuid)


func _process(delta):
	var changed=false
	var x=$Dude.position.x
	var y=$Dude.position.y
	if Input.is_action_just_pressed("ui_left"):
		print("Hooplaa")
		x-=32
		changed=true
	if Input.is_action_just_pressed("ui_right"):
		print("Heehaw")
		x+=32
		changed=true
	if Input.is_action_just_pressed("ui_up"):
		y-=32
		changed=true
	if Input.is_action_just_pressed("ui_down"):
		y+=32
		changed=true
	if changed:
		
		update_my_position(x,y)
	refresh_positions()
		
	pass
	#if randf() < 0.1:  # Adjust the probability as needed
		#create_random_circle()

func get_circle(x,y,skin):
	var position = Vector2(x,y)
	var dude = otherDudeTscn.instantiate()
	print("BLABLALBLA",skin)
	dude.texture=textures[skins[rng.randi_range(0,len(skins)-1)]]
	dude.position = position
	dude.scale=Vector2(.15,.15)
	add_child(dude)
	print("Here")
	return dude
