extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if(%Username.text != "" && %Password.text != ""):
		PlayerStats.Username = %Username.text
		PlayerStats.Password = %Password.text
		#$HTTPConnect.request("connect")
		self.visible = false
		self.queue_free
		
	pass # Replace with function body.
	
func _on_connect(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	for unique_id in json:
		
		var item=json[unique_id]
		if(item["Username"] == PlayerStats.Username && item["Password"] == PlayerStats.Password):
			PlayerStats.ID=unique_id
			return
	#$HTTPConnect.request("PlayerStats.Password/PlayerStats.Username")
	
